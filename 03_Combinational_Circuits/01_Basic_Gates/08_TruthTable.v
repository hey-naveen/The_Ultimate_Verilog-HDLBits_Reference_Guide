module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);

    // m = 1 : using four input or gate 
    assign f = (~x3 & x2 & ~x1) + (~x3 & x2 & x1) + (x3 & ~x2 & x1) + (x3 & x2 & x1);
  
    // m = 2 : minimize the expression using boolean expression
    // assign f = (~x3 & x2) | (x1 & x3);

endmodule
