`timescale 1ns / 1ps

// Copyright 2023 Sycuricon Group
// Author: Jinyan Xu (phantom@zju.edu.cn)

module Testbench (
    input clk,
	input rstn
	// output [63:0] cosim_mem_addr, 
	// output [63:0] cosim_mem_we, 
	// output [63:0] cosim_mem_wdata 
	// output [63:0] cosim_mem_rdata
);

wire [63:0] cosim_pc, 
	cosim_inst, 
	cosim_rs1_id, 
	cosim_rs1_data, 
	cosim_rs2_id, 
	cosim_rs2_data, 
	cosim_alu, 
	cosim_mem_addr, 
	cosim_mem_we, 
	cosim_mem_wdata, 
	cosim_mem_rdata, 
	cosim_rd_we, 
	cosim_rd_id, 
	cosim_rd_data, 
	cosim_br_taken, 
	cosim_npc;

	wire cosim_valid;

    PipelineCPU dut (   
        .clk(clk),
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
	    .cosim_npc(cosim_npc)
	);

    cj_cosimulation difftest (   
        .clk(clk),
	    .rstn(rstn),
		.cosim_valid(cosim_valid),
	    .cosim_pc(cosim_pc),
	    .cosim_inst(cosim_inst),
	    .cosim_we(cosim_rd_we),
	    .cosim_rd(cosim_rd_id),
	    .cosim_wdate(cosim_rd_data)
    );

endmodule

