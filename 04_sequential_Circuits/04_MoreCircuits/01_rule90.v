module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

  // declaring reg for procedural assignment
  reg [511:0] q_left, q_right, q_next;    // will result in WIRES (combinational logic)
    
    // calculating the next state of q
    always @(*) begin
        q_left = {1'b0,q[511:1]};			// q[1] is the left member of q[0]; hence shift right
        q_right = {q[510:0], 1'b0};

      // since each bit position becomes the xor of it's right and left neighbour, hence BITWISE operator is useful for each bit position
        q_next = q_left ^ q_right;    
    end
    
    // next state transition using DFFs
    always @(posedge clk) begin
        if (load) 
            q <= data;
        else 
            q <= q_next;
    end

    //m = 2: shift using shift operators
    //else q <= q<<1 ^ q>>1;

endmodule
