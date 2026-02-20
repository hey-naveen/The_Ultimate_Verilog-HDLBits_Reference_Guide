module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //


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

  //  --------------------------------------------------------------------------------------------------------

  // m = 2: EXTENDED STATE MACHINE
  // if there are many states, then Coding 100 states would be a nightmare to maintain 
  // and a waste of hardware resources.

  // Instead, you use an Extended State Machine. 
  // You keep a few high-level states (like IDLE, READING, and DONE) and use a counter to handle the repetition.
  // In this "Hybrid" approach, the FSM controls the flow, and the counter tracks the progress.
  
  /*
    module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //

    parameter IDLE=0, DATA=1;
    reg state, next;
    
    reg [1:0] count; // integer is good for simulation, 
    // but for hardware synthesis it is better to define reg with specific bit-width 
    
    // State transition logic (combinational)
    always @(*) begin    
        case(state)
            IDLE : next = in[3] ? DATA : IDLE;           
            
            // DATA: next = ((count == 3) && in[3]) ? DATA : IDLE;
            // the above is logically incorrect (since it moves to IDLE state when count != 3)
            DATA: next = (count == 3) ? (in[3] ? DATA : IDLE) : DATA;
            default : next = IDLE;
        endcase
    end

    // State transition flip-flops (sequential)
    always @(posedge clk) begin
        if (reset) begin
            state <= IDLE;
            count <= 0;            
        end
        else begin
            state <= next;
            if (next == DATA) begin
                if (count == 3)			// reset count to 1 for new byte1
                    count <= 1;
                else 
                    count <= count + 1;	// count DATA byte till 3
            end
            else
                count <= 0;
        end
    end
 
    // Output logic
    assign done = (state == DATA) && (count == 3);

endmodule
  */

endmodule
