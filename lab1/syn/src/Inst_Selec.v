module Inst_Selec(
    input [63:0] pc,
    input [63:0] ro_rdata,

    output [31:0] inst
);
    assign inst[31:0] = ro_rdata[pc[2:0]*8 +:32];
endmodule