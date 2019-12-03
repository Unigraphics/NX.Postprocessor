########################## TCL Event Handlers ##########################
#
#  Created by smithm  @  Mon Sep 05 13:49:12 2005 GMT Standard Time
#  with Post Builder version  3.3.0.
#
########################################################################

  set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]


  if { ![info exists mom_sys_post_initialized] } {

     source ${cam_post_dir}ugpost_base.tcl
 
     proc MOM_before_each_add_var {} {}
     proc MOM_before_each_event {} {}
 
#     set cam_debug_dir [MOM_ask_env_var UGII_CAM_DEBUG_DIR]
#     source ${cam_debug_dir}mom_review.tcl
 
     MOM_set_debug_mode OFF


   ####  Listing File variables 
     set mom_sys_list_output                       "OFF"
     set mom_sys_header_output                     "OFF"
     set mom_sys_list_file_rows                    "40" 
     set mom_sys_list_file_columns                 "30" 
     set mom_sys_warning_output                    "ON" 
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "H"  
     set mom_sys_commentary_output                 "ON" 
     set mom_sys_commentary_list                   "x y z 4axis 5axis feed speed"

     set mom_sys_control_out                       "; " 
     set mom_sys_control_in                        ""   

     set mom_sys_post_initialized 1
  }


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "L"  
  set mom_sys_linear_code                       "L"  
  set mom_sys_circle_code(CLW)                  "C"  
  set mom_sys_circle_code(CCLW)                 "C"  
  set mom_sys_delay_code(SECONDS)               "4"  
  set mom_sys_delay_code(REVOLUTIONS)           "4"  
  set mom_sys_cutcom_plane_code(XY)             "17" 
  set mom_sys_cutcom_plane_code(ZX)             "18" 
  set mom_sys_cutcom_plane_code(XZ)             "18" 
  set mom_sys_cutcom_plane_code(YZ)             "19" 
  set mom_sys_cutcom_plane_code(ZY)             "19" 
  set mom_sys_cutcom_code(OFF)                  "40" 
  set mom_sys_cutcom_code(LEFT)                 "41" 
  set mom_sys_cutcom_code(RIGHT)                "42" 
  set mom_sys_adjust_code                       "43" 
  set mom_sys_adjust_code_minus                 "44" 
  set mom_sys_adjust_cancel_code                "49" 
  set mom_sys_unit_code(IN)                     "70" 
  set mom_sys_unit_code(MM)                     "71" 
  set mom_sys_cycle_start_code                  "79" 
  set mom_sys_cycle_off                         ""   
  set mom_sys_cycle_drill_code                  "L"  
  set mom_sys_cycle_drill_dwell_code            "L"  
  set mom_sys_cycle_drill_deep_code             "L"  
  set mom_sys_cycle_drill_break_chip_code       "L"  
  set mom_sys_cycle_tap_code                    "L"  
  set mom_sys_cycle_bore_code                   "L"  
  set mom_sys_cycle_bore_drag_code              "L"  
  set mom_sys_cycle_bore_no_drag_code           "L"  
  set mom_sys_cycle_bore_dwell_code             "L"  
  set mom_sys_cycle_bore_manual_code            "L"  
  set mom_sys_cycle_bore_back_code              "L"  
  set mom_sys_cycle_bore_manual_dwell_code      "L"  
  set mom_sys_output_code(ABSOLUTE)             " "  
  set mom_sys_output_code(INCREMENTAL)          " "  
  set mom_sys_cycle_ret_code(AUTO)              ""   
  set mom_sys_cycle_ret_code(MANUAL)            ""   
  set mom_sys_reset_code                        "92" 
  set mom_sys_feed_rate_mode_code(IPM)          "94" 
  set mom_sys_feed_rate_mode_code(IPR)          "95" 
  set mom_sys_feed_rate_mode_code(FRN)          "93" 
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
  set mom_sys_spindle_direction_code(OFF)       "5"  
  set mom_sys_tool_change_code                  "6"  
  set mom_sys_coolant_code(ON)                  "8"  
  set mom_sys_coolant_code(FLOOD)               "8"  
  set mom_sys_coolant_code(MIST)                "7"  
  set mom_sys_coolant_code(THRU)                "26" 
  set mom_sys_coolant_code(TAP)                 "8"  
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
  set mom_sys_cir_vector                        "Vector - Absolute Arc Center"
  set mom_sys_spindle_ranges                    "0"  
  set mom_sys_rewind_stop_code                  "\#" 
  set mom_sys_home_pos(0)                       "0"  
  set mom_sys_home_pos(1)                       "0"  
  set mom_sys_home_pos(2)                       "520"
  set mom_sys_zero                              "0"  
  set mom_sys_opskip_block_leader               "/"  
  set mom_sys_seqnum_start                      "1"  
  set mom_sys_seqnum_incr                       "1"  
  set mom_sys_seqnum_freq                       "1"  
  set mom_sys_seqnum_max                        "999999999"
  set mom_sys_lathe_x_double                    "1"  
  set mom_sys_lathe_i_double                    "1"  
  set mom_sys_lathe_y_double                    "1"  
  set mom_sys_lathe_j_double                    "1"  
  set mom_sys_lathe_x_factor                    "1"  
  set mom_sys_lathe_y_factor                    "1"  
  set mom_sys_lathe_z_factor                    "1"  
  set mom_sys_lathe_i_factor                    "1"  
  set mom_sys_lathe_j_factor                    "1"  
  set mom_sys_lathe_k_factor                    "1"  
  set mom_sys_leader(N)                         ""   
  set mom_sys_leader(X)                         "X"  
  set mom_sys_leader(Y)                         "Y"  
  set mom_sys_leader(Z)                         "Z"  
  set mom_sys_leader(fourth_axis)               "A"  
  set mom_sys_leader(fifth_axis)                "B"  
  set mom_sys_contour_feed_mode(LINEAR)         "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "MMPM"
  set mom_sys_cycle_feed_mode                   "MMPM"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"
  set mom_sys_vnc_rapid_dogleg                  "1"  
  set mom_sys_prev_mach_head                    ""   
  set mom_sys_curr_mach_head                    ""   
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"
  set mom_sys_contour_feed_mode(ROTARY)         "MMPM"
  set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "MMPM"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
  set mom_sys_rapid_feed_mode(ROTARY)           "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "MMPM"
  set mom_sys_post_description                  ""

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "OFF"
  set mom_kin_4th_axis_leader                   "A"  
  set mom_kin_4th_axis_limit_action             "Warning"
  set mom_kin_4th_axis_max_limit                "0"  
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "-110"
  set mom_kin_4th_axis_plane                    "ZX" 
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Table"
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_ang_offset               "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0.0"
  set mom_kin_5th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_5th_axis_leader                   "B"  
  set mom_kin_5th_axis_limit_action             "Warning"
  set mom_kin_5th_axis_max_limit                "9999.999"
  set mom_kin_5th_axis_min_incr                 "0.001"
  set mom_kin_5th_axis_min_limit                "-9999.999"
  set mom_kin_5th_axis_plane                    "YZ" 
  set mom_kin_5th_axis_rotation                 "Reverse"
  set mom_kin_5th_axis_type                     "Table"
  set mom_kin_5th_axis_zero                     "0.0"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.01"
  set mom_kin_machine_resolution                ".001"
  set mom_kin_machine_type                      "3_axis_mill"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "3600"
  set mom_kin_max_fpm                           "15000"
  set mom_kin_max_fpr                           "100"
  set mom_kin_max_frn                           "100"
  set mom_kin_min_arc_length                    "0.001"
  set mom_kin_min_arc_radius                    "0.001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.01"
  set mom_kin_min_fpr                           "0.01"
  set mom_kin_min_frn                           "0.01"
  set mom_kin_output_unit                       "MM" 
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_pivot_guage_offset                ""   
  set mom_kin_post_data_unit                    "MM" 
  set mom_kin_rapid_feed_rate                   "40000"
  set mom_kin_tool_change_time                  ""   
  set mom_kin_x_axis_limit                      "600"
  set mom_kin_y_axis_limit                      "410"
  set mom_kin_z_axis_limit                      "520"




if [llength [info commands MOM_SYS_do_template] ] {
   if [llength [info commands MOM_do_template] ] {
      rename MOM_do_template ""
   }
   rename MOM_SYS_do_template MOM_do_template
}




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

    catch { OPEN_files } ; #open warning and listing files
    LIST_FILE_HEADER ; #list header in commentary listing



  global mom_sys_post_initialized
  if { $mom_sys_post_initialized > 1 } { return }


#************
uplevel #0 {


#=============================================================
proc MOM_sync {} {
#=============================================================
  if [llength [info commands PB_CMD_kin_handle_sync_event] ] {
    PB_CMD_kin_handle_sync_event
  }
}


#=============================================================
proc MOM_set_csys {} {
#=============================================================
  if [llength [info commands PB_CMD_kin_set_csys] ] {
    PB_CMD_kin_set_csys
  }
}


#=============================================================
proc MOM_msys {} {
#=============================================================
}


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   PB_CMD_end_pos_z
   PB_CMD_end_cycle_time
   MOM_do_template end_of_program_3

#**** The following procedure lists the tool list with time in commentary data
   LIST_FILE_TRAILER

#**** The following procedure closes the warning and listing files
   CLOSE_files
}


  incr mom_sys_post_initialized


} ;# uplevel
#***********


}


