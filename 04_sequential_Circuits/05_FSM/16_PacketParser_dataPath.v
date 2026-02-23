module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    
    // Note this can be done using Extended State machine, (see previous solution)
    
    reg [23:0] temp;	// for latching data
    
    // New: Datapath to store incoming bytes. (order does not matter since it will generate a wire)
    assign out_bytes = done ? temp : out_bytes;
    
  // continuously latching bytes on each posedge of clk (since temp is connected only at (state == byte3)
    always @(posedge clk) begin
        if (reset) temp <= 24'b0;
        else temp <= {temp[15:0], in};
    end

    // another way is to store data only in BYTE1, BYTE2, BYTE3 states.  
    // always @(posedge clk) begin
    //     if (reset) 
    //         temp <= 0;
  //   else case(next)    // since sequential logic is one clock behind than combinational logic, hence we need to use next.
    //         BYTE1, BYTE2, BYTE3: temp <= {temp[15:0], in}; 	// using Left Shift register
    //         default: temp<=0;
    //     endcase            
    // end
    
    
    // no changes below this line
    // -------------------------------------------------------------------------------

    // FSM from fsm_ps2
  // m = 1: The most robust way to solve this is to use a 4-state machine (IDLE, BYTE1, BYTE2, BYTE3) 
  // rather than trying to mix a counter with a 2-state machine. 
  // This makes the logic clear and avoids the count logic entirely. 
    parameter IDLE=0, BYTE1=1, BYTE2=2, BYTE3=3;
    reg [2:0] state, next;
    
    // State transition logic (combinational)
    always @(*) begin    
        case(state)
            IDLE : next = in[3] ? BYTE1 : IDLE;
            BYTE1: next = BYTE2;
            BYTE2: next = BYTE3;
            BYTE3: next = in[3] ? BYTE1 : IDLE;
            default : next = IDLE;
        endcase
    end

    // State transition flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) 
            state <= IDLE;
        else 
            state <= next;
    end
 
    // Output logic
    assign done = (state == BYTE3);

endmodule
