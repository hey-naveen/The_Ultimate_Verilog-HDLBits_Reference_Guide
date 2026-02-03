module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    
    wire [11:0]q;
    // 1000 hz / 1000 cycles = 1 hertz
    assign c_enable = {((q[7:4] == 9) && c_enable[1]), 
                (q[3:0] == 9),
                1'b1};

    bcdcount counter0 (clk, reset, c_enable[0], q[3:0]);
    bcdcount counter1 (clk, reset, c_enable[1], q[7:4]);
    bcdcount counter2 (clk, reset, c_enable[2], q[11:8]);
    
    assign OneHertz = (q == 12'h999);		// earlier i used (q==999) that caused an error... hence changed it to 12'h999

endmodule
