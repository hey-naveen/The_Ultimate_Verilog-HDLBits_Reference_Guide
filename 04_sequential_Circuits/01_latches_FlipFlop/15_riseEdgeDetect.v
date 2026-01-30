module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_prev;
    always @(posedge clk) begin
      in_prev <= in;			    // capturing the previous input, (updating the previous delay to current in the next clock edge)
        // since pedge is also delayed by 1 clk cycle, include it in always block
        pedge = in & ~in_prev;	// pos edge occurs when the previous input is 0 and current input is 1
    end

      //assign pedge = in & ~prev;  // will give signal in the same clock cycle

endmodule
