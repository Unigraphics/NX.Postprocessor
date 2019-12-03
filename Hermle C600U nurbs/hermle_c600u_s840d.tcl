########################## TCL Event Handlers ##########################
#
#  Created by kleber  @  Wed May 19 12:31:44 2004 E. South America Daylight Time
#  with Post Builder version  3.2.0.
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
     set mom_sys_list_file_columns                 "132"
     set mom_sys_warning_output                    "OFF"
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "mpf"
     set mom_sys_commentary_output                 "ON" 
     set mom_sys_commentary_list                   "feed"

     set mom_sys_control_out                       "MSG ("
     set mom_sys_control_in                        ")"  

     set mom_sys_post_initialized 1
  }


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "0"  
  set mom_sys_linear_code                       "1"  
  set mom_sys_circle_code(CLW)                  "2"  
  set mom_sys_circle_code(CCLW)                 "3"  
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
  set mom_sys_unit_code(IN)                     "700"
  set mom_sys_unit_code(MM)                     "710"
  set mom_sys_cycle_start_code                  "79" 
  set mom_sys_cycle_off                         "80" 
  set mom_sys_cycle_drill_code                  "81" 
  set mom_sys_cycle_drill_dwell_code            "82" 
  set mom_sys_cycle_drill_deep_code             "83" 
  set mom_sys_cycle_drill_break_chip_code       "83" 
  set mom_sys_cycle_tap_code                    "84" 
  set mom_sys_cycle_bore_code                   "85" 
  set mom_sys_cycle_bore_drag_code              "87" 
  set mom_sys_cycle_bore_no_drag_code           "86" 
  set mom_sys_cycle_bore_dwell_code             "89" 
  set mom_sys_cycle_bore_manual_code            "88" 
  set mom_sys_cycle_bore_back_code              "88" 
  set mom_sys_cycle_bore_manual_dwell_code      "88" 
  set mom_sys_output_code(ABSOLUTE)             "90" 
  set mom_sys_output_code(INCREMENTAL)          "91" 
  set mom_sys_cycle_ret_code(AUTO)              "98" 
  set mom_sys_cycle_ret_code(MANUAL)            "99" 
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
  set mom_sys_spindle_direction_code(CLW)       "3"  
  set mom_sys_spindle_direction_code(CCLW)      "4"  
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
  set mom_sys_cir_vector                        "Vector - Arc Start to Center"
  set mom_sys_spindle_ranges                    "0"  
  set mom_sys_rewind_stop_code                  "\#" 
  set mom_sys_home_pos(0)                       "300.640"
  set mom_sys_home_pos(1)                       "226.438"
  set mom_sys_home_pos(2)                       "300"
  set mom_sys_zero                              "0"  
  set mom_sys_opskip_block_leader               "/"  
  set mom_sys_seqnum_start                      "2"  
  set mom_sys_seqnum_incr                       "2"  
  set mom_sys_seqnum_freq                       "1"  
  set mom_sys_seqnum_max                        "99999"
  set mom_sys_lathe_x_double                    "1"  
  set mom_sys_lathe_i_double                    "1"  
  set mom_sys_lathe_x_factor                    "1"  
  set mom_sys_lathe_y_factor                    "1"  
  set mom_sys_lathe_z_factor                    "1"  
  set mom_sys_leader(N)                         "N"  
  set mom_sys_leader(X)                         "X"  
  set mom_sys_leader(Y)                         "Y"  
  set mom_sys_leader(Z)                         "Z"  
  set mom_sys_leader(fourth_axis)               "A"  
  set mom_sys_leader(fifth_axis)                "C"  
  set mom_sys_contour_feed_mode(LINEAR)         "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "MMPM"
  set mom_sys_cycle_feed_mode                   "MMPM"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"
  set mom_sys_vnc_rapid_dogleg                  "1"  
  set mom_sys_prev_mach_head                    ""   
  set mom_sys_curr_mach_head                    ""   
  set mom_sys_contour_feed_mode(ROTARY)         "MMPM"
  set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "MMPM"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
  set mom_sys_rapid_feed_mode(ROTARY)           "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "MMPM"
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "OFF"
  set mom_kin_4th_axis_leader                   "A"  
  set mom_kin_4th_axis_limit_action             "Warning"
  set mom_kin_4th_axis_max_limit                "110"
  set mom_kin_4th_axis_min_incr                 "0.00001"
  set mom_kin_4th_axis_min_limit                "-110"
  set mom_kin_4th_axis_plane                    "YZ" 
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Table"
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_ang_offset               "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0"  
  set mom_kin_5th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_5th_axis_leader                   "C"  
  set mom_kin_5th_axis_limit_action             "Warning"
  set mom_kin_5th_axis_max_limit                "99999.999"
  set mom_kin_5th_axis_min_incr                 "0.00001"
  set mom_kin_5th_axis_min_limit                "-99999.999"
  set mom_kin_5th_axis_plane                    "XY" 
  set mom_kin_5th_axis_rotation                 "standard"
  set mom_kin_5th_axis_type                     "Table"
  set mom_kin_5th_axis_zero                     "0.0"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.001"
  set mom_kin_machine_resolution                ".00001"
  set mom_kin_machine_type                      "5_axis_dual_table"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "9999999999"
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
  set mom_kin_pivot_gauge_offset                ""   
  set mom_kin_pivot_guage_offset                ""   
  set mom_kin_post_data_unit                    "MM" 
  set mom_kin_rapid_feed_rate                   "10000"
  set mom_kin_retract_distance                  "500"
  set mom_kin_tool_change_time                  ""   
  set mom_kin_x_axis_limit                      "1000"
  set mom_kin_y_axis_limit                      "1000"
  set mom_kin_z_axis_limit                      "1000"




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

    OPEN_files ; #open warning and listing files
    LIST_FILE_HEADER ; #list header in commentary listing



  global mom_sys_post_initialized
  if { $mom_sys_post_initialized > 1 } { return }


#************
uplevel #0 {


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
   MOM_do_template spindle_coolant_off
   MOM_force Once G_motion G_origin Z
   MOM_do_template home_1
   MOM_force Once G_motion G fourth_axis fifth_axis
   MOM_do_template home_2
   MOM_force Once G_motion G
   MOM_do_template home_3
   PB_CMD_tool_unload
   PB_CMD_machine_reset
   MOM_do_template end_of_program
   MOM_set_seq_off
   MOM_do_template machine_time

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

   PB_CMD_include_user_file
   PB_CMD_program_id
   PB_CMD_initial_values
   PB_CMD_nurbs_initialize
   MOM_set_seq_off
   PB_CMD_cabec
   MOM_set_seq_on
   PB_CMD_mm_inch_setup
   MOM_force Once G_cutcom G_continuous G_mode G H M_range
   MOM_do_template absolute_mode
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

   PB_CMD_check_update_post
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
   MOM_do_template spindle_coolant_off
   PB_CMD_machine_reset
   MOM_do_template tool_description
   MOM_force Once T
   MOM_do_template tool_change
   MOM_force Once M
   MOM_do_template auto_tool_change
   MOM_force Once H
   MOM_do_template tool_length_adjust
   MOM_force Once G_plane
   MOM_do_template plane_code
   MOM_force Once G_motion G_origin Z
   MOM_do_template home_1
   MOM_force Once G_motion G fourth_axis fifth_axis
   MOM_do_template home_2
   MOM_force Once G_motion G
   MOM_do_template home_3
   PB_CMD_tool_change_force_addresses
   MOM_do_template after_tool_change
   PB_CMD_origin
   MOM_do_template origin
   PB_CMD_machine_setup
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
   PB_CMD_origin
   MOM_do_template origin
   PB_CMD_check_spindle_value
   MOM_force Once S M_spindle
   MOM_do_template spindle_rpm
   MOM_do_template coolant_code

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
   PB_CMD_origin
   MOM_do_template origin
   PB_CMD_check_spindle_value
   MOM_force Once S M_spindle
   MOM_do_template spindle_rpm
   MOM_do_template coolant_code
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
   MOM_force Once H
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
   PB_CMD_check_spindle_value
   MOM_force Once S M_spindle
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
}


#=============================================================
proc MOM_coolant_off { } {
#=============================================================
   COOLANT_SET
   MOM_do_template coolant_off
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
   MOM_force Once M
   MOM_do_template auxfun
}


#=============================================================
proc MOM_prefun { } {
#=============================================================
   MOM_force Once G
   MOM_do_template prefun
}


#=============================================================
proc MOM_load_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   MOM_force Once T M
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
   MOM_do_template tool_preselect
}


#=============================================================
proc MOM_linear_move { } {
#=============================================================
  global first_linear_move

   if { !$first_linear_move } {
      PB_first_linear_move
      incr first_linear_move
   }

   PB_CMD_machine_setup
   MOM_do_template linear_move_2
   MOM_do_template linear_move
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   CIRCLE_SET
   PB_CMD_machine_setup
   MOM_do_template circular_move_1
   MOM_do_template circular_move
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
   PB_CMD_machine_setup
   MOM_do_template rapid_move
   set rapid_traverse_blk {G_cutcom G_motion G_mode X Y Z fourth_axis fifth_axis}
   set rapid_traverse_mod {}
   PB_SET_RAPID_MOD $rapid_traverse_mod $rapid_traverse_blk aa mod_traverse
   PB_FORCE Once $mod_traverse
   MOM_do_template rapid_traverse
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
   MOM_do_template cycle_off
   PB_CMD_cycle_off
}


