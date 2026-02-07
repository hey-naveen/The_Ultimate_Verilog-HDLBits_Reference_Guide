module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
	  reg w, E,L,clk;
    assign {w,L,E,clk} = KEY;
    
    MUXDFF m0(clk, LEDR[1], SW[0], E, L, LEDR[0]);
    MUXDFF m1(clk, LEDR[2], SW[1], E, L, LEDR[1]);
    MUXDFF m2(clk, LEDR[3], SW[2], E, L, LEDR[2]);
    MUXDFF m3(clk, KEY[3], SW[3], E, L, LEDR[3]);

  // m = 2: can be done using generate statement also
  /*
  	reg w, E,L,clk;
    assign {w,L,E,clk} = KEY;
    reg [3:0] LEDR1;
    assign LEDR1 = {KEY[3], LEDR[3:1]};
    
    generate 
        genvar i;
        for (i = 0; i<4; i++) begin : mux_block
            MUXDFF m(clk, LEDR1[i], SW[i], E, L, LEDR[i]); 
        end
    endgenerate
  */
    
    
endmodule


// --------------------- MODULE -------------------------------

module MUXDFF (input clk,
    input w, R, E, L,
    output Q);
    
    reg qnext;
    
    always @(*) begin
        qnext = L ? R : E ? w : Q;  
    end
    
    always @(posedge clk) begin
       Q <= qnext; 
    end

endmodule
