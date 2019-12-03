############ TCL FILE ######################################
# USER AND DATE STAMP
############################################################

  set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]


  if { ![info exists mom_sys_post_initialized] } {

     source ${cam_post_dir}ugpost_base.tcl

     proc MOM_before_each_add_var {} {}
     proc MOM_before_each_event {} {}

     set cam_debug_dir [MOM_ask_env_var UGII_CAM_DEBUG_DIR]
     source ${cam_debug_dir}mom_review.tcl

     MOM_set_debug_mode OFF


   ####  Listing File variables
     set mom_sys_list_output                       "OFF"
     set mom_sys_header_output                     "OFF"
     set mom_sys_list_file_rows                    "40"
     set mom_sys_list_file_columns                 "30"
     set mom_sys_warning_output                    "OFF"
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "min"
     set mom_sys_commentary_output                 "ON"
     set mom_sys_commentary_list                   "x y z 4axis 5axis feed speed"

     set mom_sys_post_initialized 1
  }


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "0"
  set mom_sys_linear_code                       "1"
  set mom_sys_circle_code(CLW)                  "2"
  set mom_sys_circle_code(CCLW)                 "3"
  set mom_sys_delay_code(SECONDS)               "4"
  set mom_sys_delay_code(REVOLUTIONS)           "4"

  set mom_sys_cutcom_code(OFF)                  "40"
  set mom_sys_cutcom_code(LEFT)                 "41"
  set mom_sys_cutcom_code(RIGHT)                "42"
  set mom_sys_adjust_code                       "43"
  set mom_sys_adjust_code_minus                 "44"
  set mom_sys_adjust_cancel_code                "49"
  set mom_sys_unit_code(IN)                     "70"
  set mom_sys_unit_code(MM)                     "71"
  set mom_sys_cycle_start_code                  "97"
  set mom_sys_cycle_off                         "180"
  set mom_sys_cycle_drill_code                  "181"
  set mom_sys_cycle_drill_dwell_code            "181"
  set mom_sys_cycle_drill_deep_code             "183"
  set mom_sys_cycle_drill_break_chip_code       "183"
  set mom_sys_cycle_tap_code                    "184"
  set mom_sys_cycle_bore_code                   "189"
  set mom_sys_cycle_bore_drag_code              "189"
  set mom_sys_cycle_bore_no_drag_code           "182" ; # ????
  set mom_sys_cycle_bore_dwell_code             "189"
  set mom_sys_cycle_bore_manual_code            "189"
  set mom_sys_cycle_bore_back_code              "189"
  set mom_sys_cycle_bore_manual_dwell_code      "189"
  set mom_sys_output_code(ABSOLUTE)             "90"
  set mom_sys_output_code(INCREMENTAL)          "91"
  set mom_sys_cycle_ret_code(AUTO)              "98"
  set mom_sys_cycle_ret_code(MANUAL)            "99"
  #set mom_sys_reset_code                        "92"
  set mom_sys_feed_rate_mode_code(IPM)          "94"
  set mom_sys_feed_rate_mode_code(IPR)          "95"
  set mom_sys_feed_rate_mode_code(FRN)          "93"
  set mom_sys_spindle_mode_code(SFM)            "111"
    set mom_sys_spindle_mode_code(SFM)            "96"
  set mom_sys_spindle_mode_code(RPM)            "97"
  set mom_sys_return_code                       "28"
  set mom_sys_feed_rate_mode_code(MMPM)         "94"
  set mom_sys_feed_rate_mode_code(MMPR)         "95"
  set mom_sys_program_stop_code                 "0"
  set mom_sys_optional_stop_code                "1"
  set mom_sys_end_of_program_code               "2"
  set mom_sys_spindle_direction_code(CLW)       "13"
  set mom_sys_spindle_direction_code(CCLW)      "14"
  set mom_sys_spindle_direction_code(OFF)       "12"
  set mom_sys_tool_change_code                  "321"
  set mom_sys_coolant_code(MIST)                "155"
  set mom_sys_coolant_code(ON)                  "8"
  set mom_sys_coolant_code(FLOOD)               "8"
  set mom_sys_coolant_code(TAP)                 "175"
  set mom_sys_coolant_code(OFF)                 "9"
  set mom_sys_rewind_code                       "30"
  set mom_sys_sim_cycle_drill                   "0"
  set mom_sys_sim_cycle_drill_dwell             "0"
  set mom_sys_sim_cycle_drill_deep              "0"
  set mom_sys_sim_cycle_drill_break_chip        "0"
  set mom_sys_sim_cycle_tap                     "0"
  set mom_sys_sim_cycle_bore                    "0"
  set mom_sys_sim_cycle_bore_drag               "0"
  set mom_sys_sim_cycle_bore_nodrag             "0"
  set mom_sys_sim_cycle_bore_manual             "0"
  set mom_sys_sim_cycle_bore_dwell              "0"
  set mom_sys_sim_cycle_bore_manual_dwell       "0"
  set mom_sys_sim_cycle_bore_back               "0"
  set mom_sys_cir_vector                        "Vector - Arc Start to Center"
  set mom_sys_spindle_ranges                    "0"
  set mom_sys_rewind_stop_code                  "#"
  set mom_sys_home_pos(0)                       "999"
  set mom_sys_home_pos(1)                       "0"
  set mom_sys_home_pos(2)                       "999"
  set mom_sys_zero                              "0"
  set mom_sys_opskip_block_leader               "/"
  set mom_sys_seqnum_start                      "1"
  set mom_sys_seqnum_incr                       "1"
  set mom_sys_seqnum_freq                       "1"
  set mom_sys_seqnum_max                        "9999"
  set mom_sys_leader(N)                         "N"
  set mom_sys_leader(X)                         "X"
  set mom_sys_leader(Y)                         "Y"
  set mom_sys_leader(Z)                         "Z"
  set mom_sys_leader(fourth_axis)               "BA="
  set mom_sys_leader(fifth_axis)                "C"
  set mom_sys_contour_feed_mode(LINEAR)         "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "MMPM"
  set mom_sys_cycle_feed_mode                   "Auto"
  #set mom_sys_cycle_feed_rate_mode              "MMPM"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"

  set mom_sys_output_mode 		"POLAR"
  set mom_coordinate_output_mode 	"OFF"
#  set mom_sys_mill_turn_type                    "XZC_MILL"
  set mom_sys_radius_output_mode                "ALWAYS_POSITIVE"
   
#  #set mom_sys_radius_output_mode                "SHORTEST_DISTANCE"
  set mom_sys_millturn_yaxis                    "TRUE"
  #set mom_sys_coordinate_output_mode            "POLAR"
  set mom_sys_coordinate_output_mode 		"CARTESIAN"
#    set mom_sys_spindle_axis(0)                   "0.0"
#  set mom_sys_spindle_axis(1)                   "0.0"
#  set mom_sys_spindle_axis(2)                   "1.0"

  set mom_sys_contour_feed_mode(ROTARY)         "MMPM"
  set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "MMPM"
  set mom_sys_rapid_feed_mode(ROTARY)           "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "MMPM"
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
  set mom_sys_control_out                       "("
  set mom_sys_control_in                        ")"



####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "OFF"
  set mom_kin_4th_axis_leader                   "BA="
  set mom_kin_4th_axis_limit_action             "Warning"
  set mom_kin_4th_axis_max_limit                "180"
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "0"
  set mom_kin_4th_axis_plane                    "ZX"
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Head"
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_ang_offset               "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0.0"
  set mom_kin_5th_axis_direction                "SIGN_DETERMINES_DIRECTION"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_5th_axis_leader                   "C"
  set mom_kin_5th_axis_limit_action             "Warning"
  set mom_kin_5th_axis_max_limit                "359.999"
  set mom_kin_5th_axis_min_incr                 "0.001"
  set mom_kin_5th_axis_min_limit                "0"
  set mom_kin_5th_axis_plane                    "XY"
  set mom_kin_5th_axis_rotation                 "standard"
  set mom_kin_5th_axis_type                     "Table"
  set mom_kin_5th_axis_zero                     "0.0"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  #set mom_kin_arc_output_mode                   "QUADRANT"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"
  set mom_kin_linearization_tol                 "0.001"
  set mom_kin_machine_resolution                ".001"
  set mom_kin_machine_type                      "5_axis_head_table"
  #set mom_kin_machine_type                      "mill_turn"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "10"
  set mom_kin_max_fpm                           "15000"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "1000"
  set mom_kin_min_arc_length                    "0.001"
  set mom_kin_min_arc_radius                    "0.001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.1"
  set mom_kin_min_frn                           "0.01"
  set mom_kin_output_unit                       "MM"
  set mom_kin_pivot_gauge_offset                "0.0"
  #set mom_kin_pivot_guage_offset                ""
  set mom_kin_post_data_unit                    "MM"
  set mom_kin_rapid_feed_rate                   "10000"
  set mom_kin_tool_change_time                  "12.0"
  set mom_kin_x_axis_limit                      "1000";#"430"
  set mom_kin_y_axis_limit                      "1000"
  set mom_kin_z_axis_limit                      "1900"




#=============================================================
proc MOM_start_of_program { } {
#=============================================================
  global mom_logname mom_date is_from
  global mom_coolant_status mom_cutcom_status
  global mom_clamp_status mom_cycle_status
  global mom_spindle_status mom_cutcom_plane pb_start_of_program_flag
  global mom_cutcom_adjust_register mom_tool_adjust_register
  global mom_tool_length_adjust_register mom_length_comp_register
  global mom_flush_register mom_wire_cutcom_adjust_register
  global mom_wire_cutcom_status

    set pb_start_of_program_flag 0
    set mom_coolant_status UNDEFINED
    set mom_cutcom_status  UNDEFINED
    set mom_clamp_status   UNDEFINED
    set mom_cycle_status   UNDEFINED
    set mom_spindle_status UNDEFINED
    set mom_cutcom_plane   UNDEFINED
    set mom_wire_cutcom_status  UNDEFINED

    catch {unset mom_cutcom_adjust_register}
    catch {unset mom_tool_adjust_register}
    catch {unset mom_tool_length_adjust_register}
    catch {unset mom_length_comp_register}
    catch {unset mom_flush_register}
    catch {unset mom_wire_cutcom_adjust_register}

    set is_from ""

    OPEN_files ; #open warning and listing files
    LIST_FILE_HEADER ; #list header in commentary listing
}


#=============================================================
proc PB_DELAY_TIME_SET { } {
#=============================================================
  global mom_sys_delay_param mom_delay_value
  global mom_delay_revs mom_delay_mode delay_time mom_spindle_speed

#   # post builder provided format for the current mode:
#    if {[info exists mom_sys_delay_param(${mom_delay_mode},format)] != 0} {
#      MOM_set_address_format dwell $mom_sys_delay_param(${mom_delay_mode},format)
#    }
    if {[EQ_is_zero $mom_spindle_speed]} {set mom_spindle_speed 1}
    switch $mom_delay_mode {
      SECONDS {set delay_time $mom_delay_value}
      default {set delay_time [expr $mom_delay_revs / $mom_spindle_speed]}
    }
}


