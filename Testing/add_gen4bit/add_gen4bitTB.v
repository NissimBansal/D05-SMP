`timescale 1ns / 1ps
module add_gen4bitTB ();

reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum;
wire cout;

add_gen4bit adder0(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));  

initial begin
    {a, b, cin} <= 0;
    $monitor("a=%b b=%b cin=%b sum=%b cout=%b", a, b, cin, sum, cout);

    #10; a[3:0] <= 4'b0011; 
         b[3:0] <= 4'b0100;

    #10; a[3:0] <= 4'b0011; 
         b[3:0] <= 4'b0100;
    
    #10; a[3:0] <= 4'b0111; 
         b[3:0] <= 4'b0011;
   
    #10; a[3:0] <= 4'b0110; 
         b[3:0] <= 4'b1010;
    
    #10; a[3:0] <= 4'b1111; 
         b[3:0] <= 4'b1110;
end

initial begin
    $dumpfile ("add_gen4bit.vcd");
    $dumpvars (0,add_gen4bitTB);
end

endmodule