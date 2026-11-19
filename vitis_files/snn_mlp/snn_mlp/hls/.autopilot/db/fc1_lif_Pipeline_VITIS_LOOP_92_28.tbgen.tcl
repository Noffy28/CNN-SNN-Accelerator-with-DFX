set moduleName fc1_lif_Pipeline_VITIS_LOOP_92_28
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
set C_modelName {fc1_lif_Pipeline_VITIS_LOOP_92_28}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict x_0 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict x_1 { MEM_WIDTH 16 MEM_SIZE 384 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ sext_ln90_2 int 9 regular  }
	{ mul_ln96_4 int 12 regular  }
	{ x_0 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ x_1 int 16 regular {array 192 { 1 3 } 1 1 }  }
	{ acc_32_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "sext_ln90_2", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln96_4", "interface" : "wire", "bitwidth" : 12, "direction" : "READONLY"} , 
 	{ "Name" : "x_0", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "x_1", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "acc_32_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ sext_ln90_2 sc_in sc_lv 9 signal 0 } 
	{ mul_ln96_4 sc_in sc_lv 12 signal 1 } 
	{ x_0_address0 sc_out sc_lv 8 signal 2 } 
	{ x_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ x_0_q0 sc_in sc_lv 16 signal 2 } 
	{ x_1_address0 sc_out sc_lv 8 signal 3 } 
	{ x_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ x_1_q0 sc_in sc_lv 16 signal 3 } 
	{ acc_32_out sc_out sc_lv 32 signal 4 } 
	{ acc_32_out_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "sext_ln90_2", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "sext_ln90_2", "role": "default" }} , 
 	{ "name": "mul_ln96_4", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "mul_ln96_4", "role": "default" }} , 
 	{ "name": "x_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_0", "role": "address0" }} , 
 	{ "name": "x_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_0", "role": "ce0" }} , 
 	{ "name": "x_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_0", "role": "q0" }} , 
 	{ "name": "x_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "x_1", "role": "address0" }} , 
 	{ "name": "x_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x_1", "role": "ce0" }} , 
 	{ "name": "x_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "x_1", "role": "q0" }} , 
 	{ "name": "acc_32_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "acc_32_out", "role": "default" }} , 
 	{ "name": "acc_32_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "acc_32_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	fc1_lif_Pipeline_VITIS_LOOP_92_28 {
		sext_ln90_2 {Type I LastRead 0 FirstWrite -1}
		mul_ln96_4 {Type I LastRead 0 FirstWrite -1}
		x_0 {Type I LastRead 1 FirstWrite -1}
		x_1 {Type I LastRead 1 FirstWrite -1}
		acc_32_out {Type O LastRead -1 FirstWrite 4}
		p_ZL5fc1_w_2_0 {Type I LastRead -1 FirstWrite -1}
		p_ZL5fc1_w_2_1 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "198", "Max" : "198"}
	, {"Name" : "Interval", "Min" : "193", "Max" : "193"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	sext_ln90_2 { ap_none {  { sext_ln90_2 in_data 0 9 } } }
	mul_ln96_4 { ap_none {  { mul_ln96_4 in_data 0 12 } } }
	x_0 { ap_memory {  { x_0_address0 mem_address 1 8 }  { x_0_ce0 mem_ce 1 1 }  { x_0_q0 mem_dout 0 16 } } }
	x_1 { ap_memory {  { x_1_address0 mem_address 1 8 }  { x_1_ce0 mem_ce 1 1 }  { x_1_q0 mem_dout 0 16 } } }
	acc_32_out { ap_vld {  { acc_32_out out_data 1 32 }  { acc_32_out_ap_vld out_vld 1 1 } } }
}
