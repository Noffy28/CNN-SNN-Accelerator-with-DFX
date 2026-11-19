create_pblock pblock_RM_MODEL_CNN_0
add_cells_to_pblock [get_pblocks pblock_RM_MODEL_CNN_0] [get_cells -quiet [list design_1_i/RM_MODEL_CNN_0]]
resize_pblock [get_pblocks pblock_RM_MODEL_CNN_0] -add {SLICE_X82Y0:SLICE_X109Y149 \
                                                        DSP48_X3Y0:DSP48_X4Y59 \
                                                        RAMB18_X4Y0:RAMB18_X5Y59 \
                                                        RAMB36_X4Y0:RAMB36_X5Y29 \
}
set_property RESET_AFTER_RECONFIG true [get_pblocks pblock_RM_MODEL_CNN_0]
set_property SNAPPING_MODE ON [get_pblocks pblock_RM_MODEL_CNN_0]

