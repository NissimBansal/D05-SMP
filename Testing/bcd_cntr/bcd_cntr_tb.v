module bcd_cntr_tb;

reg clear, clk;
wire [3:0] q;

bcd_cntr a0 (.clear(clear),.clk(clk),.q(q));

always #10 clk = ~clk;

initial begin

    {clear, clk} <= 2'b10;

    $monitor("time=%0t clear=%b q=%b", $time, clear, q);

    #5 clear <= 0;
    #10 clear <= 1'b1;
    #200 $finish;
end

initial begin
    $dumpfile ("bcd_cntr.vcd");
    $dumpvars (0,bcd_cntr_tb);
end

endmodule