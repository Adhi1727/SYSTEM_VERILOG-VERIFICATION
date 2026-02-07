module mem(
  input logic clk,r_w,
  input logic [3:0] addr,
  input logic [7:0] wr_d,
  output logic [7:0] rd_d
);
  logic [7:0] mem[15:0];
  
  always @(posedge clk) begin
    if(r_w) begin
      mem[addr] <= wr_d;
    end
    else begin
      rd_d <= mem[addr];
    end
  end
endmodule
