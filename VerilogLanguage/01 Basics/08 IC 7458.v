module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire t10, t11, t20, t21;
    
    // structural modeling
    or or2(p2y,t20, t21);
    and and20(t20, p2a, p2b);
    and and21(t21, p2c,p2d);
    
    or or1(p1y, t10, t11);
    and and10(t10,p1a,p1b,p1c);
    and and11(t11,p1d,p1e,p1f);


endmodule
