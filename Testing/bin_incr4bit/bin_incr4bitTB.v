`timescale 1ns / 1ps
module bin_incr4bitTB ();

reg [3:0] A;
wire [3:0] Y;
wire overflow;
integer i;

inc inc0 (.A(A), .Y(Y), .overflow(overflow));

initial begin

    A <= 0;
    $monitor("A=%b Y=%b overflow=%b", A, Y, overflow);

    for (i = 0; i < 16; i = i + 1) begin
        #10; A <= i;
    end
end

initial begin
    $dumpfile ("bin_incr4bit.vcd");
    $dumpvars (0,bin_incr4bitTB);
end

endmodule