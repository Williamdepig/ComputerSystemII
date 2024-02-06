`timescale 1ns/1ps

module PC(
    input clk,
    input rst,
    input stall,
    input switch_mode,
    input [63:0]pc_in,
    input [63:0]pc_csr,
    input npc_sel_id,
    input npc_sel_exe,
    output valid_if,
    output reg [63:0]pc,
    output wire [63:0]npc,
    output wire if_request

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
                pc <= switch_mode ? pc_csr : pc_in;
            end    
        end
    end
    assign npc = rst ? 0 : (stall ? pc : (pc + 4));
    assign valid_if = 1;
    assign if_request = ~rst & ~npc_sel_id & ~npc_sel_exe;//不发送request请求，运行一拍，使得next_pc能够进入到pc中
endmodule
//asdf