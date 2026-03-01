module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    
    // m = 1: without one-hot encoding
    parameter IDLE=0, COMP=1;
    reg state, next;

  // next state transition
    always @(posedge clk, posedge areset) state <= (areset) ? IDLE : next;

  // next state combinational logic
    always @(*) begin
        case(state)
            IDLE : next = x ? COMP : IDLE;
            COMP : next = COMP;
            default : next = IDLE;
        endcase
    end

  // output Logic (combinational)
    assign z = ((state == COMP) && !x) || ((state == IDLE) && x);

  // another way for output logic using case statement
  /*
      // output logic
    always @(*) begin
        case (state)
            A: z = x;
            B : z = ~x;
        endcase
    end
  */

endmodule
