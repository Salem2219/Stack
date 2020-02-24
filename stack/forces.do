add wave -position end  sim:/toplevel/clk
add wave -position end  sim:/toplevel/rst
add wave -position end  sim:/toplevel/en
add wave -position end  sim:/toplevel/I
add wave -position end  sim:/toplevel/din
add wave -position end  sim:/toplevel/empty
add wave -position end  sim:/toplevel/top
force -freeze sim:/toplevel/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/toplevel/rst 1 0
force -freeze sim:/toplevel/rst 0 100
force -freeze sim:/toplevel/en 0 0
force -freeze sim:/toplevel/I 000 0
force -freeze sim:/toplevel/din 00001111 0
add wave -position end  sim:/toplevel/datapath/t
add wave -position end  sim:/toplevel/datapath/data_ram/program
