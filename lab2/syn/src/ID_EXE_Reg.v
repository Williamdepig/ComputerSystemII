`timescale 1ns/1ps

module ID_EXE_Reg(
    input clk,
    input flush,
    input stall,
    input rst,
    input valid_id,
    output reg valid_exe,
//以下三个数据将在每个阶段寄存器组间继承
    input [63:0]pc_id,
    input [63:0]npc_id,
    input [31:0]inst_id,
    output reg [63:0]pc_exe,   
    output reg [63:0]npc_exe,
    output reg [31:0]inst_exe,
//以下是之后使用到的控制信号
    input is_load_id,
    input we_reg_id,
    input we_mem_id,
    input npc_sel_id,
    input [1:0]alu_asel_id,
    input [1:0]alu_bsel_id,
    input [1:0]wb_sel_id,
    input [2:0]bralu_op_id,
    input [2:0]memdata_width_id,
    input [3:0]alu_op_id,
    output reg is_load_exe,
    output reg we_reg_exe,
    output reg we_mem_exe,
    output reg npc_sel_exe,
    output reg [1:0]alu_asel_exe,
    output reg [1:0]alu_bsel_exe,
    output reg [1:0]wb_sel_exe,
    output reg [2:0]bralu_op_exe,
    output reg [2:0]memdata_width_exe,
    output reg [3:0]alu_op_exe,
//以下是之后使用到的数据
    input [4:0]rd_id,
    input [63:0]rs1_data_id,
    input [63:0]rs2_data_id,
    input [63:0]imm_id,
    output reg [4:0]rd_exe,
    output reg [63:0]rs1_data_exe,
    output reg [63:0]rs2_data_exe,
    output reg [63:0]imm_exe
);

    always @(posedge clk) begin
        if (flush || rst) begin  //重置
            pc_exe <= 0;
            npc_exe <= 0;
            inst_exe <= 0;
            valid_exe <= 0;

            is_load_exe <= 0;
            we_reg_exe <= 0;
            we_mem_exe <= 0;
            npc_sel_exe <= 0;
            alu_asel_exe <= 0;
            alu_bsel_exe <= 0;
            wb_sel_exe <= 0;
            bralu_op_exe <= 0;
            memdata_width_exe <= 0;
            alu_op_exe <= 0;

            rd_exe <= 0;
            rs1_data_exe <= 0;
            rs2_data_exe <= 0;
            imm_exe <= 0;
        end
        else begin      //传递所需信号和数据
            if (stall) begin
                pc_exe <= pc_exe;
                npc_exe <= npc_exe;
                inst_exe <= inst_exe;
                valid_exe <= valid_exe;

                is_load_exe <= is_load_exe;
                we_reg_exe <= we_reg_exe;
                we_mem_exe <= we_mem_exe;
                npc_sel_exe <= npc_sel_exe;
                alu_asel_exe <= alu_asel_exe;
                alu_bsel_exe <= alu_bsel_exe;
                wb_sel_exe <= wb_sel_exe;
                bralu_op_exe <= bralu_op_exe;
                memdata_width_exe <= memdata_width_exe;
                alu_op_exe <= alu_op_exe;

                rd_exe <= rd_exe;
                rs1_data_exe <= rs1_data_exe;
                rs2_data_exe <= rs2_data_exe;
                imm_exe <= imm_exe;
            end
            else begin
                pc_exe <= pc_id;
                npc_exe <= npc_id;
                inst_exe <= inst_id;
                valid_exe <= valid_id;

                is_load_exe <= is_load_id;
                we_reg_exe <= we_reg_id;
                we_mem_exe <= we_mem_id;
                npc_sel_exe <= npc_sel_id;
                alu_asel_exe <= alu_asel_id;
                alu_bsel_exe <= alu_bsel_id;
                wb_sel_exe <= wb_sel_id;
                bralu_op_exe <= bralu_op_id;
                memdata_width_exe <= memdata_width_id;
                alu_op_exe <= alu_op_id;
                
                rd_exe <= rd_id;
                rs1_data_exe <= rs1_data_id;
                rs2_data_exe <= rs2_data_id;
                imm_exe <= imm_id;
            end
        end
    end

endmodule
