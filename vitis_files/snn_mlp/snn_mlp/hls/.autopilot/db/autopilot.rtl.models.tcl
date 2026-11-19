set SynModuleInfo {
  {SRCNAME read_features_from_bram_Pipeline_VITIS_LOOP_59_1 MODELNAME read_features_from_bram_Pipeline_VITIS_LOOP_59_1 RTLNAME snn_mlp_read_features_from_bram_Pipeline_VITIS_LOOP_59_1
    SUBMODULES {
      {MODELNAME snn_mlp_flow_control_loop_pipe_sequential_init RTLNAME snn_mlp_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME snn_mlp_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME read_features_from_bram MODELNAME read_features_from_bram RTLNAME snn_mlp_read_features_from_bram}
  {SRCNAME snn_core_Pipeline_VITIS_LOOP_225_1 MODELNAME snn_core_Pipeline_VITIS_LOOP_225_1 RTLNAME snn_mlp_snn_core_Pipeline_VITIS_LOOP_225_1}
  {SRCNAME snn_core_Pipeline_VITIS_LOOP_231_2 MODELNAME snn_core_Pipeline_VITIS_LOOP_231_2 RTLNAME snn_mlp_snn_core_Pipeline_VITIS_LOOP_231_2}
  {SRCNAME fc1_lif_Pipeline_VITIS_LOOP_92_2 MODELNAME fc1_lif_Pipeline_VITIS_LOOP_92_2 RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_2
    SUBMODULES {
      {MODELNAME snn_mlp_mul_11s_16s_27_1_1 RTLNAME snn_mlp_mul_11s_16s_27_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_mul_10s_16s_26_1_1 RTLNAME snn_mlp_mul_10s_16s_26_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_2_p_ZL5fc1_w_0_0_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_2_p_ZL5fc1_w_0_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_2_p_ZL5fc1_w_0_1_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_2_p_ZL5fc1_w_0_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc1_lif_Pipeline_VITIS_LOOP_92_27 MODELNAME fc1_lif_Pipeline_VITIS_LOOP_92_27 RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_27
    SUBMODULES {
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_27_p_ZL5fc1_w_1_0_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_27_p_ZL5fc1_w_1_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_27_p_ZL5fc1_w_1_1_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_27_p_ZL5fc1_w_1_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc1_lif_Pipeline_VITIS_LOOP_92_28 MODELNAME fc1_lif_Pipeline_VITIS_LOOP_92_28 RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_28
    SUBMODULES {
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_28_p_ZL5fc1_w_2_0_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_28_p_ZL5fc1_w_2_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_28_p_ZL5fc1_w_2_1_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_28_p_ZL5fc1_w_2_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc1_lif_Pipeline_VITIS_LOOP_92_29 MODELNAME fc1_lif_Pipeline_VITIS_LOOP_92_29 RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_29
    SUBMODULES {
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_29_p_ZL5fc1_w_3_0_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_29_p_ZL5fc1_w_3_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_29_p_ZL5fc1_w_3_1_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_Pipeline_VITIS_LOOP_92_29_p_ZL5fc1_w_3_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc1_lif MODELNAME fc1_lif RTLNAME snn_mlp_fc1_lif
    SUBMODULES {
      {MODELNAME snn_mlp_fc1_lif_p_ZL5fc1_b_0_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_p_ZL5fc1_b_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_p_ZL5fc1_b_1_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_p_ZL5fc1_b_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_p_ZL5fc1_b_2_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_p_ZL5fc1_b_2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc1_lif_p_ZL5fc1_b_3_ROM_AUTO_1R RTLNAME snn_mlp_fc1_lif_p_ZL5fc1_b_3_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc2_lif_Pipeline_VITIS_LOOP_130_2 MODELNAME fc2_lif_Pipeline_VITIS_LOOP_130_2 RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_2
    SUBMODULES {
      {MODELNAME snn_mlp_sparsemux_9_2_1_1_1 RTLNAME snn_mlp_sparsemux_9_2_1_1_1 BINDTYPE op TYPE sparsemux IMPL compactencoding_dontcare}
      {MODELNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_2_p_ZL5fc2_w_0_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_2_p_ZL5fc2_w_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc2_lif_Pipeline_VITIS_LOOP_130_24 MODELNAME fc2_lif_Pipeline_VITIS_LOOP_130_24 RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_24
    SUBMODULES {
      {MODELNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_24_p_ZL5fc2_w_1_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_24_p_ZL5fc2_w_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc2_lif_Pipeline_VITIS_LOOP_130_25 MODELNAME fc2_lif_Pipeline_VITIS_LOOP_130_25 RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_25
    SUBMODULES {
      {MODELNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_25_p_ZL5fc2_w_2_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_25_p_ZL5fc2_w_2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc2_lif_Pipeline_VITIS_LOOP_130_26 MODELNAME fc2_lif_Pipeline_VITIS_LOOP_130_26 RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_26
    SUBMODULES {
      {MODELNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_26_p_ZL5fc2_w_3_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_Pipeline_VITIS_LOOP_130_26_p_ZL5fc2_w_3_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc2_lif MODELNAME fc2_lif RTLNAME snn_mlp_fc2_lif
    SUBMODULES {
      {MODELNAME snn_mlp_fc2_lif_p_ZL5fc2_b_0_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_p_ZL5fc2_b_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc2_lif_p_ZL5fc2_b_1_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_p_ZL5fc2_b_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc2_lif_p_ZL5fc2_b_2_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_p_ZL5fc2_b_2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_fc2_lif_p_ZL5fc2_b_3_ROM_AUTO_1R RTLNAME snn_mlp_fc2_lif_p_ZL5fc2_b_3_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc3_lif_Pipeline_VITIS_LOOP_162_2 MODELNAME fc3_lif_Pipeline_VITIS_LOOP_162_2 RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_2
    SUBMODULES {
      {MODELNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_2_p_ZL5fc3_w_0_ROM_AUTO_1R RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_2_p_ZL5fc3_w_0_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc3_lif_Pipeline_VITIS_LOOP_162_21 MODELNAME fc3_lif_Pipeline_VITIS_LOOP_162_21 RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_21
    SUBMODULES {
      {MODELNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_21_p_ZL5fc3_w_1_ROM_AUTO_1R RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_21_p_ZL5fc3_w_1_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc3_lif_Pipeline_VITIS_LOOP_162_22 MODELNAME fc3_lif_Pipeline_VITIS_LOOP_162_22 RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_22
    SUBMODULES {
      {MODELNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_22_p_ZL5fc3_w_2_ROM_AUTO_1R RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_22_p_ZL5fc3_w_2_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc3_lif_Pipeline_VITIS_LOOP_162_23 MODELNAME fc3_lif_Pipeline_VITIS_LOOP_162_23 RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_23
    SUBMODULES {
      {MODELNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_23_p_ZL5fc3_w_3_ROM_AUTO_1R RTLNAME snn_mlp_fc3_lif_Pipeline_VITIS_LOOP_162_23_p_ZL5fc3_w_3_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME fc3_lif MODELNAME fc3_lif RTLNAME snn_mlp_fc3_lif}
  {SRCNAME snn_core MODELNAME snn_core RTLNAME snn_mlp_snn_core
    SUBMODULES {
      {MODELNAME snn_mlp_snn_core_mem1_RAM_AUTO_1R1W RTLNAME snn_mlp_snn_core_mem1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_snn_core_mem2_RAM_AUTO_1R1W RTLNAME snn_mlp_snn_core_mem2_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_snn_core_spk1_RAM_AUTO_1R1W RTLNAME snn_mlp_snn_core_spk1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_snn_core_spk2_RAM_AUTO_1R1W RTLNAME snn_mlp_snn_core_spk2_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME snn_mlp MODELNAME snn_mlp RTLNAME snn_mlp IS_TOP 1
    SUBMODULES {
      {MODELNAME snn_mlp_features_RAM_2P_BRAM_1R1W RTLNAME snn_mlp_features_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME snn_mlp_gmem_m_axi RTLNAME snn_mlp_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME snn_mlp_control_s_axi RTLNAME snn_mlp_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
