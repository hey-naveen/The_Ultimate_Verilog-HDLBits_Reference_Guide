module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0, mux1;
    mux2 m0 ( sel[0],    a,    b, mux0 );
    mux2 m1 ( sel[0],    c,    d, mux1 );
    mux2 m2 ( sel[1], mux0, mux1,  out );
    
    // bug 1: instantiation name is same as wire name.
    // bug 2: the order of select lines are wrong
    // bug 3: the wire declared is of one bit.

endmodule
