module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    
    always @(posedge clk) begin
        if (reset) q <= 4'h1;
        else q <= {q[0],q[4], q[0]^q[3], q[2:1]};	// A xor with 0 is A, and A xor with 1, is ~A. 
    end


// m =2 :
  /*
    reg [4:0] q_next;		// q_next is not a register, but declared it as reg for procedural assignment
    // calculating the next state using combinational circuits
    always @(*) begin
        q_next = q[4:1];	// first shifting normally, but next state is wrong for q_next[4] and q_next[2].
        q_next[4] = q[0];	// overiding to correct next state.
        q_next[2] = q[0] ^ q[3];
    end
    
    // incrementing the next state upon clock (sequential circuit)
    always @(posedge clk) begin
        if (reset) q <= 4'h1;
        else q <= q_next;
    end
    */

endmodule
