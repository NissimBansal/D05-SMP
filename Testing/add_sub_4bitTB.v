`timescale 1ns / 1ps
module add_sub_4bitTB ();

reg signed [3:0] a;
reg signed [3:0] b;
reg cin;
reg SUB;
wire signed [3:0] out;
wire cout;
wire overflow;

reg signed [3:0] bn;
reg SUB_4bit;
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

    {a, b, bn, cin, SUB} <= 0;
    $monitor("a=%b b=%b SUB=%b out=%b overflow=%b", a, b, SUB, out, overflow);

    //test case 1
    #20 SUB <= 0; 
        a[3:0] <= 4'b0011; 
        b[3:0] <= 4'b0100;
    //test case 2
    #30 SUB <= 1;
        a[3:0] <= 4'b0011; 
        b[3:0] <= 4'b0100;
    //test case 3
    #40 SUB <= 0;
        a[3:0] <= 4'b0111; 
        b[3:0] <= 4'b0011;
    //test case 4
    #50 SUB <= 1;
        a[3:0] <= 4'b0000; 
        b[3:0] <= 4'b1000;
    //test case 5
    #60 SUB <= 0;
        a[3:0] <= 4'b1111; 
        b[3:0] <= 4'b1110;
    //test case 6
    #70 SUB <= 1;
        a[3:0] <= 4'b0111; 
        b[3:0] <= 4'b0011;
    //test case 7
    #80 SUB <= 1;
        a[3:0] <= 4'b1000; 
        b[3:0] <= 4'b0001;
end

initial begin
    $dumpfile ("add_sub_4bit.vcd");
    $dumpvars (0,add_sub_4bitTB);
end

endmodule