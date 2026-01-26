module top_module (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);

  // m = 1: i like to use ternary operator
    always @(posedge clk) 
        q <= reset ? 8'b0 : d;


  // m = 2: using if-else
  /*
  always@(posedge clk)begin
      if(reset)
          q <= 0;
      else
          q <= d;
  end
  */
endmodule