#=============================================================
proc MOM_cycle_plane_change { } {
#=============================================================
  global cycle_init_flag

   set cycle_init_flag TRUE
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_drill
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_drill_dwell
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_drill_deep
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_drill_break_chip
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_tap
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_bore
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_bore_drag
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_bore_no_drag
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_bore_manual
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_bore_dwell
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_bore_back
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

   PB_CMD_machine_setup
   PB_CMD_cycle_on
   MOM_do_template cycle_feed
   MOM_do_template cycle_parameters
   MOM_do_template cycle_bore_manual_dwell
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
proc PB_CMD_before_motion { } {
#=============================================================
global NAX
global mom_out_angle_pos
global mom_pos
global old_mom_out_angle_pos
global mom_tool_axis
global mom_cycle_spindle_axis
global mom_cutcom_plane
global rotation_x rotation_z
global rotation_xf rotation_zf
global last_fourth_axis 
global last_fifth_axis 

if {![info exists rotation_x]} {
     set rotation_x 0
  }
if {![info exists rotation_z]} {
     set rotation_z 0
  }
if {![info exists rotation_xf]} {
     set rotation_xf 1
  }
if {![info exists rotation_zf]} {
     set rotation_zf 1
  }
if {![info exists last_fourth_axis]} {
     set last_fourth_axis 0
  }
if {![info exists last_fifth_axis]} {
     set last_fifth_axis 0
  }
if {![info exists NAX]} {
     set NAX "5"
  }
PB_CMD_machine_setup
if {![info exists old_mom_out_angle_pos(0)]} {
     set old_mom_out_angle_pos(0) ""
  }
if {![info exists old_mom_out_angle_pos(1)]} {
     set old_mom_out_angle_pos(1) ""
  }
if {[EQ_is_equal $NAX 2.5]} {
     while { $mom_out_angle_pos(0) >  180 } { set mom_out_angle_pos(0) [expr ($mom_out_angle_pos(0)-360.0)] }
     while { $mom_out_angle_pos(0) < -180 } { set mom_out_angle_pos(0) [expr ($mom_out_angle_pos(0)+360.0)] }
     while { $mom_out_angle_pos(1) >  360 } { set mom_out_angle_pos(1) [expr ($mom_out_angle_pos(1)-360.0)] }
     while { $mom_out_angle_pos(1) < 0 } { set mom_out_angle_pos(1) [expr ($mom_out_angle_pos(1)+360.0)] }
     if { $old_mom_out_angle_pos(0)!=$mom_out_angle_pos(0) || $old_mom_out_angle_pos(1)!=$mom_out_angle_pos(1) } {
        set rotation_x [expr $mom_out_angle_pos(0)*$rotation_xf]
        set rotation_z [expr $mom_out_angle_pos(1)*$rotation_zf]
        MOM_do_template plane_rotation
        MOM_force Once X Y Z
        set old_mom_out_angle_pos(0) $mom_out_angle_pos(0)
        set old_mom_out_angle_pos(1) $mom_out_angle_pos(1)
    }
  }
if {[EQ_is_equal $NAX 2]} {
     while { $mom_pos(3) >  180 } { set mom_pos(3) [expr ($mom_pos(3)-360.0)] }
     while { $mom_pos(3) < -180 } { set mom_pos(3) [expr ($mom_pos(3)+360.0)] }
     while { $mom_pos(4) >  360 } { set mom_pos(4) [expr ($mom_pos(4)-360.0)] }
     while { $mom_pos(4) < 0 } { set mom_pos(4) [expr ($mom_pos(4)+360.0)] }
     if { $old_mom_out_angle_pos(0)!=$mom_pos(3) || $old_mom_out_angle_pos(1)!=$mom_pos(4) } {
        set rotation_x [expr $mom_pos(3)*$rotation_xf]
        set rotation_z [expr $mom_pos(4)*$rotation_zf]
        MOM_do_template plane_rotation
        MOM_force Once X Y Z
        set old_mom_out_angle_pos(0) $mom_pos(3)
        set old_mom_out_angle_pos(1) $mom_pos(4)
    }
    set mom_out_angle_pos(0) 0
    set mom_out_angle_pos(1) 0
  }
if {[EQ_is_equal $NAX 3]} {
  if { [EQ_is_equal $mom_tool_axis(0) 0.0] && [EQ_is_equal $mom_tool_axis(1) 0.0] && [EQ_is_equal $mom_tool_axis(2) 1.0] } {
           set mom_cycle_spindle_axis 2
           set mom_cutcom_plane XY
       }
  if { [EQ_is_equal $mom_tool_axis(0) 1.0] && [EQ_is_equal $mom_tool_axis(1) 0.0] && [EQ_is_equal $mom_tool_axis(2) 0.0]} {
           set mom_cycle_spindle_axis 0
           set mom_cutcom_plane YZ
       }
  if {[EQ_is_equal $mom_tool_axis(0) 0.0] && [EQ_is_equal $mom_tool_axis(1) 1.0] && [EQ_is_equal $mom_tool_axis(2) 0.0]} {
           set mom_cycle_spindle_axis 1
           set mom_cutcom_plane ZX
       }
  }
if {[EQ_is_equal $NAX 1]} {
     while { $mom_pos(3) >  180 } { set mom_pos(3) [expr ($mom_pos(3)-360.0)] }
     while { $mom_pos(3) < -180 } { set mom_pos(3) [expr ($mom_pos(3)+360.0)] }
     while { $mom_pos(4) >  360 } { set mom_pos(4) [expr ($mom_pos(4)-360.0)] }
     while { $mom_pos(4) < 0 } { set mom_pos(4) [expr ($mom_pos(4)+360.0)] }
     if { $old_mom_out_angle_pos(0)!=$mom_pos(3) || $old_mom_out_angle_pos(1)!=$mom_pos(4) } {
        set rotation_x [expr $mom_pos(3)*$rotation_xf]
        set rotation_z [expr $mom_pos(4)*$rotation_zf]
        MOM_do_template plane_rotation
        MOM_force Once X Y Z
        set old_mom_out_angle_pos(0) $mom_pos(3)
        set old_mom_out_angle_pos(1) $mom_pos(4)
    }
    set mom_out_angle_pos(0) $last_fourth_axis
    set mom_out_angle_pos(1) $last_fifth_axis
  } else {
    set last_fourth_axis $mom_out_angle_pos(0)
    set last_fifth_axis $mom_out_angle_pos(1)
  }
}


#=============================================================
proc PB_CMD_cabec { } {
#=============================================================
global POST_NAME
global POST_VERSION
global POST_DATE

if {![info exists POST_NAME]} {set POST_NAME ""}
if {![info exists POST_VERSION]} {set POST_VERSION ""}
if {![info exists POST_DATE]} {set POST_DATE ""}

global mom_ug_version  mom_kin_machine_type NAX
global mom_logname
global mom_date   mom_sys_control_in  mom_sys_control_out
global mom_event_handler_file_name
global mom_definition_file_name
global mom_part_name
global user_tcl_file
global CTCM_tcl_file

 #MOM_output_literal ";"
 MOM_output_literal "; POST-PROCESSOR NAME    : ${POST_NAME} "
 MOM_output_literal "; POST-PROCESSOR VERSION : ${POST_VERSION} "
 MOM_output_literal "; POST-PROCESSOR DATE    : ${POST_DATE} "
 MOM_output_literal "; UNIGRAPHICS VERSION    : ${mom_ug_version} "
 MOM_output_literal "; EXECUTED       BY      : ${mom_logname} "
 MOM_output_literal "; EXECUTION      DATE    : ${mom_date} "
 MOM_output_literal "; UG_POST TCL  FILE NAME : ${mom_event_handler_file_name} "
 MOM_output_literal "; UG_POST DEF  FILE NAME : ${mom_definition_file_name} "
 MOM_output_literal "; ---------------------------------------------------------"
}


#=============================================================
proc PB_CMD_check_spindle_value { } {
#=============================================================
  global mom_spindle_speed old_spindle_speed
  global mom_spindle_status
  global mom_spindle_rpm
  global mom_spindle_mode
  global mom_spindle_direction


   if { ![ info exists old_spindle_speed ] }  { 
             set old_spindle_speed 0
   }

   if { $mom_spindle_status!="OFF" }  { 
      if { [ info exists mom_spindle_speed ] }  { 
          if { $mom_spindle_speed <= 0 }  { 
             set mom_spindle_speed $old_spindle_speed
          } else {
             set old_spindle_speed $mom_spindle_speed
          }
      }
      if { [ info exists mom_spindle_rpm ] && [ info exists mom_spindle_mode ] && $mom_spindle_mode=="RPM" }  { 
          if { $mom_spindle_rpm <= 0 }  { 
             set mom_spindle_rpm $old_spindle_speed
          } else {
             set old_spindle_speed $mom_spindle_rpm
             set mom_spindle_speed $mom_spindle_rpm
          }
      }
   } else {
      MOM_suppress Once S M_spindle
   }
   if { $mom_spindle_direction=="NONE" }  { 
      set mom_spindle_speed ""
   }
   if { $mom_spindle_speed<=0 }  { 
      MOM_suppress Once S M_spindle
   }
}


#=============================================================
proc PB_CMD_check_update_post { } {
#=============================================================
  global mom_update_post_cmds_from_tool

# check if update post commands from tool is active
   set chk 1
   if { [ info exists mom_update_post_cmds_from_tool ] }  { 
          if { $mom_update_post_cmds_from_tool==1 }  { 
             set chk 0
          }
      }
   if { $chk==1 } { 
          MOM_abort "+++ ERROR: Activate Update Post From Tool ! +++"
      }

 global mom_path_name mom_tool_name

 MOM_output_literal "; "
 MOM_output_literal "; OPERACAO: $mom_path_name  FERRAMENTA: $mom_tool_name"
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
  MOM_output_literal "M12"
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
proc PB_CMD_cycle_off { } {
#=============================================================
  global cycle_setup
  if {[info exists cycle_setup]} {
     set cycle_setup 0
  }
  MOM_suppress Off G_motion
  MOM_force Once G_motion
}


#=============================================================
proc PB_CMD_cycle_on { } {
#=============================================================
  global cycle_macro
  global cycle_setup
  global cycle_name
  global mom_sys_cycle_reps_code
  global mom_sys_cycle_drill_break_chip_code
  global mom_sys_cycle_bore_no_drag_code 
  global mom_sys_cycle_drill_code
  global mom_sys_cycle_drill_deep_code 
  global mom_sys_cycle_drill_dwell_code 
  global mom_sys_cycle_tap_code 
  global mom_sys_cycle_bore_code
  global mom_sys_cycle_bore_drag_code
  global mom_sys_cycle_bore_back_code 
  global mom_sys_cycle_bore_manual_code
  global mom_sys_cycle_bore_manual_dwell_code
  global mom_sys_cycle_bore_dwell_code 
  global mom_cycle_retract_to_pos
  global mom_cycle_spindle_axis
  global mom_cycle_rapid_to_pos
  global mom_cycle_feed_to_pos
  global mom_cycle_delay
  global mom_cycle_delay_revs
  global mom_cycle_delay_mode
  global mom_cycle_step1
  global mom_cycle_step2
  global mom_cycle_feed_rate
  global mom_cycle_feed_rate_per_rev
  global mom_cycle_orient
  global mom_sys_spindle_direction_code
  global mom_spindle_direction
  global mom_spindle_speed
  global RTP
  global RFP
  global SDIS
  global DP
  global DPR
  global FDEP
  global FDPR
  global DAM
  global DTB
  global DTS
  global FRF
  global VARI
  global x_AXN
  global x_MDEP
  global x_VRT
  global x_DTD
  global x_DIS1
  global SDR
  global SDAC
  global ENC
  global MPIT
  global PIT
  global SDIR
  global RPA
  global RPO
  global RPAP
  global POSS
  global SST
  global SST1
  global FFR
  global RFF
  global RAD2DEG
  global unit_factor


  MOM_suppress Once G_motion
  MOM_suppress Always G_motion
  if {![info exists cycle_setup]} {
     set cycle_setup 0
  }
  if {$cycle_setup == 0} { 
     MOM_force Once MACALL
     set cycle_setup 1
  }

# this variable is a minimum clearance to be set with a special command, other cycle parameters
# are derived from this variable
  global BDIS
  if {![info exists BDIS]} {
    set BDIS 0.5
    set BDIS [expr $BDIS*$unit_factor]
  } 

  set RTP $mom_cycle_retract_to_pos($mom_cycle_spindle_axis)
  set RFP $mom_cycle_rapid_to_pos($mom_cycle_spindle_axis)
  set SDIS 0.0
  set DP $mom_cycle_feed_to_pos($mom_cycle_spindle_axis)
  set DPR " "
  set FDEP " "
  if {[info exists mom_cycle_step1]} {
    set FDPR $mom_cycle_step1
  } else {
    set FDPR 0.0
  }
  if {[info exists mom_cycle_step2]} {
    set DAM $mom_cycle_step2
  } else {
    set DAM 0.0
  }
  if {[info exists mom_cycle_delay]} {
     if { $mom_cycle_delay_mode == "SECONDS" } {
        set DTB $mom_cycle_delay
        set DTS $mom_cycle_delay
     }
     if { $mom_cycle_delay_mode == "REVOLUTIONS" } {
        set DTB [expr -1*$mom_cycle_delay_revs]
        set DTS [expr -1*$mom_cycle_delay_revs]
     }
  } else {
    set DTB 0
    set DTS 0
  }
  if {![info exists FRF]} {
    set FRF 1.0
  } 
  set VARI 0
  if {$cycle_name=="DRILL_DEEP"} {
    set VARI 1
  }
  set x_AXN " "
  set x_MDEP " "
  set x_VRT $BDIS
  set x_DTD $DTB
  set x_DIS1 $BDIS
  if {![info exists SDR]} {
    set SDR 0
  } 
  if {[info exists mom_spindle_direction]} {
    if {[info exists mom_sys_spindle_direction_code($mom_spindle_direction)]} {
      set SDAC $mom_sys_spindle_direction_code($mom_spindle_direction)
    } else {
      set SDAC 0
    } 
  } else {
    set SDAC 0
  } 
  if {![info exists ENC]} {
    set ENC -1
  } 
  if {$ENC>=0} {
    if {$mom_sys_cycle_tap_code<100} {
      set mom_sys_cycle_tap_code [expr  $mom_sys_cycle_tap_code*10] 
    } 
  } 
  if {$ENC<0} {
    if {$mom_sys_cycle_tap_code>100} {
      set mom_sys_cycle_tap_code [expr  $mom_sys_cycle_tap_code/10] 
    } 
  } 
  set MPIT " "
  if {  [ info exists mom_cycle_feed_rate_per_rev ]  }  { 
          set PIT $mom_cycle_feed_rate_per_rev
          if { [ info exists mom_spindle_direction ]  }  { 
             if { $mom_spindle_direction == "CCLW"  }  { set PIT [expr -1.0*$PIT]  }
          }
  } else {
    set PIT 0
  } 
  if {[info exists mom_spindle_direction]} {
    if {[info exists mom_sys_spindle_direction_code($mom_spindle_direction)]} {
      set SDIR $mom_sys_spindle_direction_code($mom_spindle_direction)
    } else {
      set SDIR 0
    } 
  } else {
    set SDIR 0
  } 
  if {![info exists POSS]} {
    set POSS 0.0
  }  
  if {$cycle_name=="BORE_NO_DRAG"} {
    if { [ info exists mom_cycle_orient ]  }  {
         set POSS $mom_cycle_orient
    } 
  } 
  set RPA [expr -$BDIS*cos($POSS/$RAD2DEG)]
  set RPO [expr -$BDIS*sin($POSS/$RAD2DEG)]
  if {![info exists RPAP]} {
     set RPAP 0.5
     set RPAP [expr $RPAP*$unit_factor]
  } 
  if {  [ info exists mom_spindle_speed ]  }  { 
    set SST $mom_spindle_speed
    set SST1 $mom_spindle_speed
  } else {
    set SST 0.0
    set SST1 0.0
  } 
  if {  [ info exists mom_cycle_feed_rate ]  }  { 
    set FFR $mom_cycle_feed_rate
    set RFF $mom_cycle_feed_rate
  } else {
    set FFR 0
    set RFF 0
  } 

   switch $cycle_name  { 
        "DRILL_BREAK_CHIP" 
           {
                set mom_sys_cycle_reps_code $mom_sys_cycle_drill_break_chip_code
           }
        "DRILL_DEEP" 
           {
                set mom_sys_cycle_reps_code $mom_sys_cycle_drill_deep_code 
           }
        "DRILL_DWELL" 
           {
                set mom_sys_cycle_reps_code $mom_sys_cycle_drill_dwell_code
           }
        "DRILL" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_drill_code
            }
        "TAP" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_tap_code 
            }
        "BORE_DWELL" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_bore_dwell_code 
            }
        "BORE_DRAG" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_bore_drag_code
            }
        "BORE" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_bore_code
            }
        "BORE_NO_DRAG" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_bore_no_drag_code 
            }
        "BORE_MANUAL" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_bore_manual_code
            }
        "BORE_MANUAL_DWELL" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_bore_manual_dwell_code
            }
        "BORE_BACK" 
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_bore_back_code 
            }
        default
            {
                set mom_sys_cycle_reps_code $mom_sys_cycle_drill_code
            }
       }


  set cycle_template [ MOM_do_template CYCLE_NAME CREATE ]
  set cycle_macro [ MOM_do_template $cycle_template CREATE ]
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
proc PB_CMD_include_user_file { } {
#=============================================================
global mom_event_handler_file_name

uplevel #0 {
  set l [expr [string length $mom_event_handler_file_name]-1]
  set m [expr [string last \. $mom_event_handler_file_name]-1]
  set n [string last \. $mom_event_handler_file_name]
  set str1 $mom_event_handler_file_name
  if { $m >= 0 } {set str1 [string range $mom_event_handler_file_name 0 $m]}
  set str2 "_user"
  set str3 ""
  if { $l >= $n } {set str3 [string range $mom_event_handler_file_name $n $l]}
  set user_tcl_file $str1$str2$str3
  unset l m n str1 str2 str3
  if { [file exists $user_tcl_file] } {
    source $user_tcl_file
  } else { 
    unset user_tcl_file
  }
}
}


