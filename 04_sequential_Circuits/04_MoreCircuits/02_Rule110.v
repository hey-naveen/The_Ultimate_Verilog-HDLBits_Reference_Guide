module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    
    // this can be done by solving k-map
    reg [511:0] L, R, C, qnext;	//Left,Right, Center, NextState 

    always @(*) begin
        L = {1'b0, q[511:1]};	// Left Member (achieved by Right Shift)
        R = {q[510:0],1'b0};	// Right Member (achieved by Left Shift)
        C = q;					// Center
        
        // solving Kmap
        qnext = (C ^ R) | (~L & C);		// using bitwise operators		
        
        
        // can't use case statement as we need to perform bit wise operations
        /*case ({L,C})
            0, 2 : qnext = R;
            1 : qnext = 1;
            3 : qnext = ~R;
        endcase*/
    end
    
    always @(posedge clk) begin
        if (load)
            q <= data;
        else 
            q <= qnext;
    end

endmodule
