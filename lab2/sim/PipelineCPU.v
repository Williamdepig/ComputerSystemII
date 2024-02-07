module PipelineCPU (
    input wire clk,                       /* 时钟 */ 
    input wire rstn,                      /* 重置信号 */ 
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
    output wire [63:0] cosim_npc         /* next pc */

);

    wire [63:0] AWADDR;
    wire [2:0] AWPROT;
    wire AWVALID;
    wire AWREADY;
    wire [63:0] WDATA;
    wire [7:0] WSTRB;
    wire WVALID;
    wire WREADY;
    wire [1:0] BRESP;
    wire BVALID;
    wire BREADY;
    wire [63:0] ARADDR;
    wire [2:0] ARPROT;
    wire ARVALID;
    wire ARREADY;
    wire [63:0] RDATA;
    wire [1:0] RRESP;
    wire RVALID;
    wire RREADY;

    Axi_lite_Core #(
        .C_M_AXI_ADDR_WIDTH(64),
        .C_M_AXI_DATA_WIDTH(64)
    ) axi_lite_core (
        .M_AXI_ACLK(clk),
        .M_AXI_ARESETN(rstn),
        .M_AXI_AWADDR (AWADDR),
        .M_AXI_AWPROT (AWPROT),
        .M_AXI_AWVALID(AWVALID),
        .M_AXI_AWREADY(AWREADY),
        .M_AXI_WDATA  (WDATA),
        .M_AXI_WSTRB  (WSTRB),
        .M_AXI_WVALID (WVALID),
        .M_AXI_WREADY (WREADY),
        .M_AXI_BRESP  (BRESP),
        .M_AXI_BVALID (BVALID),
        .M_AXI_BREADY (BREADY),
        .M_AXI_ARADDR (ARADDR),
        .M_AXI_ARPROT (ARPROT),
        .M_AXI_ARVALID(ARVALID),
        .M_AXI_ARREADY(ARREADY),
        .M_AXI_RDATA  (RDATA),
        .M_AXI_RRESP  (RRESP),
        .M_AXI_RVALID (RVALID),
        .M_AXI_RREADY (RREADY),

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

    Axi_lite_Mem #(
        .C_S_AXI_ADDR_WIDTH(64),
        .C_S_AXI_DATA_WIDTH(64)
    ) axi_lite_mem (
        .S_AXI_ACLK(clk),
        .S_AXI_ARESETN(rstn),
        .S_AXI_AWADDR (AWADDR),
        .S_AXI_AWPROT (AWPROT),
        .S_AXI_AWVALID(AWVALID),
        .S_AXI_AWREADY(AWREADY),
        .S_AXI_WDATA  (WDATA),
        .S_AXI_WSTRB  (WSTRB),
        .S_AXI_WVALID (WVALID),
        .S_AXI_WREADY (WREADY),
        .S_AXI_BRESP  (BRESP),
        .S_AXI_BVALID (BVALID),
        .S_AXI_BREADY (BREADY),
        .S_AXI_ARADDR (ARADDR),
        .S_AXI_ARPROT (ARPROT),
        .S_AXI_ARVALID(ARVALID),
        .S_AXI_ARREADY(ARREADY),
        .S_AXI_RDATA  (RDATA),
        .S_AXI_RRESP  (RRESP),
        .S_AXI_RVALID (RVALID),
        .S_AXI_RREADY (RREADY)
    );

endmodule