#=============================================================
proc PB_CMD_init_rotary { } {
#=============================================================
uplevel #0 {

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
# The parameter "mom_kin_retract_type" defines the method that will
# be used to calculate the retract point.  "DISTANCE" means that
# the retract will always be a fixed distance along the spindle
# axis.  "PLANE" means that the retract will be to a sphere, plane or
# a cylinder.
#
# The parameter "mom_kin_retract_plane" defines the distance
# from the center of rotation that the tool will retract when
# the "PLANE" option is selected.  For a four axis head machine tool the
# retraction will be a cylinder.  For a five axis head machine tool
# the retraction will be to a sphere. For rotary tables the
# retraction will be to a plane along the spindle axis.
#

set mom_kin_retract_plane               10.0
set mom_kin_retract_distance		    10.0
set mom_kin_retract_type		    "PLANE" ; # DISTANCE or PLANE


#
# The parameter "mom_kin_reengage_distance" defines the engage
# point above the part.
#

set mom_kin_reengage_distance                  .20


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
proc PB_CMD_initial_values { } {
#=============================================================
 global mom_machine_time 
 set mom_machine_time 0
 global mom_fixture_offset_value
 if {![info exists mom_fixture_offset_value]} {
    set mom_fixture_offset_value 0
 }
 global NS
 set NS ""
 global NAX
 set NAX 5
 global blank_tool
 set blank_tool 0
 # this switches off commentary data in .lpt file 
 # global mom_sys_commentary_output
 # set mom_sys_commentary_output "OFF"
}


#=============================================================
proc PB_CMD_kin_before_motion { } {
#=============================================================
#
#  This custom command is used by UG Post to support Set/Lock, 
#  rotary axis limit violation retracts and auto clamping.  
#  Do not change this procedure.  If you want to improve 
#  performance, you may comment out any of these procedures.
#  

   global mom_kin_machine_type

   if [info exists mom_kin_machine_type] {
      if { [string match "*3_axis_mill*" $mom_kin_machine_type] ||  [string match "*lathe*" $mom_kin_machine_type] } {
return
      }
   }


   LOCK_AXIS_MOTION

   ROTARY_AXIS_RETRACT

   AUTO_CLAMP
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
proc PB_CMD_kin_init_mill_turn { } {
#=============================================================
}


#=============================================================
proc PB_CMD_kin_init_mill_xzc { } {
#=============================================================
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
proc MOM_rotate { } {
#=============================================================
  global mom_rotate_axis_type mom_rotation_mode mom_rotation_direction
  global mom_rotation_angle mom_rotation_reference_mode
  global mom_kin_machine_type mom_kin_4th_axis_direction mom_kin_5th_axis_direction
  global mom_kin_4th_axis_leader mom_kin_5th_axis_leader
  global mom_kin_4th_axis_leader mom_kin_5th_axis_leader mom_pos
  global mom_out_angle_pos mom_prev_out_angle_pos
  global mom_prev_pos mom_sys_leader
  global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
  global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit

   if {![info exists mom_rotation_angle]} {return}

  #
  #  Determine which axis the user wanted, fourth or fifth.
  #
   switch $mom_rotate_axis_type {
      AAXIS {
         set axis [AXIS_SET $mom_rotate_axis_type]
      }
      BAXIS {
         set axis [AXIS_SET $mom_rotate_axis_type]
      }
      CAXIS {
         set axis [AXIS_SET $mom_rotate_axis_type]
      }
      TABLE {
         set axis 3
      }
      HEAD {
         if { $mom_kin_machine_type == "5_axis_head_table ||  $mom_kin_machine_type == "5_AXIS_HEAD_TABLE" } {
            set axis 4
         } else {
            set axis 3
         }
      }
      default {
         set axis 3
      }
   }

   switch $mom_rotation_mode {
      NONE {
         set angle $mom_rotation_angle
         set mode 0
      }
      ATANGLE {
         set angle $mom_rotation_angle
         set mode 0
      }
      ABSOLUTE {
         set angle $mom_rotation_angle
         set mode 1
      }
      INCREMENTAL {
         set angle [expr $mom_pos($axis) + $mom_rotation_angle]
         set mode 0
      }
   }
   switch $mom_rotation_direction {
      NONE {
         set dir 0
      }
      CLW {
         set dir 1
      }
      CCLW {
         set dir -1
      }
   }

   set ang [LIMIT_ANGLE $angle]
   set mom_pos($axis) $ang


   if {$axis == "3" && ![info exists mom_prev_out_angle_pos(0)]} {
      set mom_prev_out_angle_pos(0) [MOM_ask_address_value fourth_axis]
      if {$mom_prev_out_angle_pos(0) == ""} {set mom_prev_out_angle_pos(0) 0.0} 
   } 

 
   if {$axis == "4" && ![info exists mom_prev_out_angle_pos(1)]} {  
      set mom_prev_out_angle_pos(1) [MOM_ask_address_value fifth_axis]
      if {$mom_prev_out_angle_pos(1) == ""} {set mom_prev_out_angle_pos(1) 0.0}
   }

   set p [expr $axis + 1]
   set a [expr $axis - 3]
   if {$axis == "3" && $mom_kin_4th_axis_direction == "MAGNITUDE_DETERMINES_DIRECTION"} {
      set dirtype 0
      global mom_sys_4th_axis_rotate_mcodes
      if [info exists mom_sys_4th_axis_rotate_mcodes] {
        if {$mom_sys_4th_axis_rotate_mcodes == "ON"} {
          global mom_sys_4th_current_rotary_direction
          set del $dir
          if {$del == 0} {
            set del [expr $ang-$mom_prev_pos(3)]
            if {$del > 180.0} {set del [expr $dir-360.0]}
            if {$del < -180.0} {set del [expr $dir+360.0]}
          }
          if {$del > 0.0 && $mom_sys_4th_current_rotary_direction <= 0} {
            PB_CMD_output_4th_axis_clw_mcode
            set mom_sys_4th_current_rotary_direction 1
          } elseif {$del < 0.0 && $mom_sys_4th_current_rotary_direction >= 0} {
            PB_CMD_output_4th_axis_cclw_mcode
            set mom_sys_4th_current_rotary_direction -1
          }
        }
      }
   } elseif { $axis == "4"  &&  $mom_kin_5th_axis_direction == "MAGNITUDE_DETERMINES_DIRECTION" } {
      set dirtype 0
      global mom_sys_5th_axis_rotate_mcodes
      if [info exists mom_sys_5th_axis_rotate_mcodes] {
        if {$mom_sys_5th_axis_rotate_mcodes == "ON"} {
          global mom_sys_5th_current_rotary_direction
          set del $dir
          if {$del == 0} {
            set del [expr $ang-$mom_prev_pos(4)]
            if {$del > 180.0} {set del [expr $dir-360.0]}
            if {$del < -180.0} {set del [expr $dir+360.0]}
          }
          if {$del > 0.0 && $mom_sys_5th_current_rotary_direction <= 0} {
            PB_CMD_output_5th_axis_clw_mcode
            set mom_sys_5th_current_rotary_direction 1
          } elseif {$del < 0.0 && $mom_sys_5th_current_rotary_direction >= 0} {
            PB_CMD_output_5th_axis_cclw_mcode
            set mom_sys_5th_current_rotary_direction -1
          }
        }
      }
   } else {
      set dirtype 1
   }

   if {$mode == 1} {
      set mom_out_angle_pos($a) $angle
   } elseif {$dirtype == 0} {

      if {$axis == 3} {
         set mom_out_angle_pos($a) [ROTSET $ang  $mom_prev_out_angle_pos(0)  $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader  mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
      } else {
         set mom_out_angle_pos($a) [ROTSET $ang  $mom_prev_out_angle_pos(1)  $mom_kin_5th_axis_direction   $mom_kin_5th_axis_leader   mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
      }

 #     if {$axis == 3} {set prot $mom_prev_out_angle_pos(0)}
 #     if {$axis == 4} {set prot $mom_prev_out_angle_pos(1)}
 #     if {$dir == 1 && $mom_out_angle_pos($a) < $prot} {
 #        set mom_out_angle_pos($a) [expr $mom_out_angle_pos($a) + 360.0] 
 #     } elseif {$dir == -1 && $mom_out_angle_pos($a) > $prot} {
 #        set mom_out_angle_pos($a) [expr $mom_out_angle_pos($a) - 360.0]
 #     }
   } elseif {$dirtype == "1"} {

      if {$dir == -1} {
         if {$axis == 3} {
            set mom_sys_leader(fourth_axis) $mom_kin_4th_axis_leader-
         } else {
            set mom_sys_leader(fifth_axis) $mom_kin_5th_axis_leader-
         }
      } elseif {$dir == 0} {
         if {$axis == 3} {
            set mom_out_angle_pos($a) [ROTSET $ang  $mom_prev_out_angle_pos(0)  $mom_kin_4th_axis_direction   $mom_kin_4th_axis_leader   mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
         } else {
            set mom_out_angle_pos($a) [ROTSET $ang  $mom_prev_out_angle_pos(1)  $mom_kin_5th_axis_direction   $mom_kin_5th_axis_leader  mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
         }
      } elseif {$dir == 1} {
         set mom_out_angle_pos($a) $ang
      }
   }

   global mom_sys_auto_clamp
 
   if {[info exists mom_sys_auto_clamp]} {
     if {$mom_sys_auto_clamp == "ON"} {
       set out1 "0"
       set out2 "1"
       if {$axis == 3} {
         AUTO_CLAMP_2 $out1
         AUTO_CLAMP_1 $out2
       } else {
         AUTO_CLAMP_1 $out1
         AUTO_CLAMP_2 $out2
       }
     }
   }

   if {$axis == 3} {
      PB_CMD_fourth_axis_rotate_move
   } else {
      PB_CMD_fifth_axis_rotate_move
   }

   set mom_prev_pos($axis) $ang
   MOM_reload_variable -a mom_prev_pos
   MOM_reload_variable -a mom_out_angle_pos
}


#=============================================================
proc MOM_lock_axis { } {
#=============================================================
  global mom_sys_lock_value mom_sys_lock_plane
  global mom_sys_lock_axis mom_sys_lock_status

   set status [SET_LOCK axis plane value]
   if {$status == "error"} {
      MOM_catch_warning
      set mom_sys_lock_status OFF
   } else {
      set mom_sys_lock_status $status
      if {$status != "OFF"} {
         set mom_sys_lock_axis $axis
         set mom_sys_lock_plane $plane
         set mom_sys_lock_value $value
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
proc PB_CMD_machine_reset { } {
#=============================================================
global NAX
global OLD_NAX
if {![info exists OLD_NAX] && [info exists NAX]} {
     set OLD_NAX $NAX
  }
set NAX 0
PB_CMD_machine_setup
}


#=============================================================
proc PB_CMD_machine_setup { } {
#=============================================================
global NAX
global OLD_NAX
global ADIS
global mom_tool_adjust_register
global CTCM_axis
global multi_axis
global rotation_x rotation_z
global rotation_xf rotation_zf
global rotation_active


if {![info exists mom_tool_adjust_register]} {
     set mom_tool_adjust_register 1
  } elseif {$mom_tool_adjust_register<=0} {
     set mom_tool_adjust_register 1
  }

global old_mom_out_angle_pos
global mom_out_angle_pos mom_pos

if {![info exists NAX]} {
     set NAX 5
  }
if {![info exists OLD_NAX]} {
     set OLD_NAX ""
  }
if {![info exists ADIS]} {
     set ADIS 0.1
  }
if {![info exists multi_axis]} {
     set multi_axis 0
  }
if {![info exists rotation_active]} {
     set rotation_active 0
  }
if {$NAX!=$OLD_NAX} {
  if {[EQ_is_equal $NAX 6]} {
     uplevel #0 {
         set mom_kin_machine_type                      5_axis_dual_head
         set mom_kin_4th_axis_type                     "Head"
         set mom_kin_5th_axis_type                     "Head"
         set mom_kin_machine_resolution                ".00001"
         MOM_set_address_format X Coordinate
         MOM_set_address_format Y Coordinate
         MOM_set_address_format Z Coordinate
         MOM_reload_kinematics
         }
     PB_CMD_mm_inch_setup
     MOM_do_template multax_on
     MOM_force once G_origin
     MOM_do_template origin
     MOM_output_literal "FGROUP (X,Y,Z,A,C)"
     MOM_output_literal "G642"
     MOM_do_template continuous_mode
     if {$multi_axis==0} {
         set multi_axis 1
       }
     if {$rotation_active==1} {
         set rotation_x 0
         set rotation_z 0 
         MOM_do_template plane_rotation
         MOM_force Once X Y Z
         set rotation_active 0
       }
     set CTCM_axis SAME
     MOM_suppress off A3 B3 C3
     MOM_suppress always fourth_axis fifth_axis
     MOM_force always A3 B3 C3
     set OLD_NAX $NAX
     }
  if {[EQ_is_equal $NAX 5]} {
     uplevel #0 {
         set mom_kin_machine_type                      5_axis_dual_head
         set mom_kin_4th_axis_type                     "Head"
         set mom_kin_5th_axis_type                     "Head"
         set mom_kin_machine_resolution                ".00001"
         MOM_set_address_format X Coordinate
         MOM_set_address_format Y Coordinate
         MOM_set_address_format Z Coordinate
         MOM_reload_kinematics
         }
     PB_CMD_mm_inch_setup
     MOM_do_template multax_on
     MOM_force once G_origin
     MOM_do_template origin
     MOM_output_literal "FGROUP (X,Y,Z,A,C)"
     MOM_output_literal "G642"
     MOM_do_template continuous_mode
     if {$multi_axis==0} {
         set multi_axis 1
       }
     if {$rotation_active==1} {
         set rotation_x 0
         set rotation_z 0 
         MOM_do_template plane_rotation
         MOM_force Once X Y Z
         set rotation_active 0
       }
     set CTCM_axis SAME
     MOM_suppress always A3 B3 C3
     MOM_suppress off fourth_axis fifth_axis
     if {[EQ_is_equal $OLD_NAX 6]} {MOM_force once fourth_axis fifth_axis}
     set OLD_NAX $NAX
     }
  if {[EQ_is_equal $NAX 2.5]} {
     uplevel #0 {
         set mom_kin_machine_type                      5_axis_dual_table
         set mom_kin_4th_axis_type                     "Table"
         set mom_kin_5th_axis_type                     "Table"
         MOM_reload_kinematics
         }
     PB_CMD_mm_inch_setup
     MOM_do_template multax_on
     MOM_force once G_origin
     MOM_do_template origin
     MOM_output_literal "FGROUP (X,Y,Z,A,C)"
     MOM_output_literal "G642"
     MOM_do_template continuous_mode
     if {$multi_axis==0} {
         set multi_axis 1
       }
     set rotation_active 1
     global mom_kin_4th_axis_rotation                 
     global mom_kin_5th_axis_rotation                 
     set rotation_xf 1
     set rotation_zf 1
     if {[string toupper $mom_kin_4th_axis_rotation]=="REVERSE"} { set rotation_xf -1 }
     if {[string toupper $mom_kin_5th_axis_rotation]=="REVERSE"} { set rotation_zf -1 }
     set CTCM_axis ZAXIS
     MOM_suppress always A3 B3 C3
     MOM_suppress off fourth_axis fifth_axis
     if {[EQ_is_equal $OLD_NAX 6]} {MOM_force once fourth_axis fifth_axis}
     set OLD_NAX $NAX
     }
  if {[EQ_is_equal $NAX 0]} {
     uplevel #0 {
         set mom_kin_machine_type                      5_axis_dual_table
         set mom_kin_4th_axis_type                     "Table"
         set mom_kin_5th_axis_type                     "Table"
         MOM_reload_kinematics
         set old_mom_out_angle_pos(0) ""
         set old_mom_out_angle_pos(1) ""
         }
     PB_CMD_mm_inch_setup
     MOM_do_template multax_off
     set mom_out_angle_pos(0) 0.0
     set mom_out_angle_pos(1) 0.0
     set rotation_x 0
     set rotation_z 0
     # MOM_do_template plane_rotation
     set CTCM_axis SAME
     MOM_suppress always A3 B3 C3
     MOM_suppress off fourth_axis fifth_axis
     if {[EQ_is_equal $OLD_NAX 6]} {MOM_force once fourth_axis fifth_axis}
     set NAX $OLD_NAX
     set OLD_NAX 0
     }
  }
}


#=============================================================
proc PB_CMD_mm_inch_setup { } {
#=============================================================
  global mom_output_unit
  global mom_part_unit
  global mom_kin_machine_resolution
  global mom_kin_rapid_feed_rate
  global mom_sys_contour_feed_mode
  global mom_sys_rapid_feed_mode
  global mom_sys_cycle_feed_mode
  global unit_factor
  global original_kin_rapid_feed_rate
  if {![info exists original_kin_rapid_feed_rate]} {
        set original_kin_rapid_feed_rate $mom_kin_rapid_feed_rate
  }
  set f1 1.0
  set f2 1.0
  if {[info exists mom_part_unit]} {
     if {$mom_part_unit=="IN"} {
        set f1 25.4
     }
  }
  if {[info exists mom_output_unit]} {
     if {$mom_output_unit=="IN"} {
        set f2 [expr 1/25.4]
        MOM_set_address_format X Coordinate_inches
        MOM_set_address_format Y Coordinate_inches
        MOM_set_address_format Z Coordinate_inches
        MOM_set_address_format I Coordinate_inches
        MOM_set_address_format J Coordinate_inches
        MOM_set_address_format K Coordinate_inches
        MOM_set_address_format SETVAL Coordinate_inches
        MOM_set_address_format RTP Coordinate_inches
        MOM_set_address_format RFP Coordinate_inches
        MOM_set_address_format SDIS Coordinate_inches
        MOM_set_address_format DP Coordinate_inches
        MOM_set_address_format FDPR Coordinate_inches
        MOM_set_address_format DAM Coordinate_inches
        MOM_set_address_format FRF Coordinate_inches
        MOM_set_address_format x_VRT Coordinate_inches
        MOM_set_address_format x_DIS1 Coordinate_inches
        MOM_set_address_format PIT Coordinate_inches
        MOM_set_address_format RPA Coordinate_inches
        MOM_set_address_format RPO Coordinate_inches
        MOM_set_address_format RPAP Coordinate_inches
        MOM_set_address_format FFR Coordinate_inches
        MOM_set_address_format RFF Coordinate_inches
        MOM_set_address_format polyX Coordinate_inches
        MOM_set_address_format polyY Coordinate_inches
        MOM_set_address_format polyZ Coordinate_inches
        set mom_kin_machine_resolution                ".00001"
        set mom_kin_rapid_feed_rate  [expr $original_kin_rapid_feed_rate/25.4]
        set mom_sys_contour_feed_mode(LINEAR)         "IPM"
        set mom_sys_contour_feed_mode(ROTARY)         "IPM"
        set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "IPM"
        set mom_sys_rapid_feed_mode(LINEAR)           "IPM"
        set mom_sys_rapid_feed_mode(ROTARY)           "IPM"
        set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "IPM"
        set mom_sys_cycle_feed_mode                   "IPM"
        MOM_reload_kinematics
     }
     if {$mom_output_unit=="MM"} {
        MOM_set_address_format X Coordinate_mm
        MOM_set_address_format Y Coordinate_mm
        MOM_set_address_format Z Coordinate_mm
        MOM_set_address_format I Coordinate_mm
        MOM_set_address_format J Coordinate_mm
        MOM_set_address_format K Coordinate_mm
        MOM_set_address_format SETVAL Coordinate_mm
        MOM_set_address_format RTP Coordinate_mm
        MOM_set_address_format RFP Coordinate_mm
        MOM_set_address_format SDIS Coordinate_mm
        MOM_set_address_format DP Coordinate_mm
        MOM_set_address_format FDPR Coordinate_mm
        MOM_set_address_format DAM Coordinate_mm
        MOM_set_address_format FRF Coordinate_mm
        MOM_set_address_format x_VRT Coordinate_mm
        MOM_set_address_format x_DIS1 Coordinate_mm
        MOM_set_address_format PIT Coordinate_mm
        MOM_set_address_format RPA Coordinate_mm
        MOM_set_address_format RPO Coordinate_mm
        MOM_set_address_format RPAP Coordinate_mm
        MOM_set_address_format FFR Coordinate_mm
        MOM_set_address_format RFF Coordinate_inches
        MOM_set_address_format polyX Coordinate_mm
        MOM_set_address_format polyY Coordinate_mm
        MOM_set_address_format polyZ Coordinate_mm
        set mom_kin_machine_resolution                ".00001"
        set mom_kin_rapid_feed_rate  $original_kin_rapid_feed_rate
        set mom_sys_contour_feed_mode(LINEAR)         "MMPM"
        set mom_sys_contour_feed_mode(ROTARY)         "MMPM"
        set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "MMPM"
        set mom_sys_rapid_feed_mode(LINEAR)           "MMPM"
        set mom_sys_rapid_feed_mode(ROTARY)           "MMPM"
        set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "MMPM"
        set mom_sys_cycle_feed_mode                   "MMPM"
        MOM_reload_kinematics
     }
  }
  set unit_factor [expr $f1*$f2]
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

set mom_kin_nurbs_output_type SIEMENS_POLY

MOM_reload_kinematics

proc  MOM_nurbs_move {} {

  global mom_nurbs_point_count 
  global mom_nurbs_points 
  global mom_nurbs_coefficients 
  global mom_nurbs_point_x
  global mom_nurbs_co_efficient_0
  global mom_nurbs_co_efficient_1
  global mom_nurbs_point_y
  global mom_nurbs_co_efficient_3
  global mom_nurbs_co_efficient_4
  global mom_nurbs_point_z
  global mom_nurbs_co_efficient_6
  global mom_nurbs_co_efficient_7

MOM_output_literal "POLY"
  for {set ii 0} {$ii < $mom_nurbs_point_count} {incr ii} {
    set poly_output_mode ""
    set xe [expr ($mom_nurbs_points($ii,0) + $mom_nurbs_coefficients($ii,0) + $mom_nurbs_coefficients($ii,1) + $mom_nurbs_coefficients($ii,2))]
    set ye [expr ($mom_nurbs_points($ii,1) + $mom_nurbs_coefficients($ii,3) + $mom_nurbs_coefficients($ii,4) + $mom_nurbs_coefficients($ii,5))]
    set ze [expr ($mom_nurbs_points($ii,2) + $mom_nurbs_coefficients($ii,6) + $mom_nurbs_coefficients($ii,7) + $mom_nurbs_coefficients($ii,8))]
    set mom_nurbs_point_x        $xe
    set mom_nurbs_co_efficient_0 $mom_nurbs_coefficients($ii,1)
    set mom_nurbs_co_efficient_1 $mom_nurbs_coefficients($ii,0)
    set mom_nurbs_point_y        $ye
    set mom_nurbs_co_efficient_3 $mom_nurbs_coefficients($ii,4)
    set mom_nurbs_co_efficient_4 $mom_nurbs_coefficients($ii,3)
    set mom_nurbs_point_z        $ze
    set mom_nurbs_co_efficient_6 $mom_nurbs_coefficients($ii,7)
    set mom_nurbs_co_efficient_7 $mom_nurbs_coefficients($ii,6)

    MOM_do_template nurbs
  }
}

}
}


#=============================================================
proc PB_CMD_origin { } {
#=============================================================
global mom_fixture_offset_value
global origin_number

if {![info exists origin_number]} {
     set origin_number 54
  }
if {[info exists mom_fixture_offset_value]} {
    if {$mom_fixture_offset_value<=0 || $mom_fixture_offset_value>99} {
       set origin_number 54
    } elseif {$mom_fixture_offset_value<=4} {
       set origin_number [expr $mom_fixture_offset_value+53]
    } elseif {$mom_fixture_offset_value<=99} {
       set origin_number [expr $mom_fixture_offset_value+500]
    }
 }
}


#=============================================================
proc PB_CMD_pause { } {
#=============================================================
# This command enables you to pause the UG/Post processing.
#
  PAUSE
}


#=============================================================
proc PB_CMD_program_id { } {
#=============================================================
  global PROG_ID
  global PROG_PATH
  global mom_output_file_basename
  set N1 _N_
  set N2 ""
  set N3 _MPF
  if { [ info exists mom_group_name ]  }  { 
       set name [string toupper $mom_group_name] 
  } elseif { [ info exists mom_output_file_basename ]  }  { 
       set name [string toupper $mom_output_file_basename] 
  }
  set N2 $name
  if  { [ string length  $N2 ] >24  }  { set N2 [string range $name 0 23] }
  if  { [ string length  $N2 ] <=0  }  { set N2 1234 }
  set PROG_ID $N1$N2$N3 
  set PROG_PATH "\$PATH=/_N_WKS_DIR/_N_PARTPROGRAM_WPD"
}


#=============================================================
proc PB_CMD_reposition_move { } {
#=============================================================
#
#  This procedure is used by rotary axis retract to reposition the
#  rotary axes after the tool has been fully retracted.
#
#  You can modify the this procedure to customize the reposition move.
#  If you need a custom command to be output with this block, 
#  you must place a call a the custom command either before or after 
#  the MOM_do_template command.
#  
   MOM_suppress once X Y Z
   MOM_do_template rapid_traverse
}


#=============================================================
proc PB_CMD_retract_move { } {
#=============================================================
#
#  This procedure is used by rotary axis retract to move away from
#  the part.  This move is a three axis move along the tool axis at
#  a retract feedrate.
#
#  You can modify the this procedure to customize the retract move.
#  If you need a custom command to be output with this block, 
#  you must place a call to the custom command either before or after 
#  the MOM_do_template command.
# 
#  If you need to modify the x,y or z locations you will need to do the
#  following.  (without the #)
#
#  global mom_pos
#  set mom_pos(0) 1.0
#  set mom_pos(1) 2.0
#  set mom_pos(2) 3.0
  
   MOM_do_template linear_move
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
# Use this command to set a proper cycle plane when G17/18/19
# is used in the cycle definition.

  global mom_cycle_spindle_axis mom_cutcom_plane mom_pos_arc_plane

   if [info exists mom_cycle_spindle_axis] {
      switch $mom_cycle_spindle_axis {
         0 {
            set mom_cutcom_plane  YZ
            set mom_pos_arc_plane YZ
         }
         1 {
            set mom_cutcom_plane  ZX
            set mom_pos_arc_plane ZX
         }
         2 {
            set mom_cutcom_plane  XY
            set mom_pos_arc_plane XY
         }
         default {
            set mom_cutcom_plane  UNDEFINED
            set mom_pos_arc_plane UNDEFINED
         }
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
proc PB_CMD_start_of_operation_force_addresses { } {
#=============================================================
  MOM_force once S M_spindle X Y Z F
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  global mom_cutcom_plane
  set mom_cutcom_plane XY
  global old_spindle_speed
  set old_spindle_speed 0
  MOM_force once G_mode G_motion G_feed G G_origin X Y Z I J K fourth_axis fifth_axis S F M_spindle M_coolant
  MOM_suppress always A3 B3 C3
}


#=============================================================
proc PB_CMD_tool_unload { } {
#=============================================================
global blank_tool
if {![info exists blank_tool]} {
     set blank_tool 0
  }
if {$blank_tool>=0} {
      MOM_force once T M
      MOM_do_template tool_unload
      MOM_do_template auto_tool_change
  }
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
  MOM_output_literal "M13"
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
proc SOLVE_QUADRATIC { coeff rcomp icomp status degree } {
#=============================================================

  upvar $coeff c ; upvar $rcomp rc ; upvar $icomp ic
  upvar $status st ; upvar $degree deg 

   set st 1
   set deg 0
   set rc(0) 0.0 ; set rc(1) 0.0
   set ic(0) 0.0 ; set ic(1) 0.0
   set mag [VEC3_mag c]
   if [EQ_is_zero $mag] {return 0}
   set acoeff [expr $c(2)/$mag]
   set bcoeff [expr $c(1)/$mag]
   set ccoeff [expr $c(0)/$mag]
   if {![EQ_is_zero $acoeff]} {
      set deg 2
      set denom [expr $acoeff*2.]
      set dscrm [expr $bcoeff*$bcoeff - $acoeff*$ccoeff*4.0]
      if [EQ_is_zero $dscrm] {
         set dsqrt1 0.0
      } else {
         set dsqrt1 [expr sqrt(abs($dscrm))]
      }
      if [EQ_is_ge $dscrm 0.0] {
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
   } elseif [EQ_is_zero $ccoeff] {
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
#  only lock an axis in the plane of the fourth axis.  For five axis
#  posts only the fifth axis may be locked.  Five axis will only 
#  output correctly if the fifth axis is rotated so it is perpendicular
#  to the spindle axis.
#
  global mom_pos mom_out_angle_pos mom_current_motion mom_motion_type
  global mom_cycle_feed_to_pos mom_cycle_feed_to mom_tool_axis
  global mom_motion_event mom_sys_lock_status 
  global mom_cycle_rapid_to_pos mom_cycle_retract_to_pos
  global mom_cycle_rapid_to mom_cycle_retract_to 
  global mom_prev_pos
  global mom_kin_4th_axis_type
  global mom_kin_spindle_axis 
  global mom_kin_5th_axis_type 
  global mom_kin_4th_axis_plane
  global mom_sys_cycle_after_initial 

  if {$mom_sys_lock_status == "ON"} {  
      if {$mom_current_motion == "circular_move"} {return}
      if {![info exists mom_sys_cycle_after_initial]} {set mom_sys_cycle_after_initial "FALSE"}
      if {$mom_sys_cycle_after_initial == "FALSE"} {
          LOCK_AXIS mom_pos mom_prev_pos mom_pos mom_out_angle_pos
          MOM_reload_variable -a mom_out_angle_pos
          MOM_reload_variable -a mom_pos
      }
      if {$mom_motion_type == "CYCLE"} {
        if {$mom_motion_event == "initial_move"} {
           set mom_sys_cycle_after_initial "TRUE"
           return
        }
        if {$mom_sys_cycle_after_initial == "TRUE"} {
           set mom_pos(0) [expr $mom_pos(0) - $mom_cycle_rapid_to * $mom_tool_axis(0)]
           set mom_pos(1) [expr $mom_pos(1) - $mom_cycle_rapid_to * $mom_tool_axis(1)]
           set mom_pos(2) [expr $mom_pos(2) - $mom_cycle_rapid_to * $mom_tool_axis(2)]
        }
        set mom_sys_cycle_after_initial "FALSE"
        if {$mom_kin_4th_axis_type == "Table"} {
           VMOV 3 mom_kin_spindle_axis mom_sys_spindle_axis 
        } elseif {$mom_kin_5th_axis_type == "Table"} {
           VMOV 3 mom_tool_axis vec
           if {$mom_kin_4th_axis_plane == "XY"} {
              set vec(2) 0.0
           } elseif {$mom_kin_4th_axis_plane == "ZX"} {
             set vec(1) 0.0
           } elseif {$mom_kin_4th_axis_plane == "YZ"} {
             set vec(0) 0.0
           }
           set len [VEC3_unitize vec mom_sys_spindle_axis]
           if [EQ_is_zero $len] {
              set mom_sys_spindle_axis(2) 1.0
           }
        } else {
           VMOV 3 mom_tool_axis mom_sys_spindle_axis
        }

        set mom_cycle_feed_to_pos(0) [expr $mom_pos(0) + $mom_cycle_feed_to * $mom_sys_spindle_axis(0)]
        set mom_cycle_feed_to_pos(1) [expr $mom_pos(1) + $mom_cycle_feed_to * $mom_sys_spindle_axis(1)]
        set mom_cycle_feed_to_pos(2) [expr $mom_pos(2) + $mom_cycle_feed_to * $mom_sys_spindle_axis(2)]    
 
        set mom_cycle_rapid_to_pos(0) [expr $mom_pos(0) + $mom_cycle_rapid_to * $mom_sys_spindle_axis(0)]
        set mom_cycle_rapid_to_pos(1) [expr $mom_pos(1) + $mom_cycle_rapid_to * $mom_sys_spindle_axis(1)]
        set mom_cycle_rapid_to_pos(2) [expr $mom_pos(2) + $mom_cycle_rapid_to * $mom_sys_spindle_axis(2)]    
 
        set mom_cycle_retract_to_pos(0) [expr $mom_pos(0) + $mom_cycle_retract_to * $mom_sys_spindle_axis(0)]
        set mom_cycle_retract_to_pos(1) [expr $mom_pos(1) + $mom_cycle_retract_to * $mom_sys_spindle_axis(1)]
        set mom_cycle_retract_to_pos(2) [expr $mom_pos(2) + $mom_cycle_retract_to * $mom_sys_spindle_axis(2)]    
 
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
  global mom_sys_leader mom_kin_machine_resolution
  global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
  global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
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
      if {$mom_sys_lock_plane == $fifth_axis} {
         set angle [expr ($temp(4))*$DEG2RAD]
         ROTATE_VECTOR $fifth_axis $angle temp temp1
         VMOV 3 temp1 temp
         set temp(4) 0.0
     }
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
      if { $rad < [expr abs($mom_sys_lock_value) + $mom_kin_machine_resolution]} {
         if {$mom_sys_lock_value < 0.0} {
            set temp($mom_sys_lock_axis) [expr -$rad]
         } else {
            set temp($mom_sys_lock_axis) $rad
         }
      } else {
         set temp($mom_sys_lock_axis) $mom_sys_lock_value
      }

      set temp($unlocked_axis)  [expr sqrt($rad*$rad - $temp($mom_sys_lock_axis)*$temp($mom_sys_lock_axis))]

      VMOV 5 temp temp1
      set temp1($unlocked_axis) [expr -$temp($unlocked_axis)]
      set ang1 [ARCTAN $temp($i2) $temp($i1)]
      set ang2 [ARCTAN $temp1($i2) $temp1($i1)]
      if {$fifth_axis == -1} {
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

   set or(0) [ROTSET $temp(3) $mom_prev_out_angle_pos(0) $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
   if [info exists mom_kin_5th_axis_direction] {
      set or(1) [ROTSET $temp(4) $mom_prev_out_angle_pos(1) $mom_kin_5th_axis_direction  $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
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

  if [EQ_is_equal [expr $rot(0)+$rot(1)] [expr $rotalt(0)+$rotalt(1)]] {return}
  set mom_sys_rotary_error $warn
}


#=============================================================
proc ANGLE_CHECK { a axis } {
#=============================================================
upvar $a ang

global mom_kin_4th_axis_max_limit
global mom_kin_5th_axis_max_limit
global mom_kin_4th_axis_min_limit
global mom_kin_5th_axis_min_limit
global mom_kin_4th_axis_direction
global mom_kin_5th_axis_direction

if {$axis == "4"} {
    set min $mom_kin_4th_axis_min_limit 
    set max $mom_kin_4th_axis_max_limit
    set dir $mom_kin_4th_axis_direction 
} else {
    set min $mom_kin_5th_axis_min_limit 
    set max $mom_kin_5th_axis_max_limit
    set dir $mom_kin_5th_axis_direction 
}

if {[EQ_is_equal $min 0.0] && [EQ_is_equal $max 360.0] && $dir == "MAGNITUDE_DETERMINES_DIRECTION"} {
    return 0
} else {
    while {$ang > $max && $ang > [expr $min + 360.0]} {set ang [expr $ang - 360.0]}
    while {$ang < $min && $ang < [expr $max - 360.0]} {set ang [expr $ang + 360.0]}
    if {$ang > $max || $ang < $min} {
        return -1
    } else {
        return 1
    }
}
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
         global mom_sys_lock_arc_save
         global mom_kin_arc_output_mode 
         if {[info exists mom_sys_lock_arc_save]} {
             set mom_kin_arc_output_mode $mom_sys_lock_arc_save
             unset mom_sys_lock_arc_save 
             MOM_reload_kinematics
         }
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


   global mom_sys_lock_arc_save
   global mom_kin_arc_output_mode 

   if {![info exists mom_sys_lock_arc_save]} {
      set mom_sys_lock_arc_save $mom_kin_arc_output_mode
   }
   set mom_kin_arc_output_mode "LINEAR"

   MOM_reload_kinematics

return "ON"
}


#=============================================================
proc AUTO_CLAMP {  } {
#=============================================================
#
#  This procedure is used to automatically output clamp and unclamp
#  codes.  This procedure must be placed in the the procedure
#  << PB_CMD_kin_before_motion >>.  By default this procedure will
#  output M10 or M11 to do fourth axis clamping and unclamping or
#  M12 or M13 to do fifth axis clamping and unclamping.  
#

   global mom_pos 
   global mom_prev_pos 
   global mom_sys_auto_clamp
 

   if {![info exists mom_sys_auto_clamp]} {return}
   if {$mom_sys_auto_clamp != "ON"} {return}

   set rotary_out [EQ_is_equal $mom_pos(3) $mom_prev_pos(3)]

   AUTO_CLAMP_1 $rotary_out

   set rotary_out [EQ_is_equal $mom_pos(4) $mom_prev_pos(4)]

   AUTO_CLAMP_2 $rotary_out
}


#=============================================================
proc AUTO_CLAMP_2 { out } {
#=============================================================
#
   global mom_kin_machine_type

   switch $mom_kin_machine_type {
      5_axis_dual_table -
      5_AXIS_DUAL_TABLE -
      5_axis_dual_head -
      5_AXIS_DUAL_HEAD -
      5_axis_head_table -
      5_AXIS_HEAD_TABLE {}
      default           {return}
    }

   global clamp_rotary_fifth_status 

   if {![info exists clamp_rotary_fifth_status]} {set clamp_rotary_fifth_status "UNDEFINED"}

   if {$out == 0 && $clamp_rotary_fifth_status != "UNCLAMPED"} {
      PB_CMD_unclamp_fifth_axis
      set clamp_rotary_fifth_status "UNCLAMPED"
   } elseif {$out == 1 && $clamp_rotary_fifth_status != "CLAMPED"} {
      PB_CMD_clamp_fifth_axis
      set clamp_rotary_fifth_status "CLAMPED"
   }
}


#=============================================================
proc ARCTAN { y x } {
#=============================================================
   global PI

   if [EQ_is_zero $y] { set y 0 }
   if [EQ_is_zero $x] { set x 0 }

   if { [expr $y == 0] && [expr $x == 0] } {
      return 0
   }

   set ang [expr atan2($y,$x)]

   if { $ang < 0 } {
      return [expr $ang + $PI*2]
   } else {
      return $ang
   }
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
  if [EQ_is_zero $dir] {return 0}
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
   } elseif {$plane == 2} {
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
proc AUTO_CLAMP_1 { out } {
#=============================================================
#
   global clamp_rotary_fourth_status 
 
   if {![info exists clamp_rotary_fourth_status]} {set clamp_rotary_fourth_status "UNDEFINED"}

   if {$out  == 0 && $clamp_rotary_fourth_status != "UNCLAMPED"} {
      PB_CMD_unclamp_fourth_axis
      set clamp_rotary_fourth_status "UNCLAMPED"
   } elseif {$out == 1 && $clamp_rotary_fourth_status != "CLAMPED"} {
      PB_CMD_clamp_fourth_axis
      set clamp_rotary_fourth_status "CLAMPED"
   }
}


#=============================================================
proc ROTARY_AXIS_RETRACT {  } {
#=============================================================
#
#  This procedure is used by four and five axis posts to retract
#  from the part when the rotary axis become discontinuous.  This
#  procedure is activated by setting the axis limit violation 
#  action to "retract / re-engage".  
#
 
   global mom_sys_rotary_error
   global mom_motion_event 

   if {[info exists mom_sys_rotary_error] && [info exists mom_motion_event]} { 
     if {$mom_sys_rotary_error != 0 && $mom_motion_event == "linear_move"} { 
         global mom_kin_reengage_distance
         global mom_kin_rotary_reengage_feedrate 
         global mom_kin_rapid_feed_rate                      
         global mom_pos 
         global mom_prev_pos 
         global mom_prev_rot_ang_4th mom_prev_rot_ang_5th
         global mom_kin_4th_axis_direction mom_kin_4th_axis_leader 
         global mom_out_angle_pos mom_kin_5th_axis_direction mom_kin_5th_axis_leader 
         global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset
         global mom_sys_leader mom_tool_axis mom_prev_tool_axis mom_kin_4th_axis_type
         global mom_kin_spindle_axis 
         global mom_alt_pos mom_prev_alt_pos mom_feed_rate 
         global mom_kin_rotary_reengage_feedrate 
         global mom_feed_engage_value mom_feed_cut_value
         global mom_kin_4th_axis_limit_action mom_warning_info
         global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
         global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit

        #
        #  Check for the limit action being warning only.  If so, issue warning and leave
        #

         if {$mom_kin_4th_axis_limit_action == "Warning"} {
            set mom_warning_info  "Rotary axis limit violated, discontinuous motion may result"
            MOM_catch_warning
            unset mom_sys_rotary_error
            return 
         }
        #
        # The previous rotary info is only available after the first motion.
        #
         if {![info exists mom_prev_rot_ang_4th]} {  
            set mom_prev_rot_ang_4th [MOM_ask_address_value fourth_axis]
         }
         if {![info exists mom_prev_rot_ang_5th]} {  
            set mom_prev_rot_ang_5th [MOM_ask_address_value fifth_axis]
         }

        # 
        #  Determine the type of rotary violation encountered.  There are
        #  three distinct possibilities.
        #
        #  "ROTARY CROSSING LIMIT" and a four axis machine tool.  The fourth 
        #      axis will be repositioned by either +360 or -360 before 
        #      re-engaging. (roterr=0)
        #
        #  "ROTARY CROSSING LIMIT" and a five axis machine tool.  There are two
        #      possible solutions.  If the axis that crossed a limit can be 
        #      repositioned by adding or subtracting 360, then that solution 
        #      will be used.  (roterr=0) If there is only one position available and it is
        #      not in the valid travel limits, then the alternate position will
        #      be tested.  If valid, then the "secondary rotary position being used" 
        #      method will be used. (roterr=2)
        #      If the aternate position cannot be used a warning will be given.
        #
        #  "secondary rotary position being used".  Can only occur with a five 
        #      axis machine tool.  The tool will reposition to the alternate
        #      current rotary position and re-engage to the alternate current 
        #      linear position.  (roterr=1)
        #
        #      (roterr=0)
        #      Rotary Reposition : mom_prev_pos(3,4) +- 360
        #      Linear Re-Engage : mom_prev_pos(0,1,2)
        #      Final End Point : mom_pos(0-4)
        #
        #      (roterr=1)
        #      Rotary Reposition : mom_prev_alt_pos(3,4) 
        #      Linear Re-Engage : mom_prev_alt_pos(0,1,2)
        #      Final End Point : mom_pos(0-4)
        #
        #      (roterr=2)
        #      Rotary Reposition : mom_prev_alt_pos(3,4) 
        #      Linear Re-Engage : mom_prev_alt_pos(0,1,2)
        #      Final End Point : mom_alt_pos(0-4)
        #
        #      For all cases, a warning will be given if it is not possible to
        #      to cut from the re-calculated previous position to move end point.
        #      For all valid cases the tool will, retract from the part, reposition
        #      the rotary axis and re-engage back to the part.

         if {$mom_sys_rotary_error == "ROTARY CROSSING LIMIT." } {
             global mom_kin_machine_type
             switch $mom_kin_machine_type {
                 5_axis_dual_table -
                 5_AXIS_DUAL_TABLE -
                 5_axis_dual_head -
                 5_AXIS_DUAL_HEAD -
                 5_axis_head_table -
                 5_AXIS_HEAD_TABLE {

                     set d [expr $mom_out_angle_pos(0) - $mom_prev_rot_ang_4th] 
 
                     if {[expr abs($d)] > 180.0} {
                         set min $mom_kin_4th_axis_min_limit 
                         set max $mom_kin_4th_axis_max_limit
                         if {$d > 0.0} {
                             set ang [expr $mom_prev_rot_ang_4th+360.0]
                         } else {
                             set ang [expr $mom_prev_rot_ang_4th-360.0]
                         }
                     } else {
                         set min $mom_kin_5th_axis_min_limit 
                         set max $mom_kin_5th_axis_max_limit 
                         set d [expr $mom_out_angle_pos(1) - $mom_prev_rot_ang_5th]
                         if {$d > 0.0} {
                             set ang [expr $mom_prev_rot_ang_5th+360.0]
                         } else {
                             set ang [expr $mom_prev_rot_ang_5th-360.0]
                         }
                     }

                     if {$ang >= $min && $ang <= $max } {
                         set roterr 0
                     } else {
                         set roterr 2
                     }
                 }
                 default {set roterr 0}
             }
         } else {
             set roterr 1
         }
         unset mom_sys_rotary_error

        # Retract from part

         VMOV 5 mom_pos save_pos
         VMOV 5 mom_prev_pos save_prev_pos
         VMOV 2 mom_out_angle_pos save_out_angle_pos
         set save_feedrate $mom_feed_rate

         global mom_sys_spindle_axis
         GET_SPINDLE_AXIS mom_prev_tool_axis

         global mom_kin_retract_type
         global mom_kin_retract_distance
         global mom_kin_retract_plane

         if { ![info exists mom_kin_retract_distance] } {
            if [info exists mom_kin_retract_plane] {
              # Convert legacy variable
               set mom_kin_retract_distance $mom_kin_retract_plane
            } else {
               set mom_kin_retract_distance 10.0
            }
         }

         if { ![info exists mom_kin_retract_type] } {
            set mom_kin_retract_type "DISTANCE"
         }

        # Pre-release type conversion
         if [string match "PLANE" $mom_kin_retract_type] {
            set mom_kin_retract_type "SURFACE"
         }

         switch $mom_kin_retract_type {
             SURFACE {
               set cen(0) 0.0
               set cen(1) 0.0
               set cen(2) 0.0
               if [info exists mom_kin_4th_axis_center_offset] {
                  VEC3_add cen mom_kin_4th_axis_center_offset cen
               }

               if {$mom_kin_4th_axis_type == "Table"} {
                  set num_sol [CALC_CYLINDRICAL_RETRACT_POINT mom_prev_pos mom_kin_spindle_axis  $mom_kin_retract_distance ret_pt]
               } else {
                  set num_sol [CALC_SPHERICAL_RETRACT_POINT mom_prev_pos mom_prev_tool_axis cen  $mom_kin_retract_distance ret_pt]
               }
               if {$num_sol != 0} {VEC3_add ret_pt cen mom_pos}
             }

             DISTANCE -
             default {
               set mom_pos(0) [expr $mom_prev_pos(0)+$mom_kin_retract_distance*$mom_sys_spindle_axis(0)]
               set mom_pos(1) [expr $mom_prev_pos(1)+$mom_kin_retract_distance*$mom_sys_spindle_axis(1)]
               set mom_pos(2) [expr $mom_prev_pos(2)+$mom_kin_retract_distance*$mom_sys_spindle_axis(2)]
               set num_sol 1
             }
         }


         global mom_motion_distance
         global mom_feed_rate_number
         global mom_sys_frn_factor
         global mom_feed_retract_value
         global mom_feed_approach_value
  

         set dist [expr $mom_kin_reengage_distance*2.0]

         if {$num_sol != 0} {
        #
        # Retract from the part at rapid feed rate.  This is the same for all conditions.
        #
            MOM_suppress once fourth_axis fifth_axis            
            set mom_feed_rate $mom_feed_retract_value                      
            if [EQ_is_equal $mom_feed_rate 0.0] {set mom_feed_rate $mom_kin_rapid_feed_rate}
            VEC3_sub mom_pos mom_prev_pos del_pos
            set dist [VEC3_mag del_pos] 
            set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate)/ $dist]
            FEEDRATE_SET
            set retract "yes"
         } else {
            set mom_warning_info "Retraction geometry is defined inside of the current point.  \nNo retraction will be output.  Set the retraction distance to a greater value."
            MOM_catch_warning
            set retract "no"
         }

         if {$roterr == 0} {
#
#  This section of code handles the case where a limit forces a reposition to an angle
#  by adding or subtracting 360 until the new angle is within the limits.
#  This is either a four axis case or a five axis case where it is not a problem
#  with the inverse kinematics forcing a change of solution.
#  This is only a case of "unwinding" the table.
#
            if {$retract == "yes"} {PB_CMD_retract_move}
           #
           # move to alternate rotary position
           #
            if [info exists mom_kin_4th_axis_direction] {
               set mom_out_angle_pos(0) [ROTSET $mom_prev_pos(3) $mom_out_angle_pos(0)  $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader  mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
            }
            if [info exists mom_kin_5th_axis_direction] {
               set mom_out_angle_pos(1) [ROTSET $mom_prev_pos(4) $mom_out_angle_pos(1)  $mom_kin_5th_axis_direction  $mom_kin_5th_axis_leader  mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
            }
            PB_CMD_reposition_move
	     #
	     #  position back to part at approach feed rate
	     #
            GET_SPINDLE_AXIS mom_prev_tool_axis
            for {set i 0} {$i < 3} {incr i} {
               set mom_pos($i) [expr $mom_prev_pos($i)+$mom_kin_reengage_distance*$mom_sys_spindle_axis($i)]
            }
            set mom_feed_rate $mom_feed_approach_value                      
            if [EQ_is_equal $mom_feed_rate 0.0] {set mom_feed_rate $mom_kin_rapid_feed_rate}
            set dist [expr $dist-$mom_kin_reengage_distance]
            if [EQ_is_zero $dist] {set dist .0001}
            set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate) / $dist ]
            FEEDRATE_SET
            MOM_suppress once fourth_axis fifth_axis
            PB_CMD_linear_move
	     #
	     #  feed back to part at engage feed rate
	     #        
            MOM_suppress once fourth_axis fifth_axis
            if {$mom_feed_engage_value  > 0.0} {
               set mom_feed_rate $mom_feed_engage_value  
            } elseif {$mom_feed_cut_value  > 0.0} {
               set mom_feed_rate $mom_feed_cut_value  
            } else {
               set mom_feed_rate 10.0
            }
            FEEDRATE_SET
            VEC3_sub mom_pos mom_prev_pos del_pos
            set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate) / $mom_kin_reengage_distance ]
            VMOV 3 mom_prev_pos mom_pos
            PB_CMD_linear_move

            VEC3_sub mom_pos save_pos del_pos
            set dist [VEC3_mag del_pos]
            set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate)/ $dist]
            FEEDRATE_SET

            VMOV 5 save_pos mom_pos
            VMOV 5 save_prev_pos mom_prev_pos
            VMOV 2 save_out_angle_pos mom_out_angle_pos
         } else {
#
#  This section of code handles the case where there are two solutions to the tool axis inverse kinematics.
#  The post is forced to change from one solution to the other.  This causes a discontinuity in the tool path.
#  The post needs to retract, rotate to the new rotaries, then position back to the part using the alternate
#  solution.
# 
            #
            #  Check for rotary axes in limits before retracting
            # 
            set res [ANGLE_CHECK mom_prev_alt_pos(3) 4]
            if {$res == 1} {
                set mom_out_angle_pos(0) [ROTSET $mom_prev_alt_pos(3) $mom_prev_rot_ang_4th  $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader  mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
            } elseif {$res == 0} {
                set mom_out_angle_pos(0) $mom_prev_alt_pos(3)
            } else {
                set mom_warning_info "Not possible to position to alternate rotary axis positions.  Gouging may result" 
                MOM_catch_warning
                VMOV 5 save_pos mom_pos
                return
           }
            set res [ANGLE_CHECK mom_prev_alt_pos(4) 5]
            if {$res == 1} {
                set mom_out_angle_pos(1) [ROTSET $mom_prev_alt_pos(4) $mom_prev_rot_ang_5th  $mom_kin_5th_axis_direction  $mom_kin_5th_axis_leader  mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
            } elseif {$res == 0} {
                set mom_out_angle_pos(1) $mom_prev_alt_pos(4)
            } else {
                set mom_warning_info "Not possible to position to alternate rotary axis positions.  Gouging may result" 
                MOM_catch_warning
                VMOV 5 save_pos mom_pos
                return
            }
            if {$retract == "yes"} {PB_CMD_retract_move}
           #
           # move to alternate rotary position
           #
            set mom_pos(3) $mom_prev_alt_pos(3)
            set mom_pos(4) $mom_prev_alt_pos(4)
            set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
            set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
            VMOV 3 mom_prev_pos mom_pos
            PB_CMD_reposition_move
	     #
	     #  position back to part at approach feed rate
	     #
            set mom_prev_pos(3) $mom_pos(3)
            set mom_prev_pos(4) $mom_pos(4)
            for {set i 0} {$i < 3} {incr i} {
               set mom_pos($i) [expr $mom_prev_alt_pos($i)+$mom_kin_reengage_distance*$mom_sys_spindle_axis($i)]
            }
            MOM_suppress once fourth_axis fifth_axis
            set mom_feed_rate $mom_feed_approach_value                      
            if [EQ_is_equal $mom_feed_rate 0.0] {set mom_feed_rate $mom_kin_rapid_feed_rate}
            set rdist [expr $dist-$mom_kin_reengage_distance]
            if {$rdist <= 0.0} {set rdist $mom_kin_reengage_distance}
            set mom_feed_rate_number [expr $mom_sys_frn_factor*$mom_feed_rate / $rdist ]
            FEEDRATE_SET
            PB_CMD_linear_move

	     #
	     #  feed back to part at engage feed rate
	     #        
            MOM_suppress once fourth_axis fifth_axis
            if {$mom_feed_engage_value  > 0.0} {
               set mom_feed_rate $mom_feed_engage_value  
            } elseif {$mom_feed_cut_value  > 0.0} {
               set mom_feed_rate $mom_feed_cut_value  
            } else {
               set mom_feed_rate 10.0
            }
            VEC3_sub mom_pos mom_prev_alt_pos del_pos
            set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate) / $mom_kin_reengage_distance ]
            VMOV 3 mom_prev_alt_pos mom_pos
            FEEDRATE_SET
            PB_CMD_linear_move

 
            VEC3_sub mom_pos save_pos del_pos
            set dist [VEC3_mag del_pos]
            if {$dist <= 0.0} {set dist $mom_kin_reengage_distance}
            set mom_feed_rate_number [expr ($mom_sys_frn_factor*$mom_feed_rate)/ $dist]
            FEEDRATE_SET

            if {$roterr == 2} {
                VMOV 5 mom_alt_pos mom_pos
            } else {
                VMOV 5 save_pos mom_pos
            }

            set mom_out_angle_pos(0) [ROTSET $mom_pos(3) $mom_out_angle_pos(0)  $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader  mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
            set mom_out_angle_pos(1) [ROTSET $mom_pos(4) $mom_out_angle_pos(1)  $mom_kin_5th_axis_direction  $mom_kin_5th_axis_leader  mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]

            MOM_reload_variable -a mom_out_angle_pos
            MOM_reload_variable -a mom_pos
            MOM_reload_variable -a mom_prev_pos
         }
   
         set save_feedrate $mom_feed_rate
         FEEDRATE_SET
      }
   }
}


#=============================================================
proc ROTSET { angle prev_angle dir kin_leader sys_leader min max } {
#=============================================================
#
#  This procedure will take an input angle and format for a specific machine.
#  It will also validate that the angle is within the specified limits of
#  machine.
#
#  angle	      angle to be output.
#  prev_angle	previous angle output.  It should be mom_out_angle_pos
#  dir		can be either MAGNITUDE_DETERMINES_DIRECTION or 
#		      SIGN_DETERMINES_DIRECTION
#  kin_leader	leader (usually A, B or C) defined by postbuilder
#  sys_leader     leader that is created by rotset.  It could be C-.
#  min            minimum degrees of travel for current axis		
#  max            maximum degrees of travel for current axis
#
#  This procedure is called the follow functions.
#  LOCK_AXIS, RETRACT_ROTARY_AXIS, MOM_rotate, LINEARIZE_OUTPUT and MILL_TURN
#
#
#=============================================================

   upvar $sys_leader lead

#
#  Make sure angle is 0-360 to start with.
#
   LIMIT_ANGLE $angle

   if {$dir == "MAGNITUDE_DETERMINES_DIRECTION"} {
#
#  If magnitude determines direction and total travel is less than or equal
#  to 360, we can assume there is at most one valid solution.  Find it and
#  leave.  Check for the total travel being less than 360 and give a warning
#  if a valid position cannot be found.
#
      set travel [expr $max - $min]
      if {$travel <= 360.0} {
          while {$angle < $min} {set angle [expr $angle + 360.0]}
          while {$angle > $max} {set angle [expr $angle - 360.0]}
          if {$angle < $min} {
              global mom_warning_info 
              set mom_warning_info "$kin_leader-axis is under minimum or over maximum.  Assumed default."
              MOM_catch_warning
          }
      } else {
#
#  If magnitude determines direction and total travel is greater than 
#  360, we need to find the best solution that cause a move of 180 degree
#  or less.  
#
          while {[expr abs([expr $angle - $prev_angle])] > 180.0} {
              if {[expr $angle - $prev_angle] < -180.0} {
                  set angle [expr $angle + 360.0]
              } elseif {[expr $angle - $prev_angle] > 180.0} {
                  set angle [expr $angle - 360.0]
              }
          }
#
#  Check for the best solution being out of the travel limits.  Use the
#  next best valid solution.
#
          while {$angle < $min} {set angle [expr $angle + 360.0]}
          while {$angle > $max} {set angle [expr $angle - 360.0]}
      }
   } elseif {$dir == "SIGN_DETERMINES_DIRECTION"} {
#
#  Sign determines direction.  Determine whether the shortest distance is
#  clockwise or counterclockwise.  If counterclockwise append a "-" sign
#  to the address leader.
#
      set del [expr $angle-$prev_angle]
      if {($del < 0.0 && $del > -180.0) || $del > 180.0} {
          set lead "$kin_leader-"
      } else {
          set lead $kin_leader
      } 
#
#  There are no alternate solutions if the position is out of limits.  Give 
#  a warning a leave.
#
      if {$angle < $min || $angle > $max} {
          global mom_warning_info 
          set mom_warning_info "$kin_leader-axis is under minimum or over maximum.  Assumed default."
          MOM_catch_warning
      }
   }

return $angle
}


#=============================================================
proc GET_SPINDLE_AXIS { input_tool_axis } {
#=============================================================
  upvar $input_tool_axis axis

  global mom_kin_4th_axis_type
  global mom_kin_4th_axis_plane
  global mom_kin_5th_axis_type
  global mom_kin_spindle_axis
  global mom_sys_spindle_axis
  
  if {$mom_kin_4th_axis_type == "Table"} {
    VMOV 3 mom_kin_spindle_axis mom_sys_spindle_axis 
  } elseif {$mom_kin_5th_axis_type == "Table"} {
    VMOV 3 axis vec
    if {$mom_kin_4th_axis_plane == "XY"} {
      set vec(2) 0.0
    } elseif {$mom_kin_4th_axis_plane == "ZX"} {
      set vec(1) 0.0
    } elseif {$mom_kin_4th_axis_plane == "YZ"} {
      set vec(0) 0.0
    }
    set len [VEC3_unitize vec mom_sys_spindle_axis]
    if [EQ_is_zero $len] {set mom_sys_spindle_axis(2) 1.0}
  } else {
    VMOV 3 axis mom_sys_spindle_axis
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


