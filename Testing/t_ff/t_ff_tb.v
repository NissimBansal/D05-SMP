module t_ff_tb;

reg t, clear, preset, clk;
wire q;

t_ff u0 (.t(t),.clear(clear),.preset(preset),.clk(clk),.q(q));

always #10 clk = ~clk;

initial begin
    {clk, t} <= 0;
    {clear, preset} <= 2'b11;

    $monitor("time=%0t clear=%0b preset=%0b t=%0b q=%0b", $time, clear, preset, t, q);

    #15 clear <= 0;
    #20 clear <= 1; preset <= 0;
    #10 preset <= 1;

    #4 t <= 1;           
    #5 t <= 0; 
    #2 t <= 1;
    #8 t <= 0;
    #1 t <= 1;
    #20 $finish;
end

initial begin
    $dumpfile ("t_ff.vcd");
    $dumpvars (0,t_ff_tb);
end

endmodule