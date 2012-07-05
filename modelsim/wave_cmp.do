onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /tb_jop/joptop/clk_int
add wave -noupdate -radix hexadecimal /tb_jop/joptop/int_res
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/wd
add wave -noupdate -radix ascii /tb_jop/joptop/io/ua/char
add wave -noupdate -divider core0
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/stk/a
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/stk/b
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/bcf/jpc
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/bcf/bc/val
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/fch/pc
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/fch/ir
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/fch/bsy
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/fch/nxt
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/stk/sp
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/core/stk/sp_ov
add wave -noupdate -divider core1
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(1)/cpu/core/bcf/jpc
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(1)/cpu/core/bcf/bc/val
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(1)/cpu/core/fch/pc
add wave -noupdate -divider core2
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(2)/cpu/core/bcf/jpc
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(2)/cpu/core/bcf/bc/val
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(2)/cpu/core/fch/pc
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/timer_int
add wave -noupdate -divider sc_sys0
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/address
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/wr_data
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/wr
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/rd
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/rdy_cnt
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/sync_out
add wave -noupdate -radix hexadecimal -childformat {{/tb_jop/joptop/io/sys/sync_in.s_in -radix hexadecimal} {/tb_jop/joptop/io/sys/sync_in.lock_req -radix hexadecimal}} -expand -subitemconfig {/tb_jop/joptop/io/sys/sync_in.s_in {-height 20 -radix hexadecimal} /tb_jop/joptop/io/sys/sync_in.lock_req {-height 20 -radix hexadecimal}} /tb_jop/joptop/io/sys/sync_in
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/lock_reqest
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/timer_int
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/int_pend
add wave -noupdate -radix hexadecimal /tb_jop/joptop/io/sys/int_ena
add wave -noupdate -divider sc_sys1
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/address
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/wr_data
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/rd
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/wr
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/rdy_cnt
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/sync_out
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/sync_in
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/lock_reqest
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/timer_int
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/int_pend
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(1)/io2/int_ena
add wave -noupdate -divider sc_sys2
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/address
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/wr_data
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/rd
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/wr
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/rdy_cnt
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/sync_out
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/sync_in
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/lock_reqest
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/timer_int
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/int_pend
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_io(2)/io2/int_ena
add wave -noupdate -divider Sync
add wave -noupdate -radix hexadecimal /tb_jop/joptop/sync/sync_in_array
add wave -noupdate -radix hexadecimal /tb_jop/joptop/sync/sync_out_array
add wave -noupdate -radix hexadecimal /tb_jop/joptop/sync/next_state
add wave -noupdate -radix hexadecimal /tb_jop/joptop/sync/next_locked_id
add wave -noupdate -divider Arbiter
add wave -noupdate -radix hexadecimal -childformat {{/tb_jop/joptop/arbiter/arb_out(0) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_out(1) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_out(2) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_out(3) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_out(4) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_out(5) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_out(6) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_out(7) -radix hexadecimal}} -expand -subitemconfig {/tb_jop/joptop/arbiter/arb_out(0) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_out(1) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_out(2) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_out(3) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_out(4) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_out(5) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_out(6) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_out(7) {-height 20 -radix hexadecimal}} /tb_jop/joptop/arbiter/arb_out
add wave -noupdate -radix hexadecimal -childformat {{/tb_jop/joptop/arbiter/arb_in(0) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_in(1) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_in(2) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_in(3) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_in(4) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_in(5) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_in(6) -radix hexadecimal} {/tb_jop/joptop/arbiter/arb_in(7) -radix hexadecimal}} -expand -subitemconfig {/tb_jop/joptop/arbiter/arb_in(0) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_in(1) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_in(2) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_in(3) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_in(4) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_in(5) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_in(6) {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/arb_in(7) {-height 20 -radix hexadecimal}} /tb_jop/joptop/arbiter/arb_in
add wave -noupdate -radix hexadecimal -childformat {{/tb_jop/joptop/arbiter/mem_out.address -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.wr_data -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.rd -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.wr -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.atomic -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.cache -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.cinval -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.tm_cache -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_out.tm_broadcast -radix hexadecimal}} -expand -subitemconfig {/tb_jop/joptop/arbiter/mem_out.address {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.wr_data {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.rd {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.wr {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.atomic {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.cache {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.cinval {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.tm_cache {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_out.tm_broadcast {-height 20 -radix hexadecimal}} /tb_jop/joptop/arbiter/mem_out
add wave -noupdate -radix hexadecimal -childformat {{/tb_jop/joptop/arbiter/mem_in.rd_data -radix hexadecimal} {/tb_jop/joptop/arbiter/mem_in.rdy_cnt -radix hexadecimal}} -expand -subitemconfig {/tb_jop/joptop/arbiter/mem_in.rd_data {-height 20 -radix hexadecimal} /tb_jop/joptop/arbiter/mem_in.rdy_cnt {-height 20 -radix hexadecimal}} /tb_jop/joptop/arbiter/mem_in
add wave -noupdate -divider {external signals}
add wave -noupdate -divider mem_sc
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ocin
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ocout
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ocin_reg
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/line_reg
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/hit_reg
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/hit_tag_reg
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/inc_nxt_reg
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/cacheable
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/cacheable_reg
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/update_cache
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/chk_gf_dly
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ram_dout_store
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/oc_tag_in
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/oc_tag_out
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ram
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ram_din
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ram_dout
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cpu/mem/oc/ram_wraddr
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cmp_dcache/cpu_out
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cmp_dcache/cpu_in
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cmp_dcache/mem_out
add wave -noupdate -radix hexadecimal /tb_jop/joptop/gen_cpu(0)/cmp_dcache/mem_in
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9470000 ps} 0}
configure wave -namecolwidth 568
configure wave -valuecolwidth 108
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
WaveRestoreZoom {9205285 ps} {9741394 ps}
