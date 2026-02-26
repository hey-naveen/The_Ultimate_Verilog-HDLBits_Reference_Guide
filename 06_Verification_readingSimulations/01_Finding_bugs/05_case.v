module top_module (
    input [7:0] code,
    output reg [3:0] out,
    output reg valid=1 );//
    
    // bug 1: 6'h46 is 6 bit. [change to 8 bit]
    // bug 2: if not, then out = ? (hold it's previous state) ; latch is created.
    // 			[set a default state of out=0, which will be overridden by case block]
    // bug 3: 8'd26, is in decimal. [change it to hexadecimal]
    // bug 4: valid is always 0; [give it a default value = 1 that should be overridden by case]

    always @(*) begin
        out = 0;		// to avoid latches assign them a default value, then overide by case statement
        valid = 1;		// else we have assign for every case
        case (code)
            8'h45: out = 0;
            8'h16: out = 1;
            8'h1e: out = 2;
            8'h26: out = 3;
            8'h25: out = 4;
            8'h2e: out = 5;
            8'h36: out = 6;
            8'h3d: out = 7;
            8'h3e: out = 8;
            8'h46: out = 9;
            default: valid = 0;
        endcase
    end
    


endmodule
