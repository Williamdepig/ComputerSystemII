set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }];
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];
set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { rstn }];
create_clock -name dut_clk_virt -period 80.00 -waveform {0 40} [get_nets { clk_core }];
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
set_property PACKAGE_PIN K2  [get_ports {an[6]}]
set_property PACKAGE_PIN T14 [get_ports {an[5]}]
set_property PACKAGE_PIN P14 [get_ports {an[4]}]
set_property PACKAGE_PIN J14 [get_ports {an[3]}]
set_property PACKAGE_PIN T9  [get_ports {an[2]}]
set_property PACKAGE_PIN J18 [get_ports {an[1]}]
set_property PACKAGE_PIN J17 [get_ports {an[0]}]

#switch

set_property PACKAGE_PIN V10 [get_ports {switch[15]}]
set_property PACKAGE_PIN U11 [get_ports {switch[14]}]
set_property PACKAGE_PIN U12 [get_ports {switch[13]}]
set_property PACKAGE_PIN H6  [get_ports {switch[12]}]
set_property PACKAGE_PIN T13 [get_ports {switch[11]}]
set_property PACKAGE_PIN R16 [get_ports {switch[10]}]
set_property PACKAGE_PIN U8  [get_ports {switch[9]}]
set_property PACKAGE_PIN T8  [get_ports {switch[8]}]
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

set_property IOSTANDARD LVCMOS33 [get_ports {cs[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {switch[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[*]}]

set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { vga_r[0] }]; #IO_L8N_T1_AD14N_35 Sch=vga_r[0]
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { vga_r[1] }]; #IO_L7N_T1_AD6N_35 Sch=vga_r[1]
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { vga_r[2] }]; #IO_L1N_T0_AD4N_35 Sch=vga_r[2]
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { vga_r[3] }]; #IO_L8P_T1_AD14P_35 Sch=vga_r[3]
set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { vga_g[0] }]; #IO_L1P_T0_AD4P_35 Sch=vga_g[0]
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { vga_g[1] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=vga_g[1]
set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { vga_g[2] }]; #IO_L2N_T0_AD12N_35 Sch=vga_g[2]
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { vga_g[3] }]; #IO_L3P_T0_DQS_AD5P_35 Sch=vga_g[3]
set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { vga_b[0] }]; #IO_L2P_T0_AD12P_35 Sch=vga_b[0]
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { vga_b[1] }]; #IO_L4N_T0_35 Sch=vga_b[1]
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { vga_b[2] }]; #IO_L6N_T0_VREF_35 Sch=vga_b[2]
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { vga_b[3] }]; #IO_L4P_T0_35 Sch=vga_b[3]
set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { vga_hs }]; #IO_L4P_T0_15 Sch=vga_hs
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { vga_vs }]; #IO_L3N_T0_DQS_AD1N_15 Sch=vga_vs