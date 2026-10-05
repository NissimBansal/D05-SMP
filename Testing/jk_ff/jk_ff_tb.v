module jk_ff_tb;

reg j, k, clear, preset, clk;
wire q;

jk_ff u0 (.j(j),.k(k),.clear(clear),.preset(preset),.clk(clk),.q(q));

always #10 clk = ~clk;

initial begin
    {clk, j, k} <= 0;
    {clear, preset} <= 2'b11;

    $monitor("time=%0t clear=%0b preset=%0b j=%0b k=%0b q=%0b", $time, clear, preset, j, k, q);

    #5 clear <= 0;
    #5 clear <= 1; preset <= 0;
    #5 preset <= 1;

    #5 {j, k} <= 2'b01;           
    #20 {j, k} <= 2'b10; 
    #20 {j, k} <= 2'b01;
    #20 {j, k} <= 2'b10;
    #20 $finish;
end

initial begin
    $dumpfile ("jk_ff.vcd");
    $dumpvars (0,jk_ff_tb);
end

endmodule