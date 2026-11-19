set moduleName fc2_lif_Pipeline_VITIS_LOOP_130_24
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
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
set C_modelName {fc2_lif_Pipeline_VITIS_LOOP_130_24}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict spk1_0 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict spk1_1 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict spk1_2 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict spk1_3 { MEM_WIDTH 1 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ sext_ln128_1 int 8 regular  }
	{ zext_ln134 int 9 regular  }
	{ spk1_0 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ spk1_1 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ spk1_2 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ spk1_3 int 1 regular {array 16 { 1 3 } 1 1 }  }
	{ acc_15_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln128_1", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln134", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "spk1_0", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "spk1_1", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "spk1_2", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "spk1_3", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "acc_15_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln128_1 sc_in sc_lv 8 signal 0 } 
	{ zext_ln134 sc_in sc_lv 9 signal 1 } 
	{ spk1_0_address0 sc_out sc_lv 4 signal 2 } 
	{ spk1_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ spk1_0_q0 sc_in sc_lv 1 signal 2 } 
	{ spk1_1_address0 sc_out sc_lv 4 signal 3 } 
	{ spk1_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ spk1_1_q0 sc_in sc_lv 1 signal 3 } 
	{ spk1_2_address0 sc_out sc_lv 4 signal 4 } 
	{ spk1_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ spk1_2_q0 sc_in sc_lv 1 signal 4 } 
	{ spk1_3_address0 sc_out sc_lv 4 signal 5 } 
	{ spk1_3_ce0 sc_out sc_logic 1 signal 5 } 
	{ spk1_3_q0 sc_in sc_lv 1 signal 5 } 
	{ acc_15_out sc_out sc_lv 32 signal 6 } 
	{ acc_15_out_ap_vld sc_out sc_logic 1 outvld 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln128_1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "sext_ln128_1", "role": "default" }} , 
 	{ "name": "zext_ln134", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln134", "role": "default" }} , 
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
 	{ "name": "acc_15_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_15_out", "role": "default" }} , 
 	{ "name": "acc_15_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_15_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	fc2_lif_Pipeline_VITIS_LOOP_130_24 {
		sext_ln128_1 {Type I LastRead 0 FirstWrite -1}
		zext_ln134 {Type I LastRead 0 FirstWrite -1}
		spk1_0 {Type I LastRead 1 FirstWrite -1}
		spk1_1 {Type I LastRead 1 FirstWrite -1}
		spk1_2 {Type I LastRead 1 FirstWrite -1}
		spk1_3 {Type I LastRead 1 FirstWrite -1}
		acc_15_out {Type O LastRead -1 FirstWrite 2}
		p_ZL5fc2_w_1 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "68", "Max" : "68"}
	, {"Name" : "Interval", "Min" : "65", "Max" : "65"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln128_1 { ap_none {  { sext_ln128_1 in_data 0 8 } } }
	zext_ln134 { ap_none {  { zext_ln134 in_data 0 9 } } }
	spk1_0 { ap_memory {  { spk1_0_address0 mem_address 1 4 }  { spk1_0_ce0 mem_ce 1 1 }  { spk1_0_q0 mem_dout 0 1 } } }
	spk1_1 { ap_memory {  { spk1_1_address0 mem_address 1 4 }  { spk1_1_ce0 mem_ce 1 1 }  { spk1_1_q0 mem_dout 0 1 } } }
	spk1_2 { ap_memory {  { spk1_2_address0 mem_address 1 4 }  { spk1_2_ce0 mem_ce 1 1 }  { spk1_2_q0 mem_dout 0 1 } } }
	spk1_3 { ap_memory {  { spk1_3_address0 mem_address 1 4 }  { spk1_3_ce0 mem_ce 1 1 }  { spk1_3_q0 mem_dout 0 1 } } }
	acc_15_out { ap_vld {  { acc_15_out out_data 1 32 }  { acc_15_out_ap_vld out_vld 1 1 } } }
}
