module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
	wire c;  	// declared wire for internal carry propagation
    
    add16 a0 (a[15:0], b[15:0], 1'b0, sum[15:0], c);
    add16 a1 (a[31:16], b[31:16], c, sum[31:16]);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign {cout, sum} = a+b+cin;

  // m = 2;
  // assign sum = a ^ b ^ cin;
  // assign cout = a&b | a&cin | b&cin;
endmodule
