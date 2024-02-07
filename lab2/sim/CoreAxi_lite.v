module CoreAxi_lite #
(
    // Width of M_AXI address bus. 
// The master generates the read and write addresses of width specified as C_M_AXI_ADDR_WIDTH.
    parameter integer C_M_AXI_ADDR_WIDTH	= 64,
    // Width of M_AXI data bus. 
// The master issues write data and accept read data where the width of the data bus is C_M_AXI_DATA_WIDTH
    parameter integer C_M_AXI_DATA_WIDTH	= 64
)
(
    input wire  M_AXI_ACLK,
    // AXI active low reset signal
    input wire  M_AXI_ARESETN,

    // Master Interface Write Address Channel ports. Write address (issued by master)
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
    // Write channel Protection type.
// This signal indicates the privilege and security level of the transaction,
// and whether the transaction is a data access or an instruction access.
    output wire [2 : 0] M_AXI_AWPROT,
    // Write address valid. 
// This signal indicates that the master signaling valid write address and control information.
    output wire  M_AXI_AWVALID,
    // Write address ready. 
// This signal indicates that the slave is ready to accept an address and associated control signals.
    input wire  M_AXI_AWREADY,

    // Master Interface Write Data Channel ports. Write data (issued by master)
    output wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
    // Write strobes. 
// This signal indicates which byte lanes hold valid data.
// There is one write strobe bit for each eight bits of the write data bus.
    output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
    // Write valid. This signal indicates that valid write data and strobes are available.
    output wire  M_AXI_WVALID,
    // Write ready. This signal indicates that the slave can accept the write data.
    input wire  M_AXI_WREADY,

    // Master Interface Write Response Channel ports. 
// This signal indicates the status of the write transaction.
    input wire [1 : 0] M_AXI_BRESP,
    // Write response valid. 
// This signal indicates that the channel is signaling a valid write response
    input wire  M_AXI_BVALID,
    // Response ready. This signal indicates that the master can accept a write response.
    output wire  M_AXI_BREADY,

    /****************************************************************/

    // Master Interface Read Address Channel ports. Read address (issued by master)
    output wire [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
    // Protection type. 
// This signal indicates the privilege and security level of the transaction, 
// and whether the transaction is a data access or an instruction access.
    output wire [2 : 0] M_AXI_ARPROT,
    // Read address valid. 
// This signal indicates that the channel is signaling valid read address and control information.
    output wire  M_AXI_ARVALID,
    // Read address ready. 
// This signal indicates that the slave is ready to accept an address and associated control signals.
    input wire  M_AXI_ARREADY,

    // Master Interface Read Data Channel ports. Read data (issued by slave)
    input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
    // Read response. This signal indicates the status of the read transfer.
    input wire [1 : 0] M_AXI_RRESP,
    // Read valid. This signal indicates that the channel is signaling the required read data.
    input wire  M_AXI_RVALID,
    // Read ready. This signal indicates that the master can accept the read data and response information.
    output wire  M_AXI_RREADY,

    /****************************************************************/

    input wire [C_M_AXI_ADDR_WIDTH-1:0] address_mem,
    input wire ren_mem,
    input wire wen_mem,
    input wire [(C_M_AXI_DATA_WIDTH/8)-1:0] wmask_mem,
    input wire [C_M_AXI_DATA_WIDTH-1:0] wdata_mem,
    output wire [C_M_AXI_DATA_WIDTH-1:0] rdata_mem,
    output wire valid_mem,
    output reg [1:0] resp_mem
);

	reg axi_awvalid;
    reg [C_M_AXI_ADDR_WIDTH-1 : 0] axi_awaddr;
	reg axi_wvalid;
    reg [C_M_AXI_DATA_WIDTH-1 : 0] axi_wdata;
    reg [C_M_AXI_DATA_WIDTH/8-1 : 0] axi_wstrb;
    reg axi_bready;
	reg axi_arvalid;
    reg [C_M_AXI_ADDR_WIDTH-1 : 0] axi_araddr;
	reg axi_rready;
    reg [C_M_AXI_DATA_WIDTH-1 : 0] axi_rdata;
    reg [1:0] axi_resp;
    reg [1:0] axi_bresp;
	
	assign M_AXI_AWADDR	= axi_awaddr;
	assign M_AXI_WDATA	= axi_wdata;
	assign M_AXI_AWPROT	= 3'b000;
	assign M_AXI_AWVALID= axi_awvalid;
	assign M_AXI_WVALID	= axi_wvalid;
	assign M_AXI_WSTRB	= axi_wstrb;
	assign M_AXI_BREADY	= axi_bready;
	assign M_AXI_ARADDR	= axi_araddr;
	assign M_AXI_ARVALID= axi_arvalid;
	assign M_AXI_ARPROT	= 3'b001;
	assign M_AXI_RREADY	= axi_rready;

    localparam WIDLE=2'b00;
    localparam WSETDATA=2'b01;
    localparam WWAITDATA=2'b10;
    localparam WWAITBRESP=2'b11;

    reg [1:0] wstate;

    always@(posedge M_AXI_ACLK)begin
        if(~M_AXI_ARESETN)begin
            axi_awvalid<=1'b0;
            axi_wvalid<=1'b0;
            axi_bready<=1'b0;
            wstate<=WIDLE;
            axi_awaddr<=64'b0;
            axi_wdata<=64'b0;
            axi_wstrb<=8'b0;
        end else begin
            case(wstate)
                WIDLE:
                    begin
                        if(wen_mem)begin
                            axi_awaddr<=address_mem;
                            axi_wdata<=wdata_mem;
                            axi_wstrb<=wmask_mem;
                            wstate<=WSETDATA;
                        end
                    end
                WSETDATA:
                    begin
                        axi_awvalid<=1'b1;
                        axi_wvalid<=1'b1;
                        wstate<=WWAITDATA;
                    end
                WWAITDATA:
                    begin
                        if(M_AXI_WREADY)axi_wvalid<=1'b0;
                        if(M_AXI_AWREADY)axi_awvalid<=1'b0;
                        if((M_AXI_WREADY|~axi_wvalid)&
                            (M_AXI_AWREADY|~axi_awvalid))begin
                            wstate<=WWAITBRESP;
                            axi_bready<=1'b1;
                        end
                    end
                WWAITBRESP:
                    begin
                        if(M_AXI_BVALID)begin
                            axi_bready<=1'b0;
                            axi_bresp<=M_AXI_BRESP;
                            wstate<=WIDLE;
                        end
                    end
            endcase
        end
    end

    localparam RIDLE=3'b000;
    localparam RSETADDR=3'b001;
    localparam RWAITADDR=3'b010;
    localparam RWAITDATA=3'b011;
    localparam RLOADDATA=3'b100;

    reg [2:0] rstate;

    always@(posedge M_AXI_ACLK)begin
        if(~M_AXI_ARESETN)begin
            rstate<=RIDLE;
            axi_arvalid<=1'b0;
            axi_rready<=1'b0;
            axi_araddr<=64'b0;
            axi_rdata<=64'b0;
            axi_bresp<=2'b0;
            axi_resp<=2'b0;
        end else begin
            case(rstate)
                RIDLE:
                    begin
                        if(ren_mem)begin
                            axi_araddr<=address_mem;
                            rstate<=RSETADDR;
                        end
                    end
                RSETADDR:
                    begin
                        rstate<=RWAITADDR;
                        axi_arvalid<=1'b1;
                    end
                RWAITADDR:
                    begin
                        if(M_AXI_ARREADY)begin
                            axi_arvalid<=1'b0;
                            rstate<=RWAITDATA;
                            axi_rready<=1'b1;
                        end
                    end
                RWAITDATA:
                    begin
                        if(M_AXI_RVALID)begin
                            axi_rready<=1'b0;
                            axi_rdata<=M_AXI_RDATA;
                            axi_resp<=M_AXI_RRESP;
                            rstate<=RLOADDATA;
                        end
                    end
                default:
                    begin
                        rstate<=RIDLE;
                    end
            endcase
        end
    end

    assign valid_mem=rstate==RLOADDATA|M_AXI_BVALID&(wstate==WWAITBRESP);

    assign rdata_mem=axi_rdata;
    always@(posedge M_AXI_ACLK)begin
        if(~M_AXI_ARESETN)resp_mem<=2'b0;
        else if(valid_mem)begin
            if(wen_mem)resp_mem<=axi_bresp;
            else resp_mem<=axi_resp;
        end
    end

endmodule