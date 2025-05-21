onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fase1_tb/uut/clk
add wave -noupdate /fase1_tb/uut/rst
add wave -noupdate /fase1_tb/uut/EnPC
add wave -noupdate /fase1_tb/uut/RI
add wave -noupdate /fase1_tb/uut/RegDst
add wave -noupdate /fase1_tb/uut/RegWr
add wave -noupdate /fase1_tb/uut/ALUSrc
add wave -noupdate /fase1_tb/uut/ALUOp
add wave -noupdate /fase1_tb/uut/MemWr
add wave -noupdate /fase1_tb/uut/MemToReg
add wave -noupdate /fase1_tb/uut/IntructionBus
add wave -noupdate /fase1_tb/uut/COUNTER_BUS
add wave -noupdate /fase1_tb/uut/INTRUCTION_BUS
add wave -noupdate /fase1_tb/uut/REGISTER_WRITE_ADDR
add wave -noupdate /fase1_tb/uut/REGISTER_DATA1_BUS
add wave -noupdate /fase1_tb/uut/REGISTER_DATA2_BUS
add wave -noupdate /fase1_tb/uut/ALU_OP2_BUS
add wave -noupdate /fase1_tb/uut/ALU_RES_BUS
add wave -noupdate /fase1_tb/uut/DMEMEMORY_READ_DATA_BUS
add wave -noupdate /fase1_tb/uut/REGISTER_WRITE_DATA_BUS
add wave -noupdate /fase1_tb/uut/SIGN_EXTENDED_BUS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {257080 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {153600 ps} {665600 ps}