#=============================================================
proc MOM_start_of_group {} {
#=============================================================
  global mom_sys_group_output mom_group_name group_level ptp_file_name
  global mom_sequence_number mom_sequence_increment mom_sequence_frequency
  global mom_sys_ptp_output pb_start_of_program_flag

    if {[regexp NC_PROGRAM $mom_group_name] == 1} {set group_level 0 ; return}

    if {[hiset mom_sys_group_output]} { if {$mom_sys_group_output == "OFF"} {set group_level 0 ; return}}
    if {[hiset group_level]} {incr group_level} else {set group_level 1}
    if {$group_level > 1} {return}

    SEQNO_RESET ; #<4133654>
    MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency

    if {[info exists ptp_file_name]} {
      MOM_close_output_file $ptp_file_name ; MOM_start_of_program
      if {$mom_sys_ptp_output == "ON"} {MOM_open_output_file $ptp_file_name }
    } else {
      MOM_start_of_program
    }

    PB_start_of_program ; set pb_start_of_program_flag 1
}


#=============================================================
proc MOM_machine_mode {} {
#=============================================================
  global pb_start_of_program_flag
  global mom_operation_name mom_sys_change_mach_operation_name

   set mom_sys_change_mach_operation_name $mom_operation_name

    if {$pb_start_of_program_flag == 0} {PB_start_of_program ; set pb_start_of_program_flag 1}
    catch {PB_CMD_machine_mode}
}


#=============================================================
proc PB_FORCE { option args } {
#=============================================================
   if { [info exists option] && [llength $args] } {
      lappend cmd MOM_force
      lappend cmd $option
      lappend cmd [join $args]
      eval { join $cmd }
   }
}


#=============================================================
proc PB_SET_RAPID_MOD { mod_list blk_list ADDR NEW_MOD_LIST } {
#=============================================================
  upvar $ADDR addr
  upvar $NEW_MOD_LIST new_mod_list
  global mom_cycle_spindle_axis traverse_axis1 traverse_axis2


   set new_mod_list [list]

   foreach mod $mod_list {
      switch $mod {
         "rapid1" {
            set elem $addr($traverse_axis1)
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
         "rapid2" {
            set elem $addr($traverse_axis2)
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
         "rapid3" {
            set elem $addr($mom_cycle_spindle_axis)
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
         default {
            set elem $mod
            if { [lsearch $blk_list $elem] >= 0 } {
               lappend new_mod_list $elem
            }
         }
      }
   }
}


########################
# Redefine FEEDRATE_SET
########################
if [llength [info commands ugpost_FEEDRATE_SET] ] {
   rename ugpost_FEEDRATE_SET ""
}

if [llength [info commands FEEDRATE_SET] ] {
   rename FEEDRATE_SET ugpost_FEEDRATE_SET
} else {
   proc ugpost_FEEDRATE_SET {} {}
}


#=============================================================
proc FEEDRATE_SET {} {
#=============================================================
   if [llength [info commands PB_CMD_kin_feedrate_set] ] {
      PB_CMD_kin_feedrate_set
   } else {
      ugpost_FEEDRATE_SET
   }
}


############## EVENT HANDLING SECTION ################


#=============================================================
proc PB_start_of_program { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }

   MOM_set_seq_off
   #MOM_do_template rewind_stop_code
   MOM_set_seq_on
   MOM_force Once G_cutcom G_plane G_feed G_mode
  # MOM_do_template absolute_mode
}


#=============================================================
proc MOM_start_of_path { } {
#=============================================================
  global first_linear_move ;
  global mom_operation_name
  set first_linear_move 0
  TOOL_SET MOM_start_of_path
   MOM_output_literal "(Operation: $mom_operation_name)"
   if [llength [info commands PB_CMD_kin_start_of_path] ] {
      PB_CMD_kin_start_of_path
   }

   PB_CMD_start_of_operation_force_addresses
}


#=============================================================
proc MOM_from_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_ROTARY_SIGN_SET
}


#=============================================================
proc MOM_first_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   if {[info exists mom_tool_change_type]} {
      switch $mom_tool_change_type {
         MANUAL { PB_manual_tool_change }
         AUTO   { PB_auto_tool_change }
      }
   } elseif {[info exists mom_manual_tool_change]} {
      if {$mom_manual_tool_change == "TRUE"} {
         PB_manual_tool_change
      }
   }
}


#=============================================================
proc PB_auto_tool_change { } {
#=============================================================
 global mom_tool_name mom_pot_preselect_number
   PB_CMD_tool_change_force_addresses
   #PB_CMD_start_of_alignment_character
   #MOM_do_template axis_disconnecting_y
   MOM_do_template return_home
   PB_CMD_tool_code
   #MOM_force Once MT
   MOM_output_literal "(Auto Tool Change: $mom_tool_name)"
   MOM_do_template tool_select
   MOM_force Once M
   MOM_do_template load_tool;
      if {[info exists mom_pot_preselect_number]} {
   	PB_CMD_tool_code_next
   	MOM_do_template tool_preselect}
   #PB_CMD_end_of_alignment_character
}


#=============================================================
proc PB_manual_tool_change { } {
#=============================================================
   MOM_output_literal "(Manually Tool Change: $mom_tool_name)"
   MOM_do_template axis_disconnecting_y
   MOM_suppress once Y
   MOM_do_template return_home
   PB_CMD_tool_change_force_addresses
   MOM_do_template stop
}

#=============================================================
proc PB_ROTARY_SIGN_SET { } {
#=============================================================
  global mom_sys_leader
  global mom_out_angle_pos
  global mom_rotary_direction_5th
  global mom_kin_C_axis_direction
    
    set mom_out_angle_pos(1) [expr abs($mom_out_angle_pos(1))]
  #if {![EQ_is_zero $mom_out_angle_pos(1)]} {     
    if {$mom_rotary_direction_5th < 0} {
      set mom_kin_C_axis_direction "CCLW"
    } elseif {$mom_rotary_direction_5th > 0} {set mom_kin_C_axis_direction "CLW"}
  #} 
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_ROTARY_SIGN_SET

  PB_1_move

#global clamp_rotary_fifth_status
#if {[info exists clamp_rotary_fifth_status] && $clamp_rotary_fifth_status == "CLAMPED"} {MOM_suppress once fifth_axis M}

  global mom_programmed_feed_rate
   if { [EQ_is_equal $mom_programmed_feed_rate 0] } {
   	
   	
   	
      MOM_rapid_move
   } else {
      MOM_linear_move
   }

}


#=============================================================
proc MOM_first_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_ROTARY_SIGN_SET

   PB_1_move

   catch {MOM_$mom_motion_event}
}


#=============================================================
proc PB_1_move { } {
#=============================================================
   global  mom_pos_arc_plane mom_slant_angle
   global  mom_y2c_transformation  mom_sys_work_plane_change
   global  mom_sys_auto_clamp clamp_rotary_fifth_status

    set mom_sys_work_plane_change 0; # Исходное быстрое перемещение по прямой
   
   MOM_do_template axis_connecting_c

   if {$mom_y2c_transformation} {
   	MOM_do_template absolute_mode
   	MOM_do_template y2c_transformation
   	set mom_pos_arc_plane "XY"
   	MOM_do_template circle_plane
   	} else {
   	MOM_do_template axis_connecting_y }

   if {[info exists mom_slant_angle]} {
   	if {[info exists mom_sys_auto_clamp] && $mom_sys_auto_clamp == "ON"} {
   	   PB_CMD_clamp_fifth_axis
        } else {
        	MOM_do_template unclamp_C_axis
  	        set clamp_rotary_fifth_status "UNCLAMPED"
  	}
      MOM_force once X Z
      MOM_do_template return_home
      MOM_do_template slant_turret
      MOM_do_template slant_mode_point_MCS
      MOM_do_template slant_mode_angle_MCS
   } elseif {$mom_y2c_transformation} {  } else {

  	if {[info exists mom_sys_auto_clamp] && $mom_sys_auto_clamp == "ON"} {
           PB_CMD_clamp_fifth_axis
        } else {
        	MOM_do_template unclamp_C_axis
  	        set clamp_rotary_fifth_status "UNCLAMPED"
  	}
      MOM_force once X Z
      MOM_do_template return_home
      MOM_do_template index_turret
     }
}

#=============================================================
proc PB_approach_move { } {
#=============================================================
   PB_ROTARY_SIGN_SET
}


#=============================================================
proc PB_engage_move { } {
#=============================================================
   PB_ROTARY_SIGN_SET
}


#=============================================================
proc PB_first_cut { } {
#=============================================================
}


#=============================================================
proc PB_first_linear_move { } {
#=============================================================
   PB_ROTARY_SIGN_SET
}


#=============================================================
proc PB_return_move { } {
#=============================================================
   PB_ROTARY_SIGN_SET
}


#=============================================================
proc MOM_gohome_move { } {
#=============================================================
   PB_ROTARY_SIGN_SET
   MOM_rapid_move
}


#=============================================================
proc MOM_end_of_path { } {
#=============================================================
   global mom_slant_angle

   if {[info exists mom_slant_angle]} {
      MOM_do_template slant_mode_point_off
      MOM_do_template slant_mode_angle_off
      #set mom_slant_angle 0
      unset mom_slant_angle
   }
   if [llength [info commands PB_CMD_kin_end_of_path] ] {
      PB_CMD_kin_end_of_path
   }

   global mom_y2c_transformation 	mom_sys_work_plane_change 	mom_prev_pos
   global mom_coordinate_output_mode	mom_sys_auto_clamp
   set mom_coordinate_output_mode 	"OFF"
   set mom_y2c_transformation 		"FALSE"
   set mom_sys_work_plane_change 1
   
   set mom_sys_auto_clamp 		"OFF"
   PB_CMD_unclamp_fifth_axis
#   set mom_prev_pos(4) [expr $mom_prev_pos(4)+0.001]
#   AUTO_CLAMP
   MOM_do_template axis_disconnecting_y
   MOM_do_template axis_disconnecting_c

}


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   #MOM_do_template return_home
   MOM_do_template end_of_program
   MOM_set_seq_off
   #MOM_do_template rewind_stop_code

#**** The following procedure lists the tool list with time in commentary data
   LIST_FILE_TRAILER

#**** The following procedure closes the warning and listing files
   CLOSE_files
}


#=============================================================
proc MOM_tool_change { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   if {[info exists mom_tool_change_type]} {
      switch $mom_tool_change_type {
         MANUAL { PB_manual_tool_change }
         AUTO   { PB_auto_tool_change }
      }
   } elseif {[info exists mom_manual_tool_change]} {
      if {$mom_manual_tool_change == "TRUE"} {
         PB_manual_tool_change
      }
   }
}


#=============================================================
proc MOM_length_compensation { } {
#=============================================================
  #global mom_length_comp_register
  TOOL_SET MOM_length_compensation
  #set mom_tool_adjust_register $mom_length_comp_register
  # MOM_do_template tool_length_adjust
}


#=============================================================
proc MOM_set_modes { } {
#=============================================================
   MODES_SET
}


#=============================================================
proc MOM_spindle_rpm { } {
#=============================================================
   SPINDLE_SET
   MOM_force Once SB M_spindle
   MOM_do_template spindle_rpm
}


#=============================================================
proc MOM_spindle_off { } {
#=============================================================
   MOM_do_template spindle_off
}


#=============================================================
proc MOM_coolant_on { } {
#=============================================================
   COOLANT_SET
   #MOM_do_template coolant_on
}


##=============================================================
#proc MOM_coolant_off { } {
##=============================================================
#   COOLANT_SET
#   MOM_do_template coolant_off
#   MOM_do_template coolant_tap_off
#   MOM_do_template coolant_mist_off
#}


#=============================================================
proc PB_feedrates { } {
#=============================================================
}


#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
   CUTCOM_SET
}


#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
   CUTCOM_SET
   #MOM_do_template cutcom_off
}


