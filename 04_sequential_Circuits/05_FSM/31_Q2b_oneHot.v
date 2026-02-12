module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    // next state is B (Y1) when current state is A (y[0]) and input (w) is high
  assign Y1 = y[0] && w;
  
    // Y3 (D) when any of B,C,E,F and input is low; 
    // using reduction OR operator
  assign Y3 = ( |{y[2:1],y[5:4]} ) && (!w);

  // which is same as
  // assign Y3 = (y[1] | y[2] | y[4] | y[5]) && (!w);

endmodule
