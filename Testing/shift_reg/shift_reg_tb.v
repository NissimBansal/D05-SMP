module shift_reg_tb;

reg dataIn, clear, clk;
wire [7:0] q;

shift_reg u0 (.dataIn(dataIn),.clear(clear),.clk(clk),.q(q));

always #10 clk = ~clk;

initial begin

    {dataIn, clk} <= 2'b0;
    clear <= 1'b1;

    $monitor("time=%0t clear=%b dataIn=%b q=%b", $time, clear, dataIn, q);

    #5 clear <= 0;
    #10 clear <= 1; dataIn <= 1'b1;
    #20 dataIn <= 1'b1;
    #20 dataIn <= 1'b0;
    #20 dataIn <= 1'b1;
    #20 dataIn <= 1'b0;
    #20 dataIn <= 1'b0;
    #20 dataIn <= 1'b1;
    #20 dataIn <= 1'b1;
    #20 dataIn <= 1'b1; 
    #20 $finish;
end

initial begin
    $dumpfile ("shift_reg.vcd");
    $dumpvars (0,shift_reg_tb);
end

endmodule