#=============================================================
proc MOM_delay { } {
#=============================================================
   PB_DELAY_TIME_SET
   MOM_do_template delay
}


#=============================================================
proc MOM_opstop { } {
#=============================================================
   MOM_do_template opstop
}


#=============================================================
proc MOM_auxfun { } {
#=============================================================
   MOM_do_template auxfun
}


#=============================================================
proc MOM_prefun { } {
#=============================================================
   MOM_do_template prefun
}


#=============================================================
proc MOM_load_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   MOM_force Once M
   MOM_do_template load_tool
}


#=============================================================
proc MOM_stop { } {
#=============================================================
   MOM_do_template stop
}


#=============================================================
proc MOM_tool_preselect { } {
#=============================================================
  global mom_tool_preselect_number mom_tool_number mom_next_tool_number
   if {[info exists mom_tool_preselect_number]} {
      set mom_next_tool_number $mom_tool_preselect_number
   }
   MOM_force Once MT
   MOM_do_template tool_preselect
}


#=============================================================
proc MOM_linear_move { } {
#=============================================================
  global feed_mode mom_feed_rate mom_kin_rapid_feed_rate

   if { $feed_mode == "IPM" || $feed_mode == "MMPM" } {
      if { [EQ_is_ge $mom_feed_rate $mom_kin_rapid_feed_rate] } {
         MOM_rapid_move
         return
      }
   }

  global first_linear_move

   if { !$first_linear_move } {
      PB_first_linear_move
      incr first_linear_move
   }

   PB_ROTARY_SIGN_SET
   global mom_y2c_transformation
   if {$mom_y2c_transformation} { MOM_suppress once fifth_axis }
   MOM_do_template linear_move
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   PB_ROTARY_SIGN_SET
   CIRCLE_SET
   #global mom_helix_pitch
   #if {[EQ_is_zero $mom_helix_pitch]} {
     MOM_do_template circle_plane
     MOM_circular_template
   #}  
}

#=============================================================
proc MOM_rapid_move { } {
#=============================================================
  global rapid_spindle_inhibit rapid_traverse_inhibit
  global spindle_first is_from
  global mom_cycle_spindle_axis traverse_axis1 traverse_axis2
  global mom_motion_event

   set aa(0) X ; set aa(1) Y ; set aa(2) Z
   RAPID_SET
   PB_ROTARY_SIGN_SET
   set rapid_spindle_blk {G_motion G_mode X Y Z}
   set rapid_spindle_x_blk {G_motion G_mode X}
   set rapid_spindle_y_blk {G_motion G_mode Y}
   set rapid_spindle_z_blk {G_motion G_mode Z}
   set rapid_traverse_blk {G_motion G_feed G_mode X Y Z fourth_axis fifth_axis SB TL M M_spindle}
   set rapid_traverse_xy_blk {G_motion G_feed G_mode X Y fourth_axis fifth_axis SB TL M M_spindle}
   set rapid_traverse_yz_blk {G_motion G_feed G_mode Y Z fourth_axis fifth_axis SB TL M M_spindle}
   set rapid_traverse_xz_blk {G_motion G_feed G_mode X Z fourth_axis fifth_axis SB TL M M_spindle}
   set rapid_traverse_mod {}
   set rapid_spindle_mod {}

   global mom_sys_control_out mom_sys_control_in
   set co "$mom_sys_control_out"
   set ci "$mom_sys_control_in"

   switch $mom_cycle_spindle_axis {
      0 {
         if [llength $rapid_spindle_x_blk] {
            set spindle_block  rapid_spindle_x
            PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_x_blk aa mod_spindle
         } else {
            set spindle_block  ""
         }
         if [llength $rapid_traverse_yz_blk] {
            set traverse_block rapid_traverse_yz
            PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_yz_blk aa mod_traverse
         } else {
            set traverse_block  ""
         }
      }

      1 {
         if [llength $rapid_spindle_y_blk] {
            set spindle_block  rapid_spindle_y
            PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_y_blk aa mod_spindle
         } else {
            set spindle_block  ""
         }
         if [llength $rapid_traverse_xz_blk] {
            set traverse_block rapid_traverse_xz
            PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_xz_blk aa mod_traverse
         } else {
            set traverse_block  ""
         }
      }

      2 {
         if [llength $rapid_spindle_z_blk] {
            set spindle_block  rapid_spindle_z
            PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_z_blk aa mod_spindle
         } else {
            set spindle_block  ""
         }
         if [llength $rapid_traverse_xy_blk] {
            set traverse_block rapid_traverse_xy
            PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_xy_blk aa mod_traverse
         } else {
            set traverse_block  ""
         }
      }

      default {
         set spindle_block  rapid_spindle
         set traverse_block rapid_traverse
         PB_SET_RAPID_MOD $rapid_spindle_mod $rapid_spindle_blk aa mod_spindle
         PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_blk aa mod_traverse
      }
   }

   if {$spindle_first == "TRUE"} {
      if {$rapid_spindle_inhibit == "FALSE"} {
         if { $spindle_block != "" } {
            PB_FORCE Once $mod_spindle
            MOM_do_template $spindle_block
         } else {
            MOM_output_literal "$co Rapid Spindle Block is empty! $ci"
         }
      }
      if {$rapid_traverse_inhibit == "FALSE"} {
         if { $traverse_block != "" } {
            PB_FORCE Once $mod_traverse
            MOM_do_template $traverse_block
         } else {
            MOM_output_literal "$co Rapid Traverse Block is empty! $ci"
         }
      }
   } elseif {$spindle_first == "FALSE"} {
      if {$rapid_traverse_inhibit == "FALSE"} {
         if { $traverse_block != "" } {
            PB_FORCE Once $mod_traverse
            MOM_do_template $traverse_block
         } else {
            MOM_output_literal "$co Rapid Traverse Block is empty! $ci"
         }
      }
      if {$rapid_spindle_inhibit == "FALSE"} {
         if { $spindle_block != "" } {
            PB_FORCE Once $mod_spindle
            MOM_do_template $spindle_block
         } else {
            MOM_output_literal "$co Rapid Spindle Block is empty! $ci"
         }
      }
   } else {
      PB_FORCE Once $mod_traverse
      MOM_do_template rapid_traverse
   }
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
global mom_out_angle_pos

 #if { $mom_out_angle_pos(0) == 90 } { return }
 if {[EQ_is_zero $mom_out_angle_pos(0)] || $mom_out_angle_pos(0) == 90} {
   MOM_do_template cycle_off
   }
 MOM_force once X Y
 #MOM_suppress MOM_suppressMOM_suppressonce G_motion
}


#=============================================================
proc MOM_cycle_plane_change { } {
#=============================================================
  global cycle_init_flag

   #set cycle_init_flag TRUE
}


#=============================================================
proc MOM_drill { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL
   CYCLE_SET
}


#=============================================================
proc MOM_drill_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_drill
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_dwell { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_DWELL
   CYCLE_SET
}


#=============================================================
proc MOM_drill_dwell_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_drill_dwell
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_deep { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_DEEP
   CYCLE_SET
}


#=============================================================
proc MOM_drill_deep_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_drill_deep
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_drill_break_chip { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name DRILL_BREAK_CHIP
   CYCLE_SET
}


#=============================================================
proc MOM_drill_break_chip_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_drill_break_chip
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_tap { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name TAP
   CYCLE_SET
}


#=============================================================
proc MOM_tap_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_tap
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE
   CYCLE_SET
}


#=============================================================
proc MOM_bore_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_bore
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_drag { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_DRAG
   CYCLE_SET
}


#=============================================================
proc MOM_bore_drag_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_bore_drag
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_no_drag { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_NO_DRAG
   CYCLE_SET
}


#=============================================================
proc MOM_bore_no_drag_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_bore_no_drag
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_manual { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_MANUAL
   CYCLE_SET
}


#=============================================================
proc MOM_bore_manual_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_bore_manual
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_dwell { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_DWELL
   CYCLE_SET
}


#=============================================================
proc MOM_bore_dwell_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_bore_dwell
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_back { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_BACK
   CYCLE_SET
}


#=============================================================
proc MOM_bore_back_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_bore_back
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_bore_manual_dwell { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name BORE_MANUAL_DWELL
   CYCLE_SET
}


#=============================================================
proc MOM_bore_manual_dwell_move { } {
#=============================================================
  global cycle_init_flag

   PB_CMD_before_cycle
   MOM_do_template cycle_bore_manual_dwell
   PB_CMD_after_cycle
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_sequence_number { } {
#=============================================================
   SEQNO_SET
}


#=============================================================
proc PB_CMD_FEEDRATE_NUMBER { } {
#=============================================================
#
#  This custom command allows you to modify the feed rate number
#  after it has been calculated by the system
#
   global mom_feed_rate_number

   set mom_sys_frn_factor 1.0

   if [info exists mom_feed_rate_number] {
      return [expr $mom_feed_rate_number * $mom_sys_frn_factor]
   } else {
      return 0.0
   }
}


#=============================================================
proc PB_CMD_after_cycle { } {
#=============================================================
global mom_out_angle_pos

  if {[EQ_is_zero $mom_out_angle_pos(0)]} {
  } elseif { $mom_out_angle_pos(0) == 90} {
    } else {
       MOM_do_template cycle_off
       MOM_do_template slant_mode_point_off
       MOM_do_template slant_mode_angle_off

      }
}

#=============================================================
proc PB_CMD_before_cycle { } {
#=============================================================
global mom_out_angle_pos mom_cycle_rapid_to_pos mom_cycle_rapid_to
global mom_cycle_feed_to_pos mom_cycle_feed_to
global cycle_init_flag clamp_rotary_fifth_status

  if {[EQ_is_zero $mom_out_angle_pos(0)]} {
    MOM_suppress once I_cycle

  } elseif { $mom_out_angle_pos(0) == 90} {
     MOM_suppress once K_cycle
     #MOM_force once Z_cycle
    } else {
      MOM_suppress once I_cycle
      MOM_force once K_cycle X Y Z
      MOM_do_template slant_mode_point
      MOM_do_template slant_mode_angle
      set mom_cycle_rapid_to_pos(0) 0.0
      set mom_cycle_rapid_to_pos(1) 0.0
      set mom_cycle_rapid_to_pos(2) $mom_cycle_rapid_to
      set mom_cycle_feed_to_pos(0) 0.0
      set mom_cycle_feed_to_pos(1) 0.0
      set mom_cycle_feed_to_pos(2) $mom_cycle_feed_to
      MOM_do_template rapid_cycle
      set cycle_init_flag FALSE
      MOM_force once X Y F
    }
  if {$cycle_init_flag} {
    MOM_do_template rapid_cycle
    MOM_force once G_add
  }
  MOM_do_template unclamp_C_axis
  set clamp_rotary_fifth_status "UNCLAMPED"
}


#=============================================================
proc PB_CMD_clamp_fourth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to clamp the fourth axis.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#
  #MOM_do_template clamp_B_axis
  #MOM_output_literal "M10"
}


#=============================================================
proc PB_CMD_end_of_MILL { } {
#=============================================================
   MOM_output_literal "(Code to turn off the MILL-mode)"
#MOM_do_template return_home
#MOM_do_template axis_disconnecting_c
#MOM_do_template axis_disconnecting_y
MOM_do_template opstop
MOM_do_template spindle_off
}