#=============================================================
proc PB_DELAY_TIME_SET { } {
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
proc MOM_before_motion { } {
#=============================================================
  global mom_motion_event mom_motion_type

    FEEDRATE_SET


    switch $mom_motion_type {
      ENGAGE   {PB_engage_move}
      APPROACH {PB_approach_move}
      FIRSTCUT {PB_first_cut}
      RETRACT  {PB_retract_move}
      RETURN   {PB_return_move}
    }

    if [llength [info commands PB_CMD_kin_before_motion] ] { PB_CMD_kin_before_motion }
    if [llength [info commands PB_CMD_before_motion] ]     { PB_CMD_before_motion }
}


#=============================================================
proc MOM_start_of_group {} {
#=============================================================
  global mom_sys_group_output mom_group_name group_level ptp_file_name
  global mom_sequence_number mom_sequence_increment mom_sequence_frequency
  global mom_sys_ptp_output pb_start_of_program_flag

    if {![hiset group_level]} {set group_level 0 ; return}

    if {[hiset mom_sys_group_output]} {if {$mom_sys_group_output == "OFF"} {set group_level 0 ; return}}

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

    if [llength [info commands PB_machine_mode] ] {
       if [catch {PB_machine_mode} res] {
          global mom_warning_info
          set mom_warning_info "$res"
          MOM_catch_warning
       }
    }
}


#=============================================================
proc PB_FORCE { option args } {
#=============================================================
   set adds [join $args]
   if { [info exists option] && [llength $adds] } {
      lappend cmd MOM_force
      lappend cmd $option
      lappend cmd [join $adds]
      eval [join $cmd]
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

   PB_CMD_initialise_variables
   PB_CMD_new_procedures
   PB_CMD_pp_version
}


#=============================================================
proc MOM_start_of_path { } {
#=============================================================
  global mom_sys_in_operation
   set mom_sys_in_operation 1

  global first_linear_move ; set first_linear_move 0
   TOOL_SET MOM_start_of_path

   if [llength [info commands PB_CMD_kin_start_of_path] ] {
      PB_CMD_kin_start_of_path
   }

}


#=============================================================
proc MOM_from_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
}


#=============================================================
proc MOM_first_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   MOM_set_seq_off
   PB_CMD_check_update_post_from_tool_is_on
   MOM_do_template start_of_program_1
   MOM_set_seq_on
   PB_CMD_part_name
   PB_CMD_output_pp_version
   PB_CMD_set_blk_form
}


#=============================================================
proc PB_auto_tool_change { } {
#=============================================================
}


#=============================================================
proc PB_manual_tool_change { } {
#=============================================================
   MOM_do_template stop
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_start_of_operation_force
   PB_CMD_force_spindle_start_code
   PB_CMD_check_tool_number
   MOM_force Once Text T Text S
   MOM_do_template tool_change_1
   MOM_do_template initial_move_1
   PB_CMD_start_up_stuff

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
   PB_CMD_start_of_operation_force
   PB_CMD_path_name
   catch {MOM_$mom_motion_event}
}


#=============================================================
proc PB_approach_move { } {
#=============================================================
}


#=============================================================
proc PB_engage_move { } {
#=============================================================
}


#=============================================================
proc PB_first_cut { } {
#=============================================================
}


#=============================================================
proc PB_first_linear_move { } {
#=============================================================
}


#=============================================================
proc PB_retract_move { } {
#=============================================================
}


#=============================================================
proc PB_return_move { } {
#=============================================================
}


#=============================================================
proc MOM_gohome_move { } {
#=============================================================
   MOM_rapid_move
}


#=============================================================
proc MOM_end_of_path { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_end_of_path] ] {
      PB_CMD_kin_end_of_path
   }

   global mom_sys_in_operation
   set mom_sys_in_operation 0
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
   TOOL_SET MOM_length_compensation
   MOM_do_template tool_length_adjust
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
}


#=============================================================
proc MOM_coolant_off { } {
#=============================================================
   COOLANT_SET
}


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
   MOM_do_template cutcom_off
}


#=============================================================
proc MOM_delay { } {
#=============================================================
   PB_DELAY_TIME_SET
   MOM_do_template delay_1
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

   PB_CMD_axis_limit_check
   MOM_force Once G_motion M
   MOM_do_template linear_move_1
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   CIRCLE_SET
   PB_CMD_axis_limit_check
   PB_CMD_circle_centre_mks
   PB_CMD_circle_direction
   MOM_force Once G_motion circle_direction M
   MOM_do_template circular_move_1
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
   PB_CMD_axis_limit_check
   PB_CMD_force_motion_command
   PB_CMD_datum_table
   set rapid_spindle_blk {G_motion X Y Z cutter_comp user_add}
   set rapid_spindle_x_blk {G_motion X cutter_comp user_add}
   set rapid_spindle_y_blk {G_motion Y cutter_comp user_add}
   set rapid_spindle_z_blk {G_motion Z cutter_comp user_add}
   set rapid_traverse_blk {G_motion X Y Z cutter_comp Text M_spindle}
   set rapid_traverse_xy_blk {G_motion X Y cutter_comp Text M_spindle}
   set rapid_traverse_yz_blk {G_motion Y Z cutter_comp Text M_spindle}
   set rapid_traverse_xz_blk {G_motion X Z cutter_comp Text M_spindle}
   set rapid_traverse_mod {G_motion Text}
   set rapid_spindle_mod {G_motion}

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
   PB_CMD_save_last_z
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
}


