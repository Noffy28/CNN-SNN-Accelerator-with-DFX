set ModuleHierarchy {[{
"Name" : "snn_mlp", "RefName" : "snn_mlp","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_read_features_from_bram_fu_222", "RefName" : "read_features_from_bram","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_read_features_from_bram_Pipeline_VITIS_LOOP_59_1_fu_81", "RefName" : "read_features_from_bram_Pipeline_VITIS_LOOP_59_1","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_59_1","RefName" : "VITIS_LOOP_59_1","ID" : "3","Type" : "pipeline"},]},]},
	{"Name" : "grp_snn_core_fu_239", "RefName" : "snn_core","ID" : "4","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_snn_core_Pipeline_VITIS_LOOP_225_1_fu_234", "RefName" : "snn_core_Pipeline_VITIS_LOOP_225_1","ID" : "5","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_225_1","RefName" : "VITIS_LOOP_225_1","ID" : "6","Type" : "pipeline"},]},
		{"Name" : "grp_snn_core_Pipeline_VITIS_LOOP_231_2_fu_254", "RefName" : "snn_core_Pipeline_VITIS_LOOP_231_2","ID" : "7","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_231_2","RefName" : "VITIS_LOOP_231_2","ID" : "8","Type" : "pipeline"},]},],
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_244_4","RefName" : "VITIS_LOOP_244_4","ID" : "9","Type" : "no",
		"SubInsts" : [
		{"Name" : "grp_fc1_lif_fu_274", "RefName" : "fc1_lif","ID" : "10","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_87_1","RefName" : "VITIS_LOOP_87_1","ID" : "11","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_fc1_lif_Pipeline_VITIS_LOOP_92_2_fu_294", "RefName" : "fc1_lif_Pipeline_VITIS_LOOP_92_2","ID" : "12","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_92_2","RefName" : "VITIS_LOOP_92_2","ID" : "13","Type" : "pipeline"},]},
				{"Name" : "grp_fc1_lif_Pipeline_VITIS_LOOP_92_27_fu_310", "RefName" : "fc1_lif_Pipeline_VITIS_LOOP_92_27","ID" : "14","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_92_2","RefName" : "VITIS_LOOP_92_2","ID" : "15","Type" : "pipeline"},]},
				{"Name" : "grp_fc1_lif_Pipeline_VITIS_LOOP_92_28_fu_326", "RefName" : "fc1_lif_Pipeline_VITIS_LOOP_92_28","ID" : "16","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_92_2","RefName" : "VITIS_LOOP_92_2","ID" : "17","Type" : "pipeline"},]},
				{"Name" : "grp_fc1_lif_Pipeline_VITIS_LOOP_92_29_fu_342", "RefName" : "fc1_lif_Pipeline_VITIS_LOOP_92_29","ID" : "18","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_92_2","RefName" : "VITIS_LOOP_92_2","ID" : "19","Type" : "pipeline"},]},]},]},
		{"Name" : "grp_fc2_lif_fu_322", "RefName" : "fc2_lif","ID" : "20","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_125_1","RefName" : "VITIS_LOOP_125_1","ID" : "21","Type" : "no",
				"SubInsts" : [
				{"Name" : "grp_fc2_lif_Pipeline_VITIS_LOOP_130_2_fu_276", "RefName" : "fc2_lif_Pipeline_VITIS_LOOP_130_2","ID" : "22","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_130_2","RefName" : "VITIS_LOOP_130_2","ID" : "23","Type" : "pipeline"},]},
				{"Name" : "grp_fc2_lif_Pipeline_VITIS_LOOP_130_24_fu_294", "RefName" : "fc2_lif_Pipeline_VITIS_LOOP_130_24","ID" : "24","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_130_2","RefName" : "VITIS_LOOP_130_2","ID" : "25","Type" : "pipeline"},]},
				{"Name" : "grp_fc2_lif_Pipeline_VITIS_LOOP_130_25_fu_312", "RefName" : "fc2_lif_Pipeline_VITIS_LOOP_130_25","ID" : "26","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_130_2","RefName" : "VITIS_LOOP_130_2","ID" : "27","Type" : "pipeline"},]},
				{"Name" : "grp_fc2_lif_Pipeline_VITIS_LOOP_130_26_fu_330", "RefName" : "fc2_lif_Pipeline_VITIS_LOOP_130_26","ID" : "28","Type" : "sequential",
						"SubLoops" : [
						{"Name" : "VITIS_LOOP_130_2","RefName" : "VITIS_LOOP_130_2","ID" : "29","Type" : "pipeline"},]},]},]},
		{"Name" : "grp_fc3_lif_fu_354", "RefName" : "fc3_lif","ID" : "30","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_fc3_lif_Pipeline_VITIS_LOOP_162_2_fu_100", "RefName" : "fc3_lif_Pipeline_VITIS_LOOP_162_2","ID" : "31","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_162_2","RefName" : "VITIS_LOOP_162_2","ID" : "32","Type" : "pipeline"},]},
				{"Name" : "grp_fc3_lif_Pipeline_VITIS_LOOP_162_21_fu_115", "RefName" : "fc3_lif_Pipeline_VITIS_LOOP_162_21","ID" : "33","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_162_2","RefName" : "VITIS_LOOP_162_2","ID" : "34","Type" : "pipeline"},]},
				{"Name" : "grp_fc3_lif_Pipeline_VITIS_LOOP_162_22_fu_130", "RefName" : "fc3_lif_Pipeline_VITIS_LOOP_162_22","ID" : "35","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_162_2","RefName" : "VITIS_LOOP_162_2","ID" : "36","Type" : "pipeline"},]},
				{"Name" : "grp_fc3_lif_Pipeline_VITIS_LOOP_162_23_fu_145", "RefName" : "fc3_lif_Pipeline_VITIS_LOOP_162_23","ID" : "37","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_162_2","RefName" : "VITIS_LOOP_162_2","ID" : "38","Type" : "pipeline"},]},]},]},]},]
}]}