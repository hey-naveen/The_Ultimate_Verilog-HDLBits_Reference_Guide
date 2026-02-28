module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    // state transition (sequential Logic)
    always @(posedge clk) state <= (reset) ? IDLE : next;  

    
    // output logic (combinational)    
    assign err = (state == ERROR);
    assign disc = (state == DISCARD);
    assign flag = (state == FLAG);

// m=1 : conventional way using 10 states
// the change is in the FSM only, the State Transition Logic and Output Logic remains intact.
// =============================================================================
  /*
    parameter ERROR = 7, DISCARD = 8, FLAG = 9;
    reg [3:0] state, next;
    
    always @(*) begin
        case (state)
            0 : next = (in) ? 1 : 0;
            1 : next = (in) ? 2 : 0;
            2 : next = (in) ? 3 : 0;
            3 : next = (in) ? 4 : 0;
            4 : next = (in) ? 5 : 0;
            5 : next = (in) ? 6 : DISCARD;
            6 : next = (in) ? ERROR : FLAG;
            ERROR : next = (in) ? ERROR : 0;
            FLAG : next = (in) ? 1 : 0;
            DISCARD : next = (in) ? 1 : 0;
            default : next = 0;
        endcase
    end
    */

// ============================================================================

//// m =2 : using Extended State Machine : implementing using counter and less state
// i have tried to minimize the complexity and made the code readable using ternary operator
// and separating each block, which is easier to debug.    
    
    parameter IDLE=0, COUNT=1, SIX=2, DISC=3, FLAG=4, ERR=5;
    reg [2:0] state, next;
    reg [2:0] counter;
    
    // next state combinational logic
    always @(*) begin
        case(state)
            IDLE: next= in  ? COUNT : IDLE;
            
          COUNT : begin        // can be done using ternary operators only, but we need to check for 4 conditions
              if (counter <5) next = in ? COUNT : IDLE;
              else if (counter == 5) next = in ? SIX : DISC;
              else next=SIX;
          end           
            
            SIX: next= in ? ERR : FLAG;
            DISC: next= in ? COUNT : IDLE;
            ERR: next= in ? ERR : IDLE;
            FLAG: next= in? COUNT : IDLE;
            default: next = IDLE;
        endcase
    end

  // ============================================================================
    
endmodule
