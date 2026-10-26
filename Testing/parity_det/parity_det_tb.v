module parity_det_tb;

reg t, clear, clk;
wire q;

parity_det u0 (.t(t),.clear(clear),.clk(clk),.q(q));

always #10 clk = ~clk;

initial begin
    {clk, t} <= 2'b00;
    clear <= 1'b1;

    $monitor("time=%0t q=%0b", $time, q);

    #15 clear <= 0; t <= 1;
    #25 t <= 0;           
    #20 t <= 1; 
    #20 t <= 0;
    #20 t <= 1;
    #40 $finish;
end

initial begin
    $dumpfile ("parity_det.vcd");
    $dumpvars (0,parity_det_tb);
end

endmodule