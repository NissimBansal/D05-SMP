`timescale 1 ns / 1 ps
module dec3_8_tb ();

reg [2:0] in;
reg en;
wire [7:0] out;
integer i;

decif2_4 u0 ();

initial begin 
    {in, en} <= 0;
    
    $monitor("in=%b en=%b out=%b", in, en, out);
    
    #20;
    en <= 1;
    for (i = 0; i < 8; i = i + 1) begin
       #10 in <= i;  
    end

    #10 $finish;
end

endmodule