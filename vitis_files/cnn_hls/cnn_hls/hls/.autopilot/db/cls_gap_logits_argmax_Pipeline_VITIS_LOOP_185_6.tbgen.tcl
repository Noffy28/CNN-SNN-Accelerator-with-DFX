set moduleName cls_gap_logits_argmax_Pipeline_VITIS_LOOP_185_6
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
set cdfgNum 14
set C_modelName {cls_gap_logits_argmax_Pipeline_VITIS_LOOP_185_6}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict logits_out_63 { MEM_WIDTH 16 MEM_SIZE 8 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ logits_out_63 int 16 regular {array 4 { 0 } 1 1 }  }
	{ sext_ln188 int 24 regular  }
	{ sext_ln188_1 int 24 regular  }
	{ sext_ln188_2 int 24 regular  }
	{ sext_ln188_3 int 24 regular  }
	{ sext_ln188_4 int 24 regular  }
	{ sext_ln188_5 int 24 regular  }
	{ sext_ln188_6 int 24 regular  }
	{ sext_ln188_7 int 24 regular  }
	{ logits_2_out int 20 regular {pointer 1}  }
	{ logits_1_out int 20 regular {pointer 1}  }
	{ logits_out int 20 regular {pointer 1}  }
	{ p_out int 20 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "logits_out_63", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sext_ln188", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln188_1", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln188_2", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln188_3", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln188_4", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln188_5", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln188_6", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln188_7", "interface" : "wire", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "logits_2_out", "interface" : "wire", "bitwidth" : 20, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logits_1_out", "interface" : "wire", "bitwidth" : 20, "direction" : "WRITEONLY"} , 
 	{ "Name" : "logits_out", "interface" : "wire", "bitwidth" : 20, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_out", "interface" : "wire", "bitwidth" : 20, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ logits_out_63_address0 sc_out sc_lv 2 signal 0 } 
	{ logits_out_63_ce0 sc_out sc_logic 1 signal 0 } 
	{ logits_out_63_we0 sc_out sc_logic 1 signal 0 } 
	{ logits_out_63_d0 sc_out sc_lv 16 signal 0 } 
	{ sext_ln188 sc_in sc_lv 24 signal 1 } 
	{ sext_ln188_1 sc_in sc_lv 24 signal 2 } 
	{ sext_ln188_2 sc_in sc_lv 24 signal 3 } 
	{ sext_ln188_3 sc_in sc_lv 24 signal 4 } 
	{ sext_ln188_4 sc_in sc_lv 24 signal 5 } 
	{ sext_ln188_5 sc_in sc_lv 24 signal 6 } 
	{ sext_ln188_6 sc_in sc_lv 24 signal 7 } 
	{ sext_ln188_7 sc_in sc_lv 24 signal 8 } 
	{ logits_2_out sc_out sc_lv 20 signal 9 } 
	{ logits_2_out_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ logits_1_out sc_out sc_lv 20 signal 10 } 
	{ logits_1_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ logits_out sc_out sc_lv 20 signal 11 } 
	{ logits_out_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ p_out sc_out sc_lv 20 signal 12 } 
	{ p_out_ap_vld sc_out sc_logic 1 outvld 12 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "logits_out_63_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "logits_out_63", "role": "address0" }} , 
 	{ "name": "logits_out_63_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_out_63", "role": "ce0" }} , 
 	{ "name": "logits_out_63_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "logits_out_63", "role": "we0" }} , 
 	{ "name": "logits_out_63_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "logits_out_63", "role": "d0" }} , 
 	{ "name": "sext_ln188", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188", "role": "default" }} , 
 	{ "name": "sext_ln188_1", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188_1", "role": "default" }} , 
 	{ "name": "sext_ln188_2", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188_2", "role": "default" }} , 
 	{ "name": "sext_ln188_3", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188_3", "role": "default" }} , 
 	{ "name": "sext_ln188_4", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188_4", "role": "default" }} , 
 	{ "name": "sext_ln188_5", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188_5", "role": "default" }} , 
 	{ "name": "sext_ln188_6", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188_6", "role": "default" }} , 
 	{ "name": "sext_ln188_7", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "sext_ln188_7", "role": "default" }} , 
 	{ "name": "logits_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "logits_2_out", "role": "default" }} , 
 	{ "name": "logits_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "logits_2_out", "role": "ap_vld" }} , 
 	{ "name": "logits_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "logits_1_out", "role": "default" }} , 
 	{ "name": "logits_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "logits_1_out", "role": "ap_vld" }} , 
 	{ "name": "logits_out", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "logits_out", "role": "default" }} , 
 	{ "name": "logits_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "logits_out", "role": "ap_vld" }} , 
 	{ "name": "p_out", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "p_out", "role": "default" }} , 
 	{ "name": "p_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	cls_gap_logits_argmax_Pipeline_VITIS_LOOP_185_6 {
		logits_out_63 {Type O LastRead -1 FirstWrite 11}
		sext_ln188 {Type I LastRead 0 FirstWrite -1}
		sext_ln188_1 {Type I LastRead 0 FirstWrite -1}
		sext_ln188_2 {Type I LastRead 0 FirstWrite -1}
		sext_ln188_3 {Type I LastRead 0 FirstWrite -1}
		sext_ln188_4 {Type I LastRead 0 FirstWrite -1}
		sext_ln188_5 {Type I LastRead 0 FirstWrite -1}
		sext_ln188_6 {Type I LastRead 0 FirstWrite -1}
		sext_ln188_7 {Type I LastRead 0 FirstWrite -1}
		logits_2_out {Type O LastRead -1 FirstWrite 11}
		logits_1_out {Type O LastRead -1 FirstWrite 11}
		logits_out {Type O LastRead -1 FirstWrite 11}
		p_out {Type O LastRead -1 FirstWrite 11}
		p_ZN7weights5CLS_WE_0 {Type I LastRead -1 FirstWrite -1}
		p_ZN7weights5CLS_WE_1 {Type I LastRead -1 FirstWrite -1}
		p_ZN7weights5CLS_WE_2 {Type I LastRead -1 FirstWrite -1}
		p_ZN7weights5CLS_WE_3 {Type I LastRead -1 FirstWrite -1}
		p_ZN7weights5CLS_WE_4 {Type I LastRead -1 FirstWrite -1}
		p_ZN7weights5CLS_WE_5 {Type I LastRead -1 FirstWrite -1}
		p_ZN7weights5CLS_WE_6 {Type I LastRead -1 FirstWrite -1}
		p_ZN7weights5CLS_WE_7 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "17", "Max" : "17"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "5"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	logits_out_63 { ap_memory {  { logits_out_63_address0 mem_address 1 2 }  { logits_out_63_ce0 mem_ce 1 1 }  { logits_out_63_we0 mem_we 1 1 }  { logits_out_63_d0 mem_din 1 16 } } }
	sext_ln188 { ap_none {  { sext_ln188 in_data 0 24 } } }
	sext_ln188_1 { ap_none {  { sext_ln188_1 in_data 0 24 } } }
	sext_ln188_2 { ap_none {  { sext_ln188_2 in_data 0 24 } } }
	sext_ln188_3 { ap_none {  { sext_ln188_3 in_data 0 24 } } }
	sext_ln188_4 { ap_none {  { sext_ln188_4 in_data 0 24 } } }
	sext_ln188_5 { ap_none {  { sext_ln188_5 in_data 0 24 } } }
	sext_ln188_6 { ap_none {  { sext_ln188_6 in_data 0 24 } } }
	sext_ln188_7 { ap_none {  { sext_ln188_7 in_data 0 24 } } }
	logits_2_out { ap_vld {  { logits_2_out out_data 1 20 }  { logits_2_out_ap_vld out_vld 1 1 } } }
	logits_1_out { ap_vld {  { logits_1_out out_data 1 20 }  { logits_1_out_ap_vld out_vld 1 1 } } }
	logits_out { ap_vld {  { logits_out out_data 1 20 }  { logits_out_ap_vld out_vld 1 1 } } }
	p_out { ap_vld {  { p_out out_data 1 20 }  { p_out_ap_vld out_vld 1 1 } } }
}
