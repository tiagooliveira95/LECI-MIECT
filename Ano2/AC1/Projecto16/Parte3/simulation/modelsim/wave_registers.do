onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /registers_tb/s_clk
add wave -noupdate /registers_tb/s_WE
add wave -noupdate /registers_tb/s_rst
add wave -noupdate /registers_tb/s_RA1
add wave -noupdate /registers_tb/s_RA2
add wave -noupdate /registers_tb/s_WA
add wave -noupdate /registers_tb/s_WD
add wave -noupdate /registers_tb/s_RD1
add wave -noupdate /registers_tb/s_RD2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {199431 ps} 0}
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
WaveRestoreZoom {102400 ps} {358400 ps}
