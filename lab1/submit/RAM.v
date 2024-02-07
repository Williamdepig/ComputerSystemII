`timescale 1ns / 1ps

// Copyright 2023 Sycuricon Group
// Author: Jinyan Xu (phantom@zju.edu.cn)

module RAM (
    input  clk,
    input  rstn,
    input  rw_wmode,
    input  [8:0] rw_addr,
    input  [63:0] rw_wdata,
    input  [7:0] rw_wmask,
    output reg [63:0] rw_rdata,
    input  [8:0] ro_addr,
    output reg [63:0] ro_rdata
);

    localparam FILE_PATH = "/mnt/d/software/git/sys2-fa23/src/lab1/testcase/syn/syn.hex";
    integer i;
    (* ram_style = "block" *) reg [63:0] mem [0:511];
    
    initial begin
        $readmemh(FILE_PATH, mem);
    end

    always @(posedge clk) begin
        if(rstn)begin
            if (rw_wmode) begin
                for(i = 0; i < 8; i = i+1) begin
                    if(rw_wmask[i]) begin
                        mem[rw_addr][i*8 +: 8] <= rw_wdata[i*8 +: 8];
                    end
                end
            end
        end
        rw_rdata <= mem[rw_addr];
        ro_rdata <= mem[ro_addr];
    end

endmodule
