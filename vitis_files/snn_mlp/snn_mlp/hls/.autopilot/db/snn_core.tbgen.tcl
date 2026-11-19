set moduleName snn_core
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
set C_modelName {snn_core}
set C_modelType { int 160 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict features_0_0 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_0_1 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_1_0 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_1_1 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_2_0 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_2_1 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_3_0 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_3_1 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_4_0 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict features_4_1 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ features_0_0 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_0_1 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_1_0 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_1_1 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_2_0 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_2_1 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_3_0 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_3_1 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_4_0 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ features_4_1 int 16 regular {array 192 { 1 3 } 1 1 }  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "features_0_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_0_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_1_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_1_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_2_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_2_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_3_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_3_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_4_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "features_4_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 160} ]}
# RTL Port declarations: 
set portNum 41
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ features_0_0_address0 sc_out sc_lv 8 signal 0 } 
	{ features_0_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ features_0_0_q0 sc_in sc_lv 16 signal 0 } 
	{ features_0_1_address0 sc_out sc_lv 8 signal 1 } 
	{ features_0_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ features_0_1_q0 sc_in sc_lv 16 signal 1 } 
	{ features_1_0_address0 sc_out sc_lv 8 signal 2 } 
	{ features_1_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ features_1_0_q0 sc_in sc_lv 16 signal 2 } 
	{ features_1_1_address0 sc_out sc_lv 8 signal 3 } 
	{ features_1_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ features_1_1_q0 sc_in sc_lv 16 signal 3 } 
	{ features_2_0_address0 sc_out sc_lv 8 signal 4 } 
	{ features_2_0_ce0 sc_out sc_logic 1 signal 4 } 
	{ features_2_0_q0 sc_in sc_lv 16 signal 4 } 
	{ features_2_1_address0 sc_out sc_lv 8 signal 5 } 
	{ features_2_1_ce0 sc_out sc_logic 1 signal 5 } 
	{ features_2_1_q0 sc_in sc_lv 16 signal 5 } 
	{ features_3_0_address0 sc_out sc_lv 8 signal 6 } 
	{ features_3_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ features_3_0_q0 sc_in sc_lv 16 signal 6 } 
	{ features_3_1_address0 sc_out sc_lv 8 signal 7 } 
	{ features_3_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ features_3_1_q0 sc_in sc_lv 16 signal 7 } 
	{ features_4_0_address0 sc_out sc_lv 8 signal 8 } 
	{ features_4_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ features_4_0_q0 sc_in sc_lv 16 signal 8 } 
	{ features_4_1_address0 sc_out sc_lv 8 signal 9 } 
	{ features_4_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ features_4_1_q0 sc_in sc_lv 16 signal 9 } 
	{ ap_return_0 sc_out sc_lv 32 signal -1 } 
	{ ap_return_1 sc_out sc_lv 32 signal -1 } 
	{ ap_return_2 sc_out sc_lv 32 signal -1 } 
	{ ap_return_3 sc_out sc_lv 32 signal -1 } 
	{ ap_return_4 sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "features_0_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_0_0", "role": "address0" }} , 
 	{ "name": "features_0_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_0_0", "role": "ce0" }} , 
 	{ "name": "features_0_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_0_0", "role": "q0" }} , 
 	{ "name": "features_0_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_0_1", "role": "address0" }} , 
 	{ "name": "features_0_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_0_1", "role": "ce0" }} , 
 	{ "name": "features_0_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_0_1", "role": "q0" }} , 
 	{ "name": "features_1_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_1_0", "role": "address0" }} , 
 	{ "name": "features_1_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_1_0", "role": "ce0" }} , 
 	{ "name": "features_1_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_1_0", "role": "q0" }} , 
 	{ "name": "features_1_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_1_1", "role": "address0" }} , 
 	{ "name": "features_1_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_1_1", "role": "ce0" }} , 
 	{ "name": "features_1_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_1_1", "role": "q0" }} , 
 	{ "name": "features_2_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_2_0", "role": "address0" }} , 
 	{ "name": "features_2_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_2_0", "role": "ce0" }} , 
 	{ "name": "features_2_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_2_0", "role": "q0" }} , 
 	{ "name": "features_2_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_2_1", "role": "address0" }} , 
 	{ "name": "features_2_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_2_1", "role": "ce0" }} , 
 	{ "name": "features_2_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_2_1", "role": "q0" }} , 
 	{ "name": "features_3_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_3_0", "role": "address0" }} , 
 	{ "name": "features_3_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_3_0", "role": "ce0" }} , 
 	{ "name": "features_3_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_3_0", "role": "q0" }} , 
 	{ "name": "features_3_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_3_1", "role": "address0" }} , 
 	{ "name": "features_3_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_3_1", "role": "ce0" }} , 
 	{ "name": "features_3_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_3_1", "role": "q0" }} , 
 	{ "name": "features_4_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_4_0", "role": "address0" }} , 
 	{ "name": "features_4_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_4_0", "role": "ce0" }} , 
 	{ "name": "features_4_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_4_0", "role": "q0" }} , 
 	{ "name": "features_4_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "features_4_1", "role": "address0" }} , 
 	{ "name": "features_4_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "features_4_1", "role": "ce0" }} , 
 	{ "name": "features_4_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "features_4_1", "role": "q0" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }} , 
 	{ "name": "ap_return_3", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_3", "role": "default" }} , 
 	{ "name": "ap_return_4", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return_4", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	snn_core {
		features_0_0 {Type I LastRead 1 FirstWrite -1}
		features_0_1 {Type I LastRead 1 FirstWrite -1}
		features_1_0 {Type I LastRead 1 FirstWrite -1}
		features_1_1 {Type I LastRead 1 FirstWrite -1}
		features_2_0 {Type I LastRead 1 FirstWrite -1}
		features_2_1 {Type I LastRead 1 FirstWrite -1}
		features_3_0 {Type I LastRead 1 FirstWrite -1}
		features_3_1 {Type I LastRead 1 FirstWrite -1}
		features_4_0 {Type I LastRead 1 FirstWrite -1}
		features_4_1 {Type I LastRead 1 FirstWrite -1}
		p_ZL5fc1_b_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_0_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_0_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_b_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_1_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_1_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_b_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_2_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_2_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_b_3 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_3_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_3_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_b_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_b_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_b_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_b_3 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc2_w_3 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc3_w_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc3_w_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc3_w_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc3_w_3 {Type I LastRead -1 FirstWrite -1}}
	snn_core_Pipeline_VITIS_LOOP_225_1 {
		spk1_3 {Type O LastRead -1 FirstWrite 0}
		spk1_2 {Type O LastRead -1 FirstWrite 0}
		spk1_1 {Type O LastRead -1 FirstWrite 0}
		spk1 {Type O LastRead -1 FirstWrite 0}
		mem1_3 {Type O LastRead -1 FirstWrite 0}
		mem1_2 {Type O LastRead -1 FirstWrite 0}
		mem1_1 {Type O LastRead -1 FirstWrite 0}
		mem1 {Type O LastRead -1 FirstWrite 0}}
	snn_core_Pipeline_VITIS_LOOP_231_2 {
		spk2_3 {Type O LastRead -1 FirstWrite 0}
		spk2_2 {Type O LastRead -1 FirstWrite 0}
		spk2_1 {Type O LastRead -1 FirstWrite 0}
		spk2 {Type O LastRead -1 FirstWrite 0}
		mem2_3 {Type O LastRead -1 FirstWrite 0}
		mem2_2 {Type O LastRead -1 FirstWrite 0}
		mem2_1 {Type O LastRead -1 FirstWrite 0}
		mem2 {Type O LastRead -1 FirstWrite 0}}
	fc1_lif {
		x_0 {Type I LastRead 1 FirstWrite -1}
		x_1 {Type I LastRead 1 FirstWrite -1}
		spk1_0 {Type O LastRead -1 FirstWrite 5}
		spk1_1 {Type O LastRead -1 FirstWrite 7}
		spk1_2 {Type O LastRead -1 FirstWrite 9}
		spk1_3 {Type O LastRead -1 FirstWrite 11}
		mem1_0 {Type IO LastRead 1 FirstWrite 5}
		mem1_1 {Type IO LastRead 3 FirstWrite 7}
		mem1_2 {Type IO LastRead 5 FirstWrite 9}
		mem1_3 {Type IO LastRead 7 FirstWrite 11}
		p_ZL5fc1_b_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_0_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_0_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_b_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_1_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_1_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_b_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_2_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_2_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_b_3 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_3_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_3_1 {Type I LastRead -1 FirstWrite -1}}
	fc1_lif_Pipeline_VITIS_LOOP_92_2 {
		sext_ln90 {Type I LastRead 0 FirstWrite -1}
		mul_ln96_4 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type I LastRead 1 FirstWrite -1}
		x_1 {Type I LastRead 1 FirstWrite -1}
		acc_03_out {Type O LastRead -1 FirstWrite 4}
		p_ZL5fc1_w_0_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_0_1 {Type I LastRead -1 FirstWrite -1}}
	fc1_lif_Pipeline_VITIS_LOOP_92_27 {
		sext_ln90_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln96_4 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type I LastRead 1 FirstWrite -1}
		x_1 {Type I LastRead 1 FirstWrite -1}
		acc_27_out {Type O LastRead -1 FirstWrite 4}
		p_ZL5fc1_w_1_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_1_1 {Type I LastRead -1 FirstWrite -1}}
	fc1_lif_Pipeline_VITIS_LOOP_92_28 {
		sext_ln90_2 {Type I LastRead 0 FirstWrite -1}
		mul_ln96_4 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type I LastRead 1 FirstWrite -1}
		x_1 {Type I LastRead 1 FirstWrite -1}
		acc_32_out {Type O LastRead -1 FirstWrite 4}
		p_ZL5fc1_w_2_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_2_1 {Type I LastRead -1 FirstWrite -1}}
	fc1_lif_Pipeline_VITIS_LOOP_92_29 {
		sext_ln90_3 {Type I LastRead 0 FirstWrite -1}
		mul_ln96_4 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type I LastRead 1 FirstWrite -1}
		x_1 {Type I LastRead 1 FirstWrite -1}
		acc_38_out {Type O LastRead -1 FirstWrite 4}
		p_ZL5fc1_w_3_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_3_1 {Type I LastRead -1 FirstWrite -1}}
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
		p_ZL5fc2_w_3 {Type I LastRead -1 FirstWrite -1}}
	fc3_lif {
		spk2_0 {Type I LastRead 0 FirstWrite -1}
		spk2_1 {Type I LastRead 0 FirstWrite -1}
		spk2_2 {Type I LastRead 0 FirstWrite -1}
		spk2_3 {Type I LastRead 0 FirstWrite -1}
		p_read4 {Type I LastRead 6 FirstWrite -1}
		p_read5 {Type I LastRead 6 FirstWrite -1}
		p_read6 {Type I LastRead 6 FirstWrite -1}
		mem3_3_read {Type I LastRead 6 FirstWrite -1}
		p_ZL5fc3_w_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc3_w_1 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc3_w_2 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc3_w_3 {Type I LastRead -1 FirstWrite -1}}
	fc3_lif_Pipeline_VITIS_LOOP_162_2 {
		spk2_0 {Type I LastRead 0 FirstWrite -1}
		spk2_1 {Type I LastRead 0 FirstWrite -1}
		spk2_2 {Type I LastRead 0 FirstWrite -1}
		spk2_3 {Type I LastRead 0 FirstWrite -1}
		acc_out {Type O LastRead -1 FirstWrite 1}
		p_ZL5fc3_w_0 {Type I LastRead -1 FirstWrite -1}}
	fc3_lif_Pipeline_VITIS_LOOP_162_21 {
		spk2_0 {Type I LastRead 0 FirstWrite -1}
		spk2_1 {Type I LastRead 0 FirstWrite -1}
		spk2_2 {Type I LastRead 0 FirstWrite -1}
		spk2_3 {Type I LastRead 0 FirstWrite -1}
		acc_3_out {Type O LastRead -1 FirstWrite 1}
		p_ZL5fc3_w_1 {Type I LastRead -1 FirstWrite -1}}
	fc3_lif_Pipeline_VITIS_LOOP_162_22 {
		spk2_0 {Type I LastRead 0 FirstWrite -1}
		spk2_1 {Type I LastRead 0 FirstWrite -1}
		spk2_2 {Type I LastRead 0 FirstWrite -1}
		spk2_3 {Type I LastRead 0 FirstWrite -1}
		acc_6_out {Type O LastRead -1 FirstWrite 1}
		p_ZL5fc3_w_2 {Type I LastRead -1 FirstWrite -1}}
	fc3_lif_Pipeline_VITIS_LOOP_162_23 {
		spk2_0 {Type I LastRead 0 FirstWrite -1}
		spk2_1 {Type I LastRead 0 FirstWrite -1}
		spk2_2 {Type I LastRead 0 FirstWrite -1}
		spk2_3 {Type I LastRead 0 FirstWrite -1}
		acc_9_out {Type O LastRead -1 FirstWrite 1}
		p_ZL5fc3_w_3 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "76415", "Max" : "76415"}
	, {"Name" : "Interval", "Min" : "76415", "Max" : "76415"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	features_0_0 { ap_memory {  { features_0_0_address0 mem_address 1 8 }  { features_0_0_ce0 mem_ce 1 1 }  { features_0_0_q0 mem_dout 0 16 } } }
	features_0_1 { ap_memory {  { features_0_1_address0 mem_address 1 8 }  { features_0_1_ce0 mem_ce 1 1 }  { features_0_1_q0 mem_dout 0 16 } } }
	features_1_0 { ap_memory {  { features_1_0_address0 mem_address 1 8 }  { features_1_0_ce0 mem_ce 1 1 }  { features_1_0_q0 mem_dout 0 16 } } }
	features_1_1 { ap_memory {  { features_1_1_address0 mem_address 1 8 }  { features_1_1_ce0 mem_ce 1 1 }  { features_1_1_q0 mem_dout 0 16 } } }
	features_2_0 { ap_memory {  { features_2_0_address0 mem_address 1 8 }  { features_2_0_ce0 mem_ce 1 1 }  { features_2_0_q0 mem_dout 0 16 } } }
	features_2_1 { ap_memory {  { features_2_1_address0 mem_address 1 8 }  { features_2_1_ce0 mem_ce 1 1 }  { features_2_1_q0 mem_dout 0 16 } } }
	features_3_0 { ap_memory {  { features_3_0_address0 mem_address 1 8 }  { features_3_0_ce0 mem_ce 1 1 }  { features_3_0_q0 mem_dout 0 16 } } }
	features_3_1 { ap_memory {  { features_3_1_address0 mem_address 1 8 }  { features_3_1_ce0 mem_ce 1 1 }  { features_3_1_q0 mem_dout 0 16 } } }
	features_4_0 { ap_memory {  { features_4_0_address0 mem_address 1 8 }  { features_4_0_ce0 mem_ce 1 1 }  { features_4_0_q0 mem_dout 0 16 } } }
	features_4_1 { ap_memory {  { features_4_1_address0 mem_address 1 8 }  { features_4_1_ce0 mem_ce 1 1 }  { features_4_1_q0 mem_dout 0 16 } } }
}
