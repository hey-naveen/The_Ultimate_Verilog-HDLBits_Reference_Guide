module top_module (
	input a,
	input b,
	input sel,
	output out
);

	// m = 1: Ternary operator is easier to read, especially in the case of vectors:
	assign out = sel ? b : a;

  // m = 2: Behavioural modeling of mux using AND and OR gates
	// assign out = (sel & b) | (~sel & a);
	
endmodule
