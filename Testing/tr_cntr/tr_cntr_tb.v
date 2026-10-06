module tr_cntr_tb;

reg [7:0] din;
reg reset, clk, init;
wire [7:0] q;

tr_cntr u0 (.din(din),.reset(reset),.clk(clk),.init(init),.q(q));

always #10 clk = ~clk;

initial begin

    {din, clk} <= 9'b0;
    {reset, init} <= 2'b11;

    $monitor("time=%0t reset=%b init=%b din=%b q=%b", $time, reset, init, din, q);

    #5 reset <= 0;
    #10 reset <= 1; init <= 0; din <= 8'b1011100;
    #20 init <= 1;
    #400 $finish;
end

initial begin
    $dumpfile ("tr_cntr.vcd");
    $dumpvars (0,tr_cntr_tb);
end

endmodule