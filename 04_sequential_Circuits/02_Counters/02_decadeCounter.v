module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    
    always @(posedge clk) 
      if (reset || (q >= 9)) q <= 4'b0;
      else q <= q + 4'b1;

endmodule
