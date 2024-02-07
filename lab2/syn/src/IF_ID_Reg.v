`timescale 1ns/1ps

module IF_ID_Reg(
    input clk,
    input flush,
    input stall,
    input rst,
    input valid_if,
    output reg valid_id,
//以下三个数据将在每个阶段寄存器组间继承
    input [63:0]pc_if,
    input [63:0]npc_if,
    input [31:0]inst_if,
    output reg [63:0]pc_id,   
    output reg [63:0]npc_id,
    output reg [31:0]inst_id,

    output reg [4:0]rd_addr_id,
    output reg [4:0]rs1_addr_id,
    output reg [4:0]rs2_addr_id

);

    always @(posedge clk) begin
        if (flush || rst) begin  //重置
            pc_id <= 0;
            npc_id <= 0;
            inst_id <= 0;

            rd_addr_id <= 0;
            rs1_addr_id <= 0;
            rs2_addr_id <= 0;
            valid_id <= 0;
        end
        else begin      //传递所需信号和数据
            if (stall == 1) begin
                pc_id <= pc_id;
                npc_id <= npc_id;
                inst_id <= inst_id;
                
                rd_addr_id <= rd_addr_id;
                rs1_addr_id <= rs1_addr_id;
                rs2_addr_id <= rs2_addr_id;
                valid_id <= valid_id;
            end
            else begin
                pc_id <= pc_if;
                npc_id <= npc_if;
                inst_id <= inst_if;
                rd_addr_id <= inst_if[11:7];
                rs1_addr_id <= inst_if[19:15];
                rs2_addr_id <= inst_if[24:20];
                valid_id <= valid_if;
            end
        end

    end

endmodule
