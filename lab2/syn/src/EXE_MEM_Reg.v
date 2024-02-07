`timescale 1ns/1ps

module EXE_MEM_Reg(
    input clk,
    input rst,
    input flush,
    input stall,
    input valid_exe,
    output reg valid_mem,
//以下三个数据将在每个阶段寄存器组间继承
    input [63:0]pc_exe,
    input [63:0]npc_exe,
    input [31:0]inst_exe,
    output reg [63:0]pc_mem,   
    output reg [63:0]npc_mem,
    output reg [31:0]inst_mem,
//以下是之后使用到的控制信号
    input is_load_exe,
    input we_reg_exe,
    input we_mem_exe,
    input [1:0]wb_sel_exe,
    input [2:0]memdata_width_exe,
    input [3:0]br_taken_exe,
    output reg is_load_mem,
    output reg we_reg_mem,
    output reg we_mem_mem,
    output reg [1:0]wb_sel_mem,
    output reg [2:0]memdata_width_mem,
    output reg [3:0]br_taken_mem,
//以下是之后使用到的数据
    input [4:0]rd_exe,
    input [63:0]alu_res_exe,
    input [63:0]rs1_data_exe,
    input [63:0]rs2_data_exe,
    output reg [4:0]rd_mem,
    output reg [63:0]alu_res_mem,
    output reg [63:0]rs1_data_mem,
    output reg [63:0]rs2_data_mem
);

    always @(posedge clk) begin
        if (flush || rst) begin  //重置
            pc_mem <= 0;
            npc_mem <= 0;
            inst_mem <= 0;
            valid_mem <= 0;

            is_load_mem <= 0;
            we_reg_mem <= 0;
            we_mem_mem <= 0;
            wb_sel_mem <= 0;
            memdata_width_mem <= 0;
            br_taken_mem <= 0;

            rd_mem <= 0;
            alu_res_mem <= 0;
            rs1_data_mem <= 0;
            rs2_data_mem <= 0; 
        end
        else begin      //传递所需信号和数据
            if (stall) begin
                pc_mem <= pc_mem;
                npc_mem <= npc_mem;
                inst_mem <= inst_mem;
                valid_mem <= valid_mem;

                is_load_mem <= is_load_mem;
                we_reg_mem <= we_reg_mem;
                we_mem_mem <= we_mem_mem;
                wb_sel_mem <= wb_sel_mem;
                memdata_width_mem <= memdata_width_mem;
                br_taken_mem <= br_taken_mem;

                rd_mem <= rd_mem;
                alu_res_mem <= alu_res_mem;
                rs1_data_mem <= rs1_data_mem;
                rs2_data_mem <= rs2_data_mem;                 
            end
            else begin
                pc_mem <= pc_exe;
                npc_mem <= npc_exe;
                inst_mem <= inst_exe;
                valid_mem <= valid_exe;

                is_load_mem <= is_load_exe;
                we_reg_mem <= we_reg_exe;
                we_mem_mem <= we_mem_exe;
                wb_sel_mem <= wb_sel_exe;
                memdata_width_mem <= memdata_width_exe;
                br_taken_mem <= br_taken_exe;
                
                rd_mem <= rd_exe;
                alu_res_mem <= alu_res_exe;
                rs1_data_mem <= rs1_data_exe;
                rs2_data_mem <= rs2_data_exe;
            end
        end
    end

endmodule
