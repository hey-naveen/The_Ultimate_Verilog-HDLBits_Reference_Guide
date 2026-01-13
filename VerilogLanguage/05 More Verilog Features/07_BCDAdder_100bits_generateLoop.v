module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [99:0] carry; // intermediate carry
    generate
        genvar i;
      bcd_fadd f0(a[3:0], b[3:0], cin, carry[0], sum[3:0]);    // first adder        
        for (i = 1; i<100; i++) 
            begin: fa_add
              bcd_fadd f(a[4*i +: 4], b[4*i +: 4],carry[i-1], carry[i], sum[4*i +: 4]);  // ripple adders 
            end        
    endgenerate
    assign cout = carry[99];

    // m = 2
    /*
    	bcd_fadd f0(
		.a(a[3:0]),
		.b(b[3:0]),
		.cin(cin),
		.cout(carry[0]),
		.sum(sum[3:0])
	);
	
  generate
		genvar i;
		for(i=1; i<100; i=i+1) begin : block1
			bcd_fadd f(
				.a(a[4*i+3 : 4*i]),
				.b(b[4*i+3 : 4*i]),
				.cin(carry[i-1]),
				.cout(carry[i]),
				.sum(sum[4*i+3 : 4*i])
			);
		end
	endgenerate	
    */
endmodule
