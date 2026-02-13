module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  
  
  // give state names to numbers, to uniquely identify them. 
  // You can use any number, any format, they just need to be unique for each state.
  // make sure that the registers are of enough width to hold the numbers.
  
    parameter A=0, B=1; 
    reg state, next_state;

    // A finite state machine is usually coded in three parts:
    //   State transition logic
    //   State flip-flops
    //   Output logic
    // It is sometimes possible to combine one or more of these blobs of code
    // together, but be careful: Some blobs are combinational circuits, while some
    // are clocked (DFFs).

  // next state combinational logic (use blocking assignments)
    always @(*) begin            
        case(state) 
            B: next_state = in ? B : A;
            A : next_state = in? A : B;
        endcase
    end

  // next state transition with clk (sequential logic)
    always @(posedge clk, posedge areset) begin
        if (areset) state <= B;
        else state <= next_state;
    end

    // Output logic
    assign out = (state == B);

endmodule
