onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /processor_tb/uut/ControllUnit/clk
add wave -noupdate /processor_tb/uut/ControllUnit/opcode
add wave -noupdate /processor_tb/uut/ControllUnit/func
add wave -noupdate /processor_tb/uut/ControllUnit/EnPC
add wave -noupdate /processor_tb/uut/ControllUnit/RI
add wave -noupdate /processor_tb/uut/ControllUnit/RegDst
add wave -noupdate /processor_tb/uut/ControllUnit/RegWr
add wave -noupdate /processor_tb/uut/ControllUnit/ALUSrc
add wave -noupdate /processor_tb/uut/ControllUnit/ALUOp
add wave -noupdate /processor_tb/uut/ControllUnit/MemWr
add wave -noupdate /processor_tb/uut/ControllUnit/MemToReg
add wave -noupdate /processor_tb/uut/ControllUnit/rst
add wave -noupdate /processor_tb/uut/ControllUnit/s_state
add wave -noupdate /processor_tb/uut/ControllUnit/n_state
add wave -noupdate /processor_tb/uut/DataPath/clk
add wave -noupdate /processor_tb/uut/DataPath/rst
add wave -noupdate /processor_tb/uut/DataPath/EnPC
add wave -noupdate /processor_tb/uut/DataPath/RI
add wave -noupdate /processor_tb/uut/DataPath/RegDst
add wave -noupdate /processor_tb/uut/DataPath/RegWr
add wave -noupdate /processor_tb/uut/DataPath/ALUSrc
add wave -noupdate /processor_tb/uut/DataPath/ALUOp
add wave -noupdate /processor_tb/uut/DataPath/MemWr
add wave -noupdate /processor_tb/uut/DataPath/MemToReg
add wave -noupdate /processor_tb/uut/DataPath/IntructionBus
add wave -noupdate /processor_tb/uut/DataPath/COUNTER_BUS
add wave -noupdate /processor_tb/uut/DataPath/INTRUCTION_BUS
add wave -noupdate /processor_tb/uut/DataPath/REGISTER_WRITE_ADDR
add wave -noupdate /processor_tb/uut/DataPath/REGISTER_DATA1_BUS
add wave -noupdate /processor_tb/uut/DataPath/REGISTER_DATA2_BUS
add wave -noupdate /processor_tb/uut/DataPath/ALU_OP2_BUS
add wave -noupdate /processor_tb/uut/DataPath/ALU_RES_BUS
add wave -noupdate /processor_tb/uut/DataPath/DMEMEMORY_READ_DATA_BUS
add wave -noupdate /processor_tb/uut/DataPath/REGISTER_WRITE_DATA_BUS
add wave -noupdate /processor_tb/uut/DataPath/SIGN_EXTENDED_BUS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {93982 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 273
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
WaveRestoreZoom {0 ps} {953080 ps}
