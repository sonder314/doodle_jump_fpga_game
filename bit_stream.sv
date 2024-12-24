module bit_stream
(input clk, EA, input [10:0] count_h, count_v, output red, blue, green);

reg r = 0;
reg g = 0;
reg b = 0;

assign red = r;
assign green = g;
assign blue = b;

always @ (posedge clk)
begin
if (EA) begin
	if (count_h < 200)
	begin
		r = 1;
		g = 0;
		b = 0;
	end
	
	if (count_h > 200)
	begin
		r = 0;
		g = 1;
		b = 0;
	end
	
	if (count_h > 400)
	begin
		r = 0;
		g = 0;
		b = 1;
	end
	
	if (count_h > 600)
	begin
		r = 1;
		g = 0;
		b = 1;
	end
	
	if (count_h > 800)
	begin
		r = 1;
		g = 1;
		b = 1;
	end
end
else begin
	r = 0;
	g = 0;
	b = 0;
end
end
endmodule