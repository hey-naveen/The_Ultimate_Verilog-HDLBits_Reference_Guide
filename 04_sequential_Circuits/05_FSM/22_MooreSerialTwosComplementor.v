module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter idle=0, one=1, zero=2;
    reg [1:0] state, next;
    
    // next state transition (Sequential)
    always @(posedge clk, posedge areset) 
        state <= (areset) ? idle : next;
    
    // next state combinational logic
    always @(*) begin
        case(state)
            idle: next= x ? zero : idle;
            one: next= x ? one : zero;
            zero: next= x? one : zero;
            default : next = idle;
        endcase
    end
    
    // output logic
    assign z = (state == zero);

endmodule
