`timescale 1ns / 1ps

// Copyright 2023 Sycuricon Group
// Author: Jinyan Xu (phantom@zju.edu.cn)

module top (
    input wire         clk,
	input wire         rstn,
    input wire  [15:0] switch, 
    input wire  [ 4:0] btn,
    output wire [ 7:0] cs,
    output wire [ 7:0] an,
    output wire        vga_hs,
    output wire        vga_vs,
    output wire [ 3:0] vga_r,
    output wire [ 3:0] vga_g,
    output wire [ 3:0] vga_b
);
    wire clk_core;

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

    PipelineCPU dut (   
        .clk(clk_core),
	    .rstn(rstn),
	    .cosim_valid(),
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
    
    IO io(
        .clk(clk),
        .rstn(rstn),
        .clk_core(clk_core),
        .switch(switch),
        .btn(btn),
        .cs(cs),
        .an(an),
        .vga_r(vga_r),
        .vga_g(vga_g),
        .vga_b(vga_b),
        .vga_hs(vga_hs),
        .vga_vs(vga_vs),
        .debug_pc(cosim_pc),
        .debug_inst(cosim_inst),
        .debug_rs1_id(cosim_rs1_id),
        .debug_rs1(cosim_rs1_data),
        .debug_rs2_id(cosim_rs2_id),
        .debug_rs2(cosim_rs2_data),
        .debug_alu(cosim_alu),
        .debug_mem_addr(cosim_mem_addr),
        .debug_mem_we(cosim_mem_we),
        .debug_mem_wdata(cosim_mem_wdata),
        .debug_mem_rdata(cosim_mem_rdata),
        .debug_rd_id(cosim_rd_id),
        .debug_rd_we(cosim_rd_we),
        .debug_rd(cosim_rd_data),
        .debug_br_taken(cosim_br_taken),
        .debug_npc(cosim_npc)
    );
endmodule
