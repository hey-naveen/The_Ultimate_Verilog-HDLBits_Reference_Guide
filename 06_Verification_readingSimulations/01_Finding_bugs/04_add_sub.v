// synthesis verilog_input_version verilog_2001
module top_module ( 
    input do_sub,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] out,
    output reg result_is_zero
);//

    always @(*) begin
        result_is_zero = 0;
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase

        if (!out)
            result_is_zero = 1;
    end
    
    // bug 1: the else condition is missing, so a latch is formed and result_is_zero is always 1
    // bug 2: the bitwise NOT (~) operator does not work, we have to use logical NOT (!) operator

endmodule
