
`timescale 1 ns / 1 ps

module MemAxi_lite #
(
    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH	= 64,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH	= 64
)
(
    // Global Clock Signal
    input wire  S_AXI_ACLK,
    // Global Reset Signal. This Signal is Active LOW
    input wire  S_AXI_ARESETN,

    // Write address (issued by master, acceped by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    // Write channel Protection type. This signal indicates the
        // privilege and security level of the transaction, and whether
        // the transaction is a data access or an instruction access.
    input wire [2 : 0] S_AXI_AWPROT,
    // Write address valid. This signal indicates that the master signaling
        // valid write address and control information.
    input wire  S_AXI_AWVALID,
    // Write address ready. This signal indicates that the slave is ready
        // to accept an address and associated control signals.
    output wire  S_AXI_AWREADY,

    // Write data (issued by master, acceped by Slave) 
    input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
    // Write strobes. This signal indicates which byte lanes hold
        // valid data. There is one write strobe bit for each eight
        // bits of the write data bus.    
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    // Write valid. This signal indicates that valid write
        // data and strobes are available.
    input wire  S_AXI_WVALID,
    // Write ready. This signal indicates that the slave
        // can accept the write data.
    output wire  S_AXI_WREADY,

    // Write response. This signal indicates the status
        // of the write transaction.
    output wire [1 : 0] S_AXI_BRESP,
    // Write response valid. This signal indicates that the channel
        // is signaling a valid write response.
    output wire  S_AXI_BVALID,
    // Response ready. This signal indicates that the master
        // can accept a write response.
    input wire  S_AXI_BREADY,

    /**********************************************************************/

    // Read address (issued by master, acceped by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
    // Protection type. This signal indicates the privilege
        // and security level of the transaction, and whether the
        // transaction is a data access or an instruction access.
    input wire [2 : 0] S_AXI_ARPROT,
    // Read address valid. This signal indicates that the channel
        // is signaling valid read address and control information.
    input wire  S_AXI_ARVALID,
    // Read address ready. This signal indicates that the slave is
        // ready to accept an address and associated control signals.
    output wire  S_AXI_ARREADY,

    // Read data (issued by slave)
    output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
    // Read response. This signal indicates the status of the
        // read transfer.
    output wire [1 : 0] S_AXI_RRESP,
    // Read valid. This signal indicates that the channel is
        // signaling the required read data.
    output wire  S_AXI_RVALID,
    // Read ready. This signal indicates that the master can
        // accept the read data and response information.
    input wire  S_AXI_RREADY,

    /**********************************************************************/

    output wire [C_S_AXI_ADDR_WIDTH-1 : 0] addr_mem,
    output wire [C_S_AXI_DATA_WIDTH-1 : 0] wdata_mem,
    input  wire [C_S_AXI_DATA_WIDTH-1 : 0] rdata_mem,
    input  wire valid_mem, 
    output reg wen_mem,
    output reg ren_mem,
    output wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] wmask_mem
);

    reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_awaddr;
	reg axi_awready;
    reg [C_S_AXI_DATA_WIDTH-1 : 0] axi_wdata;
    reg [C_S_AXI_DATA_WIDTH/8-1 : 0] axi_wstrb;
	reg axi_wready;
	reg [1 : 0] axi_bresp;
	reg axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] axi_araddr;
	reg axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] axi_rdata;
	reg [1 : 0] axi_rresp;
	reg axi_rvalid;

    assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;

    localparam WIDLE=2'b00;
    localparam WGETDATA=2'b01;
    localparam WWORK=2'b10;
    localparam WBRESP=2'b11;
    reg [1:0] wstate;
    always@(posedge S_AXI_ACLK)begin
        if(!S_AXI_ARESETN)begin
            wstate<=WIDLE;
            axi_awaddr<=64'b0;
            axi_awready<=1'b0;
            axi_wdata<=64'b0;
            axi_wready<=1'b0;
            axi_bresp<=2'b0;
            axi_bvalid<=1'b0;
            wen_mem<=1'b0;
            axi_wstrb<=8'b0;
        end else begin
            case(wstate)
                WIDLE:
                    begin
                        if(S_AXI_WVALID&S_AXI_AWVALID)begin
                            axi_wready<=1'b1;
                            axi_awready<=1'b1;
                            axi_awaddr<=S_AXI_AWADDR;
                            axi_wdata<=S_AXI_WDATA;
                            axi_wstrb<=S_AXI_WSTRB;
                            wstate<=WGETDATA;
                        end
                    end
                WGETDATA:
                    begin
                        wen_mem<=1'b1;
                        wstate<=WWORK;
                        axi_awready<=1'b0;
                        axi_wready<=1'b0;
                    end
                WWORK:
                    begin
                        if(valid_mem)begin
                            wen_mem<=1'b0;
                            wstate<=WBRESP;
                            axi_bvalid<=1'b1;
                            axi_bresp<=2'b0;
                        end
                    end
                WBRESP:
                    begin
                        if(S_AXI_BREADY)begin
                            wstate<=WIDLE;
                            axi_bvalid<=1'b0;
                        end
                    end
            endcase
        end
    end

    assign addr_mem=wen_mem?axi_awaddr:axi_araddr;
    assign wmask_mem=axi_wstrb;
    assign wdata_mem=axi_wdata;

    localparam RIDLE=2'b00;
    localparam RGETADDR=2'b01;
    localparam RWORK=2'b10;
    localparam RRESP=2'b11;
    reg [1:0] rstate;
    always@(posedge S_AXI_ACLK)begin
        if(!S_AXI_ARESETN)begin
            rstate<=RIDLE;
            axi_arready<=1'b0;
            axi_rvalid<=1'b0;
            axi_rresp<=2'b0;
            ren_mem<=1'b0;
            axi_araddr<=64'b0;
            axi_rdata<=64'b0;
        end else begin
            case(rstate)
                RIDLE:
                    begin
                        if(S_AXI_ARVALID)begin
                            rstate<=RGETADDR;
                            axi_arready<=1'b1;
                            axi_araddr<=S_AXI_ARADDR;
                        end
                    end
                RGETADDR:
                    begin
                        axi_arready<=1'b0;
                        ren_mem<=1'b1;
                        rstate<=RWORK;
                    end
                RWORK:
                    begin
                        if(valid_mem)begin
                            ren_mem<=1'b0;
                            rstate<=RRESP;
                            axi_rdata<=rdata_mem;
                            axi_rvalid<=1'b1;
                            axi_rresp<=2'b0;
                        end
                    end
                RRESP:
                    begin
                        if(S_AXI_RREADY)begin
                            axi_rvalid<=1'b0;
                            rstate<=RIDLE;
                        end
                    end
            endcase
        end
    end

endmodule
