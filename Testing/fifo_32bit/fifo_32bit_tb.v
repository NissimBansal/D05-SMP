module fifo_32bit_tb ();

reg [31:0] datain;
wire [31:0] dataout;
reg clk, reset, we, re;
wire [2:0] wptr, rptr;
wire empty, full;

always #10 clk = ~clk;

fifo_32bit #(.DEPTH(8)) dut (clk, reset, re, we, datain, dataout, wptr, rptr, empty, full);

initial begin

    {clk, we, re, datain, reset} <= 0; #5;

    $monitor("t=%0t reset=%b re=%b we=%b datain=%h dataout=%h wptr=%b rptr=%b empty=%b full=%b", $time, reset, re, we, datain, dataout, wptr, rptr, empty, full);

    @(negedge clk) reset <= 1'b1; we <= 1'b1; datain <= 32'hDEADBEEF;
    
    @(negedge clk) datain <= 32'hFFFFFFFF;
    
    @(negedge clk) datain <= 32'h08002029; re <= 1'b1;
    
    @(negedge clk) we <= 1'b0;

    repeat (10) @(negedge clk) begin 
        if (empty) $finish;
    end
end

initial begin
    $dumpfile ("fifo_32bit.vcd");
    $dumpvars (0,fifo_32bit_tb);
end

endmodule