#=============================================================
proc PB_CMD_end_of_TURN { } {
#=============================================================
   MOM_output_literal "(Code to turn off the TURN-mode)"

MOM_suppress once Z
MOM_do_template return_home
MOM_do_template return_home
MOM_do_template opstop
MOM_do_template spindle_off
}


#=============================================================
proc PB_CMD_end_of_alignment_character { } {
#=============================================================
 #  Return sequnece number back to orignal
 #  This command may be used with the command "PM_CMD_start_of_alignment_character"

  global mom_sys_leader saved_seq_num
  set mom_sys_leader(N) $saved_seq_num
}


#=============================================================
proc PB_CMD_fifth_axis_rotate_move { } {
#=============================================================
#
#  This procedure is used by the ROTATE ude command to output a
#  fifth axis rotary move.  You can use the NC Data Definitions
#  section of postbuilder to modify the fifth_axis_rotary_move
#  block template.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#

  MOM_force once fifth_axis
  MOM_do_template fifth_axis_rotate_move
}


#=============================================================
proc PB_CMD_fourth_axis_rotate_move { } {
#=============================================================
#
#  This procedure is used by the ROTATE ude command to output a
#  fourth axis rotary move.  You can use the NC Data Definitions
#  section of postbuilder to modify the fourth_axis_rotary_move
#  block template.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#

  MOM_force once fourth_axis
  MOM_do_template fourth_axis_rotate_move
}


#=============================================================
proc PB_CMD_init_multiple_post { } {
#=============================================================

uplevel #0 {

# This procedure will also allow you to output code when switching from one
# machining mode to another.  The procedure PB_CMD_start_of_zhead will be
# executed if it exists whenever the zhead is used.  Likewise and procedure
# is called each time a new head is used to turn off the previous mode and
# initiate the new mode.

# When several posts are linked together only the master post (the one with
# this custom command imported) will control the listing, warning, verbosity
# of error diagnostics, group output and the review tool.  The master post
# will also output the Start of Program and End of Program events.  The
# slave posts will not output any Start of Program or End of Program events
# nor control any run-time functions.

  proc MOM_head {} {

   global mom_head_name mom_sys_postname
   global mom_load_event_handler
   global current_head
   global mom_warning_info
   global mom_sys_head_change_init_program
   global mom_machine_mode

   if { ![info exists current_head] } {set current_head ""}
   if { [info exists mom_head_name] } {set mom_head_name [string toupper $mom_head_name]}
   if { [info exists mom_sys_postname($mom_head_name)] && $current_head != "$mom_head_name" } {
      if { [llength [info commands PB_CMD_end_of_$current_head]] } {PB_CMD_end_of_$current_head}
      set current_head $mom_head_name
      set mom_load_event_handler  [MOM_ask_env_var UGII_CAM_POST_DIR]$mom_sys_postname($mom_head_name).tcl
      MOM_load_definition_file  [MOM_ask_env_var UGII_CAM_POST_DIR]$mom_sys_postname($mom_head_name).def
      if { [llength [info commands PB_CMD_start_of_$current_head]] } {PB_CMD_start_of_$current_head}
      set mom_sys_head_change_init_program 1

      rename MOM_start_of_program MOM_start_of_program_save
      rename MOM_end_of_program MOM_end_of_program_save

    } else {
      set mom_warning_info "bad head name"
      MOM_catch_warning
   }
}

proc MOM_Head {} {MOM_head}
proc MOM_HEAD {} {MOM_head}


} ;# end uplevel
}


##=============================================================
#proc PB_CMD_kin_before_motion { } {
##=============================================================
##
##  This custom command is used by UG Post to support Set/Lock,
##  rotary axis limit violation retracts and auto clamping.
##  Do not change this procedure.  If you want to improve
##  performance, you may comment out any of these procedures.
##
#
#   global mom_kin_machine_type
#
#   LOCK_AXIS_MOTION
#
#   #ROTARY_AXIS_RETRACT
#
#   #AUTO_CLAMP
#}
#=============================================================
proc PB_CMD_kin_before_motion { } {
#=============================================================
#
# This procedure is called before every motion.  It converts the
# xyz input from UG to xzc for the mill/turn.  It also processes
# the tool axis and verifies its correctness.  Do NOT rename this
# procedure.
#

   global mom_out_angle_pos mom_sys_coordinate_output_mode mom_sys_output_mode mom_pos 
   global mom_mcs_goto mom_tool_axis mom_prev_pos mom_sys_millturn_yaxis
   global prev_mom_kin_arc_output_mode mom_kin_arc_output_mode
   global mom_coordinate_output_mode

   if { $mom_coordinate_output_mode == "ON" } { set mom_sys_coordinate_output_mode "POLAR"} else {
   	set mom_sys_coordinate_output_mode "CARTESIAN"}

   if { $mom_sys_coordinate_output_mode == "POLAR" } {

      if { $mom_sys_millturn_yaxis != "TRUE" } { MOM_suppress always Y }
      if { $mom_sys_output_mode != "POLAR" }  {
        #
        # This section outputs the code needed to change the control to polar
        # output mode.
        #
         
         set mom_sys_output_mode "POLAR"
      }

      MILL_TURN
      MOM_reload_variable -a mom_out_angle_pos
      set mom_prev_pos(4) $mom_out_angle_pos(1)
      set mom_pos(4) $mom_out_angle_pos(1)
      MOM_reload_variable -a mom_pos
      MOM_reload_variable -a mom_prev_pos

   } elseif { $mom_sys_coordinate_output_mode == "CARTESIAN" } {

      if { $mom_sys_millturn_yaxis != "TRUE" } { MOM_suppress off Y }
      if { $mom_sys_output_mode != "CARTESIAN" } {
        #
        # This section outputs the code needed to change the control to cartesian
        # output mode.
        #
         #PB_CMD_init_cartesian_mode
         set mom_sys_output_mode "CARTESIAN"
      }
   }
}


#=============================================================
proc PB_CMD_kin_feedrate_set { } {
#=============================================================
# This procedure supercedes the functionalites provided by the
# FEEDRATE_SET in ugpost_base.tcl.  Post Builder automatically
# generates proper call sequences to this procedure in the
# Event handlers.
#
# This procedure must be used in conjunction with ugpost_base.tcl.
#
  global   feed com_feed_rate
  global   mom_feed_rate_output_mode super_feed_mode feed_mode
  global   mom_cycle_feed_rate_mode mom_cycle_feed_rate
  global   mom_cycle_feed_rate_per_rev
  global   mom_motion_type
  global   mom_warning_info
  global   Feed_IPM Feed_IPR Feed_MMPM Feed_MMPR Feed_INV
  global   mom_sys_feed_param
  global   mom_sys_cycle_feed_mode


  set super_feed_mode $mom_feed_rate_output_mode

  set f_pm [ASK_FEEDRATE_FPM] ; set f_pr [ASK_FEEDRATE_FPR]

  switch $mom_motion_type {

    CYCLE {
      if [info exists mom_sys_cycle_feed_mode] {
         if { $mom_sys_cycle_feed_mode != "Auto" } {
            set mom_cycle_feed_rate_mode $mom_sys_cycle_feed_mode
         }
      }
      if {[hiset mom_cycle_feed_rate_mode]} { set super_feed_mode $mom_cycle_feed_rate_mode }
      if {[hiset mom_cycle_feed_rate]} { set f_pm $mom_cycle_feed_rate }
      if {[hiset mom_cycle_feed_rate_per_rev]} { set f_pr $mom_cycle_feed_rate_per_rev }
    }

    FROM -
    RETRACT -
    RETURN -
    LIFT -
    TRAVERSAL -
    GOHOME -
    GOHOME_DEFAULT -
    RAPID {
      SUPER_FEED_MODE_SET RAPID
    }

    default {
      if {[EQ_is_zero $f_pm] && [EQ_is_zero $f_pr]} {
        SUPER_FEED_MODE_SET RAPID
      } else {
        SUPER_FEED_MODE_SET CONTOUR
      }
    }
  }


  set feed_mode $super_feed_mode


 # Adjust feedrate format per Post output unit again.
  global mom_kin_output_unit
  if { $mom_kin_output_unit == "IN" } {
     switch $feed_mode {
       MMPM {
         set feed_mode "IPM"
         CATCH_WARNING "Feedrate mode MMPM changed to IPM"
       }
       MMPR {
         set feed_mode "IPR"
         CATCH_WARNING "Feedrate mode MMPR changed to IPR"
       }
     }
  } else {
     switch $feed_mode {
       IPM {
         set feed_mode "MMPM"
         CATCH_WARNING "Feedrate mode IPM changed to MMPM"
       }
       IPR {
         set feed_mode "MMPR"
         CATCH_WARNING "Feedrate mode IPR changed to MMPR"
       }
     }
  }


  switch $feed_mode {
    IPM     -
    MMPM    { set feed $f_pm }
    IPR     -
    MMPR    { set feed $f_pr }
    DPM     { set feed [PB_CMD_FEEDRATE_DPM] }
    FRN     -
    INVERSE { set feed [PB_CMD_FEEDRATE_NUMBER] }
    default { set mom_warning_info "INVALID FEED RATE MODE" ; MOM_catch_warning ; return }
  }


 # Post Builder provided format for the current mode:
  if [info exists mom_sys_feed_param(${feed_mode},format)] {
    MOM_set_address_format F $mom_sys_feed_param(${feed_mode},format)
  } else {
    switch $feed_mode {
      IPM     -
      MMPM    -
      IPR     -
      MMPR    -
      DPM     -
      FRN     { MOM_set_address_format F Feed_${feed_mode} }
      INVERSE { MOM_set_address_format F Feed_INV }
    }
  }

 # Commentary output
  set com_feed_rate $f_pm


 # Execute user's commnad, if any.
  if [llength [info commands "PB_CMD_FEEDRATE_SET"]] {
     PB_CMD_FEEDRATE_SET
  }
}


#=============================================================
proc PB_CMD_kin_init_rotary { } {
#=============================================================

   global mom_kin_machine_type

   if [info exists mom_kin_machine_type] {
      if { [string match "*3_axis_mill*" $mom_kin_machine_type] ||  [string match "*lathe*" $mom_kin_machine_type] } {
return
      }
   }

   PB_CMD_init_rotary

uplevel #0 {


#=============================================================
proc MOM_clamp { } {
#=============================================================
  global mom_clamp_axis mom_clamp_status mom_sys_auto_clamp

   if {$mom_clamp_axis == "AUTO"} {
      if {$mom_clamp_status == "ON"} {
         set mom_sys_auto_clamp "ON"
      } elseif {$mom_clamp_status == "OFF"} {
         set mom_sys_auto_clamp "OFF"
      }
   }
}



#=============================================================
proc PB_catch_warning { } {
#=============================================================
  global mom_sys_rotary_error mom_warning_info

   if {$mom_warning_info == "ROTARY CROSSING LIMIT."} {
      set mom_sys_rotary_error $mom_warning_info
   }
   if {$mom_warning_info == "secondary rotary position being used"} {
      set mom_sys_rotary_error $mom_warning_info
   }
}


} ;# uplevel
}


