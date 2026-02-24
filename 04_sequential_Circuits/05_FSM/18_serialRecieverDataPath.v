module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    
    // New: Datapath to latch input bits.
    reg[7:0] temp_data;
    assign out_byte = done ? temp_data : 8'b0;	// sending data
    
    // latching data on posedge clk
    always @(posedge clk) begin
        if (next == recv) begin
            temp_data = {in, temp_data[7:1]};	// using right shift register (LSB goes in First)
        end
    end
    
    // same as serial reciever
    // ------------------------------------------------------
    
    // Use FSM from Fsm_serial
    
  // you probably don't want to use 8 different states, hence using Extended state machine with counter
    parameter idle=0, recv=1, stop=2, err=3, start=4;
    reg [2:0] state, next;
    reg [3:0] count; 
    
    // next state combinational logic
    always @(*) begin
        case(state) 
            idle: next= in ? idle : start;	// will go to start after idle only
            start: next=recv;
            recv: next= (count==8) ? (in ? stop : err) : recv; // checking at 9th stage
            stop: next= in ? idle : start;
            err: next = in ? idle : err;              // it will go to idle not start directly 
            default: next= idle;
        endcase
    end
    
    // next state transition
    always @(posedge clk) begin
        if (reset) state <= idle;
        else state <= next;
    end
    
    // counter logic (sequential)
    always @(posedge clk) begin
        if (reset) begin
            count <=0;
        end
        else begin
            if (next == recv) count <= count + 1;
            else count <= 0;
        end
    end
    
    
    // output logic
    assign done = (state == stop);
   //--------------------------------------


endmodule
