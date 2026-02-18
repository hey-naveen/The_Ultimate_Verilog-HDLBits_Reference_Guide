module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    parameter   WL = 0,	// walk left
    			WR = 1,	// walk right
    			FL = 2,	// fall left
    			FR = 3; // fall right
    reg [1:0] state, next;
    
    // next state combinational logic
    always @(*) begin
        case(state) 
            WL : next = (!ground) ? FL : (bump_left ? WR : WL);
            WR : next = !ground   ? FR : (bump_right ? WL : WR);
            FL : next = ground ? WL : FL;
            FR : next = ground ? WR : FR;
            default : next = WL;
        endcase
    end

    // state transition sequential logic
    always @(posedge clk, posedge areset) begin
        if (areset) 
            state <= WL;
        else
            state <= next;
    end
    
    // output logic (combinational)
    assign walk_left = (state == WL);
    assign walk_right = (state == WR);
    assign aaah = (state == FL) | (state == FR);
    
endmodule
