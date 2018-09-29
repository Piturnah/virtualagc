// Test bench for 2005259A/module.v
`timescale 1us / 1ns

module testbench;

reg rst = 1;
initial
  begin
    $dumpfile("module.lxt2");
    $dumpvars(0, testbench);

    # 1 rst = 0;
    # 1000000 $finish;
  end

reg FS01_ = 1;
always #4.883 FS01_ = !FS01_;

reg RCHAT_ = 0;
reg RCHBT_ = 0;
reg CGA1 = 0;

wire F03B, F07A, F09A, F17A, F18A, F18A_, F25A, FS06, FS07, FS07_,
  FS08;

wire CHAT01, CHAT02, CHAT03, CHAT04, CHAT05, CHAT06, CHAT07, CHAT08,
  CHAT09, CHAT10, CHAT11, CHAT12, CHAT13, CHAT14, CHBT01, CHBT02, CHBT03,
  CHBT04, CHBT05, CHBT06, CHBT07, CHBT08, CHBT09, CHBT10, CHBT11, CHBT12,
  CHBT13, CHBT14, F02A, F02B, F03A, F03B_, F04A, F04B, F05A, F05B, F06A,
  F06B, F07A_, F07B, F08A, F08B, F09B, F10A, F10B, F11A, F11B, F12A, F12B,
  F13A, F13B, F14A, F14B, F15A, F15B, F16A, F16B, F17B, F18AX, F18B, F19A,
  F19B, F20A, F20B, F21A, F21B, F22A, F22B, F23A, F23B, F24A, F24B, F25B,
  F26A, F26B, F27A, F27B, F28A, F28B, F29A, F29B, F30A, F30B, F31A, F31B,
  F32A, F32B, F33A, F33B, FS02, FS02A, FS03, FS03A, FS04, FS04A, FS05, FS05A,
  FS06_, FS07A, FS08_, FS09, FS10, FS11, FS12, FS13, FS14, FS15, FS16, FS17,
  FS18, FS19, FS20, FS21, FS22, FS23, FS24, FS25, FS26, FS27, FS28, FS29,
  FS30, FS31, FS32, FS33;
  
A1 A1A (
  rst, CGA1, FS01_, RCHAT_, RCHBT_, F03B, F07A, F09A, F17A, F18A, F18A_,
  F25A, FS06, FS07, FS07_, FS08, CHAT01, CHAT02, CHAT03, CHAT04, CHAT05,
  CHAT06, CHAT07, CHAT08, CHAT09, CHAT10, CHAT11, CHAT12, CHAT13, CHAT14,
  CHBT01, CHBT02, CHBT03, CHBT04, CHBT05, CHBT06, CHBT07, CHBT08, CHBT09,
  CHBT10, CHBT11, CHBT12, CHBT13, CHBT14, F02A, F02B, F03A, F03B_, F04A,
  F04B, F05A, F05B, F06A, F06B, F07A_, F07B, F08A, F08B, F09B, F10A, F10B,
  F11A, F11B, F12A, F12B, F13A, F13B, F14A, F14B, F15A, F15B, F16A, F16B,
  F17B, F18AX, F18B, F19A, F19B, F20A, F20B, F21A, F21B, F22A, F22B, F23A,
  F23B, F24A, F24B, F25B, F26A, F26B, F27A, F27B, F28A, F28B, F29A, F29B,
  F30A, F30B, F31A, F31B, F32A, F32B, F33A, F33B, FS02, FS02A, FS03, FS03A,
  FS04, FS04A, FS05, FS05A, FS06_, FS07A, FS08_, FS09, FS10, FS11, FS12,
  FS13, FS14, FS15, FS16, FS17, FS18, FS19, FS20, FS21, FS22, FS23, FS24,
  FS25, FS26, FS27, FS28, FS29, FS30, FS31, FS32, FS33
);

initial
  $timeformat(-6, 0, " us", 10);
initial
  $monitor("%t: %d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d", 
  	$time, FS33, FS32, FS31, FS30, FS29, FS28, FS27, FS26, FS25, FS24, FS23, FS22, FS21, FS20, FS19, FS18, FS17, 
  	FS16, FS15, FS14, FS13, FS12, FS11, FS10, FS09, FS08, FS07, FS06, FS05, FS04, FS03, FS02, FS01_);

endmodule
