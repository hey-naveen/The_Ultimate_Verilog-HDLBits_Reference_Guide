module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    
    // assign out_sop = a&b&c | ~a&~b&c&~d;   // this won't work because we need to have output in minimal sop form, 
    // so we need to take don't cares also.
    
    assign out_sop = c&d | ~a & ~b &c;
    assign out_pos = c & (~a | d) & (~b | d);
    
    // another way
    //assign out_pos = (c) & (~a | b) & (d | ~b);

endmodule