#=============================================================
proc MOM_cycle_plane_change { } {
#=============================================================
  global cycle_init_flag

   set cycle_init_flag TRUE
   PB_CMD_cycle_plane_change
   set cycle_init_flag FALSE
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_drill
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_drill_dwell
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_drill_deep
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_drill_break_chip
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_tap
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_bore
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_bore_drag
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_bore_no_drag
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_bore_manual
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_bore_dwell
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_bore_back
   MOM_do_template cycle_parameters
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

   PB_CMD_cycle_init
   PB_CMD_axis_limit_check
   MOM_do_template cycle_bore_manual_dwell
   MOM_do_template cycle_parameters
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
proc PB_CMD_axis_limit_check { } {
#=============================================================
global mom_x_axis_minimum
global mom_x_axis_maximum
global mom_y_axis_minimum
global mom_y_axis_maximum
global mom_pos

set actual_x_val [format "%.4f" $mom_pos(0)]
set actual_y_val [format "%.4f" $mom_pos(1)]
set axis_limit_error "\n\n *** Axis limit exceeded at X$actual_x_val Y$actual_y_val ***\n*** Machine limts are X-min $mom_x_axis_minimum, X-max $mom_x_axis_maximum, Y-min $mom_y_axis_minimum and Y-max $mom_y_axis_maximum ***\n\n"


if {$mom_pos(0) < $mom_x_axis_minimum} {MOM_abort "$axis_limit_error"} elseif {$mom_pos(0) > $mom_x_axis_maximum} {MOM_abort "$axis_limit_error"} elseif {$mom_pos(1) < $mom_y_axis_minimum} {MOM_abort "$axis_limit_error"} elseif {$mom_pos(1) > $mom_y_axis_maximum} {MOM_abort "$axis_limit_error"}
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
global mom_cutcom_status cutter_comp

if {![info exist mom_cutcom_status]} {
    set cutter_comp "R0"
} elseif {$mom_cutcom_status == "OFF"} {
    set cutter_comp "R0"
} elseif {$mom_cutcom_status == "LEFT"} {
    set cutter_comp "RL"
} elseif {$mom_cutcom_status == "OFF"} {
    set cutter_comp "RR"
}
}


#=============================================================
proc PB_CMD_check_tool_number { } {
#=============================================================
global mom_tool_number
global mom_operation_name

set minimum_tool_number 1
set maximum_tool_number 22

if {$mom_tool_number < $minimum_tool_number || $mom_tool_number > $maximum_tool_number} {MOM_abort "\n\n***** Invalid tool number $mom_tool_number in operation $mom_operation_name *****\n\n"}
}


#=============================================================
proc PB_CMD_check_update_post_from_tool_is_on { } {
#=============================================================
  global mom_update_post_cmds_from_tool
  if {$mom_update_post_cmds_from_tool  == 0} {MOM_abort "\n\n***** Update Post From Tool option is not turned on! *****\n\n"}
}


#=============================================================
proc PB_CMD_circle_centre_mks { } {
#=============================================================
global mom_pos_arc_plane

switch $mom_pos_arc_plane { XY { MOM_force once X
           MOM_force once Y
           MOM_do_template circular_move_2_2
          }
       YZ { MOM_force once Y
           MOM_force once Z
           MOM_do_template circular_move_2
          }
       ZX { MOM_force once X
           MOM_force once Z
           MOM_do_template circular_move_2_1
          }
       default {MOM_abort "Problem with circular motion"}
                          }
}


#=============================================================
proc PB_CMD_circle_direction { } {
#=============================================================
global mom_arc_direction circle_direction

if {$mom_arc_direction == "CLW"} {set circle_direction "DR-"}
if {$mom_arc_direction == "CCLW"} {set circle_direction "DR+"}

global mom_pos_arc_plane

switch $mom_pos_arc_plane {
       XY { MOM_force once X Y}
       YZ { MOM_force once Y Z}
       ZX { MOM_force once X Z}
       default {MOM_abort "Problem with circular motion"}
                          }
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
  MOM_output_literal "M10"
}


#=============================================================
proc PB_CMD_custom_command { } {
#=============================================================
global cycle_init_flag
set cycle_init_flag "TRUE"
}


#=============================================================
proc PB_CMD_cycle_init { } {
#=============================================================
# Heidenhain TNC410
#
# The peckimg action of the PECKING cycle (cycle 1) on this software version is "deep".
# Cycle 1 is used for all drilling cycles execept "BREAK CHIP" which uses cycle 203
#
# The customer uses RIGID TAPPING, so cycle 17 is supported for tapping
#
# BORE and BORE,DWELL is supported with the REAMING cycle, 201
#
# The BORING cycle, 202, can include 0.2mm pull-off in X or Y (direction set by Q214),
# so "BORE,DRAG", "BORE,NODRAG", "BORE" and "BORE,DWELL" are the only boring cycles supported.
# All others will give an error message.
#

global cycle_init_flag mom_cycle_delay

global mom_motion_event   mom_cycle_feed_to       
global mom_tool_diameter   mom_cycle_step1   
global cycle_peck_size cycle_type_number   ;# js
global cycle_type_name                     ;# mks 
global js_prev_pos			   ;# diy previous Z height
global js_return_pos			   ;# returnZ incremental from top of hole
global mom_tool_flute_length

global mom_pos		;# xy and especially Z of this hole
global mom_prev_pos	;# ditto - previous hole
global mom_cycle_retract_mode

global mom_cycle_rapid_to
global mom_cycle_retract_to
global mom_cycle_feed_rate_per_rev
global mom_cycle_feed_rate
global mom_cycle_delay
global mom_cycle_orient
global spindle_orientation_direction
global spindle_orientation_204

global old_mom_cycle_rapid_to
global old_mom_cycle_feed_to
global old_cycle_peck_size
global old_mom_cycle_delay
global old_mom_cycle_feed_rate
global old_js_return_pos
global old_mom_prev_pos
global old_mom_pos
global old_spindle_orientation_direction
global old_spindle_orientation_204
global old_mom_cycle_retract_to

global old_cycle_type_number
global old_mom_cycle_feed_rate_per_rev

global mom_counter_bore_depth
global mom_counter_bore_pullout

global mks_first_cycle_after_tool_chage_flag

if {$mks_first_cycle_after_tool_chage_flag == "TRUE"} { set cycle_init_flag "TRUE"
                                                       set mks_first_cycle_after_tool_chage_flag "FALSE"
                                                      } else {set cycle_init_flag "FALSE"}

if {![info exists mom_cycle_delay]} {set mom_cycle_delay 0}

# peck sizes 
set cycle_peck_size [expr ($mom_cycle_feed_to*(-1.0))] 	;# single peck size most cycles
if { $mom_motion_event == "drill_deep_move" || $mom_motion_event == "drill_break_chip_move"} {

    if {($mom_cycle_step1 == 0)} {
	set cycle_peck_size  $mom_tool_diameter ;# default peck  if not set
    }  else {
	set cycle_peck_size  $mom_cycle_step1	;# real peck
    } 
}

set js_return_pos [expr $js_prev_pos - $mom_prev_pos(2)] ;# calc incr retract

# UGLY HACK start
# normally cycle_init_flag is only set if this is a new cycle
#  it is specifically unset in cycle_plane_change event, which
#  happens when a drilling operation goes uphill, 
#  ( drills a hole at a higher Z than the previous hole) 
#  it is _not_ set  when drilling downhill.
#  this next bit of code sets the variable for up or downhill
#  so that the new hole is defined - this is absolutely required
#  to ensure the hole Z height Q203 is set correctly.

#if { $mom_pos(2) != $mom_prev_pos(2) }  {
#	set cycle_init_flag  "TRUE"
#}

#  UGLY HACK end


# Heidenhain cycle types

switch $mom_motion_event {
       bore_move {
	set cycle_type_number 201
        set cycle_type_name "201 REAMING ~"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate ||  ![info exists old_mom_pos(2)] ||  [expr abs($old_mom_pos(2)) - abs($mom_pos(2))] > .0001 ||  ![info exists old_mom_cycle_retract_to] ||  [expr abs($old_mom_cycle_retract_to) - abs($mom_cycle_retract_to)] > .0001
           } {set cycle_init_flag "TRUE"}
            }
       bore_dwell_move {
	set cycle_type_number 201
        set cycle_type_name "201 REAMING ~"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate ||  ![info exists old_mom_pos(2)] ||  [expr abs($old_mom_pos(2)) - abs($mom_pos(2))] > .0001 ||  ![info exists old_mom_cycle_retract_to] ||  [expr abs($old_mom_cycle_retract_to) - abs($mom_cycle_retract_to)] > .0001
           } {set cycle_init_flag "TRUE"}
            }
       bore_no_drag_move {
	set cycle_type_number 202
        set cycle_type_name "202 BORING ~"
        if {![info exists spindle_orientation_direction] || $spindle_orientation_direction == 0} {set spindle_orientation_direction 1}
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate ||  ![info exists old_mom_pos(2)] ||  [expr abs($old_mom_pos(2)) - abs($mom_pos(2))] > .0001 ||  ![info exists old_mom_cycle_retract_to] ||  [expr abs($old_mom_cycle_retract_to) - abs($mom_cycle_retract_to)] > .0001 ||  ![info exists old_spindle_orientation_direction] ||  $old_spindle_orientation_direction != $spindle_orientation_direction
           } {set cycle_init_flag "TRUE"}
            }
       bore_drag_move {
	set cycle_type_number 202
        set cycle_type_name "202 BORING ~"
        set spindle_orientation_direction 0
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate ||  ![info exists old_mom_pos(2)] ||  [expr abs($old_mom_pos(2)) - abs($mom_pos(2))] > .0001 ||  ![info exists old_mom_cycle_retract_to] ||  [expr abs($old_mom_cycle_retract_to) - abs($mom_cycle_retract_to)] > .0001 ||  ![info exists old_spindle_orientation_direction] ||  $old_spindle_orientation_direction != $spindle_orientation_direction
           } {set cycle_init_flag "TRUE"}
            }
       bore_back_move {
	set cycle_type_number 204
        set cycle_type_name "204 BACK BORING ~"
        if {![info exists mom_counter_bore_depth]} {MOM_abort "\n\n*** Counter bore depth must be programmed with back boring *** \n\n"}
        if {![info exists mom_counter_bore_pullout]} {MOM_abort "\n\n*** Infeed distance must be programmed with back boring *** \n\n"}
        if {![info exists spindle_orientation_204]} {set spindle_orientation_204 1}
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate ||  ![info exists old_mom_pos(2)] ||  [expr abs($old_mom_pos(2)) - abs($mom_pos(2))] > .0001 ||  ![info exists old_mom_cycle_retract_to] ||  [expr abs($old_mom_cycle_retract_to) - abs($mom_cycle_retract_to)] > .0001 ||  ![info exists old_spindle_orientation_204] ||  $old_spindle_orientation_204 != $spindle_orientation_204
           } {set cycle_init_flag "TRUE"}
            }
       drill_move {
	set cycle_type_number 1
        set cycle_type_name "1.0 PECKING"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_cycle_peck_size] ||  [expr abs($old_cycle_peck_size) - abs($cycle_peck_size)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate
           } {set cycle_init_flag "TRUE"}
            }
       drill_deep_move {
	set cycle_type_number 1
        set cycle_type_name "1.0 PECKING"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_cycle_peck_size] ||  [expr abs($old_cycle_peck_size) - abs($cycle_peck_size)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate
           } {set cycle_init_flag "TRUE"}
            }
       drill_counter_sink_move {
	set cycle_type_number 1
        set cycle_type_name "1.0 PECKING"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_cycle_peck_size] ||  [expr abs($old_cycle_peck_size) - abs($cycle_peck_size)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate
           } {set cycle_init_flag "TRUE"}
            }
       drill_csink_dwell_move {
	set cycle_type_number 1
        set cycle_type_name "1.0 PECKING"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_cycle_peck_size] ||  [expr abs($old_cycle_peck_size) - abs($cycle_peck_size)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate
           } {set cycle_init_flag "TRUE"}
            }
       drill_dwell_move {
	set cycle_type_number 1
        set cycle_type_name "1.0 PECKING"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_cycle_peck_size] ||  [expr abs($old_cycle_peck_size) - abs($cycle_peck_size)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay ||  ![info exists old_mom_cycle_feed_rate] ||  $old_mom_cycle_feed_rate != $mom_cycle_feed_rate
           } {set cycle_init_flag "TRUE"}
            }
       drill_break_chip_move {
	set cycle_type_number 203
        set cycle_type_name "203 UNIVERSAL DRILLING ~"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay || ![info exists old_mom_cycle_feed_rate] || $old_mom_cycle_feed_rate != $mom_cycle_feed_rate ||  ![info exists old_mom_pos(2)] ||  [expr abs($old_mom_pos(2)) - abs($mom_pos(2))] > .0001 ||  ![info exists old_mom_cycle_retract_to] ||  [expr abs($old_mom_cycle_retract_to) - abs($mom_cycle_retract_to)] > .0001 ||  ![info exists old_cycle_peck_size] ||  [expr abs($old_cycle_peck_size) - abs($cycle_peck_size)] > .0001
            } {set cycle_init_flag "TRUE"}
           }
       tap_move {
	set cycle_type_number 17
        set cycle_type_name "17.0 RIGID TAPPING GS"
        if { ![info exists old_cycle_type_number] ||  $old_cycle_type_number != $cycle_type_number ||  ![info exists old_mom_cycle_rapid_to] ||  [expr abs($old_mom_cycle_rapid_to) - abs($mom_cycle_rapid_to)] > .0001 ||  ![info exists old_mom_cycle_feed_to] ||  [expr abs($old_mom_cycle_feed_to) - abs($mom_cycle_feed_to)] > .0001 ||  ![info exists old_mom_cycle_feed_rate_per_rev] ||  $old_mom_cycle_feed_rate_per_rev != $mom_cycle_feed_rate_per_rev
           } {set cycle_init_flag "TRUE"}
            }
      default {MOM_abort "\n\n**** Unsupported cycle type $mom_motion_event ****\n\n"}
}

