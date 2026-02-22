module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    // assign out = (~sel & a) | (sel & b);
  /* There are two bugs in this code, due to which it will not work for 'VECTORS'.
  1. sel is 1 bit wide, so in bitwise operation the upper bits of A and B are zeroed.
  2. out is a when sel = 1, and b when sel = 0. (from waveform)
  */
  
    assign out = ({8{sel}} & a) | ({8{~sel}} & b);	

  // another way is to checking through if else, or using ternary operator (for vectors)
    //assign out = sel ? a : b; 
endmodule
