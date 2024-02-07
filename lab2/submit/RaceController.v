module RaceController(
    input is_load_exe,
    input [4:0]rs1_addr_id,
    input [4:0]rs2_addr_id,
    input use_rs1_id,
    input use_rs2_id,
    input [4:0]rd_addr_exe,
    input [4:0]rd_addr_mem,
    input we_reg_exe,
    input we_reg_mem,
    input npc_sel_id,
    input npc_sel_exe,
    input [3:0]br_taken,

    input if_stall,       //取内存的stall
    input mem_stall, 

    output wire stall_PC,
    output wire stall_IFID,
    output wire stall_IDEXE,
    output wire stall_EXEMEM,
    output wire stall_MEMWB,
    output wire flush_IFID,
    output wire flush_IDEXE,
    output wire flush_EXEMEM,
    output wire flush_MEMWB
);
//    assign stall_IFID = (rs1_addr_id == rd_addr_exe & we_reg_exe & rs1_addr_id != 0 & use_rs1_id) | (rs2_addr_id == rd_addr_exe & we_reg_exe & rs2_addr_id != 0 & use_rs2_id) | (rs1_addr_id == rd_addr_mem & we_reg_mem & rs1_addr_id != 0 & use_rs1_id) | (rs2_addr_id == rd_addr_mem & we_reg_mem & rs2_addr_id != 0 & use_rs2_id); 
    assign stall_IFID = (is_load_exe == 1 & rs1_addr_id == rd_addr_exe & we_reg_exe & rs1_addr_id != 0) | (is_load_exe == 1 & rs2_addr_id == rd_addr_exe & we_reg_exe & rs2_addr_id != 0) | stall_IDEXE;
    assign stall_PC = stall_IFID | if_stall | npc_sel_id | (npc_sel_exe & ~br_taken[3] & (br_taken[2:0] != 3'b000));//如果不跳转，额外stall一拍，使得pc不变，npc载入pc而非pc+4
    assign stall_IDEXE = stall_EXEMEM;
    assign stall_EXEMEM = mem_stall;
    assign stall_MEMWB = 0;
    assign flush_IFID = (stall_PC & ~stall_IFID) | npc_sel_exe;
    assign flush_IDEXE = (stall_IFID & ~stall_IDEXE) | npc_sel_exe;
    assign flush_EXEMEM = stall_IDEXE & ~stall_EXEMEM;
    assign flush_MEMWB = stall_EXEMEM & ~stall_MEMWB;
endmodule