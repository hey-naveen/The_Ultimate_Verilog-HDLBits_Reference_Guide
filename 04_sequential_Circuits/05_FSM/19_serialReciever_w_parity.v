module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //


  
    // m==2: ------------------------------------------------------------------------
    // 1. we declared 9 bit data with 9th bit (msb) as parity and [7:0] as databyte
    // 2. Used xor for calculating parity
    // 3. outbyte is databyte[7:0], neglecting the parity bit

  /*

    // Modify FSM and datapath from Fsm_serialdata
    reg [2:0] state, next;
    parameter IDLE = 0, START = 1, RECV = 2, WAIT = 3, STOP = 4;
    reg [3:0] i;
    reg [8:0] data;	
    
    always @(*) begin
        case (state)
        IDLE : next = in ? IDLE : START;
        START : next = RECV;
        RECV : begin
            if (i == 9) begin 	// at tenth stage
               next = in ? STOP : WAIT; 
            end
            else begin
               next = RECV; 
            end
        end
        WAIT : next = in ? IDLE : WAIT;
        STOP : next = in ? IDLE : START;
        endcase
    end
    
    always @(posedge clk) begin
        if (reset) begin
             i  <=  0;
             state <= IDLE;            
        end
        else begin
            state <= next;
            if (next == RECV) begin
                data = {in, data[8:1]};
               i++; 
            end
            else i <= 0;
            
        end
    end
    

    assign out_byte = (done) ? data[7:0]: 0;

    // New: Add parity checking.
    assign done = (state == STOP && ^data);
    */
  //------------------------------------------------------
    
    

endmodule
