module sync
(input clk, output h_sync, v_sync, EA, 
output [10:0] h_count, v_count);
reg [10:0] h_count_reg = 0;
reg [10:0] v_count_reg = 0;
reg EA_reg = 1;
reg h_sync_reg = 1;
reg v_sync_reg = 1;

assign h_sync = h_sync_reg;
assign v_sync = v_sync_reg;
assign EA = EA_reg;

assign h_count = h_count_reg;
assign v_count = v_count_reg;

always @ (negedge clk)//jjj
begin

if (h_count_reg > 1023) EA_reg = 0;
else if (v_count_reg > 767) EA_reg = 0;
else EA_reg = 1;


// V-Sync ---------------------
if (v_count_reg == 770) begin
	v_sync_reg = 0;
end

if (v_count_reg == 776) begin
	v_sync_reg = 1;
end

if (v_count_reg == 805) begin
	v_count_reg = 0;
end
// -----------------------------


// H-Sync ------------------
if (h_count_reg == 1047) begin 
h_sync_reg = 0;
end

if (h_count_reg == 1183) begin
h_sync_reg = 1;
end
// --------------------------

if (h_count_reg == 1343) begin
h_count_reg = 0;
v_count_reg = v_count_reg + 1;
end


h_count_reg = h_count_reg + 1;

end
endmodule