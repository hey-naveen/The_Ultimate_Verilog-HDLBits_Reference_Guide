module top_module(
    input a,
    input b,
    input c,
    output out  ); 

  // solution in SOP form (take grouping of 4)
    assign out = b | c | a;

endmodule
