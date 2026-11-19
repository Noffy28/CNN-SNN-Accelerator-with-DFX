set moduleName fc2_lif
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 23
set C_modelName {fc2_lif}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict spk1_0 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict spk1_1 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict spk1_2 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict spk1_3 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict spk2_0 { MEM_WIDTH 1 MEM_SIZE 8 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict spk2_1 { MEM_WIDTH 1 MEM_SIZE 8 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict spk2_2 { MEM_WIDTH 1 MEM_SIZE 8 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict spk2_3 { MEM_WIDTH 1 MEM_SIZE 8 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mem2_0 { MEM_WIDTH 32 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mem2_1 { MEM_WIDTH 32 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mem2_2 { MEM_WIDTH 32 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict mem2_3 { MEM_WIDTH 32 MEM_SIZE 32 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ spk1_0 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ spk1_1 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ spk1_2 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ spk1_3 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ spk2_0 int 1 regular {array 8 { 0 3 } 0 1 }  }
	{ spk2_1 int 1 regular {array 8 { 0 3 } 0 1 }  }
	{ spk2_2 int 1 regular {array 8 { 0 3 } 0 1 }  }
	{ spk2_3 int 1 regular {array 8 { 0 3 } 0 1 }  }
	{ mem2_0 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ mem2_1 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ mem2_2 int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ mem2_3 int 32 regular {array 8 { 2 3 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "spk1_0", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "spk1_1", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "spk1_2", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "spk1_3", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "spk2_0", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "spk2_1", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "spk2_2", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "spk2_3", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "mem2_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "mem2_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "mem2_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "mem2_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 54
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ spk1_0_address0 sc_out sc_lv 4 signal 0 } 
	{ spk1_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ spk1_0_q0 sc_in sc_lv 1 signal 0 } 
	{ spk1_1_address0 sc_out sc_lv 4 signal 1 } 
	{ spk1_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ spk1_1_q0 sc_in sc_lv 1 signal 1 } 
	{ spk1_2_address0 sc_out sc_lv 4 signal 2 } 
	{ spk1_2_ce0 sc_out sc_logic 1 signal 2 } 
	{ spk1_2_q0 sc_in sc_lv 1 signal 2 } 
	{ spk1_3_address0 sc_out sc_lv 4 signal 3 } 
	{ spk1_3_ce0 sc_out sc_logic 1 signal 3 } 
	{ spk1_3_q0 sc_in sc_lv 1 signal 3 } 
	{ spk2_0_address0 sc_out sc_lv 3 signal 4 } 
	{ spk2_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ spk2_0_we0 sc_out sc_logic 1 signal 4 } 
	{ spk2_0_d0 sc_out sc_lv 1 signal 4 } 
	{ spk2_1_address0 sc_out sc_lv 3 signal 5 } 
	{ spk2_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ spk2_1_we0 sc_out sc_logic 1 signal 5 } 
	{ spk2_1_d0 sc_out sc_lv 1 signal 5 } 
	{ spk2_2_address0 sc_out sc_lv 3 signal 6 } 
	{ spk2_2_ce0 sc_out sc_logic 1 signal 6 } 
	{ spk2_2_we0 sc_out sc_logic 1 signal 6 } 
	{ spk2_2_d0 sc_out sc_lv 1 signal 6 } 
	{ spk2_3_address0 sc_out sc_lv 3 signal 7 } 
	{ spk2_3_ce0 sc_out sc_logic 1 signal 7 } 
	{ spk2_3_we0 sc_out sc_logic 1 signal 7 } 
	{ spk2_3_d0 sc_out sc_lv 1 signal 7 } 
	{ mem2_0_address0 sc_out sc_lv 3 signal 8 } 
	{ mem2_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ mem2_0_we0 sc_out sc_logic 1 signal 8 } 
	{ mem2_0_d0 sc_out sc_lv 32 signal 8 } 
	{ mem2_0_q0 sc_in sc_lv 32 signal 8 } 
	{ mem2_1_address0 sc_out sc_lv 3 signal 9 } 
	{ mem2_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ mem2_1_we0 sc_out sc_logic 1 signal 9 } 
	{ mem2_1_d0 sc_out sc_lv 32 signal 9 } 
	{ mem2_1_q0 sc_in sc_lv 32 signal 9 } 
	{ mem2_2_address0 sc_out sc_lv 3 signal 10 } 
	{ mem2_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ mem2_2_we0 sc_out sc_logic 1 signal 10 } 
	{ mem2_2_d0 sc_out sc_lv 32 signal 10 } 
	{ mem2_2_q0 sc_in sc_lv 32 signal 10 } 
	{ mem2_3_address0 sc_out sc_lv 3 signal 11 } 
	{ mem2_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ mem2_3_we0 sc_out sc_logic 1 signal 11 } 
	{ mem2_3_d0 sc_out sc_lv 32 signal 11 } 
	{ mem2_3_q0 sc_in sc_lv 32 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "spk1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "spk1_0", "role": "address0" }} , 
 	{ "name": "spk1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_0", "role": "ce0" }} , 
 	{ "name": "spk1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_0", "role": "q0" }} , 
 	{ "name": "spk1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "spk1_1", "role": "address0" }} , 
 	{ "name": "spk1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_1", "role": "ce0" }} , 
 	{ "name": "spk1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_1", "role": "q0" }} , 
 	{ "name": "spk1_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "spk1_2", "role": "address0" }} , 
 	{ "name": "spk1_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_2", "role": "ce0" }} , 
 	{ "name": "spk1_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_2", "role": "q0" }} , 
 	{ "name": "spk1_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "spk1_3", "role": "address0" }} , 
 	{ "name": "spk1_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_3", "role": "ce0" }} , 
 	{ "name": "spk1_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk1_3", "role": "q0" }} , 
 	{ "name": "spk2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "spk2_0", "role": "address0" }} , 
 	{ "name": "spk2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_0", "role": "ce0" }} , 
 	{ "name": "spk2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_0", "role": "we0" }} , 
 	{ "name": "spk2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_0", "role": "d0" }} , 
 	{ "name": "spk2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "spk2_1", "role": "address0" }} , 
 	{ "name": "spk2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_1", "role": "ce0" }} , 
 	{ "name": "spk2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_1", "role": "we0" }} , 
 	{ "name": "spk2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_1", "role": "d0" }} , 
 	{ "name": "spk2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "spk2_2", "role": "address0" }} , 
 	{ "name": "spk2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_2", "role": "ce0" }} , 
 	{ "name": "spk2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_2", "role": "we0" }} , 
 	{ "name": "spk2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_2", "role": "d0" }} , 
 	{ "name": "spk2_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "spk2_3", "role": "address0" }} , 
 	{ "name": "spk2_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_3", "role": "ce0" }} , 
 	{ "name": "spk2_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_3", "role": "we0" }} , 
 	{ "name": "spk2_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "spk2_3", "role": "d0" }} , 
 	{ "name": "mem2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2_0", "role": "address0" }} , 
 	{ "name": "mem2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_0", "role": "ce0" }} , 
 	{ "name": "mem2_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_0", "role": "we0" }} , 
 	{ "name": "mem2_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_0", "role": "d0" }} , 
 	{ "name": "mem2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_0", "role": "q0" }} , 
 	{ "name": "mem2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2_1", "role": "address0" }} , 
 	{ "name": "mem2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_1", "role": "ce0" }} , 
 	{ "name": "mem2_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_1", "role": "we0" }} , 
 	{ "name": "mem2_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_1", "role": "d0" }} , 
 	{ "name": "mem2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_1", "role": "q0" }} , 
 	{ "name": "mem2_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2_2", "role": "address0" }} , 
 	{ "name": "mem2_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_2", "role": "ce0" }} , 
 	{ "name": "mem2_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_2", "role": "we0" }} , 
 	{ "name": "mem2_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_2", "role": "d0" }} , 
 	{ "name": "mem2_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_2", "role": "q0" }} , 
 	{ "name": "mem2_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "mem2_3", "role": "address0" }} , 
 	{ "name": "mem2_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_3", "role": "ce0" }} , 
 	{ "name": "mem2_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mem2_3", "role": "we0" }} , 
 	{ "name": "mem2_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_3", "role": "d0" }} , 
 	{ "name": "mem2_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "mem2_3", "role": "q0" }}  ]}

set ArgLastReadFirstWriteLatency {
	fc2_lif {
		spk1_0 {Type I LastRead 1 FirstWrite -1}
		spk1_1 {Type I LastRead 1 FirstWrite -1}
		spk1_2 {Type I LastRead 1 FirstWrite -1}
		spk1_3 {Type I LastRead 1 FirstWrite -1}
		spk2_0 {Type O LastRead -1 FirstWrite 5}
		spk2_1 {Type O LastRead -1 FirstWrite 7}
		spk2_2 {Type O LastRead -1 FirstWrite 9}
		spk2_3 {Type O LastRead -1 FirstWrite 11}
		mem2_0 {Type IO LastRead 1 FirstWrite 5}
		mem2_1 {Type IO LastRead 3 FirstWrite 7}
		mem2_2 {Type IO LastRead 5 FirstWrite 9}
		mem2_3 {Type IO LastRead 7 FirstWrite 11}
		p_ZL5fc2_b_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_b_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_b_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_b_3 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_3 {Type I LastRead -1 FirstWrite -1}}
	fc2_lif_Pipeline_VITIS_LOOP_130_2 {
		sext_ln128 {Type I LastRead 0 FirstWrite -1}
		zext_ln134 {Type I LastRead 0 FirstWrite -1}
		spk1_0 {Type I LastRead 1 FirstWrite -1}
		spk1_1 {Type I LastRead 1 FirstWrite -1}
		spk1_2 {Type I LastRead 1 FirstWrite -1}
		spk1_3 {Type I LastRead 1 FirstWrite -1}
		acc_04_out {Type O LastRead -1 FirstWrite 2}
		p_ZL5fc2_w_0 {Type I LastRead -1 FirstWrite -1}}
	fc2_lif_Pipeline_VITIS_LOOP_130_24 {
		sext_ln128_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln134 {Type I LastRead 0 FirstWrite -1}
		spk1_0 {Type I LastRead 1 FirstWrite -1}
		spk1_1 {Type I LastRead 1 FirstWrite -1}
		spk1_2 {Type I LastRead 1 FirstWrite -1}
		spk1_3 {Type I LastRead 1 FirstWrite -1}
		acc_15_out {Type O LastRead -1 FirstWrite 2}
		p_ZL5fc2_w_1 {Type I LastRead -1 FirstWrite -1}}
	fc2_lif_Pipeline_VITIS_LOOP_130_25 {
		sext_ln128_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln134 {Type I LastRead 0 FirstWrite -1}
		spk1_0 {Type I LastRead 1 FirstWrite -1}
		spk1_1 {Type I LastRead 1 FirstWrite -1}
		spk1_2 {Type I LastRead 1 FirstWrite -1}
		spk1_3 {Type I LastRead 1 FirstWrite -1}
		acc_19_out {Type O LastRead -1 FirstWrite 2}
		p_ZL5fc2_w_2 {Type I LastRead -1 FirstWrite -1}}
	fc2_lif_Pipeline_VITIS_LOOP_130_26 {
		sext_ln128_3 {Type I LastRead 0 FirstWrite -1}
		zext_ln134 {Type I LastRead 0 FirstWrite -1}
		spk1_0 {Type I LastRead 1 FirstWrite -1}
		spk1_1 {Type I LastRead 1 FirstWrite -1}
		spk1_2 {Type I LastRead 1 FirstWrite -1}
		spk1_3 {Type I LastRead 1 FirstWrite -1}
		acc_22_out {Type O LastRead -1 FirstWrite 2}
		p_ZL5fc2_w_3 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2265", "Max" : "2265"}
	, {"Name" : "Interval", "Min" : "2265", "Max" : "2265"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	spk1_0 { ap_memory {  { spk1_0_address0 mem_address 1 4 }  { spk1_0_ce0 mem_ce 1 1 }  { spk1_0_q0 mem_dout 0 1 } } }
	spk1_1 { ap_memory {  { spk1_1_address0 mem_address 1 4 }  { spk1_1_ce0 mem_ce 1 1 }  { spk1_1_q0 mem_dout 0 1 } } }
	spk1_2 { ap_memory {  { spk1_2_address0 mem_address 1 4 }  { spk1_2_ce0 mem_ce 1 1 }  { spk1_2_q0 mem_dout 0 1 } } }
	spk1_3 { ap_memory {  { spk1_3_address0 mem_address 1 4 }  { spk1_3_ce0 mem_ce 1 1 }  { spk1_3_q0 mem_dout 0 1 } } }
	spk2_0 { ap_memory {  { spk2_0_address0 mem_address 1 3 }  { spk2_0_ce0 mem_ce 1 1 }  { spk2_0_we0 mem_we 1 1 }  { spk2_0_d0 mem_din 1 1 } } }
	spk2_1 { ap_memory {  { spk2_1_address0 mem_address 1 3 }  { spk2_1_ce0 mem_ce 1 1 }  { spk2_1_we0 mem_we 1 1 }  { spk2_1_d0 mem_din 1 1 } } }
	spk2_2 { ap_memory {  { spk2_2_address0 mem_address 1 3 }  { spk2_2_ce0 mem_ce 1 1 }  { spk2_2_we0 mem_we 1 1 }  { spk2_2_d0 mem_din 1 1 } } }
	spk2_3 { ap_memory {  { spk2_3_address0 mem_address 1 3 }  { spk2_3_ce0 mem_ce 1 1 }  { spk2_3_we0 mem_we 1 1 }  { spk2_3_d0 mem_din 1 1 } } }
	mem2_0 { ap_memory {  { mem2_0_address0 mem_address 1 3 }  { mem2_0_ce0 mem_ce 1 1 }  { mem2_0_we0 mem_we 1 1 }  { mem2_0_d0 mem_din 1 32 }  { mem2_0_q0 mem_dout 0 32 } } }
	mem2_1 { ap_memory {  { mem2_1_address0 mem_address 1 3 }  { mem2_1_ce0 mem_ce 1 1 }  { mem2_1_we0 mem_we 1 1 }  { mem2_1_d0 mem_din 1 32 }  { mem2_1_q0 mem_dout 0 32 } } }
	mem2_2 { ap_memory {  { mem2_2_address0 mem_address 1 3 }  { mem2_2_ce0 mem_ce 1 1 }  { mem2_2_we0 mem_we 1 1 }  { mem2_2_d0 mem_din 1 32 }  { mem2_2_q0 mem_dout 0 32 } } }
	mem2_3 { ap_memory {  { mem2_3_address0 mem_address 1 3 }  { mem2_3_ce0 mem_ce 1 1 }  { mem2_3_we0 mem_we 1 1 }  { mem2_3_d0 mem_din 1 32 }  { mem2_3_q0 mem_dout 0 32 } } }
}
