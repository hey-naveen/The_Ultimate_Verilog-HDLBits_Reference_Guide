module top_module (
    input clk,
    input d,
    output q
);
  // always @(posedge clk or negedge clk) is not accepted as a legal sensitivity list, so we have to use two different always blocks.
    reg q1,q2;
    always @(posedge clk) 
        q1 <= d;
    always @(negedge clk)
        q2 <= d;
    assign q = clk ? q1 : q2;


  // m = 2:
  /*
  reg p, n;
  always @(posedge clk)
        n <= d ^ n;
        
    // A negative-edge triggered flip-flop
    always @(negedge clk)
        n <= d ^ p;
    
    // Why does this work? 
    // After posedge clk, p changes to d^n. Thus q = (p^n) = (d^n^n) = d.
    // After negedge clk, n changes to d^p. Thus q = (p^n) = (p^d^p) = d.
    // At each (positive or negative) clock edge, p and n FFs alternately
    // load a value that will cancel out the other and cause the new value of d to remain.
    
    assign q = p ^ n;
    */

endmodule
