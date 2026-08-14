`timescale 1ns / 1ps
module add_sub_4bitTB ();

reg signed [3:0] a;
reg signed [3:0] b;
reg signed [3:0] bn;
reg cin;
reg SUB;
reg SUB_4bit;
wire signed [3:0] out;
wire cout;
wire overflow;

wire c1, c2, c3;

always @(SUB) begin
     cin = SUB;
     SUB_4bit = {4{SUB}};
     bn = ( b ^ SUB_4bit ) + ( 1 & SUB );
end

fullAdder fa1(.a(a[0]), .b(bn[0]), .cin(cin), .out(out[0]), .cout(c1));
fullAdder fa2(.a(a[1]), .b(bn[1]), .cin(c1), .out(out[1]), .cout(c2));
fullAdder fa3(.a(a[2]), .b(bn[2]), .cin(c2), .out(out[2]), .cout(c3));
fullAdder fa4(.a(a[3]), .b(bn[3]), .cin(c3), .out(out[3]), .cout(cout));

assign overflow = c3 ^ cout;



initial begin
    $dumpfile ("add_sub_4bit.vcd");
    $dumpvars (0,add_sub_4bitTB);
end

endmodule