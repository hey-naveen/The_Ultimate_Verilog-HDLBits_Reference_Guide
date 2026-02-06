module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    reg [2:0] Q_next;
    always @(*) begin
        Q_next[0] = KEY[1] ? SW[0] : LEDR[2];
        Q_next[1] = KEY[1] ? SW[1] : LEDR[0];
        Q_next[2] = KEY[1] ? SW[2] : LEDR[2] ^ LEDR[1];
    end 
    
    always @(posedge KEY[0]) begin
       LEDR <= Q_next; 
    end

  // m = 2:
  /*
      reg [2:0] q_next;
    always @(*)
        begin
            if (KEY[1]) begin
                q_next = SW;
            end
            else begin
                q_next[0] = LEDR[2];
                q_next[1] = LEDR[0];
                q_next[2] = LEDR[2] ^ LEDR[1];
            end
        end
    
    always @(posedge KEY[0]) begin
            LEDR <= q_next;
    end

  */


  // m = 3: 
  /*
    wire L;
  wire clk;
  wire [2:0] R;
  reg [2:0] Q;
  
  assign R = SW;
  assign clk = KEY[0];
  assign L = KEY[1];
        
  always @(posedge clk) begin
      if(L)
          Q <= R;
      else
          Q <= {Q[2]^Q[1], Q[0], Q[2]};
  end
    
  assign LEDR = Q;
  */

endmodule
