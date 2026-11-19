# This script segment is generated automatically by AutoPilot

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_sparsemux_7_2_15_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {onehotencoding_realdef}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_sparsemux_7_2_15_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {onehotencoding_realdef}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_sparsemux_7_2_15_1_1 BINDTYPE {op} TYPE {sparsemux} IMPL {onehotencoding_realdef}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_mac_muladd_15ns_9s_18s_24_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_mac_muladd_15ns_9s_24s_24_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_mac_muladd_15ns_10s_24s_24_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_mac_muladd_15ns_11s_24s_24_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_weights_DW_B_ROM_AUTObkb BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_0_cud BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_1_dEe BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_2_eOg BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_3_fYi BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_4_g8j BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_5_hbi BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_6_ibs BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_7_jbC BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ds_cnn_depthwise_pointwise_relu_fused_Pipeline_VITIS_LOOP_85_3_p_ZN7weights4DW_WE_8_kbM BINDTYPE {storage} TYPE {rom} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 164 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_0 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_0_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_0_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_0_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 165 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_1 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_1_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_1_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_1_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 166 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_2 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_2_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_2_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_2_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_0_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 167 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_0 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_0_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_0_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_0_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 168 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_1 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_1_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_1_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_1_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 169 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_2 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_2_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_2_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_2_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_1_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 170 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_0 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_0 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_0_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_0_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_0_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_0'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 171 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_1 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_1 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_1_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_1_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_1_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 172 \
    name p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_2 \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_2 \
    op interface \
    ports { p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_2_address0 { O 12 vector } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_2_ce0 { O 1 bit } p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_2_q0 { I 15 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ6ds_cnnPK8ap_fixedILi16ELi8EL9ap_q_mode5EL9ap_o_mode3ELi0EEPiPS2_E5pool1_2_2'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 129 \
    name add_ln94_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_add_ln94_1 \
    op interface \
    ports { add_ln94_1 { I 5 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 130 \
    name add_ln95_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_add_ln95_1 \
    op interface \
    ports { add_ln95_1 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 131 \
    name add_ln95 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_add_ln95 \
    op interface \
    ports { add_ln95 { I 7 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 132 \
    name add_ln94 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_add_ln94 \
    op interface \
    ports { add_ln94 { I 6 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 133 \
    name empty_49 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_49 \
    op interface \
    ports { empty_49 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 134 \
    name empty_50 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_50 \
    op interface \
    ports { empty_50 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 135 \
    name empty_51 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_51 \
    op interface \
    ports { empty_51 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name empty_52 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_52 \
    op interface \
    ports { empty_52 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name empty_53 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_53 \
    op interface \
    ports { empty_53 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name empty_54 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_54 \
    op interface \
    ports { empty_54 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name empty_55 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_55 \
    op interface \
    ports { empty_55 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name empty_56 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_56 \
    op interface \
    ports { empty_56 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name empty_57 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_57 \
    op interface \
    ports { empty_57 { I 12 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name empty_58 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty_58 \
    op interface \
    ports { empty_58 { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 2 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name and_ln99 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln99 \
    op interface \
    ports { and_ln99 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name and_ln99_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln99_1 \
    op interface \
    ports { and_ln99_1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name and_ln99_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln99_2 \
    op interface \
    ports { and_ln99_2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name and_ln99_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_and_ln99_3 \
    op interface \
    ports { and_ln99_3 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name dw_relu_15_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_15_out \
    op interface \
    ports { dw_relu_15_out { O 16 vector } dw_relu_15_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name dw_relu_14_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_14_out \
    op interface \
    ports { dw_relu_14_out { O 16 vector } dw_relu_14_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name dw_relu_13_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_13_out \
    op interface \
    ports { dw_relu_13_out { O 16 vector } dw_relu_13_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name dw_relu_12_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_12_out \
    op interface \
    ports { dw_relu_12_out { O 16 vector } dw_relu_12_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name dw_relu_11_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_11_out \
    op interface \
    ports { dw_relu_11_out { O 16 vector } dw_relu_11_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name dw_relu_10_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_10_out \
    op interface \
    ports { dw_relu_10_out { O 16 vector } dw_relu_10_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name dw_relu_9_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_9_out \
    op interface \
    ports { dw_relu_9_out { O 16 vector } dw_relu_9_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name dw_relu_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_8_out \
    op interface \
    ports { dw_relu_8_out { O 16 vector } dw_relu_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name dw_relu_7_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_7_out \
    op interface \
    ports { dw_relu_7_out { O 16 vector } dw_relu_7_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name dw_relu_6_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_6_out \
    op interface \
    ports { dw_relu_6_out { O 16 vector } dw_relu_6_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name dw_relu_5_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_5_out \
    op interface \
    ports { dw_relu_5_out { O 16 vector } dw_relu_5_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name dw_relu_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_4_out \
    op interface \
    ports { dw_relu_4_out { O 16 vector } dw_relu_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name dw_relu_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_3_out \
    op interface \
    ports { dw_relu_3_out { O 16 vector } dw_relu_3_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 161 \
    name dw_relu_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_2_out \
    op interface \
    ports { dw_relu_2_out { O 16 vector } dw_relu_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name dw_relu_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_1_out \
    op interface \
    ports { dw_relu_1_out { O 16 vector } dw_relu_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name dw_relu_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_dw_relu_out \
    op interface \
    ports { dw_relu_out { O 16 vector } dw_relu_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName ds_cnn_flow_control_loop_pipe_sequential_init_U
set CompName ds_cnn_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix ds_cnn_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