if {$cycle_init_flag == "TRUE"} {

 MOM_do_template cycle_block		;# cycle def 1/201 etc
 MOM_set_seq_off

#if {[info exists old_cycle_type_number]} {MOM_output_literal "old cycle number $old_cycle_type_number"}
#MOM_output_literal "Cycle number is $cycle_type_number"
#if {[info exists old_mom_cycle_rapid_to]} {MOM_output_literal "Old rapto is $old_mom_cycle_rapid_to"}
#MOM_output_literal "Rapto $mom_cycle_rapid_to"
#if {[info exists old_mom_cycle_feed_to]} {MOM_output_literal "Old feedto $old_mom_cycle_feed_to"}
#MOM_output_literal "Feedto is $mom_cycle_feed_to"
#if {[info exists old_cycle_peck_size]} {MOM_output_literal "old peck $old_cycle_peck_size"}
#MOM_output_literal "Peck size $cycle_peck_size"
#if {[info exists old_mom_cycle_delay]} {MOM_output_literal "Old dwell $old_mom_cycle_delay"}
#MOM_output_literal "Dwell is $mom_cycle_delay"
#if {[info exists old_mom_cycle_feed_rate]} {MOM_output_literal "Old feedrate is $old_mom_cycle_feed_rate"}
#MOM_output_literal "Feed $mom_cycle_feed_rate"
#if {[info exists old_mom_prev_pos]} {MOM_output_literal "Old ps is $old_mom_prev_pos(2)"}
#MOM_output_literal "Prev pos $mom_prev_pos(2)"
#if {[info exists old_js_return_pos]} {MOM_output_literal "Old js pos is $old_js_return_pos"}
#MOM_output_literal "JS return $js_return_pos"

switch $cycle_type_number {
                      1 {
                           MOM_set_seq_on
                           MOM_do_template cycle_block_cycle_1		;# Setup ( engage ) ht 
                           MOM_do_template cycle_block_cycle_2		;# Hole depth ( incremental )
    	                   MOM_do_template cycle_block_cycle_4		;# Peck size
                           MOM_do_template cycle_block_cycle_7		;# Cycle dwell
                           MOM_force once F
                           MOM_do_template cycle_block_cycle_3		;# Cycle Feed
                           set old_mom_cycle_rapid_to $mom_cycle_rapid_to
                           set old_mom_cycle_feed_to $mom_cycle_feed_to
                           set old_cycle_peck_size $cycle_peck_size
                           set old_mom_cycle_delay $mom_cycle_delay
                           set old_mom_cycle_feed_rate $mom_cycle_feed_rate
                         }
                      17 {
                          MOM_set_seq_on
                          MOM_do_template cycle_block_tap_1		;# Setup ( engage ) ht 
                          MOM_do_template cycle_block_tap_2		;# Hole depth ( incremental )
                          MOM_force once cycle_tap_lead
                          MOM_do_template cycle_block_tap_3		;# Cycle Feed
                          set old_mom_cycle_rapid_to $mom_cycle_rapid_to
                          set old_mom_cycle_feed_to $mom_cycle_feed_to
                          set old_mom_cycle_feed_rate_per_rev $mom_cycle_feed_rate_per_rev
                         }
                     201 {
                          MOM_do_template cycle_block_1		;# Q200 setup ( engage ) ht 
                          MOM_do_template cycle_block_2		;# Q201 hole depth ( incremental )
 	                  MOM_do_template cycle_block_3	        ;# Q206 feedrate units/min
                          MOM_do_template cycle_block_7_1       ;# Q211 cycle dwell
                          MOM_output_literal "Q208=0 ~"
                          MOM_do_template cycle_block_6		;# Q203 Z of top of hole ( absolute )
                          MOM_do_template cycle_block_8_1	;# Q204 Z-return after cycle ( incremental )
                          set old_mom_cycle_rapid_to $mom_cycle_rapid_to
			  set old_mom_cycle_feed_to $mom_cycle_feed_to
			  set old_mom_cycle_delay $mom_cycle_delay
                          set old_mom_cycle_feed_rate $mom_cycle_feed_rate
                          set old_mom_pos(2) $mom_pos(2)
                          set old_mom_cycle_retract_to $mom_cycle_retract_to
                        }
                    202 {
                         # Bore with spindle positioning and fixed-distance retraction in X or Y
                         MOM_do_template cycle_block_1		;# Q200 setup ( engage ) ht 
                         MOM_do_template cycle_block_2		;# Q201 hole depth ( incremental )
 	                 MOM_do_template cycle_block_3   	;# Q206 feedrate units/min
                         MOM_do_template cycle_block_7_1	;# Q211 cycle dwell
                         MOM_output_literal "Q208=0 ~"          ;# Q208 retraction feed
                         MOM_do_template cycle_block_6		;# Q203 Z of top of hole ( absolute )
                         MOM_do_template cycle_block_8		;# Q204 Z-return after cycle ( incremental )
                         MOM_output_literal "Q214=$spindle_orientation_direction"
                         set old_mom_cycle_rapid_to $mom_cycle_rapid_to
			 set old_mom_cycle_feed_to $mom_cycle_feed_to
			 set old_mom_cycle_delay $mom_cycle_delay
                         set old_mom_cycle_feed_rate $mom_cycle_feed_rate
                         set old_mom_pos(2) $mom_pos(2)
                         set old_mom_cycle_retract_to $mom_cycle_retract_to
                         set old_spindle_orientation_direction $spindle_orientation_direction
                       }
                   203 {
                        MOM_do_template cycle_block_1		;# Q200 setup ( engage ) ht 
                        MOM_do_template cycle_block_2		;# Q201 hole depth ( incremental )
 	                MOM_do_template cycle_block_3	        ;# Q206 feedrate units/mim
                        MOM_do_template cycle_block_4	        ;# Q202 peck depth
                        MOM_output_literal "Q210=0 ~"
                        MOM_do_template cycle_block_6		;# Q203 Z of top of hole ( absolute )
                        MOM_do_template cycle_block_8		;# Q204 Z-return after cycle ( incremental )
                        MOM_do_template cycle_block_4_1		;# Q212
                        MOM_output_literal "Q213=0 ~"
                        MOM_do_template cycle_block_4_5		;# Q205 set to (0.35 * $cycle_peck_size). 0 does not work!
                        MOM_do_template cycle_block_7_1 	;# Q211 cycle dwell
                        MOM_output_literal "Q208=0"
                        set old_mom_cycle_rapid_to $mom_cycle_rapid_to
		        set old_mom_cycle_feed_to $mom_cycle_feed_to
			set old_mom_cycle_delay $mom_cycle_delay
                        set old_cycle_peck_size $cycle_peck_size 
                        set old_mom_cycle_feed_rate $mom_cycle_feed_rate
                        set old_mom_pos(2) $mom_pos(2)
                        set old_mom_cycle_retract_to $mom_cycle_retract_to
                       }
                   204 {
                        MOM_do_template cycle_block_1		;# Q200 setup ( engage ) ht
                        MOM_do_template cycle_block_4_2		;# Q249, counter bore depth
                        MOM_do_template cycle_block_2_1		;# Q250 hole depth ( incremental )
                        MOM_do_template cycle_block_4_3         ;# Q251 counter bore pullout
                        MOM_do_template cycle_block_4_4         ;# Q252 flute length
                        MOM_output_literal "Q253=1000 ~"		;# Q253 positioning feed, set to 1000mmpm
 	                MOM_do_template cycle_block_3_1	        ;# Q254 feedrate units/mim
                        MOM_do_template cycle_block_7_2 	;# Q255 cycle dwell
                        MOM_do_template cycle_block_6		;# Q203 Z of top of hole ( absolute )
                        MOM_do_template cycle_block_8		;# Q204 Z-return after cycle ( incremental )                        MOM_output_literal "Q214=$spindle_orientation_direction"
                        MOM_output_literal "Q214=$spindle_orientation_204"
                        set old_mom_cycle_rapid_to $mom_cycle_rapid_to
                        set old_mom_counter_bore_depth $mom_counter_bore_depth
                        set old_mom_counter_bore_pullout $mom_counter_bore_pullout
		        set old_mom_cycle_feed_to $mom_cycle_feed_to
			set old_mom_cycle_delay $mom_cycle_delay
                        set old_mom_cycle_feed_rate $mom_cycle_feed_rate
                        set old_mom_pos(2) $mom_pos(2)
                        set old_mom_cycle_retract_to $mom_cycle_retract_to
                        set old_spindle_orientation_204 $spindle_orientation_204
                       }
                     }

MOM_set_seq_on
set old_cycle_type_number $cycle_type_number
}
}


#=============================================================
proc PB_CMD_cycle_off { } {
#=============================================================
global cycle_init_flag
set cycle_init_flag "FALSE"
}


#=============================================================
proc PB_CMD_cycle_plane_change { } {
#=============================================================
# plane change happens when drilling operation goes uphill
# ie - when new hole is higher in Z than prev hole
# retract mode AUTO is return to clearance plane using
# Q204 ( which is like G98 ) so this next bit is only for
# case where cycles stay down 

global mom_cycle_retract_mode mom_cycle_rapid_to_pos mom_pos

if { $mom_cycle_retract_mode != "AUTO" } { 

	MOM_force Once  G_motion 	;# not sure why i need this
	MOM_do_template cycle_rapidtoZ	
  }
}


#=============================================================
proc PB_CMD_datum_table { } {
#=============================================================
global mks_datum_table_flag
global mom_datum_table_entry

if {$mks_datum_table_flag == "TRUE"} { MOM_output_literal "CYCL DEF 7.0 DATUM SHIFT"
                                      MOM_do_template datum_table
                                      set mks_datum_table_flag "FALSE"
                                     }
}


