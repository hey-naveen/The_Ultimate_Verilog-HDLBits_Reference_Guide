module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);
  // 8 bit vector creates 8 flip flops
    always @(posedge clk) 
        q <= d;

endmodule
