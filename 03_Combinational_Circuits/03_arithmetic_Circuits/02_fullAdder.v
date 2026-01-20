module top_module( 
    input a, b, cin,
    output cout, sum );

  // m = 1 : behavioral Modeling
    assign {cout, sum} = cin + a + b;

  // m = 2 : structural Modeling
  /*
    assign sum = a ^ b ^ cin;
    assign cout = a & b | b & cin | cin & a;

  // or cout can also be expressed as,
    assign cout = a & b | cin & a ^ b;    // see how it produces error (order of priority [& > ^ > |])
    assign cout = a & b | cin & (a ^ b);
    */  

endmodule
