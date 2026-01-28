module top_module (
    input clk,
    input in, 
    output out);
    
    wire d;
  xor x1(d, out, in);    // or we can use 'assign d = in ^ out;'
    
    always @(posedge clk) 
        out <= d;

endmodule
