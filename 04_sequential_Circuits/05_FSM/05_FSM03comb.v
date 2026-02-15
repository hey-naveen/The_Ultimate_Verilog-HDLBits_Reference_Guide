module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: here it is asked as a form of function
    always @(*) begin
        next_state = next_state_func(state, in);
    end
        
    function [1:0] next_state_func (input [1:0] state, input in);
        case (state) 
            A : next_state_func = in ? B : A;
            B : next_state_func = in ? B : C;
            C : next_state_func = in ? D : A;
            D : next_state_func = in ? B : C;
            default: next_state_func = A;
        endcase
    endfunction

  // m = 2: State transition logic: (as we were doing it earlier)
  /* 
    always @(*) begin
        case (state) 
            A : next_state = in ? B : A;
            B : next_state = in ? B : C;
            C : next_state = in ? D : A;
            D : next_state = in ? B : C;
            default: next_state = A;
        endcase
    end
    */
    
    // Output logic:  
    assign out = (state == D);

endmodule
