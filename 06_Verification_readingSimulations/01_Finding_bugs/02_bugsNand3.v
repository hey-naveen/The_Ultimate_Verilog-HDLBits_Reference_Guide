module top_module (input a, input b, input c, output out);//

    // andgate inst1 ( a, b, c, out );
    
    // bug 1: order  of positional association is wrong. out must be in starting.
    // bug 2: the instantiation outputs the andgate output, we must complement it, to get the NAND gate output.
    // bug 3: the number of unassigned port will take default value as 1'b0. 
    // 		  which will result in result as zero, since and_output = a&b&c&d&e;
    
    wire and_output;
    
    andgate inst1(and_output, a, b, c, 1'b1, 1'b1);
    
    assign out = ~and_output;

endmodule
