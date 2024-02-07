module Core(
    input wire clk,                       /* 时钟 */ 
    input wire rstn,                      /* 重置信号 */ 
    output wire cosim_valid,              /* 指令有效 */
    output wire [63:0] cosim_pc,          /* current pc */
    output wire [31:0] cosim_inst,        /* current instruction */
    output wire [ 7:0] cosim_rs1_id,      /* rs1 id */
    output wire [63:0] cosim_rs1_data,    /* rs1 data */
    output wire [ 7:0] cosim_rs2_id,      /* rs2 id */
    output wire [63:0] cosim_rs2_data,    /* rs2 data */
    output wire [63:0] cosim_alu,         /* alu out */
    output wire [63:0] cosim_mem_addr,    /* memory address */
    output wire [ 3:0] cosim_mem_we,       /* memory write enable */
    output wire [63:0] cosim_mem_wdata,   /* memory write data */
    output wire [63:0] cosim_mem_rdata,   /* memory read data */
    output wire [ 3:0] cosim_rd_we,       /* rd write enable */
    output wire [ 7:0] cosim_rd_id,       /* rd id */
    output wire [63:0] cosim_rd_data,     /* rd data */
    output wire [ 3:0] cosim_br_taken,    /* branch taken? */
    output wire [63:0] cosim_npc,          /* next pc */

/* transfer to Core2Mem_FSM */
    output wire [63:0] pc,                
    output wire [63:0] address,
    output wire we_mem,
    output wire [63:0] wdata_mem,
    output wire [ 7:0] wmask_mem,
    output wire re_mem,
    output wire if_request,
    input wire  [63:0] rdata_mem,
    input wire  [31:0] inst,
    input wire  if_stall,
    input wire  mem_stall

/* transfer to ram??? need changing 
    output wire we_mem_exe,                //we_mem  
    output wire [63:0] alu_res_ram,        //address
    output wire [ 7:0] rw_wmask,           //wmask_mem
    output wire [ 8:0] ro_addr,            //pc
    output wire [63:0] rw_wdata,           //wdata_mem
    input wire  [63:0] rw_rdata,           //rdata_mem
    input wire  [63:0] ro_rdata            //inst
*/
);
  //pc
  wire stall_pc;
  wire valid_if;
  wire [63:0] next_pc_mux;
  wire [63:0] pc_if;
  wire [63:0] npc_if;
  //IFID
  wire flush_ifid;
  wire stall_ifid;
  wire valid_id;
  wire [31:0]inst_if;
  wire [63:0]pc_id;
  wire [63:0]npc_id;
  wire [31:0]inst_id;
  wire [4:0]rd_addr_id;
  wire [4:0]rs1_addr_id;
  wire [4:0]rs2_addr_id;
  wire [63:0]rs1_data_id;
  wire [63:0]rs2_data_id;
  wire [63:0]imm_id;
  wire use_rs1_id;
  wire use_rs2_id;
  //ctrl sign id
  wire we_reg_id , we_mem_id , npc_sel_id , is_load_id;
  wire [1:0] alu_asel_id , alu_bsel_id , wb_sel_id; 
  wire [2:0] immgen_op_id , bralu_op_id , memdata_width_id;
  wire [3:0] alu_op_id; 
  //IDEXE
  wire flush_idexe;
  wire stall_idexe;
  wire valid_exe;
  wire [63:0]pc_exe;
  wire [63:0]npc_exe;
  wire [31:0]inst_exe;
  wire [4:0]rd_addr_exe;
  wire [4:0]rs1_addr_exe;
  wire [4:0]rs2_addr_exe;
  wire [63:0]rs1_data_idexe;
  wire [63:0]rs2_data_idexe;
  wire [63:0]rs1_data_exe;
  wire [63:0]rs2_data_exe;
  wire [63:0]imm_exe;
  wire [63:0]alu_a, alu_b;
  //control sign exe
  wire we_reg_exe , we_mem_exe , npc_sel_exe , is_load_exe;
  wire [1:0] alu_asel_exe , alu_bsel_exe , wb_sel_exe; 
  wire [2:0] bralu_op_exe , memdata_width_exe;
  wire [3:0] alu_op_exe , br_taken_exe;   
  //EXEMEM
  wire flush_exemem;
  wire stall_exemem;
  wire valid_mem;
  wire [63:0]pc_mem;
  wire [63:0]npc_mem;
  wire [31:0]inst_mem;
  wire [4:0]rd_addr_mem;
  wire [4:0]rs1_addr_mem;
  wire [4:0]rs2_addr_mem;
  wire [63:0]rs1_data_mem;
  wire [63:0]rs2_data_mem;
  wire [63:0]alu_res_mem;
  wire [63:0]alu_res_exe;
  wire [63:0]dmem_mem;
  wire [63:0]rw_wdata;
  wire [7:0]rw_wmask;
  //control sign mem
  wire we_reg_mem , we_mem_mem , is_load_mem;
  wire [1:0] wb_sel_mem; 
  wire [2:0] memdata_width_mem;
  wire [3:0] br_taken_mem;
  //MEMWB
  wire flush_memwb;
  wire stall_memwb;
  wire valid_wb;
  wire [63:0]pc_wb;
  wire [63:0]npc_wb;
  wire [31:0]inst_wb;
  wire [4:0]rd_addr_wb;
  wire [63:0]rs1_data_wb;
  wire [63:0]rs2_data_wb;
  wire [63:0]alu_res_wb;
  wire [63:0]dmem_wb;
  wire [63:0]mem_wdata_wb;
  //control sign wb
  wire we_reg_wb , we_mem_wb;
  wire [1:0] wb_sel_wb; 
  wire [3:0] br_taken_wb;
  // 例化控制通路模块
  PC_MUX pcmux(.rst(~rstn),
               .npc(npc_if),       
               .alu_res(alu_res_exe),
               .npc_sel(npc_sel_exe), 
               .br_taken(br_taken_exe),
               .pc(next_pc_mux)
               );  
  PC pc1(.clk(clk),
         .rst(~rstn),
         .stall(stall_pc),
         .pc_in(next_pc_mux),
         .npc_sel_id(npc_sel_id),
         .npc_sel_exe(npc_sel_exe),
         .valid_if(valid_if),
         .pc(pc_if),
         .npc(npc_if),
         .if_request(if_request)
         );
  IF_ID_Reg ifid_reg(.clk(clk),
                     .flush(flush_ifid),
                     .stall(stall_ifid),
                     .rst(~rstn),
                     .valid_if(valid_if),
                     .valid_id(valid_id),

                     .pc_if(pc_if),
                     .npc_if(npc_if),
                     .inst_if(inst_if),
                     .pc_id(pc_id),
                     .npc_id(npc_id),
                     .inst_id(inst_id),

                     .rd_addr_id(rd_addr_id),
                     .rs1_addr_id(rs1_addr_id),
                     .rs2_addr_id(rs2_addr_id)
                     );
  Control ctrl(.inst(inst_id),
               .is_load(is_load_id),
               .we_reg(we_reg_id),
               .we_mem(we_mem_id),
               .npc_sel(npc_sel_id),
               .alu_asel(alu_asel_id),
               .alu_bsel(alu_bsel_id),
               .wb_sel(wb_sel_id),
               .immgen_op(immgen_op_id),
               .bralu_op(bralu_op_id),
               .memdata_width(memdata_width_id),
               .alu_op(alu_op_id),
               .use_rs1(use_rs1_id),
               .use_rs2(use_rs2_id)
               );
  Regs regs(.clk(clk),
            .rst(~rstn),
            .we(we_reg_wb),
            .read_addr_1(rs1_addr_id),
            .read_addr_2(rs2_addr_id),
            .write_addr(rd_addr_wb),
            .write_data(cosim_rd_data),     //please wait
            .read_data_1(rs1_data_id),
            .read_data_2(rs2_data_id)
            );
  Imm_Gen immgen(.immgen_op(immgen_op_id),
                 .inst(inst_id),
                 .imm(imm_id)
                 );
  ID_EXE_Reg idexe_reg(.clk(clk),
                       .flush(flush_idexe),
                       .stall(stall_idexe),
                       .rst(~rstn),
                       .valid_id(valid_id),
                       .valid_exe(valid_exe),

                       .pc_id(pc_id),
                       .npc_id(npc_id),
                       .inst_id(inst_id),
                       .pc_exe(pc_exe),
                       .npc_exe(npc_exe),
                       .inst_exe(inst_exe),
                       
                       .is_load_id(is_load_id),
                       .we_reg_id(we_reg_id),
                       .we_mem_id(we_mem_id),
                       .npc_sel_id(npc_sel_id),
                       .alu_asel_id(alu_asel_id),
                       .alu_bsel_id(alu_bsel_id),
                       .wb_sel_id(wb_sel_id),
                       .bralu_op_id(bralu_op_id),
                       .memdata_width_id(memdata_width_id),
                       .alu_op_id(alu_op_id),
                       .is_load_exe(is_load_exe),
                       .we_reg_exe(we_reg_exe),
                       .we_mem_exe(we_mem_exe),
                       .npc_sel_exe(npc_sel_exe),
                       .alu_asel_exe(alu_asel_exe),
                       .alu_bsel_exe(alu_bsel_exe),
                       .wb_sel_exe(wb_sel_exe),
                       .bralu_op_exe(bralu_op_exe),
                       .memdata_width_exe(memdata_width_exe),
                       .alu_op_exe(alu_op_exe),

                       .rd_id(rd_addr_id),
                       .rs1_data_id(rs1_data_idexe),
                       .rs2_data_id(rs2_data_idexe),
                       .imm_id(imm_id),
                       .rd_exe(rd_addr_exe),
                       .rs1_data_exe(rs1_data_exe),
                       .rs2_data_exe(rs2_data_exe),
                       .imm_exe(imm_exe)
                       );
  Branch branch(.bralu_op(bralu_op_exe),
                .reg1(rs1_data_exe),
                .reg2(rs2_data_exe),
                .br_taken(br_taken_exe)
                );
  ALU_MUX alumux(.reg1(rs1_data_exe),
                 .pc(pc_exe),
                 .reg2(rs2_data_exe),
                 .imm(imm_exe),
                 .asel(alu_asel_exe) , .bsel(alu_bsel_exe),
                 .a(alu_a),
                 .b(alu_b)
                 );
  ALU alu(.a(alu_a),
          .b(alu_b),
          .alu_op(alu_op_exe),
          .res(alu_res_exe)
          );
  EXE_MEM_Reg exemem_reg(.clk(clk),
                       .flush(flush_exemem),
                       .stall(stall_exemem),
                       .rst(~rstn),
                       .valid_exe(valid_exe),
                       .valid_mem(valid_mem),

                       .pc_exe(pc_exe),
                       .npc_exe(npc_exe),
                       .inst_exe(inst_exe),
                       .pc_mem(pc_mem),
                       .npc_mem(npc_mem),
                       .inst_mem(inst_mem),

                       .is_load_exe(is_load_exe),
                       .we_reg_exe(we_reg_exe),
                       .we_mem_exe(we_mem_exe),
                       .wb_sel_exe(wb_sel_exe),
                       .memdata_width_exe(memdata_width_exe),
                       .br_taken_exe(br_taken_exe),
                       .is_load_mem(is_load_mem),
                       .we_reg_mem(we_reg_mem),
                       .we_mem_mem(we_mem_mem),
                       .wb_sel_mem(wb_sel_mem),
                       .memdata_width_mem(memdata_width_mem),
                       .br_taken_mem(br_taken_mem),

                       .rd_exe(rd_addr_exe),
                       .alu_res_exe(alu_res_exe),
                       .rd_mem(rd_addr_mem),
                       .alu_res_mem(alu_res_mem),
                       .rs1_data_exe(rs1_data_exe),
                       .rs2_data_exe(rs2_data_exe),                       
                       .rs1_data_mem(rs1_data_mem),
                       .rs2_data_mem(rs2_data_mem)
                       );
  Data_Off dataoff(.res(alu_res_exe),
                   .rw_wdata0(rs2_data_exe),
                   .rw_wdata(rw_wdata)
                   );
  Mask_Gen maskgen(.res(alu_res_exe),
                   .memdata_width(memdata_width_exe),
                   .rw_wmask(rw_wmask)
                   );
  Data_Trunc datatrunc(.rw_rdata(rdata_mem),
                       .res(alu_res_mem),
                       .memdata_width(memdata_width_mem),
                       .dmem(dmem_mem)
                       );
  MEM_WB_Reg memwb_reg(.clk(clk),
                       .flush(flush_memwb),
                       .stall(stall_memwb),
                       .rst(~rstn),
                       .valid_mem(valid_mem),
                       .valid_wb(valid_wb),

                       .pc_mem(pc_mem),
                       .npc_mem(npc_mem),
                       .inst_mem(inst_mem),
                       .pc_wb(pc_wb),
                       .npc_wb(npc_wb),
                       .inst_wb(inst_wb),

                       .we_reg_mem(we_reg_mem),
                       .we_mem_mem(we_mem_mem),
                       .wb_sel_mem(wb_sel_mem),
                       .br_taken_mem(br_taken_mem),
                       .we_reg_wb(we_reg_wb),
                       .we_mem_wb(we_mem_wb),
                       .wb_sel_wb(wb_sel_wb),
                       .br_taken_wb(br_taken_wb),

                       .rw_wdata(rw_wdata),
                       .rd_mem(rd_addr_mem),
                       .alu_res_mem(alu_res_mem),
                       .dmem_mem(dmem_mem),
                       .mem_wdata_wb(mem_wdata_wb),
                       .rd_wb(rd_addr_wb),
                       .alu_res_wb(alu_res_wb),
                       .dmem_wb(dmem_wb),
                       .rs1_data_mem(rs1_data_mem),
                       .rs2_data_mem(rs2_data_mem),                       
                       .rs1_data_wb(rs1_data_wb),
                       .rs2_data_wb(rs2_data_wb)
                       );    
  WB_MUX wbmux(.wb_sel(wb_sel_wb),
               .npc(npc_wb),
               .dmem(dmem_wb),
               .res(alu_res_wb),
               .rf(cosim_rd_data)
               );

  RaceController racecontroller(.is_load_exe(is_load_exe),
                                .rs1_addr_id(rs1_addr_id),
                                .rs2_addr_id(rs2_addr_id),
                                .use_rs1_id(use_rs1_id),
                                .use_rs2_id(use_rs2_id),
                                .rd_addr_exe(rd_addr_exe),
                                .rd_addr_mem(rd_addr_mem),
                                .we_reg_exe(we_reg_exe),
                                .we_reg_mem(we_reg_mem),
                                .npc_sel_id(npc_sel_id),
                                .npc_sel_exe(npc_sel_exe),
                                .br_taken(br_taken_exe),

                                .if_stall(if_stall),
                                .mem_stall(mem_stall),

                                .stall_PC(stall_pc),
                                .stall_IFID(stall_ifid),
                                .stall_IDEXE(stall_idexe),
                                .stall_EXEMEM(stall_exemem),
                                .stall_MEMWB(stall_memwb),
                                .flush_IFID(flush_ifid),
                                .flush_IDEXE(flush_idexe),
                                .flush_EXEMEM(flush_exemem),
                                .flush_MEMWB(flush_memwb)                             
                                );
  ForwardingUnit forwarding_unit(.rs1_addr_id(rs1_addr_id),
                                 .rs1_data_id(rs1_data_id),
                                 .rs2_addr_id(rs2_addr_id),
                                 .rs2_data_id(rs2_data_id),
                                 .rd_addr_exe(rd_addr_exe),
                                 .rd_addr_mem(rd_addr_mem),
                                 .alu_res_exe(alu_res_exe),
                                 .npc_exe(npc_exe),
                                 .wb_sel_exe(wb_sel_exe),
                                 .we_reg_exe(we_reg_exe),
                                 .alu_res_mem(alu_res_mem),
                                 .npc_mem(npc_mem),
                                 .wb_sel_mem(wb_sel_mem),
                                 .we_reg_mem(we_reg_mem),
                                 .dmem_mem(dmem_mem),
                                 .rs1_data_idexe(rs1_data_idexe),
                                 .rs2_data_idexe(rs2_data_idexe)
                                );

assign cosim_mem_wdata = mem_wdata_wb;
assign cosim_mem_rdata = dmem_wb;
assign cosim_mem_addr = alu_res_wb;
assign cosim_rs1_id = cosim_inst[19:15];
assign cosim_rs2_id = cosim_inst[24:20];
assign cosim_rs1_data = rs1_data_wb;
assign cosim_rs2_data = rs2_data_wb;
assign cosim_br_taken = br_taken_wb;
assign cosim_valid = valid_wb;
assign cosim_pc = pc_wb;
assign cosim_inst = inst_wb;
assign cosim_alu = alu_res_wb;
assign cosim_rd_id = rd_addr_wb;
assign cosim_npc = npc_wb;
assign cosim_rd_we = we_reg_wb;
assign cosim_mem_we = we_mem_wb;


assign pc = next_pc_mux;
assign address = alu_res_exe;
assign we_mem = we_mem_exe;
assign wdata_mem = rw_wdata;
assign wmask_mem = rw_wmask;
assign re_mem = is_load_exe;
assign inst_if = inst;

endmodule