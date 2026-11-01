module fifo_32bit #(paramter SIZE = 32) 
                    (   input clk, reset, oe, we, 
                        inout [31:0] data,
                        output wptr, rptr)
;

reg [31:0] fifo [7:0];

endmodule