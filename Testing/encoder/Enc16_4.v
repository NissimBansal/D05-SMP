module enc16_4 (input [15:0] KEY,
                output [3:0] CODE)
;

initial begin

CODE <= 4'b0000; 

while (KEY != 0) begin
    
    KEY <= (KEY >> 1);
    CODE <= CODE + 1;
end

end

endmodule