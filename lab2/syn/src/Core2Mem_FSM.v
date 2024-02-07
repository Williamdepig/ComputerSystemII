module Core2Mem_FSM (
    input wire clk,
    input wire rstn,
    input wire [63:0] pc,
    input wire if_request,
    input wire [63:0] address_cpu,
    input wire wen_cpu,
    input wire ren_cpu,
    input wire [63:0] wdata_cpu,
    input wire [7:0] wmask_cpu,
    output [31:0] inst,
    output [63:0] rdata_cpu,
    output if_stall,
    output mem_stall,

    output reg [63:0] address_mem,
    output reg ren_mem,
    output reg wen_mem,
    output reg [7:0] wmask_mem,
    output reg [63:0] wdata_mem,
    input wire [63:0] rdata_mem,
    input wire valid_mem
);
    parameter IDLE = 3'b100,
              INST = 3'b010,
              DATA = 3'b001;
    reg [2:0] state;
    reg [2:0] next_state;

    reg [63:0] pc_reg;
    reg if_stall_reg;
    reg mem_stall_reg;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        next_state = IDLE;
        if_stall_reg = 0;
        mem_stall_reg = 0;
        case(state)
            IDLE: begin 
                next_state = wen_cpu | ren_cpu ? DATA : 
                             if_request        ? INST : 
                             IDLE;
                if_stall_reg = if_request;
                mem_stall_reg = wen_cpu | ren_cpu;
            end  
            DATA: begin
                next_state = valid_mem ? IDLE : DATA;
                if_stall_reg = if_request;
                mem_stall_reg = ~valid_mem;
            end
            INST: begin
                next_state = valid_mem ? IDLE : INST;
                if_stall_reg = ~valid_mem;
                mem_stall_reg = wen_cpu | ren_cpu; 
            end
            default: begin
                next_state = IDLE;
                if_stall_reg = 0;
                mem_stall_reg = 0;
            end
        endcase
    end
    always @(posedge clk or negedge rstn) begin 
        if (!rstn) begin
            address_mem <= 0;
            ren_mem <= 0;
            wen_mem <= 0;
            wmask_mem <= 0;
            wdata_mem <= 0;
            pc_reg <= 0;
        end
        else begin
            case(next_state)
                DATA:begin
                     if(state == DATA)begin
                        address_mem <= address_mem;
                        ren_mem <= ren_mem;
                        wen_mem <= wen_mem;
                        wmask_mem <= wmask_mem;
                        wdata_mem <= wdata_mem;
                    end
                    else begin
                        address_mem <= address_cpu;
                        ren_mem <= ren_cpu;
                        wen_mem <= wen_cpu;
                        wmask_mem <= wmask_cpu;
                        wdata_mem <= wdata_cpu;
                    end
                end
                INST:begin
                    if(state == INST)begin
                        pc_reg <= pc_reg;
                        address_mem <= address_mem;
                        ren_mem <= ren_mem;
                    end
                    else begin
                        pc_reg <= pc;
                        address_mem <= pc;
                        ren_mem <= if_request;
                    end
                end
                IDLE:begin
                    pc_reg <= 0;
                    address_mem <= 0;
                    ren_mem <= 0;
                    wen_mem <= 0;
                    wmask_mem <= 0;
                    wdata_mem <= 0;
                end
                default:begin
                    pc_reg <= 0;
                    address_mem <= 0;
                    ren_mem <= 0;
                    wen_mem <= 0;
                    wmask_mem <= 0;
                    wdata_mem <= 0;
                end
            endcase
        end
    end

    assign if_stall = if_stall_reg;
    assign mem_stall = mem_stall_reg;
    assign rdata_cpu = rdata_mem;
    assign inst[31:0] = rdata_cpu[pc_reg[2:0]*8 +:32];
endmodule