#=============================================================
proc PB_CMD_kin_linearize_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_mill_turn_initialize { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_mill_xzc_init { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_start_of_path { } {
#=============================================================
#
#  This procedure is executed at the start of every operation.
#  It will check to see if a new head (post) was loaded and
#  will then initialize any functionality specific to that post.
#
#  It will also restore the initial Start of Program or End
#  of program event procedures.
#
#  DO NOT CHANGE THIS FILE UNLESS YOU KNOW WHAT YOU ARE DOING.
#  DO NOT CALL THIS PROCEDURE FROM ANY OTHER CUSTOM COMMAND.
#
  global mom_sys_head_change_init_program

   if [info exists mom_sys_head_change_init_program] {

      PB_CMD_kin_start_of_program
      unset mom_sys_head_change_init_program

      if [llength [info commands "MOM_start_of_program_save"]] {
         rename MOM_start_of_program ""
         rename MOM_end_of_program ""
         rename MOM_start_of_program_save MOM_start_of_program
         rename MOM_end_of_program_save MOM_end_of_program
      }
   }

  # Initialize tool time accumulator for this operation.
   if [llength [info commands PB_CMD_init_oper_tool_time] ] {
      PB_CMD_init_oper_tool_time
   }
}


#=============================================================
proc PB_CMD_kin_start_of_program { } {
#=============================================================
#
#  This procedure will execute the following custom commands for
#  initialization.  They will be executed once at the start of
#  program and again each time they are loaded as a linked post.
#  After execution they will be deleted so that they are not
#  present when a different post is loaded.  You may add a call
#  to a procedure that you want executed when a linked post is
#  loaded.
#
#  Note that when a linked post is called in, the Start of Program
#  event marker is not executed again, only this procedure.
#
#  DO NOT REMOVE ANY LINES FROM THIS PROCEDURE UNLESS YOU KNOW
#  WHAT YOU ARE DOING.  DO NOT CALL THIS PROCEDURE FROM ANY
#  OTHER CUSTOM COMMAND.
#

   global mom_kin_machine_type

   set command_list [list]

   if [info exists mom_kin_machine_type] {
      if { ![string match "*3_axis_mill*" $mom_kin_machine_type] &&  ![string match "*lathe*" $mom_kin_machine_type] } {

         lappend command_list  PB_CMD_kin_init_rotary
      }
   }

   lappend command_list  PB_CMD_init_auto_retract
   lappend command_list  PB_CMD_multiple_post_initialize
   lappend command_list  PB_CMD_init_multiple_post
   #lappend command_list  PB_CMD_initialize_parallel_zw_mode
   #lappend command_list  PB_CMD_init_parallel_zw_mode
   lappend command_list  PB_CMD_initialize_tool_list
   lappend command_list  PB_CMD_init_tool_list
   lappend command_list  PB_CMD_init_tape_break
   lappend command_list  PB_CMD_initialize_spindle_axis
   lappend command_list  PB_CMD_init_spindle_axis
   lappend command_list  PB_CMD_initialize_helix
   lappend command_list  PB_CMD_init_helix
   lappend command_list  PB_CMD_pq_cutcom_initialize
   lappend command_list  PB_CMD_init_pq_cutcom

   if [info exists mom_kin_machine_type] {
      #if { [string match "*mill_turn*" $mom_kin_machine_type] } {

#          lappend command_list  PB_CMD_kin_init_mill_xzc
#          lappend command_list  PB_CMD_kin_mill_xzc_init
#          lappend command_list  PB_CMD_kin_init_mill_turn
#          lappend command_list  PB_CMD_kin_mill_turn_initialize
      #}
   }

   foreach cmd $command_list {

      if [llength [info commands "$cmd"]] {

         # <PB v2.0.2>
         # Old init commands for XZC/MILL_TURN posts are not executed.
         # Parameters set by these commands in the v2.0 legacy posts
         # will need to be transfered to PB_CMD_init_mill_xzc &
         # PB_CMD_init_mill_turn commands respectively.

         switch { $cmd } {
            "PB_CMD_kin_mill_xzc_init" -
            "PB_CMD_kin_mill_turn_initialize" {}
            default { $cmd }
         }
         rename $cmd ""
         proc $cmd { args } {}
      }
   }
}


#=============================================================
proc PB_CMD_linear_move { } {
#=============================================================
#
#  This procedure is used my many automatic postbuilder functions
#  to output a linear move.  Do NOT add this block to events or
#  markers.  It is a static block and it is not intended to be added
#  to events.  Do NOT change the name of this procedure.
#
#  If you need a custom command to be output with a linear move block,
#  you must place a call to the custom command either before or after
#  the MOM_do_template command.
#
#  This proc is used for:
#     simulated cycles feed moves
#     mill/turn mill linearization
#     four and five axis retract and re-engage
#

  MOM_do_template linear_move
}


#=============================================================
proc PB_CMD_linearize_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_machine_mode { } {
#=============================================================
#
#  This procedure is used by a simple mill/turn post.
#  DO NOT change any code in this procedure unless you know
#  what you are doing
#

   global mom_head_name mom_sys_postname
   global mom_load_event_handler
   global current_head
   global mom_warning_info
   global mom_sys_head_change_init_program
   global mom_machine_mode


   if { [info exists mom_head_name] } {return}
   set head_name $mom_machine_mode

   if { ![info exists current_head] } {set current_head ""}
   #if { [info exists head_name] } {set head_name [string toupper head_name]}

   if { [info exists mom_sys_postname($head_name)] && $current_head != "$head_name" } {

      if { [llength [info commands PB_CMD_end_of_$current_head]] } {PB_CMD_end_of_$current_head}

      set current_head $head_name

      set mom_load_event_handler  [MOM_ask_env_var UGII_CAM_POST_DIR]$mom_sys_postname($head_name).tcl
      MOM_load_definition_file  [MOM_ask_env_var UGII_CAM_POST_DIR]$mom_sys_postname($head_name).def

      if { [llength [info commands PB_CMD_start_of_$current_head]] } {PB_CMD_start_of_$current_head}
      set mom_sys_head_change_init_program 1


      rename MOM_start_of_program MOM_start_of_program_save
      rename MOM_end_of_program MOM_end_of_program_save

   } else {

      set mom_warning_info "bad head name"
      MOM_catch_warning
   }
}


#=============================================================
proc PB_CMD_start_of_MILL { } {
#=============================================================
MOM_output_literal "(Code to turn on the MILL-mode)"

#MOM_do_template axis_connecting_c
}


#=============================================================
proc PB_CMD_start_of_TURN { } {
#=============================================================
   MOM_output_literal "(Code to turn on the TURN-mode)"
#MOM_force once S
MOM_do_template spindle_max_rpm
#global mom_sys_C_axis_disconnecting_code
#global mom_sys_Y_axis_disconnecting_code


}



#=============================================================
proc PB_CMD_start_of_alignment_character { } {
#=============================================================
 # This command can be used to output a special sequence number character.
 # Replace the ":" with any character that you require.
 # You must use the command "PB_CMD_end_of_alignment_character" to reset
 # the sequence number back to the original setting.

  global mom_sys_leader saved_seq_num
  set saved_seq_num $mom_sys_leader(N)
  set mom_sys_leader(N) ":"
}


#=============================================================
proc PB_CMD_start_of_operation_force_addresses { } {
#=============================================================
  MOM_force once S M_spindle X Y Z F SB fifth_axis G_compensation BA_slant fourth_axis
  MOM_force once K_cycle I_cycle X_cycle Y_cycle Z_cycle
  MOM_force once TL
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  MOM_force once fourth_axis TL fourth_axis_B G_compensation BA_slant
}



##=============================================================
#proc PB_CMD_x_radius-diameter { } {
##=============================================================
#global mom_pos mom_prev_pos
#set transformation_of_coordinates "OFF"
#if {$transformation_of_coordinates == "ON"} {
#	set mom_pos(0) [expr $mom_pos(0)*2]
#	set mom_prev_pos(0) [expr $mom_prev_pos(0)*2]
#}
#}


#=============================================================
proc EQ_is_zero { s } {
#=============================================================
   global mom_system_tolerance

   if [info exists mom_system_tolerance] {
      if { [expr abs($s)] <= $mom_system_tolerance } { return 1 } else { return 0 }
   } else {
      return 0
   }
}


#=============================================================
proc DELAY_TIME_SET {  } {
#=============================================================
  global mom_sys_delay_param mom_delay_value
  global mom_delay_revs mom_delay_mode delay_time

   # post builder provided format for the current mode:
    if {[info exists mom_sys_delay_param(${mom_delay_mode},format)] != 0} {
      MOM_set_address_format dwell $mom_sys_delay_param(${mom_delay_mode},format)
    }

    switch $mom_delay_mode {
      SECONDS {set delay_time $mom_delay_value}
      default {set delay_time $mom_delay_revs}
    }
}


#=============================================================
proc SOLVE_QUADRATIC { coeff rcomp icomp status degree } {
#=============================================================

  upvar $coeff c ; upvar $rcomp rc ; upvar $icomp ic
  upvar $status st ; upvar $degree deg

   set st 1
   set deg 0
   set rc(0) 0.0 ; set rc(1) 0.0
   set ic(0) 0.0 ; set ic(1) 0.0
   set mag [VEC3_mag c]
   if {[EQ_is_zero $mag]} {return 0}
   set acoeff [expr $c(2)/$mag]
   set bcoeff [expr $c(1)/$mag]
   set ccoeff [expr $c(0)/$mag]
   if {![EQ_is_zero $acoeff]} {
      set deg 2
      set denom [expr $acoeff*2.]
      set dscrm [expr $bcoeff*$bcoeff - $acoeff*$ccoeff*4.0]
      if {[EQ_is_zero $dscrm]} {
         set dsqrt1 0.0
      } else {
         set dsqrt1 [expr sqrt(abs($dscrm))]
      }
      if {[EQ_is_ge $dscrm 0.0]} {
         set rc(0) [expr (-$bcoeff + $dsqrt1)/$denom]
         set rc(1) [expr (-$bcoeff - $dsqrt1)/$denom]
         set st 3
         return 2
      } else {
         set rc(0) [expr -$bcoeff/$denom]
         set rc(1) $rc(0)
         set ic(0) [expr $dsqrt1/$denom]
         set ic(1) $ic(0)
         set st 2
         return 0
      }
   } elseif {![EQ_is_zero $bcoeff] } {
      set st 3
      set deg 1
      set rc(0) [expr -$ccoeff/$bcoeff]
      return 1
   } elseif {[EQ_is_zero $ccoeff] } {
      return 0
   } else {
      return 0
   }
}


#=============================================================
proc LOCK_AXIS_MOTION {  } {
#=============================================================
#
#  The UDE lock_axis must be specified in the tool path
#  for the post to lock the requested axis.  The UDE lock_axis may only
#  be used for four and five axis machine tools.  A four axis post may
#  only lock an axis in the plane of the fourth axis.  If you have a
#  five axis machine you must specify a plane since there are two
#  possible planes.
#
  global mom_pos mom_out_angle_pos mom_current_motion mom_motion_type
  global mom_cycle_feed_to_pos mom_cycle_feed_to mom_tool_axis
  global mom_motion_event mom_sys_lock_status
  global mom_cycle_rapid_to_pos mom_cycle_retract_to_pos
  global mom_cycle_rapid_to mom_cycle_retract_to
  global mom_prev_pos


  if {$mom_sys_lock_status == "ON"} {
    if {$mom_current_motion != "circular_move"} {
      LOCK_AXIS mom_pos mom_prev_pos mom_pos mom_out_angle_pos
      MOM_reload_variable -a mom_out_angle_pos
      MOM_reload_variable -a mom_pos
      if {$mom_motion_type == "CYCLE"} {
        if {$mom_motion_event == "initial_move"} {
           set mom_pos(0) [expr $mom_pos(0) - $mom_cycle_rapid_to * $mom_tool_axis(0)]
           set mom_pos(1) [expr $mom_pos(1) - $mom_cycle_rapid_to * $mom_tool_axis(1)]
           set mom_pos(2) [expr $mom_pos(2) - $mom_cycle_rapid_to * $mom_tool_axis(2)]
        }
        set mom_cycle_feed_to_pos(0) [expr $mom_pos(0) + $mom_cycle_feed_to * $mom_tool_axis(0)]
        set mom_cycle_feed_to_pos(1) [expr $mom_pos(1) + $mom_cycle_feed_to * $mom_tool_axis(1)]
        set mom_cycle_feed_to_pos(2) [expr $mom_pos(2) + $mom_cycle_feed_to * $mom_tool_axis(2)]

        set mom_cycle_rapid_to_pos(0) [expr $mom_pos(0) + $mom_cycle_rapid_to * $mom_tool_axis(0)]
        set mom_cycle_rapid_to_pos(1) [expr $mom_pos(1) + $mom_cycle_rapid_to * $mom_tool_axis(1)]
        set mom_cycle_rapid_to_pos(2) [expr $mom_pos(2) + $mom_cycle_rapid_to * $mom_tool_axis(2)]

        set mom_cycle_retract_to_pos(0) [expr $mom_pos(0) + $mom_cycle_retract_to * $mom_tool_axis(0)]
        set mom_cycle_retract_to_pos(1) [expr $mom_pos(1) + $mom_cycle_retract_to * $mom_tool_axis(1)]
        set mom_cycle_retract_to_pos(2) [expr $mom_pos(2) + $mom_cycle_retract_to * $mom_tool_axis(2)]
      }
    }
  }
}


#=============================================================
proc LOCK_AXIS { input_point prev_point output_point output_rotary } {
#=============================================================
  upvar $input_point ip ; upvar $output_point op ; upvar $output_rotary or
  upvar $prev_point pp

  global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset
  global mom_kin_4th_axis_plane mom_kin_5th_axis_plane
  global mom_sys_lock_value mom_sys_lock_plane
  global mom_sys_lock_axis mom_sys_lock_status
  global mom_out_angle_pos mom_prev_out_angle_pos mom_kin_4th_axis_direction
  global mom_kin_5th_axis_direction mom_kin_4th_axis_leader mom_kin_5th_axis_leader
  global mom_sys_leader
  global DEG2RAD RAD2DEG

   if {$mom_sys_lock_status == "OFF"} {  return }
   
   VEC3_sub ip mom_kin_4th_axis_center_offset temp
   if [info exists mom_kin_5th_axis_center_offset] {
      VEC3_sub temp mom_kin_5th_axis_center_offset temp
   }
   set temp(3) $ip(3)
   set temp(4) $ip(4)

   if {$mom_sys_lock_plane == -1} {
      if {$mom_kin_4th_axis_plane == "XY"} {
         set mom_sys_lock_plane 2
      } elseif {$mom_kin_4th_axis_plane == "ZX"} {
         set mom_sys_lock_plane 1
      } elseif {$mom_kin_4th_axis_plane == "YZ"} {
         set mom_sys_lock_plane 0
      }
   }

   if {$mom_kin_4th_axis_plane == "XY"} {
      set fourth_axis 2
   } elseif {$mom_kin_4th_axis_plane == "ZX"} {
      set fourth_axis 1
   } elseif {$mom_kin_4th_axis_plane == "YZ"} {
      set fourth_axis 0
   }

   if {[info exists mom_kin_5th_axis_plane]} {
      if {$mom_kin_5th_axis_plane == "XY"} {
         set fifth_axis 2
      } elseif {$mom_kin_5th_axis_plane == "ZX"} {
         set fifth_axis 1
      } elseif {$mom_kin_5th_axis_plane == "YZ"} {
         set fifth_axis 0
      }
   } else {
      set fifth_axis -1
   }


   if {$mom_sys_lock_axis > 2} {
      set angle [expr ($mom_sys_lock_value-$temp($mom_sys_lock_axis))*$DEG2RAD]
      ROTATE_VECTOR $mom_sys_lock_plane $angle temp temp1
      VMOV 3 temp1 temp
      set temp($mom_sys_lock_axis) $mom_sys_lock_value
   } else {
      if {$mom_sys_lock_plane == 0} {
         set i1 1
         set i2 2
      } elseif {$mom_sys_lock_plane == 1} {
         set i1 2
         set i2 0
      } elseif {$mom_sys_lock_plane == 2} {
         set i1 0
         set i2 1
      }
      set unlocked_axis [expr $i1 + $i2 - $mom_sys_lock_axis]
      set rad [expr sqrt($temp($i1)*$temp($i1) + $temp($i2)*$temp($i2))]
      set angle [ARCTAN $temp($i2) $temp($i1)]
      if { $rad < [expr abs($mom_sys_lock_value)]} {
         if {$mom_sys_lock_value < 0.0} {
            set temp($mom_sys_lock_axis) [expr -$rad]
         } else {
            set temp($mom_sys_lock_axis) $rad
         }
      } else {
         set temp($mom_sys_lock_axis) $mom_sys_lock_value
      }

      set temp($unlocked_axis)  [expr sqrt($rad*$rad - $temp($mom_sys_lock_axis)*$temp($mom_sys_lock_axis))]

      if { $mom_sys_lock_plane == $fourth_axis || $mom_sys_lock_plane == $fifth_axis } {
         VMOV 5 temp temp1
         set temp1($unlocked_axis) [expr -$temp($unlocked_axis)]
         set ang1 [ARCTAN $temp($i2) $temp($i1)]
         set ang2 [ARCTAN $temp1($i2) $temp1($i1)]
         if {$mom_sys_lock_plane == $fourth_axis} {
            set i1 3
         } else {
            set i1 4
         }
         set temp($i1) [expr ($angle-$ang1)*$RAD2DEG]
         set temp1($i1) [expr ($angle-$ang2)*$RAD2DEG]
         set ang1 [LIMIT_ANGLE [expr $pp($i1)-$temp($i1)]]
         set ang2 [LIMIT_ANGLE [expr $pp($i1)-$temp1($i1)]]
         if {$ang1 > 180.0} {set ang1 [LIMIT_ANGLE [expr -$ang1]]}
         if {$ang2 > 180.0} {set ang2 [LIMIT_ANGLE [expr -$ang2]]}
         if {$ang1 > $ang2} {VMOV 5 temp1 temp}
      }
   }

   VEC3_add temp mom_kin_4th_axis_center_offset op
   if {[info exists mom_kin_5th_axis_center_offset]} {
      VEC3_add op mom_kin_5th_axis_center_offset op
   }

   if {![info exists or]} {
      set or(0) 0.0
      set or(1) 0.0
   }
   if {![info exists mom_prev_out_angle_pos]} {
      set mom_prev_out_angle_pos(0) $or(0)
      set mom_prev_out_angle_pos(1) $or(1)
   }

   set or(0) [ROTSET $temp(3) $mom_prev_out_angle_pos(0) $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)]
   if {[info exists mom_kin_5th_axis_direction]} {
      set or(1) [ROTSET $temp(4) $mom_prev_out_angle_pos(1) $mom_kin_5th_axis_direction  $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)]
   }
   set op(3) $temp(3)
   set op(4) $temp(4)
}


