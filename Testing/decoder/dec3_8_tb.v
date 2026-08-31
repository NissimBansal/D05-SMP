`timescale 1 ns / 1 ps
module dec3_8_tb ();

reg [2:0] in;
wire [7:0] out;
integer i;
reg enn;

dec_if2_4 u0 (.in(in[1:0]), .en(enn), .out(out[3:0]));
dec_if2_4 u1 (.in(in[1:0]), .en(in[2]), .out(out[7:4]));

always @ (in) enn = ~in[2];

initial begin 
    in <= 3'b000;
    
    $monitor("in=%b out=%b", in, out);

    for (i = 0; i < 8; i = i + 1) begin
       #10 in <= i;
    end
end

initial begin
    $dumpfile ("dec3_8.vcd");
    $dumpvars (0,dec3_8_tb);
end

endmodule

