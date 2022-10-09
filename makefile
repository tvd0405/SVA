comp_vhd:
	vcom dut.vhd;
	vlog tb.sv;
comp_vlog:
	vlog dut.sv;
	vlog tb.sv;
sim:
	vsim -c -voptargs=+acc tb -do "add wave -position insertpoint \
	sim:/tb/dut_i/U_assert_ip/*;run -all;quit -f";
view:
	vsim vsim.wlf;
clean:
	rm -rf work
