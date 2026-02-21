module top_module();
    // input should be reg and output should be wire.
    reg clk =0,
    	in = 0;
    reg [2:0] s;
    wire out;
    
    always #5 clk = ~clk;
    
    q7 dut(clk, in, s, out);
    
    initial begin
        s = 3'd2;
        #10 s=3'd6;
        #10 s=3'd2; in=1'b1;
        #10 s=3'd7; in=1'b0;
        #10 s=3'd0; in=1'b1;
        #30 in=1'b0;
    end

  // m = 2: separate block for in and s
  /*
    initial begin
        #20 in = 1;
        #10 in = 0;
        #10 in = 1;
        #30 in = 0;
    end
    
    initial begin
        s = 2;
        #10 s = 6;
        #10 s = 2;
        #10 s = 7;
        #10 s = 0;        
    end
  */

endmodule
