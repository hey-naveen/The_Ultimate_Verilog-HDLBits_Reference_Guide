module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);

  // using vectors, which will be useful in the case of longer vectors.
    reg [3:0] q, qnext;
    always @(*) begin
        qnext = {in,q[3:1]};	// shifting in and left shifting rest.
    end
    always @(posedge clk) begin
        if (!resetn) q <= 4'h0;
        else q <= qnext;
    end
    
    assign out = q[0];

  // m = 2: since we have only four bits, we can use them individually without vector
  /*
    reg d3,d2,d1,d0;
    always @(posedge clk) begin
        if (!resetn) begin
            d3 <= 0;
            d2 <= 0;
            d1 <= 0;
            d0 <= 0;
        end
        else begin
            d3 <= in;
            d2 <= d3;
            d1 <= d2;
            d0 <= d1;
        end
        
    end
    assign out = d0;
  */

endmodule
