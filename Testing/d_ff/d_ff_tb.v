module d_ff_tb;

reg d, clear, preset, clk;
wire q;

d_ff u0 (.d(d),.clear(clear),.preset(preset),.clk(clk),.q(q));

always #10 clk = ~clk;

initial begin
    {clk, d} <= 0;
    {clear, preset} <= 2'b11;

    $monitor("time=%0t clear=%0b preset=%0b d=%0b q=%0b", $time, clear, preset, d, q);

    #5 clear <= 0;
    #5 clear <= 1; preset <= 0;
    #5 preset <= 1;

    #5 d <= 1;           
    #5 d <= 0; 
    #2 d <= 1;
    #8 d <= 0;
    #20 $finish;
end

initial begin
    $dumpfile ("d_ff.vcd");
    $dumpvars (0,d_ff_tb);
end

endmodule