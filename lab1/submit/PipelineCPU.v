module PipelineCPU (
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
    output wire [ 3:0] cosim_mem_we,      /* memory write enable */
    output wire [63:0] cosim_mem_wdata,   /* memory write data */
    output wire [63:0] cosim_mem_rdata,   /* memory read data */
    output wire [ 3:0] cosim_rd_we,       /* rd write enable */
    output wire [ 7:0] cosim_rd_id,       /* rd id */
    output wire [63:0] cosim_rd_data,     /* rd data */
    output wire [ 3:0] cosim_br_taken,    /* branch taken? */
    output wire [63:0] cosim_npc          /* next pc */

);
  wire we_mem_exe;
  wire [8:0]alu_res_ram;
  wire [7:0]rw_wmask;
  wire [8:0]ro_addr;
  wire [63:0]rw_wdata;
  wire [63:0]ro_rdata;
  wire [63:0]rw_rdata;

  Core core(.clk(clk),
             .rstn(rstn),
             .cosim_valid(cosim_valid),
             .cosim_pc(cosim_pc),
             .cosim_inst(cosim_inst),
             .cosim_rs1_id(cosim_rs1_id),
             .cosim_rs1_data(cosim_rs1_data),
             .cosim_rs2_id(cosim_rs2_id),
             .cosim_rs2_data(cosim_rs2_data),
             .cosim_alu(cosim_alu),
             .cosim_mem_addr(cosim_mem_addr),
             .cosim_mem_we(cosim_mem_we),
             .cosim_mem_wdata(cosim_mem_wdata),
             .cosim_mem_rdata(cosim_mem_rdata),
             .cosim_rd_we(cosim_rd_we),
             .cosim_rd_id(cosim_rd_id),
             .cosim_rd_data(cosim_rd_data),
             .cosim_br_taken(cosim_br_taken),
             .cosim_npc(cosim_npc),
             
             .we_mem_exe(we_mem_exe),
             .alu_res_ram(alu_res_ram),
             .rw_wmask(rw_wmask),
             .ro_addr(ro_addr),
             .rw_wdata(rw_wdata),
             .rw_rdata(rw_rdata),
             .ro_rdata(ro_rdata)
             );


  RAM ram(.clk(clk),                       
          .rstn(rstn),
          .rw_wmode(we_mem_exe),
          .rw_addr(alu_res_ram),
          .rw_wdata(rw_wdata),
          .rw_wmask(rw_wmask),
          .rw_rdata(rw_rdata),
          .ro_addr(ro_addr),
          .ro_rdata(ro_rdata)
          );
endmodule
