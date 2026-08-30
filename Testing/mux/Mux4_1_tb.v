`timescale 1 ns / 1 ps
module Mux4_1_tb ();

reg [3:0] in;
reg [1:0] S;
wire out;
integer i;

MuxBeh4_1 u0 (.in(in), .S(S), .out(out));

initial begin 
    {in, S} <= 0;

    $monitor("in=%b S=%b out=%b", in, S, out);
    
    for (i = 0; i < 4; i = i + 1) begin
        S <= i; 
        in <= 0; #10;
        in [i] <= 1; #10; 
    end
end

initial begin
    $dumpfile ("MuxBeh4_1.vcd");
    $dumpvars (0,Mux4_1_tb);
end

endmodule