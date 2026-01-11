module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up);
    
    always @(*) begin

      // assigning default values
        {up, down, left, right} = 4'b0000;
        // left = 0; down = 0; right = 0; up = 0;

      // overiding values using case
        case(scancode)
            16'he06b: left = 1'b1;
            16'he072: down = 1'b1;
            16'he074: right = 1'b1;
            16'he075: up = 1'b1;
            default : ;  // now default is unnecessary
        endcase
    end
endmodule
