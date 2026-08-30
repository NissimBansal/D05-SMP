`timescale 1 ns / 1 ps
module Enc16_4_tb ();

reg [15:0] KEY;
wire [3:0] CODE;
integer i;

Enc16_4 u0 (.KEY(KEY), .CODE(CODE));

initial begin

    KEY <= 16'b1;
    $monitor("KEY=%b CODE=%b", KEY, CODE);

    for (i = 0; i < 16; i = i + 1) begin
        KEY <= (1 << i); #10
    end

end

initial begin
    $dumpfile ("Enc16_4.vcd");
    $dumpvars (0,Enc16_4_tb);
end

endmodule