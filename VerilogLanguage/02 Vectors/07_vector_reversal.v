module top_module( 
    input [7:0] in,
    output [7:0] out
);
    // m = 1 ---------------------------------
    // assign { out } = { in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};

    // m = 2 ---------------------------------
    // assign {out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7]} = in;

    // m = 3 ---------------------------------
    // using loop 
    parameter N = 8;
    always @(*) begin	
        for (int i=0; i<N; i++)	// int is a SystemVerilog type. Use integer for pure Verilog.
            out[(N-1)-i] = in[i];
	end

endmodule
