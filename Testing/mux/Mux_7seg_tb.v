`timescale 1 ns / 1 ps
module Mux_7seg_tb ();

reg [3:0] BCD;
wire a, b, c, d, e, f, g;
integer i;

Mux_7seg u0 (.BCD(BCD), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));

initial begin 
    BCD <= 0;

    $monitor("BCD=%b a=%b b=%b c=%b d=%b e=%b f=%b g=%b", BCD, a, b, c, d, e, f, g);
    
    for (i = 0; i < 10; i = i + 1) begin
        BCD <= i; #10; 
    end
end

initial begin
    $dumpfile ("Mux_7seg.vcd");
    $dumpvars (0,Mux_7seg_tb);
end

endmodule