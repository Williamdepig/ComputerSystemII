module Axi_lite_Core #
(
    parameter integer C_M_AXI_ADDR_WIDTH	= 64,
    parameter integer C_M_AXI_DATA_WIDTH	= 64
)
(
    input wire  M_AXI_ACLK,
    input wire  M_AXI_ARESETN,
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
    output wire [2 : 0] M_AXI_AWPROT,
    output wire  M_AXI_AWVALID,
    input wire  M_AXI_AWREADY,
    output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
    output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
    output wire  M_AXI_WVALID,
    input wire  M_AXI_WREADY,
    input wire [1 : 0] M_AXI_BRESP,
    input wire  M_AXI_BVALID,
    output wire  M_AXI_BREADY,
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
    output wire [2 : 0] M_AXI_ARPROT,
    output wire  M_AXI_ARVALID,
    input wire  M_AXI_ARREADY,
    input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
    input wire [1 : 0] M_AXI_RRESP,
    input wire  M_AXI_RVALID,
    output wire  M_AXI_RREADY,

    output wire cosim_valid,
    output wire [63:0] cosim_pc,          /* current pc */
    output wire [31:0] cosim_inst,        /* current instruction */
    output wire [ 7:0] cosim_rs1_id,      /* rs1 id */
    output wire [63:0] cosim_rs1_data,    /* rs1 data */
    output wire [ 7:0] cosim_rs2_id,      /* rs2 id */
    output wire [63:0] cosim_rs2_data,    /* rs2 data */
    output wire [63:0] cosim_alu,         /* alu out */
    output wire [63:0] cosim_mem_addr,    /* memory address */
    output wire [ 3:0] cosim_mem_we,      /* memory write enable */
    output wire [63:0] cosim_mem_wdata,   /* memory write data */
    output wire [63:0] cosim_mem_rdata,   /* memory read data */
    output wire [ 3:0] cosim_rd_we,       /* rd write enable */
    output wire [ 7:0] cosim_rd_id,       /* rd id */
    output wire [63:0] cosim_rd_data,     /* rd data */
    output wire [ 3:0] cosim_br_taken,    /* branch taken? */
    output wire [63:0] cosim_npc          /* next pc */
);
    wire [63:0] pc;
    wire [63:0] address_cpu;
    wire wen_cpu;
    wire ren_cpu;
    wire [63:0] wdata_cpu;
    wire [7:0] wmask_cpu;
    wire [31:0] inst;
    wire [63:0] rdata_cpu;
    wire if_stall;
    wire mem_stall;
    wire if_request;
    wire [63:0] address_mem;
    wire ren_mem;
    wire wen_mem;
    wire [7:0] wmask_mem;
    wire [63:0] wdata_mem;
    wire [63:0] rdata_mem;
    wire valid_mem;

    wire clk=M_AXI_ACLK;
    wire rstn=M_AXI_ARESETN;

    Core core(
        .clk(clk),
        .rstn(rstn),
        .pc(pc),                //output
        .inst(inst),            //input
        .address(address_cpu),  //output
        .we_mem(wen_cpu),       //output
        .wdata_mem(wdata_cpu),  //output
        .wmask_mem(wmask_cpu),  //output
        .re_mem(ren_cpu),       //output
        .rdata_mem(rdata_cpu),  //input
        .if_request(if_request),//output
        .if_stall(if_stall),    //input
        .mem_stall(mem_stall),  //input

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

    Core2Mem_FSM fsm(
        .clk(clk),
        .rstn(rstn),
        .pc(pc),
        .address_cpu(address_cpu),
        .wen_cpu(wen_cpu),
        .ren_cpu(ren_cpu),
        .wdata_cpu(wdata_cpu),
        .wmask_cpu(wmask_cpu),
        .inst(inst),
        .rdata_cpu(rdata_cpu),
        .if_stall(if_stall),
        .mem_stall(mem_stall),
        .if_request(if_request),

        .address_mem(address_mem),
        .ren_mem(ren_mem),
        .wen_mem(wen_mem),
        .wmask_mem(wmask_mem),
        .wdata_mem(wdata_mem),
        .rdata_mem(rdata_mem),
        .valid_mem(valid_mem)
    );

    CoreAxi_lite #(
        .C_M_AXI_ADDR_WIDTH(C_M_AXI_ADDR_WIDTH),
        .C_M_AXI_DATA_WIDTH(C_M_AXI_DATA_WIDTH)
    )   coreaxi_lite(
        .M_AXI_ACLK(M_AXI_ACLK),
        .M_AXI_ARESETN(M_AXI_ARESETN),
        .M_AXI_AWADDR(M_AXI_AWADDR),
        .M_AXI_AWPROT(M_AXI_AWPROT),
        .M_AXI_AWVALID(M_AXI_AWVALID),
        .M_AXI_AWREADY(M_AXI_AWREADY),
        .M_AXI_WDATA(M_AXI_WDATA),
        .M_AXI_WSTRB(M_AXI_WSTRB),
        .M_AXI_WVALID(M_AXI_WVALID),
        .M_AXI_WREADY(M_AXI_WREADY),
        .M_AXI_BRESP(M_AXI_BRESP),
        .M_AXI_BVALID(M_AXI_BVALID),
        .M_AXI_BREADY(M_AXI_BREADY),
        .M_AXI_ARADDR(M_AXI_ARADDR),
        .M_AXI_ARPROT(M_AXI_ARPROT),
        .M_AXI_ARVALID(M_AXI_ARVALID),
        .M_AXI_ARREADY(M_AXI_ARREADY),
        .M_AXI_RDATA(M_AXI_RDATA),
        .M_AXI_RRESP(M_AXI_RRESP),
        .M_AXI_RVALID(M_AXI_RVALID),
        .M_AXI_RREADY(M_AXI_RREADY),
        .address_mem(address_mem),
        .ren_mem(ren_mem),
        .wen_mem(wen_mem),
        .wmask_mem(wmask_mem),
        .wdata_mem(wdata_mem),
        .rdata_mem(rdata_mem),
        .valid_mem(valid_mem),
        .resp_mem()
    );

    
endmodule