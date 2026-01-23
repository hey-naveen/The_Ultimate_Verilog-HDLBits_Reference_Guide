module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

  // similar to ripple carry adder
  wire [4:0] c;  // temporary carry propagation wires
  
    assign c[0] = cin;
    assign cout = c[4];
    
    generate
        genvar i;
        for (i=0; i<4; i++) begin: adder_block
            bcd_fadd f0(a[4*i +: 4], b[4*i +: 4], c[i], c[i+1], sum[4*i +: 4]);
        end
    endgenerate
endmodule
