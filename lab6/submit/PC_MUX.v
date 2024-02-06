`timescale 1ns/1ps

module PC_MUX(
    input rst,
    input [63:0] npc,
    input [63:0] alu_res,
    input npc_sel,
    input [3:0] br_taken,

    output reg [63:0] pc
);
    always @(*)begin
        if(npc_sel) begin
            if(br_taken[2:0] == 0) pc = alu_res;    //J-type指令
            else if(br_taken[3] == 1) pc = alu_res; //B-type跳转成立
            else pc = npc;                        //B-type跳转不成立
        end
        else pc = npc;
    end
 
endmodule