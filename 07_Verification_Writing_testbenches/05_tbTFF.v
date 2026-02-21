module top_module ();
    reg clk = 0,
    	reset = 0,
    	t = 0;
    wire q; 
    
    always #5 clk = ~clk;
    
    tff dut(clk, reset, t, q);
    
    initial begin
       reset = 1;
      @(posedge clk);    // can use #10 also
        @(posedge clk);
        
        reset=0;
        t=1;
    end
    

endmodule
