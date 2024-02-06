set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS18} [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS18} [get_ports rstn]
create_clock -period 80.000 -name dut_clk_virt -waveform {0.000 40.000} [get_nets clk_core]
set_false_path -from [get_clocks dut_clk_virt] -to [get_clocks sys_clk_pin]

set_property PACKAGE_PIN H15 [get_ports {cs[7]}]
set_property PACKAGE_PIN L18 [get_ports {cs[6]}]
set_property PACKAGE_PIN T11 [get_ports {cs[5]}]
set_property PACKAGE_PIN P15 [get_ports {cs[4]}]
set_property PACKAGE_PIN K13 [get_ports {cs[3]}]
set_property PACKAGE_PIN K16 [get_ports {cs[2]}]
set_property PACKAGE_PIN R10 [get_ports {cs[1]}]
set_property PACKAGE_PIN T10 [get_ports {cs[0]}]

set_property PACKAGE_PIN U13 [get_ports {an[7]}]
set_property PACKAGE_PIN K2 [get_ports {an[6]}]
set_property PACKAGE_PIN T14 [get_ports {an[5]}]
set_property PACKAGE_PIN P14 [get_ports {an[4]}]
set_property PACKAGE_PIN J14 [get_ports {an[3]}]
set_property PACKAGE_PIN T9 [get_ports {an[2]}]
set_property PACKAGE_PIN J18 [get_ports {an[1]}]
set_property PACKAGE_PIN J17 [get_ports {an[0]}]

#switch

set_property PACKAGE_PIN V10 [get_ports {switch[15]}]
set_property PACKAGE_PIN U11 [get_ports {switch[14]}]
set_property PACKAGE_PIN U12 [get_ports {switch[13]}]
set_property PACKAGE_PIN H6 [get_ports {switch[12]}]
set_property PACKAGE_PIN T13 [get_ports {switch[11]}]
set_property PACKAGE_PIN R16 [get_ports {switch[10]}]
set_property PACKAGE_PIN U8 [get_ports {switch[9]}]
set_property PACKAGE_PIN T8 [get_ports {switch[8]}]
set_property PACKAGE_PIN R13 [get_ports {switch[7]}]
set_property PACKAGE_PIN U18 [get_ports {switch[6]}]
set_property PACKAGE_PIN T18 [get_ports {switch[5]}]
set_property PACKAGE_PIN R17 [get_ports {switch[4]}]
set_property PACKAGE_PIN R15 [get_ports {switch[3]}]
set_property PACKAGE_PIN M13 [get_ports {switch[2]}]
set_property PACKAGE_PIN L16 [get_ports {switch[1]}]
set_property PACKAGE_PIN J15 [get_ports {switch[0]}]

# btn right up left down center
set_property PACKAGE_PIN M17 [get_ports {btn[4]}]
set_property PACKAGE_PIN M18 [get_ports {btn[3]}]
set_property PACKAGE_PIN P17 [get_ports {btn[2]}]
set_property PACKAGE_PIN P18 [get_ports {btn[1]}]
set_property PACKAGE_PIN N17 [get_ports {btn[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports {cs[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {an[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {switch[*]}]
set_property IOSTANDARD LVCMOS18 [get_ports {btn[*]}]

set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS18} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS18} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS18} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS18} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS18} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS18} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS18} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS18} [get_ports {led[7]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS18} [get_ports {led[8]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS18} [get_ports {led[9]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS18} [get_ports {led[10]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS18} [get_ports {led[11]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS18} [get_ports {led[12]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS18} [get_ports {led[13]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS18} [get_ports {led[14]}]
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS18} [get_ports {led[15]}]

set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS18} [get_ports {vga_r[0]}]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS18} [get_ports {vga_r[1]}]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS18} [get_ports {vga_r[2]}]
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS18} [get_ports {vga_r[3]}]
set_property -dict {PACKAGE_PIN C6 IOSTANDARD LVCMOS18} [get_ports {vga_g[0]}]
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS18} [get_ports {vga_g[1]}]
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS18} [get_ports {vga_g[2]}]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS18} [get_ports {vga_g[3]}]
set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS18} [get_ports {vga_b[0]}]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS18} [get_ports {vga_b[1]}]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS18} [get_ports {vga_b[2]}]
set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS18} [get_ports {vga_b[3]}]
set_property -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS18} [get_ports vga_hs]
set_property -dict {PACKAGE_PIN B12 IOSTANDARD LVCMOS18} [get_ports vga_vs]