#=============================================================
proc VMOV { n p1 p2 } {
#=============================================================
  upvar $p1 v1 ; upvar $p2 v2

   for {set i 0} {$i < $n} {incr i} {
      set v2($i) $v1($i)
   }
}


#=============================================================
proc LOCK_AXIS_SUB { axis } {
#=============================================================
  global mom_pos mom_lock_axis_value_defined mom_lock_axis_value

   if {$mom_lock_axis_value_defined == 1} {
      return $mom_lock_axis_value
   } else {
      return $mom_pos($axis)
   }
}


#=============================================================
proc REPOSITION_ERROR_CHECK { warn } {
#=============================================================
  global mom_kin_4th_axis_max_limit mom_kin_4th_axis_min_limit
  global mom_kin_5th_axis_max_limit mom_kin_5th_axis_min_limit
  global mom_pos mom_prev_pos mom_alt_pos mom_alt_prev_pos
  global mom_sys_rotary_error mom_warning_info mom_kin_machine_type

  if {$warn != "secondary rotary position being used" || [string index $mom_kin_machine_type 0] != 5} {
    set mom_sys_rotary_error $warn
    return
  }

  set mom_sys_rotary_error 0

  set a4 [expr $mom_alt_pos(3)+360.0]
  set a5 [expr $mom_alt_pos(4)+360.0]
  while {[expr $a4-$mom_kin_4th_axis_min_limit] > 360.0} {set a4 [expr $a4-360.0]}
  while {[expr $a5-$mom_kin_5th_axis_min_limit] > 360.0} {set a5 [expr $a5-360.0]}
  if {$a4 <= $mom_kin_4th_axis_max_limit && $a5 <= $mom_kin_5th_axis_max_limit} {return}

  for {set i 0} {$i < 2} {incr i} {
    set rot($i) [expr $mom_pos([expr $i+3]) - $mom_prev_pos([expr $i+3])]
    while {$rot($i) > 180.0} {set rot($i) [expr $rot($i)-360.0]}
    while {$rot($i) < 180.0} {set rot($i) [expr $rot($i)+360.0]}
    set rot($i) [expr abs($rot($i))]

    set rotalt($i) [expr $mom_alt_pos([expr $i+3]) - $mom_prev_pos([expr $i+3])]
    while {$rotalt($i) > 180.0} {set rotalt($i) [expr $rotalt($i)-360.0]}
    while {$rotalt($i) < 180.0} {set rotalt($i) [expr $rotalt($i)+360.0]}
    set rotalt($i) [expr abs($rotalt($i))]
  }

  if {[EQ_is_equal [expr $rot(0)+$rot(1)] [expr $rotalt(0)+$rotalt(1)]]} {return}
  set mom_sys_rotary_error $warn
}


#=============================================================
proc CATCH_WARNING { msg } {
#=============================================================
  global mom_warning_info
  global mom_motion_event
  global mom_event_number

   set level [info level]
   set call_stack ""
   for {set i 1} {$i < $level} {incr i} {
      set call_stack "$call_stack\[ [lindex [info level $i] 0] \]"
   }
   set mom_warning_info "$msg ($mom_motion_event $mom_event_number) $call_stack"
   MOM_catch_warning
}


#=============================================================
proc AXIS_SET { axis } {
#=============================================================

  global mom_sys_leader

   if {$axis == "[string index $mom_sys_leader(fourth_axis) 0]AXIS"} {
      return 3
   } elseif {$axis == "[string index $mom_sys_leader(fifth_axis) 0]AXIS"} {
      return 4
   }
}


#=============================================================
proc WORKPLANE_SET {  } {
#=============================================================
   global mom_cycle_spindle_axis
   global mom_sys_spindle_axis
   global traverse_axis1 traverse_axis2

   if { ![info exists mom_sys_spindle_axis] } {
      set mom_sys_spindle_axis(0) 0.0
      set mom_sys_spindle_axis(1) 0.0
      set mom_sys_spindle_axis(2) 1.0
   }

   if { ![info exists mom_cycle_spindle_axis] } {
      set x $mom_sys_spindle_axis(0)
      set y $mom_sys_spindle_axis(1)
      set z $mom_sys_spindle_axis(2)

      if { [EQ_is_zero $y] && [EQ_is_zero $z] } {
         set mom_cycle_spindle_axis 0
      } elseif { [EQ_is_zero $x] && [EQ_is_zero $z] } {
         set mom_cycle_spindle_axis 1
      } else {
         set mom_cycle_spindle_axis 2
      }
   }

   if { $mom_cycle_spindle_axis == 2 } {
      set traverse_axis1 0 ; set traverse_axis2 1
   } elseif { $mom_cycle_spindle_axis == 0 } {
      set traverse_axis1 1 ; set traverse_axis2 2
   } elseif { $mom_cycle_spindle_axis == 1 } {
      set traverse_axis1 0 ; set traverse_axis2 2
   }
}


