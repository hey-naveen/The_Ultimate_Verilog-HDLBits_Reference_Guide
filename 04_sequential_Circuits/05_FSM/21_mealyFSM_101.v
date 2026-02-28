module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter IDLE=0, ONE=1, ONE_ZERO=2;
    reg [1:0] state, next;
    
    always @(*) begin
        case(state)
            IDLE: next= x ? ONE: IDLE;
            ONE	: next= x ? ONE: ONE_ZERO;
            ONE_ZERO: next= x? ONE: IDLE;
            default: next= IDLE;
        endcase
    end
    
    always @(posedge clk, negedge aresetn) state <= (!aresetn) ? IDLE : next;
    
    
    /// in implementing mealy machine, the output is combinational only, 
    // but it depends upon the input logic (hence it is unstable also) also along with the current state, and 
    // it requires fewer states, gives fast result.
    always @(*) begin
        if ((state == ONE_ZERO) && (x==1)) z =1;
        else z=0;
    end
    
     

endmodule
