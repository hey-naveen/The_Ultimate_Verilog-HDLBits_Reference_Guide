module top_module (
    input [7:0] in,
    output [31:0] out );

  // Circuit that sign-extends an 8-bit number to 32 bits
  // Numbers are stored in 2's complement form in computers.
  // Extending a number to a larger bit size (e.g., 8-bit to 32-bit) is simple: just repeat the most significant bit (the sign bit).
    
    assign out = { {24{in[7]}} , in[7:0] };

endmodule
