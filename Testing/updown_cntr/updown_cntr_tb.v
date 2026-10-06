module updown_cntr_tb;

reg [3:0] din;
reg clear, preset, clk, load, mode;
wire [3:0] q;

updown_cntr u0 (.din(din),.clear(clear),.preset(preset),.clk(clk),.load(load),.q(q),.mode(mode));

always #10 clk = ~clk;

initial begin

    {din, clk, mode} <= 5'b0;
    {clear, preset, load} <= 3'b111;

    $monitor("time=%0t clear=%b preset=%b load=%b mode=%b din=%b q=%b", $time, clear, preset, load, mode, din, q);

    #5 clear <= 0;
    #10 clear <= 1; preset <= 0;
    #20 preset <= 1; load <= 0; din <= 4'b1001;
    #20 load <= 1; mode <= 0;
    #400 mode <= 1;
    #400 $finish;
end

initial begin
    $dumpfile ("updown_cntr.vcd");
    $dumpvars (0,updown_cntr_tb);
end

endmodule