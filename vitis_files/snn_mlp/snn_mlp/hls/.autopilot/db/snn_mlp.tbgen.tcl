set moduleName snn_mlp
set isTopModule 1
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
set C_modelName {snn_mlp}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict logits_out { MEM_WIDTH 32 MEM_SIZE 16 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ gmem int 16 regular {axi_master 0}  }
	{ feature_mem int 64 regular {axi_slave 0}  }
	{ prediction int 8 regular {axi_slave 1 volatile }  }
	{ logits_out int 32 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 16, "direction" : "READONLY", "id_num" : 1, "bitSlice":[ {"cElement": [{"cName": "feature_mem","offset": { "type": "dynamic","port_name": "feature_mem","bundle": "control"},"direction": "READONLY"}]}]} , 
 	{ "Name" : "feature_mem", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "prediction", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 8, "direction" : "WRITEONLY", "offset" : {"out":28}, "offset_end" : {"out":35}} , 
 	{ "Name" : "logits_out", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":48}, "offset_end" : {"out":63}} ]}
# RTL Port declarations: 
set portNum 65
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 0 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"snn_mlp","role":"start","value":"0","valid_bit":"0"},{"name":"snn_mlp","role":"continue","value":"0","valid_bit":"4"},{"name":"snn_mlp","role":"auto_start","value":"0","valid_bit":"7"},{"name":"feature_mem","role":"data","value":"16"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"snn_mlp","role":"start","value":"0","valid_bit":"0"},{"name":"snn_mlp","role":"done","value":"0","valid_bit":"1"},{"name":"snn_mlp","role":"idle","value":"0","valid_bit":"2"},{"name":"snn_mlp","role":"ready","value":"0","valid_bit":"3"},{"name":"snn_mlp","role":"auto_start","value":"0","valid_bit":"7"},{"name":"prediction","role":"data","value":"28"}, {"name":"prediction","role":"valid","value":"32","valid_bit":"0"},{"name":"logits_out","role":"data","value":"48"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }}  ]}

set ArgLastReadFirstWriteLatency {
	snn_mlp {
		gmem {Type I LastRead 2 FirstWrite -1}
		feature_mem {Type I LastRead 0 FirstWrite -1}
		prediction {Type O LastRead -1 FirstWrite 4}
		logits_out {Type O LastRead -1 FirstWrite 4}
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
	read_features_from_bram {
		gmem {Type I LastRead 2 FirstWrite -1}
		feature_mem {Type I LastRead 0 FirstWrite -1}
		features_0_0 {Type O LastRead -1 FirstWrite 3}
		features_0_1 {Type O LastRead -1 FirstWrite 3}
		features_1_0 {Type O LastRead -1 FirstWrite 3}
		features_1_1 {Type O LastRead -1 FirstWrite 3}
		features_2_0 {Type O LastRead -1 FirstWrite 3}
		features_2_1 {Type O LastRead -1 FirstWrite 3}
		features_3_0 {Type O LastRead -1 FirstWrite 3}
		features_3_1 {Type O LastRead -1 FirstWrite 3}
		features_4_0 {Type O LastRead -1 FirstWrite 3}
		features_4_1 {Type O LastRead -1 FirstWrite 3}}
	read_features_from_bram_Pipeline_VITIS_LOOP_59_1 {
		gmem {Type I LastRead 2 FirstWrite -1}
		sext_ln59 {Type I LastRead 0 FirstWrite -1}
		features_4_1 {Type O LastRead -1 FirstWrite 3}
		features_4_0 {Type O LastRead -1 FirstWrite 3}
		features_3_1 {Type O LastRead -1 FirstWrite 3}
		features_3_0 {Type O LastRead -1 FirstWrite 3}
		features_2_1 {Type O LastRead -1 FirstWrite 3}
		features_2_0 {Type O LastRead -1 FirstWrite 3}
		features_1_1 {Type O LastRead -1 FirstWrite 3}
		features_1_0 {Type O LastRead -1 FirstWrite 3}
		features_0_1 {Type O LastRead -1 FirstWrite 3}
		features_0_0 {Type O LastRead -1 FirstWrite 3}}
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
	{"Name" : "Latency", "Min" : "78355", "Max" : "78355"}
	, {"Name" : "Interval", "Min" : "78356", "Max" : "78356"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	gmem { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN SIZE 1 8 }  { m_axi_gmem_AWSIZE BURST 1 3 }  { m_axi_gmem_AWBURST LOCK 1 2 }  { m_axi_gmem_AWLOCK CACHE 1 2 }  { m_axi_gmem_AWCACHE PROT 1 4 }  { m_axi_gmem_AWPROT QOS 1 3 }  { m_axi_gmem_AWQOS REGION 1 4 }  { m_axi_gmem_AWREGION USER 1 4 }  { m_axi_gmem_AWUSER DATA 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA FIFONUM 1 32 }  { m_axi_gmem_WSTRB STRB 1 4 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER DATA 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN SIZE 1 8 }  { m_axi_gmem_ARSIZE BURST 1 3 }  { m_axi_gmem_ARBURST LOCK 1 2 }  { m_axi_gmem_ARLOCK CACHE 1 2 }  { m_axi_gmem_ARCACHE PROT 1 4 }  { m_axi_gmem_ARPROT QOS 1 3 }  { m_axi_gmem_ARQOS REGION 1 4 }  { m_axi_gmem_ARREGION USER 1 4 }  { m_axi_gmem_ARUSER DATA 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA FIFONUM 0 32 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RUSER DATA 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER DATA 0 1 } } }
}

set maxi_interface_dict [dict create]
dict set maxi_interface_dict gmem { CHANNEL_NUM 0 BUNDLE gmem NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 READ_WRITE_MODE READ_ONLY}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
