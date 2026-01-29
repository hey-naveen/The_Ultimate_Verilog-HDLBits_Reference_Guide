module top_module (
    input clk,
    input x,
    output z
); 
  assign z = ~(q1 | q2 | q3);    // if q is defined as vector we can use reduction operator as 'z = ~(|Q)'. 
    reg q1, q2, q3;          // make sure to define it as reg and not wire
    
    always @(posedge clk) begin
        q1 <= q1 ^ x;
        q2 <= x & ~q2;
        q3 <= x | ~q3;
    end

  // m = 2: by declaring all the wires
  /* 
    wire d0, d1, d2;
    reg Q0, Q1, Q2;
    
    assign d0 = x ^ Q0;
    assign d1 = x & !Q1;
    assign d2 = x | !Q2;
    assign z = !(Q0 | Q1 | Q2);
    

    always @(posedge clk)
        begin
            Q0 <= d0;
            Q1 <= d1;
            Q2 <= d2;
        end
    */
endmodule
