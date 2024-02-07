`timescale 1ns/1ps

module PC(
    input clk,
    input rst,
    input stall,
    input [63:0]pc_in,
    output valid_if,
    output reg [63:0]pc,
    output [63:0]npc

);

    always@(posedge clk) begin    
        if(rst) begin    
            pc <= 0;
        end
        else begin
            if (stall)begin
                pc <= pc;
            end    
            else begin
                pc <= pc_in;
            end    
        end
    end
    assign npc = rst ? 0 : (stall ? pc : (pc + 4));
    assign valid_if = 1;
endmodule