`timescale 1 ns / 1 ps
module dec2_4_tb ();

reg [1:0] in;
reg en;
wire [3:0] out;
integer i;

dec_if2_4 u0 (.in(in), .en(en), .out(out));

initial begin 
    {in, en} <= 0;
    #20;

    $monitor("in=%b en=%b out=%b", in, en, out);
    
    en = 1;
    for (i = 0; i < 4; i = i + 1) begin
        in <= i; #10; 
    end
end

initial begin
    $dumpfile ("dec2_4.vcd");
    $dumpvars (0,dec2_4_tb);
end

endmodule