#=============================================================
proc PB_CMD_end_cycle_time { } {
#=============================================================
global mom_machine_time
global mom_output_comments_flag

if {$mom_output_comments_flag == "TRUE"} { set mom_machine_time [format "%.2f" $mom_machine_time]
                                          MOM_output_literal "; TOTAL MACHINE TIME: $mom_machine_time MINUTES"
                                         }
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
proc PB_CMD_end_pos_z { } {
#=============================================================
MOM_output_literal "L Z25 F MAX M2"
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
proc PB_CMD_force_motion_command { } {
#=============================================================
MOM_force always G_motion
}


#=============================================================
proc PB_CMD_force_spindle_start_code { } {
#=============================================================
MOM_force once M_spindle
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
proc PB_CMD_handle_sync_event { } {
#=============================================================
  global mom_sync_code
  global mom_sync_index
  global mom_sync_start
  global mom_sync_incr
  global mom_sync_max


  set mom_sync_start 	99
  set mom_sync_incr   	1
  set mom_sync_max	199


  if {![info exists mom_sync_code] } {
    set mom_sync_code $mom_sync_start
  }
  
  set mom_sync_code [expr $mom_sync_code + $mom_sync_incr]

  MOM_output_literal "M$mom_sync_code"
}


#=============================================================
proc PB_CMD_helical_output { } {
#=============================================================
global mom_pos_arc_plane
global mom_arc_angle
global mom_arc_direction
global mks_arc_angle

switch $mom_arc_direction { CLW {set mks_arc_angle [expr 0 - abs($mom_arc_angle)]}
                           CCLW {set mks_arc_angle [expr abs($mom_arc_angle)]}
                          }

switch $mom_pos_arc_plane { XY {MOM_do_template helical_move_xy}
                           YZ {MOM_do_template helical_move_yz}
                           ZX {MOM_do_template helical_move_zx}
                           default {MOM_abort "Problem with circular motion"}
                          }
MOM_force once X Y Z
}


#=============================================================
proc PB_CMD_init_rotary { } {
#=============================================================
uplevel #0 {

#
# Fourth Axis Auto Clamping is activated by programming the
# UDE CLAMP/AUTO,ON in your tool path.  Fourth Axis Auto
# Clamping may be turned off by programming the UDE CLAMP/AUTO,OFF.
#
# An M10 will be output to clamp the XYZ axis for fourth axis 
# motion. An M11 will be output to un-clamp the fourth axis 
# when fourth axis motion occurs in the block.  You may edit 
# the custom commands PB_CMD_clamp_fourth_axis or 
# PB_CMD_unclamp_fourth_axis to output codes other than M10 or M11.
# 
#
# Retract and Re-Engage Parameters
#
# This option is activated by setting the Axis Limit Violation 
# Handling option on the Machine Tool dialog to Retract / Re-Engage.  
#
# The sequence of actions that take place when a rotary limit violation
# occurs is a retract to the clearance plane at the rapid feedrate, 
# reposition the rotary axes so they do not violate, move back to 
# the engage point at the retract feedrate and engage into the part again.
#
# You can set additional parameters that will control the retract 
# and re-engage motion.
#
# The parameter "mom_kin_retract_plane" defines the distance
# from the center of rotation that the tool will retract when
# an axis violation occurs.  For a four axis head machine tool the
# retraction will be a cylinder.  For a five axis head machine tool
# the retraction will be to a sphere. For rotary tables the
# retraction will be to a plane along the spindle axis.
#

set mom_kin_retract_plane                      10.0


#
# The parameter "mom_kin_reengage_distance" defines the engage
# point above the part.
#

set mom_kin_reengage_distance                  .1


#
# The following parameters are used by UG Post.  Do NOT change 
# them unless you know what you are doing.
#

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
proc PB_CMD_initialise_variables { } {
#=============================================================
global mom_kin_helical_arc_output_mode
set mom_kin_helical_arc_output_mode FULL_CIRCLE

MOM_reload_kinematics

global mks_first_tool_flag
global mks_comment_count
global mom_prog_name
global ptp_file_name
global mks_define_blank_size
global mks_datum_table_flag
global mom_output_comments_flag

set mks_first_tool_flag "TRUE"
set mks_comment_count 1
set mks_define_blank_size "FALSE"
set mks_datum_table_flag "FALSE"
set mom_output_comments_flag "TRUE"

# Rotary axis clamping variables

global mom_fourth_axis_clamp_mode
global mom_fifth_axis_clamp_mode
global clamp_fourth_axis_flag
global clamp_fifth_axis_flag
global clamp_fourth_axis_code
global clamp_fifth_axis_code

set clamp_fourth_axis_code(ON) "10"
set clamp_fifth_axis_code(ON) "35"
set clamp_fourth_axis_code(OFF) "11"
set clamp_fifth_axis_code(OFF) "36"

set mom_fourth_axis_clamp_mode "FALSE"
set mom_fifth_axis_clamp_mode "FALSE"
set clamp_fourth_axis_flag "ON"
set clamp_fifth_axis_flag "ON"

# Axis limit checking
# Rotary axis limits are checked by UG/Post
# X & Y axis limits are checked
# Z-axis limits cannot be checked because UG does not know the tool length
# compensation register value.

global mom_x_axis_minimum
global mom_x_axis_maximum
global mom_y_axis_minimum
global mom_y_axis_maximum

set mom_x_axis_minimum -400
set mom_x_axis_maximum 400
set mom_y_axis_minimum -260
set mom_y_axis_maximum 260

# Extract "ptp" filename as programme identifier
if {[info exists ptp_file_name]} { set ptp_pos_1 [string last "\\" $ptp_file_name]
                                  set ptp_pos_2 [string last "." $ptp_file_name]
                                  #MOM_output_literal $ptp_file_name
                                  #MOM_output_literal "Final back slash is $ptp_pos_1"
                                  #MOM_output_literal "Final dp is $ptp_pos_2"
                                  set ptp_str1 [string range $ptp_file_name [expr $ptp_pos_1+1] [expr $ptp_pos_2-1]]
                                  #MOM_output_literal $ptp_str1
                                  set mom_prog_name [string toupper $ptp_str1]
                                 } else {set mom_prog_name 9999}
}


#=============================================================
proc PB_CMD_kin_before_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_end_of_path { } {
#=============================================================
  # Record tool time for this operation.
   if [llength [info commands PB_CMD_set_oper_tool_time] ] {
      PB_CMD_set_oper_tool_time
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
proc PB_CMD_kin_handle_sync_event { } {
#=============================================================
  PB_CMD_handle_sync_event
}


#=============================================================
proc PB_CMD_kin_init_auto_retract { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_init_mill_turn { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_init_mill_xzc { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_init_mill_xzc_1 { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_init_rotary { } {
#=============================================================
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
proc PB_CMD_kin_mill_xzc_init_1 { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_set_csys { } {
#=============================================================
   if [llength [info commands PB_CMD_set_csys] ] {
      PB_CMD_set_csys
   }
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


     #<06-17-03 gsl> Moved from MOM_head to
     # execute start of head callback in new post's context.
      global CURRENT_HEAD
      if { [info exists CURRENT_HEAD] &&  [llength [info commands PB_start_of_HEAD__$CURRENT_HEAD]] } {
         PB_start_of_HEAD__$CURRENT_HEAD
      }

      # Restore master start & end of program handlers
      if [llength [info commands "MOM_start_of_program_save"]] {
         if [llength [info commands "MOM_start_of_program"]] {
            rename MOM_start_of_program ""
         }
         rename MOM_start_of_program_save MOM_start_of_program 
      }
      if [llength [info commands "MOM_end_of_program_save"]] {
         if [llength [info commands "MOM_end_of_program"]] {
            rename MOM_end_of_program ""
         }
         rename MOM_end_of_program_save MOM_end_of_program 
      }

     # Restore master head change event handler
      if [llength [info commands "MOM_head_save"]] {
         if [llength [info commands "MOM_head"]] {
            rename MOM_head ""
         }
         rename MOM_head_save MOM_head
      }
   }

  # Initialize tool time accumulator for this operation.
   if [llength [info commands PB_CMD_init_oper_tool_time] ] {
      PB_CMD_init_oper_tool_time
   }

  # Force out motion G code at the start of path.
   MOM_force once G_motion
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
#  event marker is not executed again, neither is this procedure.
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

   lappend command_list  PB_CMD_init_pivot_offsets
   lappend command_list  PB_CMD_init_auto_retract
   lappend command_list  PB_CMD_initialize_parallel_zw_mode
   lappend command_list  PB_CMD_init_parallel_zw_mode
   lappend command_list  PB_CMD_initialize_tool_list
   lappend command_list  PB_CMD_init_tool_list
   lappend command_list  PB_CMD_init_tape_break
   lappend command_list  PB_CMD_initialize_spindle_axis
   lappend command_list  PB_CMD_init_spindle_axis
   lappend command_list  PB_CMD_initialize_helix
   lappend command_list  PB_CMD_init_helix
   lappend command_list  PB_CMD_pq_cutcom_initialize
   lappend command_list  PB_CMD_init_pq_cutcom
   lappend command_list  PB_CMD_init_new_iks

   if [info exists mom_kin_machine_type] {
      if { [string match "*3_axis_mill_turn*" $mom_kin_machine_type] } {

          lappend command_list  PB_CMD_kin_init_mill_xzc
          lappend command_list  PB_CMD_kin_mill_xzc_init
          lappend command_list  PB_CMD_kin_init_mill_turn
          lappend command_list  PB_CMD_kin_mill_turn_initialize
      }
   }

   foreach cmd $command_list {

      if [llength [info commands "$cmd"]] {

         # <PB v2.0.2>
         # Old init commands for XZC/MILL_TURN posts are not executed.
         # Parameters set by these commands in the v2.0 legacy posts
         # will need to be transfered to PB_CMD_init_mill_xzc &
         # PB_CMD_init_mill_turn commands respectively.

         switch $cmd {
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
proc PB_CMD_new_procedures { } {
#=============================================================
proc  MOM_operator_message {} {
#_______________________________________________________________________________
# This procedure is executed when the Operator Message command is activated.
#_______________________________________________________________________________

         global mom_operator_message mom_operator_message_defined
         global ptp_file_name group_output_file mom_group_name
         global mom_sys_commentary_output
         global mom_sys_control_in
         global mom_sys_control_out
         global mom_sys_ptp_output
         global mks_first_tool_flag
         global mks_comment
         global mks_comment_count
         global mom_output_comments_flag

#mks mod
if {$mom_output_comments_flag == "FALSE"} {set mom_operator_message_defined 0}

         if {[info exists mom_operator_message_defined] == 0} {return}
         
         if {$mom_operator_message_defined == 0} { return }
         

         if {$mom_operator_message != "ON" && $mom_operator_message != "OFF"} {
             set brac_start [string first \( $mom_operator_message]
             set brac_end [string last \) $mom_operator_message]
             if {$brac_start != 0} {
               set text_string "("
             } else {
               set text_string ""
             }
             append text_string $mom_operator_message
             if {$brac_end != [expr [string length $mom_operator_message] -1]} {
               append text_string ")"
             }

             if {$mks_first_tool_flag == "FALSE"} {MOM_set_seq_off}
             MOM_close_output_file   $ptp_file_name
             if {[hiset mom_group_name]} {
                if {[hiset group_output_file($mom_group_name)]} {
                   MOM_close_output_file $group_output_file($mom_group_name)
                }
             }
             if {$mks_first_tool_flag == "FALSE"} {MOM_output_literal      [string toupper $text_string]}
             if {$mom_sys_ptp_output == "ON"} {MOM_open_output_file    $ptp_file_name }
             if {[hiset mom_group_name]} {
                if {[hiset group_output_file($mom_group_name)]} {
                   MOM_open_output_file $group_output_file($mom_group_name)
                }
             }
             if {$mks_first_tool_flag == "FALSE"} {MOM_set_seq_on}
             set need_commentary $mom_sys_commentary_output
             set mom_sys_commentary_output OFF
             regsub -all {[)]} $text_string $mom_sys_control_in text_string
             regsub -all {[(]} $text_string $mom_sys_control_out text_string
             if {$mks_first_tool_flag == "FALSE"} {MOM_output_literal [string toupper $text_string]}
             set mom_sys_commentary_output $need_commentary
             if {$mks_first_tool_flag == "TRUE"} { set mks_comment($mks_comment_count) $text_string
                                                  set mks_comment($mks_comment_count) [string toupper $mks_comment($mks_comment_count)]
                                                  set mks_comment_count "[expr $mks_comment_count+1]"
                                                  #set mks_first_tool_flag "FALSE"
                                                  }
         }
}

proc  MOM_prog_identifier {} {
#_______________________________________________________________________________
# This procedure is executed when the programme identifier UDE is called.
#_______________________________________________________________________________

global mom_prog_name
set mom_prog_name [string toupper $mom_prog_name]

}

proc MOM_set_blk_form {} {

# Output Block Size blocks at stert of CNC programme

global mks_define_blank_size
set mks_define_blank_size "TRUE"

}


proc MOM_datum_table {} {
#_______________________________________________________________________________
# This procedure is executed whenever the datum table UDE is executed.
#_______________________________________________________________________________

global mks_datum_table_flag
set mks_datum_table_flag "TRUE"

}


proc MOM_probe_cycle_3 {} {

# echo back the post file location
# options for full path name, file name only , uppercase

  global mom_event_handler_file_name

  set test [expr [string last "\\" $mom_event_handler_file_name]+1]
  set output [string range $mom_event_handler_file_name $test end]
  set output [string toupper $output]
  
#MOM_output_literal $output
  if {$output != "HERMLE_C800U_PROBING.TCL"} { MOM_abort "\n\n *** The only post processor permitted for use with probing is HERMLE_C800U_PROBING *** \n\n"
        }
}

proc MOM_cycle_202_orient {} {

#
# This procedure is used to set the retract direction for the boring cycle, cycle number 202.
# It sets the value of Q214
#
# Q214 Value  Retract Direction
# ==========  =================
#
#     0          No retraction (a different cycle)
#     1		 -X (default)
#     2          -Y
#     3          +X
#     4          +Y
#

global mom_spindle_orient
global spindle_orientation_direction

set mom_spindle_orient [string toupper $mom_spindle_orient]

switch $mom_spindle_orient {
                            "X-MINUS" {set spindle_orientation_direction 1}
                            "Y-MINUS" {set spindle_orientation_direction 2}
                            "X-PLUS" {set spindle_orientation_direction 3}
                            "Y-PLUS" {set spindle_orientation_direction 4}
                            }
}

proc MOM_cycle_204_values {} {

#
# This procedure is used to set the retract direction for the boring cycle, cycle number 202.
# It sets the value of Q214
#
# Q214 Value  Retract Direction
# ==========  =================
#
#     0          No retraction (a different cycle)
#     1		 -X (default)
#     2          -Y
#     3          +X
#     4          +Y
#

global mom_spindle_orient
global spindle_orientation_204

set mom_spindle_orient [string toupper $mom_spindle_orient]

switch $mom_spindle_orient {
                            "X-MINUS" {set spindle_orientation_204 1}
                            "Y-MINUS" {set spindle_orientation_204 2}
                            "X-PLUS" {set spindle_orientation_204 3}
                            "Y-PLUS" {set spindle_orientation_204 4}
                            }
#MOM_output_literal "Orientation code is $spindle_orientation_204"
}

#=============================================================
proc MOM_helix_move { } {
#=============================================================
   CIRCLE_SET
   PB_CMD_axis_limit_check
   PB_CMD_circle_centre_mks
   PB_CMD_circle_direction
   MOM_force Once G_motion circle_direction M
   PB_CMD_helical_output
}
}


#=============================================================
proc PB_CMD_nurbs_initialize { } {
#=============================================================
#
#  You will need to activate nurbs motion in Unigraphics CAM under 
#  machine control to generate nurbs events.
#
#  This procedure is used to establish nurbs parameters.  It must be 
#  placed in the Start of Program marker to output nurbs.
#
uplevel #0 {

 set mom_kin_nurbs_output_type                  HEIDENHAIN_POLY
 
 MOM_reload_kinematics

proc  MOM_nurbs_move {} {
#_______________________________________________________________________________
# This procedure is executed for each Nurbs machining move.
#_______________________________________________________________________________
  global mom_nurbs_point_count
  global mom_nurbs_points 
  global mom_nurbs_coefficients 
  global mom_nurbs_points_x
  global mom_nurbs_points_y
  global mom_nurbs_points_z
  global mom_nurbs_co_efficient_0
  global mom_nurbs_co_efficient_1
  global mom_nurbs_co_efficient_2
  global mom_nurbs_co_efficient_3
  global mom_nurbs_co_efficient_4
  global mom_nurbs_co_efficient_5
  global mom_nurbs_co_efficient_6
  global mom_nurbs_co_efficient_7
  global mom_nurbs_co_efficient_8


  MOM_force once F
  
  MOM_do_template spline_start

  for {set ii 0} {$ii < $mom_nurbs_point_count} {incr ii} {
       set poly_output_mode "SPL"
       set mom_nurbs_points_x       $mom_nurbs_points($ii,0)
       set mom_nurbs_points_y       $mom_nurbs_points($ii,1)
       set mom_nurbs_points_z       $mom_nurbs_points($ii,2)
       set mom_nurbs_co_efficient_0 $mom_nurbs_coefficients($ii,0)
       set mom_nurbs_co_efficient_1 $mom_nurbs_coefficients($ii,1)
       set mom_nurbs_co_efficient_2 $mom_nurbs_coefficients($ii,2)
       set mom_nurbs_co_efficient_3 $mom_nurbs_coefficients($ii,3)
       set mom_nurbs_co_efficient_4 $mom_nurbs_coefficients($ii,4)
       set mom_nurbs_co_efficient_5 $mom_nurbs_coefficients($ii,5)
       set mom_nurbs_co_efficient_6 $mom_nurbs_coefficients($ii,6)
       set mom_nurbs_co_efficient_7 $mom_nurbs_coefficients($ii,7)
       set mom_nurbs_co_efficient_8 $mom_nurbs_coefficients($ii,8)

       MOM_do_template nurbs_spline
       MOM_do_template nurbs_coeff_x
       MOM_do_template nurbs_coeff_y
       MOM_do_template nurbs_coeff_z
  }

}

}
}


#=============================================================
proc PB_CMD_output_pp_version { } {
#=============================================================
global pp_version

MOM_output_literal "; POST PROCESSOR VERSION $pp_version"
}


#=============================================================
proc PB_CMD_part_name { } {
#=============================================================
# echo back the post file location
# options for full path name, file name only , uppercase

  global mom_part_name
  global mom_output_comments_flag

if {$mom_output_comments_flag == "TRUE"} {MOM_output_literal "; PART FILE: [ string toupper $mom_part_name]"}
}


#=============================================================
proc PB_CMD_path_name { } {
#=============================================================
global mom_path_name
global mom_output_comments_flag
if {$mom_output_comments_flag == "TRUE"} {MOM_output_literal "; [string toupper $mom_path_name]"}
}


#=============================================================
proc PB_CMD_pause { } {
#=============================================================
# This command enables you to pause the UG/Post processing.
#
  PAUSE
}


#=============================================================
proc PB_CMD_pp_version { } {
#=============================================================
global pp_version

# 19th January 2005
#
set pp_version "2.1"
#
# Switched on warnings files
# Added support for "MOM_helix_move" for use with NX3

# Version 2.1, 5 September 2005
#
# 1) Removed S-code from circular motion block

}


#=============================================================
proc PB_CMD_programme_end_sub_programme { } {
#=============================================================
MOM_output_literal "CALL PGM \\9116.I"
}


#=============================================================
proc PB_CMD_ptp_file_name { } {
#=============================================================
global ptp_file_name
if {[info exists ptp_file_name]} {MOM_output_literal "Output file: $ptp_file_name"} else {MOM_output_literal "No output file"}
}


#=============================================================
proc PB_CMD_reset_axes { } {
#=============================================================
MOM_suppress off X Y Z
}


#=============================================================
proc PB_CMD_reset_circle_centre { } {
#=============================================================
global mom_pos_arc_plane

if {$mom_pos_arc_plane == "YZ"} {MOM_force always Y Z} elseif {$mom_pos_arc_plane == "ZX"} {MOM_force always X Z} elseif {$mom_pos_arc_plane == "XY"} {MOM_force always X Y} else {MOM_abort "Error in circular motion"}
}


#=============================================================
proc PB_CMD_rest_axis_modality { } {
#=============================================================
MOM_force off X Y Z
}


#=============================================================
proc PB_CMD_rotary_axis_canned_cycle_clamp { } {
#=============================================================
global mom_fourth_axis_clamp_mode
global mom_fifth_axis_clamp_mode
global clamp_fourth_axis_flag
global clamp_fifth_axis_flag
global mom_rotary_delta_4th
global mom_rotary_delta_5th
global mks_initial_move_flag


  if {$mom_fourth_axis_clamp_mode == "TRUE"} { if {$clamp_fourth_axis_flag == "OFF"} { MOM_do_template fourth_axis_clamp
                                                                                     set clamp_fourth_axis_flag "ON"
                                                                                    }
                                             }

  if {$mom_fifth_axis_clamp_mode == "TRUE"} { if {$clamp_fifth_axis_flag == "OFF"} { MOM_do_template fifth_axis_clamp
                                                                                   set clamp_fifth_axis_flag "ON"
                                                                                  }
                                            }

set mks_initial_move_flag "FALSE"
}


#=============================================================
proc PB_CMD_rotary_axis_clamp { } {
#=============================================================
global mom_fourth_axis_clamp_mode
global mom_fifth_axis_clamp_mode
global clamp_fourth_axis_flag
global clamp_fifth_axis_flag
global mom_rotary_delta_4th
global mom_rotary_delta_5th
global mks_initial_move_flag


  if {$mom_fourth_axis_clamp_mode == "TRUE"} { if {$clamp_fourth_axis_flag == "OFF" && ($mom_rotary_delta_4th == 0 || $mks_initial_move_flag == "TRUE")} { MOM_do_template fourth_axis_clamp
                     set clamp_fourth_axis_flag "ON"
                    } elseif {$clamp_fourth_axis_flag == "ON" && $mom_rotary_delta_4th != 0} { MOM_do_template fourth_axis_unclamp
                     set clamp_fourth_axis_flag "OFF"
                    }

}

  if {$mom_fifth_axis_clamp_mode == "TRUE"} { if {$clamp_fifth_axis_flag == "OFF" && ($mom_rotary_delta_5th == 0 || $mks_initial_move_flag == "TRUE")} { MOM_do_template fifth_axis_clamp
                     set clamp_fifth_axis_flag "ON"
                    } elseif {$clamp_fifth_axis_flag == "ON" && $mom_rotary_delta_5th != 0} { MOM_do_template fifth_axis_unclamp
                     set clamp_fifth_axis_flag "OFF"
                    }

}

set mks_initial_move_flag "FALSE"
}


#=============================================================
proc PB_CMD_rotary_axis_unclamp { } {
#=============================================================
global mom_fourth_axis_clamp_mode
global mom_fifth_axis_clamp_mode
global clamp_fourth_axis_flag
global clamp_fifth_axis_flag
global mom_rotary_delta_4th
global mom_rotary_delta_5th
global mks_initial_move_flag


if {$mom_fourth_axis_clamp_mode == "TRUE" || $mks_initial_move_flag == "TRUE"} { if {$clamp_fourth_axis_flag == "ON" && ($mom_rotary_delta_4th != 0 || $mks_initial_move_flag == "TRUE")} { MOM_do_template fourth_axis_unclamp
                     set clamp_fourth_axis_flag "OFF"
                    } elseif {$clamp_fourth_axis_flag == "OFF" && $mom_rotary_delta_4th == 0} { MOM_do_template fourth_axis_clamp
                     set clamp_fourth_axis_flag "ON"
                    }

}

  if {$mom_fifth_axis_clamp_mode == "TRUE"|| $mks_initial_move_flag == "TRUE"} { if {$clamp_fifth_axis_flag == "ON" && ($mom_rotary_delta_5th != 0 || $mks_initial_move_flag == "TRUE")} { MOM_do_template fifth_axis_unclamp
                     set clamp_fifth_axis_flag "OFF"
                    } elseif {$clamp_fifth_axis_flag == "OFF" && $mom_rotary_delta_5th == 0} { MOM_do_template fifth_axis_clamp
                     set clamp_fifth_axis_flag "ON"
                    } 
}
}


#=============================================================
proc PB_CMD_save_last_z { } {
#=============================================================
# capture previous z height for use in cycles
# can't always use the simple mom_prev_pos in cycles so need
# a dedicated variable

global mom_pos
global js_prev_pos			   ;# diy previous Z height	

 if {[hiset mom_pos(2)]} {
	set js_prev_pos $mom_pos(2)
 } else {
	set js_prev_pos 0		   ;# irrelevant if not yet set
 }
}


#=============================================================
proc PB_CMD_set_blk_form { } {
#=============================================================

global mks_define_blank_size

if {$mks_define_blank_size =="TRUE"} { global mom_x_blk_form_min
                                      global mom_x_blk_form_max
                                      global mom_y_blk_form_min
                                      global mom_y_blk_form_max
                                      global mom_z_blk_form_min
                                      global mom_z_blk_form_max

                                      MOM_do_template blank_form_1
                                      MOM_do_template blank_form_2

                                      set mks_define_blank_size "FALSE"
                                     }
}


#=============================================================
proc PB_CMD_set_csys { } {
#=============================================================
#  This custom command is provided as the default to nullify
#  the same command in a linked post that may have been
#  imported from pb_cmd_coordinate_system_rotation.tcl.
}


#=============================================================
proc PB_CMD_set_cycle_plane { } {
#=============================================================
#
# Use this command to determine and output proper plane code
# when G17/18/19 is used in the cycle definition.
#


 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # This option can be set to 1, if the address of cycle's
 # principal axis needs to be suppressed. (Ex. siemens controller)
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set suppress_principal_axis 0


 #++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # This option can be set to 1, if the plane code needs
 # to be forced out @ the start of every set of cycles.
 #++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set force_plane_code 0


  global mom_kin_machine_type
  global mom_kin_4th_axis_type mom_kin_4th_axis_plane
  global mom_kin_5th_axis_type
  global mom_tool_axis mom_sys_spindle_axis mom_kin_spindle_axis
  global mom_pos
  global mom_cycle_spindle_axis mom_cutcom_plane mom_pos_arc_plane


 # Default cycle spindle axis to Z
  set mom_cycle_spindle_axis 2


  if { ![string match "*3_axis_mill*" $mom_kin_machine_type] } {

    if { $mom_kin_4th_axis_type == "Head" } {

      if [EQ_is_equal [expr abs($mom_tool_axis(0))] 1.0] {
        set mom_cycle_spindle_axis 0
      }

      if [EQ_is_equal [expr abs($mom_tool_axis(1))] 1.0] {
        set mom_cycle_spindle_axis 1
      }

      if { $mom_kin_5th_axis_type == "Table" } {

        if { [EQ_is_equal [expr abs($mom_pos(3))] 90.0] || [EQ_is_equal [expr abs($mom_pos(3))] 270.0] } {

          switch $mom_kin_4th_axis_plane {
            "YZ" {
              set mom_cycle_spindle_axis 1
            }
            "ZX" {
              set mom_cycle_spindle_axis 0
            }
          }
        }
      }
    }
  }


  switch $mom_cycle_spindle_axis {
    0 {
      set mom_cutcom_plane  YZ
      set mom_pos_arc_plane YZ
      set principal_axis X
    }
    1 {
      set mom_cutcom_plane  ZX
      set mom_pos_arc_plane ZX
      set principal_axis Y
    }
    2 {
      set mom_cutcom_plane  XY
      set mom_pos_arc_plane XY
      set principal_axis Z
    }
    default {
      set mom_cutcom_plane  UNDEFINED
      set mom_pos_arc_plane UNDEFINED
      set principal_axis ""
    }
  }


  if { $suppress_principal_axis && [string length $principal_axis] > 0 } {
    MOM_suppress once $principal_axis
  }


  if { $force_plane_code } {
    global cycle_init_flag

    if { [info exists cycle_init_flag] && [string match "TRUE" $cycle_init_flag] } {
      MOM_force once G_plane
    }
  }
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
proc PB_CMD_start_of_operation_force { } {
#=============================================================
  MOM_force once G_motion X Y Z F cutter_comp
}


#=============================================================
proc PB_CMD_start_of_operation_force_addresses { } {
#=============================================================
  MOM_force once S M_spindle X Y Z F
}


#=============================================================
proc PB_CMD_start_up_stuff { } {
#=============================================================
global mks_comment_count
global mks_comment
global mks_initial_move_flag
global mom_tool_name
global mks_datum_table_flag
global mom_datum_table_entry
global mom_path_name
global mks_first_cycle_after_tool_chage_flag
global mks_first_tool_flag
global mom_output_comments_flag

if {[info exists mks_comment]} { for {set count 1} {$count < $mks_comment_count} {incr count} {MOM_output_literal $mks_comment($count)}
                                 unset mks_comment
                               }

set mks_initial_move_flag "TRUE"
set mks_first_cycle_after_tool_chage_flag "TRUE"
set mks_first_tool_flag "FALSE"

if {[info exists mom_datum_table_entry]} {set mks_datum_table_flag "TRUE"}

if {$mom_output_comments_flag == "TRUE"} { MOM_output_literal "; $mom_tool_name"
                                          MOM_output_literal "; $mom_path_name"
                                         }
}


#=============================================================
proc PB_CMD_start_up_sub_programme { } {
#=============================================================
MOM_output_literal "CALL PGM \\9115.I"
}


#=============================================================
proc PB_CMD_suppress_axes { } {
#=============================================================
global mom_pos_arc_plane

switch $mom_pos_arc_plane { XY {MOM_suppress always Z}
                    YZ {MOM_suppress always X}
                    ZX {MOM_suppress always Y}
                    default {MOM_abort "Invalid value of mom_pos_arc_plane $mom_pos_arc_plane"}
                          }
}


#=============================================================
proc PB_CMD_tool_change_axis_unclamp { } {
#=============================================================
global clamp_fourth_axis_flag
global clamp_fifth_axis_flag
global mks_first_tool_flag

if {$mks_first_tool_flag == "FALSE"} { if {$clamp_fourth_axis_flag == "ON"} {MOM_do_template fourth_axis_unclamp}
     if {$clamp_fifth_axis_flag == "ON"} {MOM_do_template fifth_axis_unclamp}

     set clamp_fourth_axis_flag "ON"
     set clamp_fifth_axis_flag "ON"
    } else {set mks_first_tool_flag "FALSE"}
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  MOM_force once G_adjust H
}


#=============================================================
proc PB_CMD_trigger_canned_cycles { } {
#=============================================================
global cycle_init_flag
set cycle_init_flag "TRUE"
}


#=============================================================
proc PB_CMD_unclamp_fourth_axis { } {
#=============================================================
#
#  This procedure is used by auto clamping to output the code
#  needed to unclamp the fourth axis.  
#
#  Do NOT add this block to events or markers.  It is a static 
#  block and it is not intended to be added to events.  Do NOT 
#  change the name of this custom command.
#
  MOM_output_literal "M11"
}


#=============================================================
proc PAUSE { args } {
#=============================================================
  global env

  if { [info exists env(PB_SUPPRESS_UGPOST_DEBUG)] &&  $env(PB_SUPPRESS_UGPOST_DEBUG) == 1 } {
return
  }


  set cam_aux_dir  [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]

  global tcl_platform

  if [string match "*windows*" $tcl_platform(platform)] {
     set ug_wish "ugwish.exe"
  } else {
     set ug_wish ugwish
  }
 
  if { [file exists ${cam_aux_dir}$ug_wish] && [file exists ${cam_aux_dir}mom_pause.tcl] } {

     set title ""
     set msg ""

     if { [llength $args] == 1 } {
       set msg [lindex $args 0]
     }

     if { [llength $args] > 1 } {
       set title [lindex $args 0]
       set msg [lindex $args 1]
     }
 
     exec ${cam_aux_dir}$ug_wish ${cam_aux_dir}mom_pause.tcl $title $msg
  }
}


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
proc TRACE {  } {
#=============================================================
   set start_idx 1

   set str ""
   set level [info level]
   for {set i $start_idx} {$i < $level} {incr i} {
      set str "${str}[lindex [info level $i] 0]\n"
   }

return $str
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

  if {$mom_sys_lock_status == "ON"} {  
    if {$mom_current_motion != "circular_move"} {
      LOCK_AXIS mom_pos mom_pos mom_out_angle_pos
      MOM_reload_variable -a mom_out_angle_pos
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
proc LOCK_AXIS { input_point output_point output_rotary } {
#=============================================================
  upvar $input_point ip ; upvar $output_point op ; upvar $output_rotary or

  global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset
  global mom_pos mom_kin_4th_axis_plane mom_kin_5th_axis_plane    
  global mom_sys_lock_value mom_sys_lock_plane
  global mom_sys_lock_axis mom_sys_lock_status
  global mom_out_angle_pos mom_prev_out_angle_pos mom_kin_4th_axis_direction 
  global mom_kin_5th_axis_direction mom_kin_4th_axis_leader mom_kin_5th_axis_leader
  global mom_sys_leader 
  global DEG2RAD RAD2DEG
 
   if {$mom_sys_lock_status == "OFF"} {
      return
   }
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

      if {$mom_sys_lock_plane == $fourth_axis || $mom_sys_lock_plane == $fifth_axis} {
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
         set ang1 [LIMIT_ANGLE [expr $ip($i1)-$temp($i1)]]
         set ang2 [LIMIT_ANGLE [expr $ip($i1)-$temp1($i1)]]
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

   set or(0) [ROTSET $temp(3) $mom_prev_out_angle_pos(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)]
   if {[info exists mom_kin_5th_axis_direction]} {
      set or(1) [ROTSET $temp(4) $mom_prev_out_angle_pos(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)]
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
proc AUTO_CLAMP {  } {
#=============================================================
#
#  This procedure is used to automaticaaly output clamp and unclamp
#  codes.  This procedure must be placed in the the procedure
#  << PB_CMD_kin_before_motion >>.  By default this procedure will
#  output M10 or M11 to do the clamping and unclamping.
#
   global clamp_rotary_status mom_pos mom_prev_pos mom_sys_auto_clamp

   if {![info exists mom_sys_auto_clamp]} {return}
   if {$mom_sys_auto_clamp != "ON"} {return}

   if {![info exists clamp_rotary_status]} {set clamp_rotary_status "UNDEFINED"}

   set rotary_out [EQ_is_equal $mom_pos(3) $mom_prev_pos(3)]

   if {$rotary_out  == 0 && $clamp_rotary_status != "UNCLAMPED"} {
      PB_CMD_unclamp_fourth_axis
      set clamp_rotary_status "UNCLAMPED"
   } elseif {$rotary_out == 1 && $clamp_rotary_status != "CLAMPED"} {
      PB_CMD_clamp_fourth_axis
      set clamp_rotary_status "CLAMPED"
   }
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
         set lead "$kin_leader-"
      } else {
         set lead $kin_leader
      } 
   }

return $angle
}


#=============================================================
proc ROTARY_AXIS_RETRACT {  } {
#=============================================================
#
#  This procedure is used by four and five axis posts to retract
#  from the part when the rotary axis become discontinuous.  This
#  procedure must be placed in the MOM_before_motion event.  
#
  global mom_kin_retract_plane mom_kin_reengage_distance
  global mom_kin_rotary_reengage_feedrate mom_kin_rapid_feed_rate                      
  global mom_sys_rotary_error mom_pos mom_prev_pos 
  global mom_prev_out_angle_pos
  global mom_kin_4th_axis_direction mom_kin_4th_axis_leader 
  global mom_out_angle_pos mom_kin_5th_axis_direction mom_kin_5th_axis_leader 
  global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset
  global mom_sys_leader mom_tool_axis mom_prev_tool_axis mom_kin_4th_axis_type
  global mom_kin_spindle_axis mom_motion_event
  global mom_alt_pos mom_prev_alt_pos mom_feed_rate 
  global mom_kin_rotary_reengage_feedrate 
  global mom_feed_engage_value mom_feed_cut_value
  global mom_kin_4th_axis_limit_action mom_warning_info


   if {[info exists mom_sys_rotary_error] && [info exists mom_motion_event]} {

      if {$mom_sys_rotary_error != 0 && $mom_motion_event == "linear_move"} { 

         if {$mom_kin_4th_axis_limit_action == "Warning"} {
            set mom_warning_info  "Rotary axis limit violated, discontinuos motion may result"
            MOM_catch_warning
            unset mom_sys_rotary_error
            return 
         }


         if {$mom_sys_rotary_error == "ROTARY CROSSING LIMIT." } {
            set roterr 0
         } else {
            set roterr 1
         }

         unset mom_sys_rotary_error

        # Retract from part

         VMOV 5 mom_pos save_pos
         VMOV 5 mom_prev_pos save_prev_pos
         VMOV 2 mom_out_angle_pos save_out_angle_pos
         set save_feedrate $mom_feed_rate

         set cen(0) 0.0
         set cen(1) 0.0
         set cen(2) 0.0
         if [info exists mom_kin_4th_axis_center_offset] {
            VEC3_add cen mom_kin_4th_axis_center_offset cen
         }
         if [info exists mom_kin_5th_axis_center_offset] {
            VEC3_sub cen mom_kin_5th_axis_center_offset cen
         }
         if {$mom_kin_4th_axis_type == "Table"} {
            set num_sol [CALC_CYLINDRICAL_RETRACT_POINT mom_prev_pos mom_kin_spindle_axis $mom_kin_retract_plane ret_pt]
         } else {
            set num_sol [CALC_SPHERICAL_RETRACT_POINT mom_prev_pos mom_prev_tool_axis cen $mom_kin_retract_plane ret_pt]
         }

  
         set mom_feed_rate $mom_kin_rapid_feed_rate                      
         FEEDRATE_SET
  

         if {$num_sol != 0} {
            MOM_suppress once fourth_axis fifth_axis
            VEC3_add ret_pt cen mom_pos
            PB_CMD_linear_move
         }

        #
        # temporary fix for missing mom_prev_out_angle_pos(0)
        #
         if {![info exists mom_prev_out_angle_pos(0)]} {  
            set mom_prev_out_angle_pos(0) [MOM_ask_address_value fourth_axis]
         }
         if {![info exists mom_prev_out_angle_pos(1)]} {  
            set mom_prev_out_angle_pos(1) [MOM_ask_address_value fifth_axis]
         }


         if {$roterr == 0} {
           #
           # unwind table
           #
            if {[info exists mom_kin_4th_axis_direction]} {
               set mom_out_angle_pos(0) [ROTSET $mom_prev_pos(3) $mom_out_angle_pos(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)]
            }
            if {[info exists mom_kin_5th_axis_direction]} {
               set mom_out_angle_pos(1) [ROTSET $mom_prev_pos(4) $mom_out_angle_pos(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fourth_axis)]
            }
            MOM_suppress once X Y Z
            PB_CMD_linear_move
            for {set i 0} {$i < 3} {incr i} {
               set mom_pos($i) [expr $mom_prev_pos($i)+$mom_kin_reengage_distance*$mom_kin_spindle_axis($i)]
            }
            MOM_suppress once fourth_axis fifth_axis
            PB_CMD_linear_move
            VMOV 3 mom_prev_pos mom_pos
            MOM_suppress once fourth_axis fifth_axis
            if {$mom_feed_engage_value  > 0.0} {
               set mom_feed_rate $mom_feed_engage_value  
            } elseif {$mom_feed_cut_value  > 0.0} {
               set mom_feed_rate $mom_feed_cut_value  
            } else {
               set mom_feed_rate 10.0
            }
            FEEDRATE_SET
            PB_CMD_linear_move
            VMOV 5 save_pos mom_pos
            VMOV 5 save_prev_pos mom_prev_pos
            VMOV 2 save_out_angle_pos mom_out_angle_pos
         } else {
           #
           # move to alternate rotary position
           #
            set mom_out_angle_pos(0) [ROTSET $mom_prev_alt_pos(3) $mom_prev_out_angle_pos(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)]
            set mom_out_angle_pos(1) [ROTSET $mom_prev_alt_pos(4) $mom_prev_out_angle_pos(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fourth_axis)]
            MOM_suppress once X Y Z
            PB_CMD_linear_move
            for {set i 0} {$i < 3} {incr i} {
               set mom_pos($i) [expr $mom_prev_alt_pos($i)+$mom_kin_reengage_distance*$mom_prev_tool_axis($i)]
            }
            MOM_suppress once fourth_axis fifth_axis
            PB_CMD_linear_move
            VMOV 3 mom_prev_alt_pos mom_pos
            MOM_suppress once fourth_axis fifth_axis
            if {$mom_feed_engage_value  > 0.0} {
               set mom_feed_rate $mom_feed_engage_value  
            } elseif {$mom_feed_cut_value  > 0.0} {
               set mom_feed_rate $mom_feed_cut_value  
            } else {
               set mom_feed_rate 10.0
            }
            FEEDRATE_SET
            PB_CMD_linear_move

            VMOV 5 save_pos mom_pos
            VMOV 5 save_prev_pos mom_prev_pos

            set mom_out_angle_pos(0) [ROTSET $mom_pos(3) $mom_out_angle_pos(0) $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)]
            set mom_out_angle_pos(1) [ROTSET $mom_pos(4) $mom_out_angle_pos(1) $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fourth_axis)]

            MOM_reload_variable -a mom_out_angle_pos
         }

         set save_feedrate $mom_feed_rate
         FEEDRATE_SET
      }
   }
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