#=============================================================
proc EQ_is_equal { s t } {
#=============================================================
   global mom_system_tolerance

   if [info exists mom_system_tolerance] {
      if { [expr abs($s - $t)] <= $mom_system_tolerance } { return 1 } else { return 0 }
   } else {
      return 0
   }
}


#=============================================================
proc SET_LOCK { axis plane value } {
#=============================================================
  upvar $axis a ; upvar $plane p ; upvar $value v

  global mom_kin_machine_type mom_lock_axis mom_lock_axis_plane mom_lock_axis_value
  global mom_warning_info

   switch $mom_kin_machine_type {
      4_axis_head -
      4_AXIS_HEAD -
      4_axis_table -
      4_AXIS_TABLE -
      mill_turn -
      MILL_TURN            {set mtype 4}
      5_axis_dual_table -
      5_AXIS_DUAL_TABLE -
      5_axis_dual_head -
      5_AXIS_DUAL_HEAD -
      5_axis_head_table -
      5_AXIS_HEAD_TABLE    {set mtype 5}
      default {
         set mom_warning_info "Set lock only vaild for 4 and 5 axis machines"
         return "error"
      }
   }

   set p -1

   switch $mom_lock_axis {
      OFF {
         return "OFF"
      }
      XAXIS {
         set a 0
         switch $mom_lock_axis_plane {
            XYPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 2
            }
            YZPLAN {
               set mom_warning_info "Invalid plane for lock axis"
               return "error"
            }
            ZXPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 1
            }
            NONE {
               if {$mtype == 5} {
                  set mom_warning_info "Must specify lock axis plane for 5 axis machine"
                  return "error"
               } else {
                  set v [LOCK_AXIS_SUB $a]
               }
            }
         }
      }
      YAXIS {
         set a 1
         switch $mom_lock_axis_plane {
            XYPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 2
            }
            YZPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 0
            }
            ZXPLAN {
               set mom_warning_info "Invalid plane for lock axis"
               return "error"
            }
            NONE {
               if {$mtype == 5} {
                  set mom_warning_info "Must specify lock axis plane for 5 axis machine"
                  return "error"
               } else {
                  set v [LOCK_AXIS_SUB $a]
               }
            }
         }
      }
      ZAXIS {
         set a 2
         switch $mom_lock_axis_plane {
            YZPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 0
            }
            ZXPLAN {
               set v [LOCK_AXIS_SUB $a]
               set p 1
            }
            XYPLAN {
               set mom_warning_info "Invalid plane for lock axis"
               return "error"
            }
            NONE {
               if {$mtype == 5} {
                  set mom_warning_info "Must specify lock axis plane for 5 axis machine"
                  return "error"
               } else {
                  set v [LOCK_AXIS_SUB $a]
               }
            }
         }
      }
      FOURTH {
         set a 3
         set v [LOCK_AXIS_SUB $a]
      }
      FIFTH {
         set a 4
         set v [LOCK_AXIS_SUB $a]
      }
      AAXIS {
         set a [AXIS_SET $mom_lock_axis]
         set v [LOCK_AXIS_SUB $a]
      }
      BAXIS {
         set a [AXIS_SET $mom_lock_axis]
         set v [LOCK_AXIS_SUB $a]
      }
      CAXIS {
         set a [AXIS_SET $mom_lock_axis]
         set v [LOCK_AXIS_SUB $a]
      }
   }

return "ON"
}




#=============================================================
proc ARCTAN { y x } {
#=============================================================
  global PI

   if {[EQ_is_zero $y]} {
      if {$x < 0.0} { return $PI }

      return 0.0
   }
   if {[EQ_is_zero $x]} {
      if {$y < 0.0} {return [expr $PI*1.5]}
      return [expr $PI*.5]
   }
   set ang [expr atan ($y/$x)]
   if {$x > 0.0 && $y < 0.0} {return [expr $ang+$PI*2.0]}
   if {$x < 0.0 && $y < 0.0} {return [expr $ang+$PI]}
   if {$x < 0.0 && $y > 0.0} {return [expr $ang+$PI]}

return $ang
}


#=============================================================
proc CALC_SPHERICAL_RETRACT_POINT { refpt axis cen_sphere rad_sphere int_pts } {
#=============================================================

  upvar $refpt rp ; upvar $axis ta ; upvar $cen_sphere cs
  upvar $int_pts ip

   set rad [expr $rad_sphere*$rad_sphere]
   VEC3_sub rp cs v1

   set coeff(2) 1.0
   set coeff(1) [expr ($v1(0)*$ta(0) + $v1(1)*$ta(1) + $v1(2)*$ta(2))*2.0]
   set coeff(0) [expr $v1(0)*$v1(0) + $v1(1)*$v1(1) + $v1(2)*$v1(2) - $rad]

   set num_sol [SOLVE_QUADRATIC coeff roots iroots status degree]
   if {$num_sol == 0} {return 0}

   if {[expr $roots(0)] > [expr $roots(1)] || $num_sol == 1} {
      set d $roots(0)
   } else {
      set d $roots(1)
   }
   set ip(0) [expr $rp(0) + $d*$ta(0)]
   set ip(1) [expr $rp(1) + $d*$ta(1)]
   set ip(2) [expr $rp(2) + $d*$ta(2)]

return [RETRACT_POINT_CHECK rp ta ip]
}






#=============================================================
proc CALC_CYLINDRICAL_RETRACT_POINT { refpt axis dist ret_pt } {
#=============================================================
  upvar $refpt rfp ; upvar $axis ax ; upvar $ret_pt rtp

#
# return 0 parallel or lies on plane
#        1 unique intersection
#


#
# create plane canonical form
#
  VMOV 3 ax plane
  set plane(3) $dist

  set num [expr $plane(3)-[VEC3_dot rfp plane]]
  set dir [VEC3_dot ax plane]
  if {[EQ_is_zero $dir]} {return 0}
  for {set i 0} {$i < 3} {incr i} {
    set rtp($i) [expr $rfp($i) + $ax($i)*$num/$dir]
  }
  return [RETRACT_POINT_CHECK rfp ax rtp]
}


#=============================================================
proc ROTATE_VECTOR { plane angle input_vector output_vector } {
#=============================================================
  upvar $output_vector v ; upvar $input_vector v1

   if {$plane == 0} {
      set v(0) $v1(0)
      set v(1) [expr $v1(1)*cos($angle) - $v1(2)*sin($angle)]
      set v(2) [expr $v1(2)*cos($angle) + $v1(1)*sin($angle)]
   } elseif {$plane == 1} {
      set v(0) [expr $v1(0)*cos($angle) + $v1(2)*sin($angle)]
      set v(1) $v1(1)
      set v(2) [expr $v1(2)*cos($angle) - $v1(0)*sin($angle)]
   } elseif {$plane == 1} {
      set v(0) [expr $v1(0)*cos($angle) - $v1(1)*sin($angle)]
      set v(1) [expr $v1(1)*cos($angle) + $v1(0)*sin($angle)]
      set v(2) $v1(2)
   }
}


#=============================================================
proc RETRACT_POINT_CHECK { refpt axis retpt } {
#=============================================================
  upvar $refpt rfp ; upvar $axis ax ; upvar $retpt rtp

#
#  determine if retraction point is "below" the retraction plane
#  if the tool is already in a safe position, do not retract
#
#  return 0	no retract needed
#         1     retraction needed
#

  VEC3_sub rtp rfp vec
  if {[VEC3_is_zero vec]} {return 0}
  set x [VEC3_unitize vec vec1]
  set dir [VEC3_dot ax vec1]
  if {$dir <= 0.0} {
    return 0
  } else {
    return 1
  }
}


#=============================================================
proc ROTSET { angle prev_angle dir kin_leader sys_leader } {
#=============================================================

#  This procedure will take an input angle and format for a specific machine.
#
#  angle	angle to be output.
#  prev_angle	previous angle out.  It should be mom_out_angle_pos
#  dir		can be either MAGNITUDE_DETERMINES_DIRECTION or
#		SIGN_DETERMINES_DIRECTION
#  kin_leader	leader (usually A, B or C) defined by postbuilder
#  sys_leader   leader that is created by rotset.  It could be C-.
#
  upvar $sys_leader lead

global mom_rotary_direction_5th

   while {$angle < 0.0} {set angle [expr $angle+360.0]}
   while {$angle >= 360.0} {set angle [expr $angle-360.0]}



   if {$dir == "MAGNITUDE_DETERMINES_DIRECTION"} {
      while {[expr abs([expr $angle-$prev_angle])] > 180.0} {
      
         if {[expr $angle-$prev_angle] < -180.0} {
            set angle [expr $angle+360.0]
         } elseif {[expr $angle-$prev_angle] > 180.0} {
            set angle [expr $angle-360.0]
         }
      }
   } elseif {$dir == "SIGN_DETERMINES_DIRECTION"} {
      set del [expr $angle-$prev_angle]
      if {($del < 0.0 && $del > -180.0) || $del > 180.0} {
      	set mom_rotary_direction_5th -1

      } else {
      	set mom_rotary_direction_5th 1
      	
      }
   }

return $angle
}


#=============================================================
proc LIMIT_ANGLE { a } {
#=============================================================

   while {$a < 0.0} {set a [expr $a+360.0]}
   while {$a >= 360.0} {set a [expr $a-360.0]}

return $a
}


if [info exists mom_sys_start_of_program_flag] {
   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }
} else {
   set mom_sys_head_change_init_program 1
   set mom_sys_start_of_program_flag 1
}



#=============================================================
proc PB_CMD_init_rotary { } {
#=============================================================
uplevel #0 {



set mom_kin_retract_plane                      200.0

set mom_kin_reengage_distance                  5.0

set mom_kin_spindle_axis(0)                    0.0
set mom_kin_spindle_axis(1)                    0.0
set mom_kin_spindle_axis(2)                    1.0

if [info exists mom_sys_spindle_axis] { unset mom_sys_spindle_axis }

set mom_sys_spindle_axis(0)                    0.0
set mom_sys_spindle_axis(1)                    0.0
set mom_sys_spindle_axis(2)                    1.0

set mom_sys_lock_status                        "OFF"

} ;# uplevel
}

#=============================================================
proc MOM_msys { } {
#=============================================================



}

#=============================================================
proc PB_CMD_clamp_fifth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to clamp the fifth axis.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#
  #MOM_output_literal "(Auto Clamp)"
  global clamp_rotary_fifth_status
 
    	   MOM_force once G_motion fifth_axis M
   	   MOM_do_template fifth_axis_rotate_move
           MOM_do_template clamp_C_axis
           set clamp_rotary_fifth_status "CLAMPED"
  
}  

#=============================================================
proc PB_CMD_unclamp_fifth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to unclamp the fifth axis.
#
#  Do NOT add this block to events or markers.  It is a static
#  block and it is not intended to be added to events.  Do NOT
#  change the name of this custom command.
#
    #MOM_output_literal "(Auto UnClamp)"
    global clamp_rotary_fifth_status
  MOM_do_template unclamp_C_axis
  set clamp_rotary_fifth_status "UNCLAMPED"
}

