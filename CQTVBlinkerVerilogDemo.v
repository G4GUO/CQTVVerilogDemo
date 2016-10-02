module CQTVBlinkerVerilogDemo( input clk50mhz, input button,
                output LED1, output LED2, output LED3 );

reg [31:0]counter_r;
reg [2:0]led_r;
					 
always @(posedge clk50mhz)
begin
    counter_r <= counter_r + 32'd1;
	 case({button,counter_r[25:24]})
	 0: led_r <= 3'b001;
	 1: led_r <= 3'b010;
	 2: led_r <= 3'b100;
	 3: led_r <= 3'b000;
	 4: led_r <= 3'b100;
	 5: led_r <= 3'b010;
	 6: led_r <= 3'b001;
	 7: led_r <= 3'b000;
	 default: led_r <= 3'b000;
	 endcase;
end
				
assign LED1 = !led_r[0];
assign LED2 = !led_r[1];
assign LED3 = !led_r[2];
		
endmodule
					 