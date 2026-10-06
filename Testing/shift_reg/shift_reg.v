module d_ff (   input d, Clear, Clk,
                output reg Q)
;

always @(posedge Clk or negedge Clear) begin
    if (!Clear) Q <= 1'b0;
    else Q <= d;
end

endmodule

module shift_reg (  input clk, clear, dataIn, 
                    output [7:0] q)
;

d_ff f7 (.d(dataIn),.Clear(clear),.Clk(clk),.Q(q[7]));

genvar i;
generate
    for (i = 0; i < 7; i = i + 1) begin
        d_ff f (.d(q[i+1]),.Clear(clear),.Clk(clk),.Q(q[i]));
    end
endgenerate

endmodule