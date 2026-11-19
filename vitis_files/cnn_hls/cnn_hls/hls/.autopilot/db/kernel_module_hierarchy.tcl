set ModuleHierarchy {[{
"Name" : "ds_cnn", "RefName" : "ds_cnn","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_ds_cnn_Pipeline_VITIS_LOOP_231_1_fu_284", "RefName" : "ds_cnn_Pipeline_VITIS_LOOP_231_1","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_231_1","RefName" : "VITIS_LOOP_231_1","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_conv1_relu_maxpool_fu_307", "RefName" : "conv1_relu_maxpool","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_26_1_VITIS_LOOP_27_2_VITIS_LOOP_28_3","RefName" : "VITIS_LOOP_26_1_VITIS_LOOP_27_2_VITIS_LOOP_28_3","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_depthwise_pointwise_relu_fused_fu_365", "RefName" : "depthwise_pointwise_relu_fused","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_78_1","RefName" : "VITIS_LOOP_78_1","ID" : "6","Type" : "no",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_79_2","RefName" : "VITIS_LOOP_79_2","ID" : "7","Type" : "no",
			"SubInsts" : [
			{"Name" : "grp_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_fu_349", "RefName" : "depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3","ID" : "8","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_85_3","RefName" : "VITIS_LOOP_85_3","ID" : "9","Type" : "pipeline"},]},
			{"Name" : "grp_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_111_6_fu_426", "RefName" : "depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_111_6","ID" : "10","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_111_6","RefName" : "VITIS_LOOP_111_6","ID" : "11","Type" : "pipeline"},]},]},]},]},
	{"Name" : "grp_avgpool6x8_fu_489", "RefName" : "avgpool6x8","ID" : "12","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3","RefName" : "VITIS_LOOP_136_1_VITIS_LOOP_137_2_VITIS_LOOP_138_3","ID" : "13","Type" : "pipeline"},]},
	{"Name" : "grp_cls_gap_logits_argmax_fu_543", "RefName" : "cls_gap_logits_argmax","ID" : "14","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_cls_gap_logits_argmax_Pipeline_VITIS_LOOP_168_2_VITIS_LOOP_169_3_VITIS_LOOP_170_s_fu_114", "RefName" : "cls_gap_logits_argmax_Pipeline_VITIS_LOOP_168_2_VITIS_LOOP_169_3_VITIS_LOOP_170_s","ID" : "15","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_168_2_VITIS_LOOP_169_3_VITIS_LOOP_170_4","RefName" : "VITIS_LOOP_168_2_VITIS_LOOP_169_3_VITIS_LOOP_170_4","ID" : "16","Type" : "pipeline"},]},
		{"Name" : "grp_cls_gap_logits_argmax_Pipeline_VITIS_LOOP_178_5_fu_128", "RefName" : "cls_gap_logits_argmax_Pipeline_VITIS_LOOP_178_5","ID" : "17","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_178_5","RefName" : "VITIS_LOOP_178_5","ID" : "18","Type" : "pipeline"},]},
		{"Name" : "grp_cls_gap_logits_argmax_Pipeline_VITIS_LOOP_185_6_fu_140", "RefName" : "cls_gap_logits_argmax_Pipeline_VITIS_LOOP_185_6","ID" : "19","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_185_6","RefName" : "VITIS_LOOP_185_6","ID" : "20","Type" : "pipeline"},]},
		{"Name" : "grp_cls_gap_logits_argmax_Pipeline_VITIS_LOOP_198_8_fu_174", "RefName" : "cls_gap_logits_argmax_Pipeline_VITIS_LOOP_198_8","ID" : "21","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_198_8","RefName" : "VITIS_LOOP_198_8","ID" : "22","Type" : "pipeline"},]},]},]
}]}