#=============================================================
proc AUTO_CLAMP { } {
#=============================================================
#
#  This procedure is used to automatically output clamp and unclamp
#  codes.  This procedure must be placed in the the procedure
#  << PB_CMD_kin_before_motion >>.  By default this procedure will
#  output M10 or M11 to do fourth axis clamping and unclamping or
#  M12 or M13 to do fifth axis clamping and unclamping.
#
   global clamp_rotary_fourth_status
   global clamp_rotary_fifth_status
   global mom_pos
   global mom_prev_pos
   global mom_sys_auto_clamp
   global mom_kin_machine_type

   if {![info exists mom_sys_auto_clamp]} {return}
   if {$mom_sys_auto_clamp != "ON"} {return}

#   if {![info exists clamp_rotary_fourth_status]} {set clamp_rotary_fourth_status "UNDEFINED"}
   if {![info exists clamp_rotary_fifth_status]} {set clamp_rotary_fifth_status "UNDEFINED"}


   set rotary_out [EQ_is_equal $mom_pos(4) $mom_prev_pos(4)]

   if {$rotary_out  == 0 && $clamp_rotary_fifth_status != "UNCLAMPED"} {
      PB_CMD_unclamp_fifth_axis
      set clamp_rotary_fifth_status "UNCLAMPED"
   } elseif {$rotary_out == 1 && $clamp_rotary_fifth_status != "CLAMPED"} {
      PB_CMD_clamp_fifth_axis
      set clamp_rotary_fifth_status "CLAMPED"
   }

}

#=============================================================
proc PB_CMD_kin_init_mill_xzc { } {
#=============================================================
#
# This procedure initializes the current post to output
# in XZC mode for a mill/turn.  The chuck will lock and
# be used as a rotary C axis.  All XY moves will be converted
# to X and C with X being a radius value and C the angle.
# The spindle can be specified as either parallel to the Z axis
# or perpendicular the Z axis.  The tool axis of the operation
# must be consistent with the defined spindle axis.  An error
# will be generated if the post cannot position to the specified
# spindle axis.
#

   global mom_kin_machine_type

   if [info exists mom_kin_machine_type] {
#      if { ![string match "*mill_turn*" $mom_kin_machine_type] } {
#return
#      }
   }


#***********
uplevel #0 {

if [info exists mom_kin_arc_output_mode] {
   set mom_sys_cartesian_arc_output_mode  $mom_kin_arc_output_mode
} else {
   set mom_sys_cartesian_arc_output_mode "LINEAR"
}

if [string match "POLAR" $mom_sys_coordinate_output_mode] {
   set mom_kin_arc_output_mode  "LINEAR"
} else {
   set mom_kin_arc_output_mode  $mom_sys_cartesian_arc_output_mode
}

#MOM_reload_kinematics

if [EQ_is_equal $mom_sys_spindle_axis(2) 1.0] {
   set mom_cycle_spindle_axis   2
} elseif [EQ_is_zero $mom_sys_spindle_axis(2)] {
   if [EQ_is_equal $mom_sys_spindle_axis(0) 1.0] {
      set mom_cycle_spindle_axis    0
      set mom_kin_caxis_rotary_pos  0.0
   } elseif [EQ_is_zero $mom_sys_spindle_axis(0)] {
      set mom_cycle_spindle_axis    1
      set mom_kin_caxis_rotary_pos  90.0
   } elseif [EQ_is_equal $mom_sys_spindle_axis(0) -1.0] {
      set mom_cycle_spindle_axis    0
      set mom_kin_caxis_rotary_pos  180.0
   }
}


#=============================================================
proc MOM_set_polar { } {
#=============================================================
   global mom_sys_coordinate_output_mode mom_coordinate_output_mode
   global mom_kin_arc_output_mode prev_mom_kin_arc_output_mode

}

#=============================================================
proc VMOV { n p1 p2 } {
#=============================================================
   upvar $p1 v1 ; upvar $p2 v2

   for {set i 0} {$i < $n} {incr i} {
      set v2($i) $v1($i)
   }
}

} ;# uplevel
#***********
}


#=============================================================
proc MILL_TURN {  } {
#=============================================================
   global mom_tool_axis mom_sys_spindle_axis mom_cycle_retract_to
   global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos
   global mom_cycle_retract_to_pos mom_cycle_rapid_to mom_cycle_feed_to
   global mom_kin_5th_axis_direction mom_kin_5th_axis_leader mom_sys_leader
   global mom_prev_rot_ang_5th mom_mcs_goto mom_motion_type
   global mom_out_angle_pos mom_pos mom_prev_pos
   global mom_sys_radius_output_mode mom_warning_info
   global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit

   set status  [CONVERT_POINT mom_mcs_goto mom_tool_axis mom_prev_pos mom_sys_radius_output_mode mom_pos]
   if {$status == "INVALID"} {
      set mom_warning_info "Invalid Tool Axis For Mill/Turn"
      MOM_catch_warning
   }

   if {![info exists mom_prev_rot_ang_5th]} {set mom_prev_rot_ang_5th 0.0}
   set mom_out_angle_pos(1) [ROTSET $mom_pos(4) $mom_prev_rot_ang_5th  $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)]
   set mom_prev_pos(4) $mom_out_angle_pos(1)
   set mom_pos(4) $mom_out_angle_pos(1)
   MOM_reload_variable -a mom_out_angle_pos
   MOM_reload_variable -a mom_pos
   MOM_reload_variable -a mom_prev_pos
   if {$mom_pos(4) < $mom_kin_5th_axis_min_limit} {
      set mom_warning_info "C axis rotary position exceeds minimum limit, did not alter output"
      MOM_catch_warning
   } elseif {$mom_pos(4) > $mom_kin_5th_axis_max_limit} {
      set mom_warning_info "C axis rotary position exceeded maximum limit, did not alter output"
      MOM_catch_warning
   }

   if {$mom_motion_type == "CYCLE"} {
      for {set i 0} {$i < 3} {incr i} {
         set mom_cycle_rapid_to_pos($i)  [expr $mom_pos($i) + $mom_cycle_rapid_to*$mom_sys_spindle_axis($i)]
         set mom_cycle_feed_to_pos($i)  [expr $mom_pos($i) + $mom_cycle_feed_to*$mom_sys_spindle_axis($i)]
         set mom_cycle_retract_to_pos($i)  [expr $mom_pos($i) + $mom_cycle_retract_to*$mom_sys_spindle_axis($i)]
      }
   }
}

#=============================================================
proc CONVERT_POINT { input_point tool_axis prev_pos conversion_method converted_point } {
#=============================================================
   upvar $input_point v1; upvar $tool_axis ta ; upvar $converted_point v2
   upvar $prev_pos pp; upvar $conversion_method meth

   global mom_sys_spindle_axis mom_kin_caxis_rotary_pos
   global mom_sys_millturn_yaxis mom_kin_machine_resolution
   global mom_origin mom_translate
   global mom_tool_z_offset
   global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
   global mom_warning_info
   global RAD2DEG DEG2RAD PI

   VMOV 3 v1 temp

   if {[info exists mom_tool_z_offset]} {
       set toff(0) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(0)]
       set toff(1) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(1)]
       set toff(2) [expr $mom_tool_z_offset*$mom_sys_spindle_axis(2)]
   } else {
       set toff(0) 0.0
       set toff(1) 0.0
       set toff(2) 0.0
   }

   VEC3_add temp toff temp
   if { [info exists mom_origin] }    { VEC3_sub temp mom_origin temp }
   if { [info exists mom_translate] } { VEC3_add temp mom_translate temp }

   if { [EQ_is_equal $mom_sys_spindle_axis(2) 1.0] && [EQ_is_equal $ta(2) 1.0] } {

      set v2(0) [expr sqrt(pow($temp(0),2) + pow($temp(1),2))]
      set v2(1) 0.0
      set v2(2) $temp(2)
      set v2(4) [expr ([ARCTAN $temp(1) $temp(0)])*$RAD2DEG]
      set ang1 [LIMIT_ANGLE $v2(4)]
      if {$ang1 >= $mom_kin_5th_axis_min_limit && $ang1 <= $mom_kin_5th_axis_max_limit} {
         set ang1bad 0
      } else {
         set ang1 [expr $ang1 - 360.0]
         if {$ang1 >= $mom_kin_5th_axis_min_limit && $ang1 <= $mom_kin_5th_axis_max_limit} {
            set ang1bad 0
         } else {
            set ang1bad 1
         }
      }

      set ap(0) [expr -$v2(0)]
      set ap(1) 0.0
      set ap(2) $v2(2)
      set ap(3) 0.0
      set ap(4) [expr $v2(4)+180.0]
      if {$ap(4) >= 360.0} {set ap(4) [expr $ap(4) - 360.0]}
      set ang2 [LIMIT_ANGLE $ap(4)]
      if {$ang2 >= $mom_kin_5th_axis_min_limit && $ang2 <= $mom_kin_5th_axis_max_limit} {
         set ang2bad 0
      } else {
         set ang2 [expr $ang2 - 360.0]
         if {$ang2 >= $mom_kin_5th_axis_min_limit && $ang2 <= $mom_kin_5th_axis_max_limit} {
            set ang2bad 0
         } else {
            set ang2bad 1
         }
      }

      if {$meth == "ALWAYS_POSITIVE"} {
         if {$ang1bad} {
            set mom_warning_info "Fourth axis rotary angle not valid"
            MOM_catch_warning
         }
      } elseif {$meth == "ALWAYS_NEGATIVE"} {
         if {$ang2bad} {
            set mom_warning_info "Fourth axis rotary angle not valid"
            MOM_catch_warning
         }
         VMOV 5 ap v2
      } elseif {$ang2bad && $ang1bad} {
         set mom_warning_info "Fourth axis rotary angle not valid"
         MOM_catch_warning
      } elseif {$ang1bad == 1} {
         VMOV 5 ap v2
      } elseif {!$ang1bad && !$ang2bad} {
         set d1 [LIMIT_ANGLE [expr $v2(4) - $pp(4)]]
         if {$d1 > 180.} {set d1 [expr 360.0 - $d1]}
         set d2 [LIMIT_ANGLE [expr $ap(4) - $pp(4)]]
         if {$d2 > 180.} {set d2 [expr 360.0 - $d2]}
         if {$d2 < $d1} {VMOV 5 ap v2}
      }

   } elseif [EQ_is_zero $mom_sys_spindle_axis(2)] {

      set cpos [expr ([ARCTAN $ta(1) $ta(0)])]
      set cout [expr $cpos - $mom_kin_caxis_rotary_pos*$RAD2DEG]
      set crot [expr 2*$PI - $cout]

      set v2(0) [expr cos($crot)*$temp(0) - sin($crot)*$temp(1)]
      set v2(1) [expr sin($crot)*$temp(0) + cos($crot)*$temp(1)]
      set v2(2) $temp(2)
      set v2(4) [expr $cout*$RAD2DEG]

      if {$mom_sys_millturn_yaxis == "FALSE" && [expr abs($v2(1))] > $mom_kin_machine_resolution} {
         return "INVALID"
      }
   } else {
      return "INVALID"
   }

return "OK"
}

#***************************
# Source in user's tcl file.
#***************************
 set user_tcl_file ${cam_post_dir}Macturn30_user.tcl
 if { [file exists $user_tcl_file] } {
    source $user_tcl_file
 }


