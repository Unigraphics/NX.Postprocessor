########################## TCL Event Handlers ##########################
#
#  Created by smithm  @  Mon Feb 28 13:58:20 2005 GMT Daylight Time
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
     set mom_sys_output_file_suffix                "ptp"
     set mom_sys_commentary_output                 "ON" 
     set mom_sys_commentary_list                   "x y z 4axis 5axis feed speed"

     set mom_sys_control_out                       "("  
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
  set mom_sys_unit_code(IN)                     "70" 
  set mom_sys_unit_code(MM)                     "71" 
  set mom_sys_cycle_start_code                  "100"
  set mom_sys_cycle_off                         "80" 
  set mom_sys_cycle_drill_code                  "81" 
  set mom_sys_cycle_drill_dwell_code            "81" 
  set mom_sys_cycle_drill_deep_code             "83" 
  set mom_sys_cycle_drill_break_chip_code       "82" 
  set mom_sys_cycle_tap_code                    "84" 
  set mom_sys_cycle_bore_code                   "85" 
  set mom_sys_cycle_bore_drag_code              "86" 
  set mom_sys_cycle_bore_no_drag_code           "76" 
  set mom_sys_cycle_bore_dwell_code             "85" 
  set mom_sys_cycle_bore_manual_code            "88" 
  set mom_sys_cycle_bore_back_code              "87" 
  set mom_sys_cycle_bore_manual_dwell_code      "88" 
  set mom_sys_output_code(ABSOLUTE)             "90" 
  set mom_sys_output_code(INCREMENTAL)          "91" 
  set mom_sys_cycle_ret_code(AUTO)              "98" 
  set mom_sys_cycle_ret_code(MANUAL)            "99" 
  set mom_sys_reset_code                        "54" 
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
  set mom_sys_spindle_range_code(1)             "41" 
  set mom_sys_spindle_param(1,max)              "6000"
  set mom_sys_spindle_param(1,min)              "10" 
  set mom_sys_spindle_range_code(2)             "42" 
  set mom_sys_spindle_param(2,max)              "0"  
  set mom_sys_spindle_param(2,min)              "0"  
  set mom_sys_spindle_range_code(3)             "43" 
  set mom_sys_spindle_param(3,max)              "0"  
  set mom_sys_spindle_param(3,min)              "0"  
  set mom_sys_spindle_range_code(4)             "44" 
  set mom_sys_spindle_param(4,max)              "0"  
  set mom_sys_spindle_param(4,min)              "0"  
  set mom_sys_spindle_range_code(5)             "45" 
  set mom_sys_spindle_param(5,max)              "0"  
  set mom_sys_spindle_param(5,min)              "0"  
  set mom_sys_spindle_range_code(6)             "46" 
  set mom_sys_spindle_param(6,max)              "0"  
  set mom_sys_spindle_param(6,min)              "0"  
  set mom_sys_spindle_range_code(7)             "47" 
  set mom_sys_spindle_param(7,max)              "0"  
  set mom_sys_spindle_param(7,min)              "0"  
  set mom_sys_spindle_range_code(8)             "48" 
  set mom_sys_spindle_param(8,max)              "0"  
  set mom_sys_spindle_param(8,min)              "0"  
  set mom_sys_spindle_range_code(9)             "49" 
  set mom_sys_spindle_param(9,max)              "0"  
  set mom_sys_spindle_param(9,min)              "0"  
  set mom_sys_sim_cycle_drill                   "0"  
  set mom_sys_sim_cycle_drill_dwell             "0"  
  set mom_sys_sim_cycle_drill_deep              "0"  
  set mom_sys_sim_cycle_drill_break_chip        "0"  
  set mom_sys_sim_cycle_tap                     "0"  
  set mom_sys_sim_cycle_bore                    "0"  
  set mom_sys_sim_cycle_bore_drag               "0"  
  set mom_sys_sim_cycle_bore_nodrag             "1"  
  set mom_sys_sim_cycle_bore_manual             "1"  
  set mom_sys_sim_cycle_bore_dwell              "0"  
  set mom_sys_sim_cycle_bore_manual_dwell       "1"  
  set mom_sys_sim_cycle_bore_back               "1"  
  set mom_sys_cir_vector                        "Vector - Arc Start to Center"
  set mom_sys_spindle_ranges                    "9"  
  set mom_sys_rewind_stop_code                  "\#" 
  set mom_sys_home_pos(0)                       "0"  
  set mom_sys_home_pos(1)                       "-150"
  set mom_sys_home_pos(2)                       "400"
  set mom_sys_zero                              "0"  
  set mom_sys_opskip_block_leader               "/"  
  set mom_sys_seqnum_start                      "10" 
  set mom_sys_seqnum_incr                       "10" 
  set mom_sys_seqnum_freq                       "1"  
  set mom_sys_seqnum_max                        "9999"
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
  set mom_sys_leader(N)                         "N"  
  set mom_sys_leader(X)                         "X"  
  set mom_sys_leader(Y)                         "Y"  
  set mom_sys_leader(Z)                         "Z"  
  set mom_sys_leader(fourth_axis)               "B"  
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
  set mom_sys_post_description                  ""

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "OFF"
  set mom_kin_4th_axis_leader                   "B"  
  set mom_kin_4th_axis_limit_action             "Warning"
  set mom_kin_4th_axis_max_limit                "360"
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "0"  
  set mom_kin_4th_axis_plane                    "ZX" 
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Table"
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.01"
  set mom_kin_machine_resolution                ".001"
  set mom_kin_machine_type                      "3_axis_mill"
  set mom_kin_max_arc_radius                    "16000"
  set mom_kin_max_dpm                           "10" 
  set mom_kin_max_fpm                           "15000"
  set mom_kin_max_fpr                           "100"
  set mom_kin_max_frn                           "100"
  set mom_kin_min_arc_length                    "0.001"
  set mom_kin_min_arc_radius                    "0.2"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.01"
  set mom_kin_min_fpr                           "0.01"
  set mom_kin_min_frn                           "0.01"
  set mom_kin_output_unit                       "MM" 
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_pivot_guage_offset                ""   
  set mom_kin_post_data_unit                    "MM" 
  set mom_kin_rapid_feed_rate                   "6000"
  set mom_kin_tool_change_time                  ""   
  set mom_kin_x_axis_limit                      "800"
  set mom_kin_y_axis_limit                      "800"
  set mom_kin_z_axis_limit                      "400"




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
   MOM_force Once G Z
   MOM_do_template auto_tool_change
   MOM_force Once G X Y
   MOM_do_template auto_tool_change_1
   MOM_do_template end_of_program_1
   MOM_do_template end_of_program
   MOM_set_seq_off
   PB_CMD_append_cycle_blocks
   PB_CMD_end_sequence

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

   PB_CMD_post_processor_version
   PB_CMD_initialise_variables
   PB_CMD_new_procedures
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

   PB_CMD_start_of_operation_force_addresses
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
   PB_CMD_check_update_post_from_tool_is_on
   MOM_set_seq_off
   PB_CMD_prog_number
   PB_CMD_init_tool_list
   PB_CMD_create_tool_list
   PB_CMD_repeat_programme_number
   MOM_set_seq_on
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
   PB_CMD_tool_change_force_addresses
   MOM_force Once G Z
   MOM_do_template auto_tool_change
   MOM_force Once G X Y
   MOM_do_template auto_tool_change_1
   MOM_force Once G_plane T M
   MOM_do_template tool_change_1
   PB_CMD_start_up_stuff
}


#=============================================================
proc PB_manual_tool_change { } {
#=============================================================
   PB_CMD_tool_change_force_addresses
   MOM_do_template stop
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_intial_move_flag

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
   PB_CMD_reverse_spindle_speed
   MOM_force Once S
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
   MOM_do_template cutcom_off
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

   PB_CMD_reverse_spindle_speed
   MOM_do_template linear_move_1
   PB_CMD_reset_lube
   MOM_do_template linear_move_2
   MOM_do_template linear_move
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   CIRCLE_SET
   PB_CMD_reverse_spindle_speed
   MOM_do_template circular_move_1
   PB_CMD_reset_lube
   MOM_do_template circular_move_2
   PB_CMD_force_xyz
   MOM_force Once G_motion
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
   PB_CMD_reverse_spindle_speed
   MOM_do_template rapid_move
   MOM_do_template rapid_move_1
   set rapid_spindle_blk {G X Y Z}
   set rapid_spindle_x_blk {G X}
   set rapid_spindle_y_blk {G Y}
   set rapid_spindle_z_blk {G Z}
   set rapid_traverse_blk {G X Y Z}
   set rapid_traverse_xy_blk {G X Y}
   set rapid_traverse_yz_blk {G Y Z}
   set rapid_traverse_xz_blk {G X Z}
   set rapid_traverse_mod {G}
   set rapid_spindle_mod {G}

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
   MOM_do_template cycle_off
   PB_CMD_unset_cycle_delay
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_drill
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_drill_dwell
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_drill_deep
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_drill_break_chip
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_tap
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_bore
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_bore_drag
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_invalid_cycles
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

   PB_CMD_invalid_cycles
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

   PB_CMD_reset_cycle_parameters
   MOM_set_seq_off
   PB_CMD_output_drill_cycle
   MOM_do_template cycle_bore_dwell
   MOM_set_seq_on
   MOM_force Once cycle_number
   MOM_do_template post_startblk
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

   PB_CMD_invalid_cycles
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

   PB_CMD_invalid_cycles
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_sequence_number { } {
#=============================================================
   SEQNO_SET
}


#=============================================================
proc PB_CMD_append_cycle_blocks { } {
#=============================================================
if {[file exists "C:\\temp\\mike_smiths_temporary_output_file.txt"]} { set test [open C:\\temp\\mike_smiths_temporary_output_file.txt r]
    while {![eof $test]} { gets $test mks_cycle_block
                          if {$mks_cycle_block != ""} {MOM_output_literal $mks_cycle_block}
                         }
   close $test
   MOM_remove_file "C:\\temp\\mike_smiths_temporary_output_file.txt"
  }
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_check_cycle_delay { } {
#=============================================================
global mom_cycle_delay

if {![info exists mom_cycle_delay]} {set mom_cycle_delay 0}
}


#=============================================================
proc PB_CMD_check_update_post_from_tool_is_on { } {
#=============================================================
global mom_update_post_cmds_from_tool
if {$mom_update_post_cmds_from_tool  == 0} {MOM_abort "\n\n***** Update Post From Tool Option is OFF ***** \n\n"}
}


#=============================================================
proc PB_CMD_create_tool_list { } {
#=============================================================
#  Place this custom command in either the start of program
#  or the end of program event marker to generate a tool list
#  in your NC file.
#
#  You will also need to place the custom command 
#  PB_CMD_init_tool_list in the start of program event marker.
#
#  The Shop Doc template file "pb_post_tool_list.tpl" distributed with
#  Post Builder in "POSTBUILD/pblib/misc" directory can be copied
#  to the "mach/resource/postprocessor" or "mach/resource/shop_docs" directory,
#  in case that your UG runtime environment does not have access to the
#  Post Builder installation.
#  Placing "pb_post_tool_list.tpl" in ohter location can also be accomplished by
#  changing the scripts below in this proc.
#
#  The variable "tool_list_output_type" set in this proc allows you
#  to select the type of tool list to be generated.
#  The options are as follows:
#
#   "ORDER_IN_USE"     - List tools in the order of use in program.
#   "ALL_UNIQUE"       - List all unique tools in the order of use.
#   "GROUP_BY_TYPE"    - List tools in groups for different tool types.
#
# The default is set to "GROUP_BY_TYPE".
#

   global mom_sys_tool_list_initialized

   if { ![info exists mom_sys_tool_list_initialized] || !$mom_sys_tool_list_initialized } {
      MOM_output_to_listing_device "proc PB_CMD_init_tool_list must be executed in the Start of Program before PB_CMD_create_tool_list is called."
return
   }


  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Set "tool_list_output_type" to the desired output fashion.
  #
  #   "ORDER_IN_USE"     - List tools in the order of use in program.
  #   "ALL_UNIQUE"       - List all unique tools in the order of use.
  #   "GROUP_BY_TYPE"    - List tools in groups for different tool types.
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   set tool_list_output_type "ORDER_IN_USE"
  # set tool_list_output_type "ALL_UNIQUE"
  # set tool_list_output_type "GROUP_BY_TYPE"


   global mom_sys_control_out mom_sys_control_in
   global current_program_name
   global mom_tool_number mom_tool_length_adjust_register mom_tool_name


  # Save info for the currently active tool in the program being post-prcessed
  # before starting Shop Doc mechanism for tool list generation.

   if [info exists mom_tool_number] {
      set saved_tool_number $mom_tool_number
   }

   if [info exists mom_tool_length_adjust_register] {
      set saved_adjust_register $mom_tool_length_adjust_register
   }

   if [info exists mom_tool_length_adjust_register] {
      set saved_tool_name $mom_tool_name
   }


  # Create tool list per selected top-level group.
  # Group name is set to blank if no group has been selected.

   global mom_parent_group_name

   if [info exists mom_parent_group_name] {
      set current_program_name $mom_parent_group_name
   } else {
      set current_program_name ""
   }


   set ci " "
   set co " "

   if [info exists mom_sys_control_in] { set ci $mom_sys_control_in }
   if [info exists mom_sys_control_out] { set co $mom_sys_control_out }



  #*************************
  # Generate tool list data
  #*************************
   set template_file pb_post_tool_list.tpl

   set pb_lib_misc_dir  [MOM_ask_env_var UGII_BASE_DIR]/postbuild/pblib/misc/
   set cam_post_dir     [MOM_ask_env_var UGII_CAM_POST_DIR]
   set cam_shop_doc_dir [MOM_ask_env_var UGII_CAM_SHOP_DOC_DIR]

   if { [file exists [file nativename ${pb_lib_misc_dir}${template_file}]] } {

      MOM_do_template_file [file nativename ${pb_lib_misc_dir}${template_file}]

   } elseif { [file exists ${cam_post_dir}${template_file}] } {

      MOM_do_template_file ${cam_post_dir}${template_file}

   } elseif { [file exists ${cam_shop_doc_dir}${template_file}] } {

      MOM_do_template_file ${cam_shop_doc_dir}${template_file}

   } else {

      MOM_output_to_listing_device "Template file pb_post_tool_list.tpl is not found. \nTool list is not generated."
return
   }

  #******************
  # Output tool list
  #******************
   global tool_data_buffer
   global mom_sys_tool_stack

   #+++++++++++++++++++++++++++++++++++++++
   # Select desired tool list to be output
   #
   #   IN_USE - order in use
   #   ALL    - all unique tools
   #   MILL   - mills
   #   DRILL  - drills
   #   LATHE  - turning tools
   #+++++++++++++++++++++++++++++++++++++++
   switch $tool_list_output_type {

      "ORDER_IN_USE" {
         set tool_list $mom_sys_tool_stack(IN_USE)
      }

      "GROUP_BY_TYPE" {
         set tool_list [concat $mom_sys_tool_stack(LATHE)  $mom_sys_tool_stack(DRILL)  $mom_sys_tool_stack(MILL)]
      }

      default {
         set tool_list $mom_sys_tool_stack(ALL)
      }
   }


   set prev_tool_type ""

#   foreach tool $tool_list {
#
#      set tool_type $tool_data_buffer($tool,type)
#
     # Output tool type header if changed.
#      if { ![string match "$tool_type" $prev_tool_type] } {
#         if { [info exists tool_data_buffer($tool_type,header)] &&  $tool_data_buffer($tool_type,header) != "" } {
#            shop_doc_output_literal "$tool_data_buffer($tool_type,header)"
#         }
#      }

#      if [info exists tool_data_buffer($tool,output)] {
#         shop_doc_output_literal "$tool_data_buffer($tool,output)"
#      }
#      set prev_tool_type $tool_type
#   }

  # Restore currently active tool in the program being post-processed.
   if [info exists saved_tool_number] {
      set mom_tool_number $saved_tool_number
   }

   if [info exists saved_adjust_register] {
      set mom_tool_length_adjust_register $saved_adjust_register
   }

   if [info exists saved_tool_name] {
      set mom_tool_name $saved_tool_name
   }
}


#=============================================================
proc PB_CMD_custom_command { } {
#=============================================================
proc MOM_catch_warning {} {
#_______________________________________________________________________________
# This procedure generates the warnings for missing procedures and values
# falling out of MIN/MAX. 
#_______________________________________________________________________________
  global mom_warning_info
  global warn_file list_file warn_count
  global group_warn_file group_list_file group_warn_count
  global mom_sequence_mode mom_sequence_number mom_sequence_increment mom_sequence_frequency
  global mom_arc_radius

  if {[regexp "MOM_msys" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_machine_mode" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_origin" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_translate" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_lintol" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_tlset" $mom_warning_info] == 1} { return }
 
  catch {PB_catch_warning}

  if { [regexp  "mom_seqnum" $mom_warning_info] == 1 } {
    MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
  }

  if { [regexp  "MINIMUM ARC RADIUS VIOLATED" $mom_warning_info] == 1 } {MOM_output_text "Radius is $mom_arc_radius"}

  if {[hiset warn_file]} {
    puts $warn_file "$mom_warning_info " ; incr warn_count +1
    if {[hiset list_file]} {puts $list_file "$mom_warning_info "}
  }
  if {[hiset group_warn_file]} {
    puts $group_warn_file "$mom_warning_info " ; incr group_warn_count +1
    if {[hiset group_list_file]} {puts $group_list_file "$mom_warning_info "}
  }
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
proc PB_CMD_end_sequence { } {
#=============================================================
MOM_output_literal "\n?\n0000"
}


#=============================================================
proc PB_CMD_force_xyz { } {
#=============================================================
global mom_pos_arc_plane

switch $mom_pos_arc_plane { XY {MOM_force once X Y}
                           ZX {MOM_force once X Z}
                           YZ {MOM_force once Y Z}
                          }
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
proc PB_CMD_incr_cycle_number { } {
#=============================================================
global mks_cycle_number
incr mks_cycle_number
}


#=============================================================
proc PB_CMD_init_tool_list { } {
#=============================================================
#
#  This procedure will be executed automatically at the start of program and
#  anytime it is loaded as a slave post of a linked post.
#
#  Use the Custom Commands in this file to generate a tool list
#  at either the beginning or the end of your NC file.
#
#  Only the tools used in the program being post-processed will be listed.
#
#  This proc is used to add the shop doc event handlers
#  to your post.  You may edit the proc MOM_TOOL_BODY to
#  customize the output for your tool list.
#
#  In order to create the tool list, you must add the proc
#  PB_CMD_create_tool_list to either the start of program 
#  or the end of program event marker depending on where
#  you want the tool list to be output in your NC tape.
#
#  The Shop Doc template file "pb_post_tool_list.tpl that resides in the
#  "POSTBUILD/pblib/misc" directory is required for this service to work.
#  You may want to copy it to the "mach/resource/postprocessor"
#  or "mach/resource/shop_docs" directory, in case that your
#  UG runtime environment does not have access to the Post Builder
#  installation.
# 

   global mom_sys_tool_list_initialized


uplevel #0 {

proc MOM_TOOL_BODY { } {
   global mom_tool_name
   global mom_tool_diameter
   global mom_tool_length
   global mom_tool_type
   global mom_template_subtype
   global mom_tool_point_angle
   global mom_tool_flute_length
   global mom_tool_length_adjust_register
   global mom_tool_nose_radius
   global mom_tool_corner1_radius
   global mom_tool_flute_length
   global mom_tool_orientation
   global mom_sys_control_out mom_sys_control_in
   global cycle_program_name current_program_name
   global mom_sys_tool_stack mom_sys_tool_time

   global tool_data_buffer


  # Handle single operation case.
  # current_program_name will be blank when no group has been selected.

   if { $current_program_name != "" } {
      set n1 [string toupper $cycle_program_name]
      set n2 [string toupper $current_program_name]
      if { $n1 != $n2 && $n1 != "" } {
return
      }
   } else {

     # mom_sys_change_mach_operation_name is set in MOM_machine_mode
     # Use this variable to generate tool info for a single operation.

      global mom_sys_change_mach_operation_name mom_operation_name

      if [info exists mom_sys_change_mach_operation_name] {
         if { ![string match "$mom_operation_name" $mom_sys_change_mach_operation_name] } {
return
         }
      } else {
return
      }
   }
 
  #****************************
  # Collect various tool lists
  #****************************
   lappend mom_sys_tool_stack(IN_USE) $mom_tool_name

   set tool_type [MAP_TOOL_TYPE]

   if { [lsearch $mom_sys_tool_stack(ALL) $mom_tool_name] < 0 } {

      lappend mom_sys_tool_stack(ALL)         $mom_tool_name
      lappend mom_sys_tool_stack($tool_type)  $mom_tool_name

# MKS output
MOM_force once R
MOM_do_template tool_definition

   }


  #**************************************************
  # Define data to be output for each tool per type #
  #**************************************************
   set output ""
   set tool_time ""


   set ci $mom_sys_control_in
   set co $mom_sys_control_out

   if { $mom_template_subtype == "" } { set mom_template_subtype $mom_tool_type }

   switch $tool_type {

      "MILL" {

         set output [format "%-20s %-20s %-10.4f %-10.4f %-10.4f %-10d"  $mom_tool_name $mom_template_subtype $mom_tool_diameter $mom_tool_corner1_radius  $mom_tool_flute_length $mom_tool_length_adjust_register] 

         if [info exists mom_sys_tool_time($mom_tool_name)] {
            set tool_time [format "%-10.2f" $mom_sys_tool_time($mom_tool_name)]
         } else {
            set tool_time ""
         }
      }

      "DRILL" {

         set mom_tool_point_angle [expr (180.0 / 3.14159) * $mom_tool_point_angle]
         set output [format "%-20s %-20s %-10.4f %-10.4f %-10.4f %-10d"  $mom_tool_name $mom_template_subtype  $mom_tool_diameter $mom_tool_point_angle  $mom_tool_flute_length $mom_tool_length_adjust_register] 

         if [info exists mom_sys_tool_time($mom_tool_name)] {
            set tool_time [format "%-10.2f" $mom_sys_tool_time($mom_tool_name)]
         } else {
            set tool_time ""
         }
      }

      "LATHE" {

         set pi [expr 2 * asin(1.0)]
         set tool_orient [expr (180. / 3.14159) * $mom_tool_orientation]
         set output [format "%-20s %-20s %-10.4f %-15.4f %-10d"  $mom_tool_name $mom_template_subtype  $mom_tool_nose_radius $tool_orient  $mom_tool_length_adjust_register] 
  
         if [info exists mom_sys_tool_time($mom_tool_name)] {
            set tool_time [format "%-10.2f" $mom_sys_tool_time($mom_tool_name)]
         } else {
            set tool_time ""
         }
      }
   }


  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Store data to be output or used in PB_CMD_create_tool_list.
  #
  # <Ex.>
  #  global mom_tool_number
  #   set tool_data_buffer($mom_tool_name,tool_number) $mom_tool_number
  #
  # If a BLOCK_TEMPLATE is used to output the data, the global varaibles
  # used in the expression of an Address need to be set accordingly
  # before "MOM_do_template" is called.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   set tool_data_buffer($mom_tool_name,output) "$co$output$tool_time$ci"
   set tool_data_buffer($mom_tool_name,type)   "$tool_type"
}


proc MOM_SETUP_HDR {} {
   global mom_sys_control_out mom_sys_control_in


  # Initialize various tool lists
   global mom_sys_tool_stack

   set mom_sys_tool_stack(IN_USE) [list]
   set mom_sys_tool_stack(ALL)    [list]
   set mom_sys_tool_stack(MILL)   [list]
   set mom_sys_tool_stack(DRILL)  [list]
   set mom_sys_tool_stack(LATHE)  [list]


   set ci $mom_sys_control_in
   set co $mom_sys_control_out


  #++++++++++++++++++++++++++++++++++++++++++
  # Define header to be output per tool type
  #++++++++++++++++++++++++++++++++++++++++++
   global tool_data_buffer

   set tool_desc   "DESCRIPTION"
   set tool_dia    "DIAMETER"
   set corner_rad  "COR RAD"
   set tip_ang     "TIP ANG"
   set flute_len   "FLUTE LEN"
   set adjust      "ADJ REG"
   set nose_dia    "NOSE RAD"
   set tool_orient "TOOL ORIENT"
   set mach_time   "MACH TIME"


     set tool_name   "DRILL"
     set output [format "%-20s %-20s %-10s %-10s %-10s %-9s %-10s"  $tool_name $tool_desc  $tool_dia $tip_ang $flute_len $adjust $mach_time] 

     set header [list]
     lappend header "$co                                                                                               $ci"
     lappend header "$co-----------------------------------------------------------------------------------------------$ci"
     lappend header "$co$output$ci"
     lappend header "$co-----------------------------------------------------------------------------------------------$ci"

   set tool_data_buffer(DRILL,header) [join $header \n]


     set tool_name   "MILL"
     set output [format "%-20s %-20s %-10s %-10s %-10s %-9s %-10s"  $tool_name $tool_desc  $tool_dia $corner_rad $flute_len $adjust $mach_time] 
     
     set header [list]
     lappend header "$co                                                                                               $ci"
     lappend header "$co-----------------------------------------------------------------------------------------------$ci"
     lappend header "$co$output$ci"
     lappend header "$co-----------------------------------------------------------------------------------------------$ci"

   set tool_data_buffer(MILL,header) [join $header \n]


     set tool_name   "LATHE"
     set output [format "%-20s %-20s %-10s %-15s %-9s %-10s"  $tool_name $tool_desc $nose_dia $tool_orient $adjust $mach_time] 

     set header [list]
     lappend header "$co                                                                                               $ci"
     lappend header "$co-----------------------------------------------------------------------------------------------$ci"
     lappend header "$co$output$ci"
     lappend header "$co-----------------------------------------------------------------------------------------------$ci"

   set tool_data_buffer(LATHE,header) [join $header \n]
}


proc MOM_PROGRAMVIEW_HDR {} {}
proc MOM_SETUP_FTR {} {}


proc MOM_MEMBERS_HDR {} {
   global mom_sys_program_stack cycle_program_name
   global current_program_name

   lappend mom_sys_program_stack $cycle_program_name

   if { [lsearch $mom_sys_program_stack "$current_program_name"] >= 0 } {
      set cycle_program_name $current_program_name
   }
}


proc MOM_MEMBERS_FTR {} {
   global mom_sys_program_stack cycle_program_name
   global current_program_name

   set mom_sys_program_stack [lreplace $mom_sys_program_stack end end]
   set cycle_program_name [lindex $mom_sys_program_stack end]

   if { [lsearch $mom_sys_program_stack "$current_program_name"] >= 0 } {
      set cycle_program_name $current_program_name
   }
}


proc MOM_PROGRAM_BODY {} {
   global mom_object_name cycle_program_name

   set cycle_program_name $mom_object_name
}


proc MOM_SETUP_BODY {} {}
proc MOM_OPER_BODY  {} {}
proc MOM_TOOL_HDR   {} {}
proc MOM_TOOL_FTR   {} {}
proc MOM_PROGRAMVIEW_FTR {} {}


proc MAP_TOOL_TYPE { } {
   global mom_tool_type

   if {[string match "Milling*" $mom_tool_type]} {
      return "MILL"
   } elseif { [string match "Turning*" $mom_tool_type]} {
      return "LATHE"
   } elseif { [string match "Grooving*" $mom_tool_type]} {
      return "LATHE"
   } elseif { [string match "Threading*" $mom_tool_type]} {
      return "LATHE"
   } elseif { [string match "Drilling*" $mom_tool_type]} {
      return "DRILL"
   } else {
      return ""
   }
}


proc shop_doc_output_literal { line } {
   global tool_list_commentary list_file

   if [info exists tool_list_commentary] {
      if [info exists line] { puts $list_file $line }
   } else {
      MOM_output_literal $line
   }
}


} ;# uplevel


   set mom_sys_tool_list_initialized 1
}


#=============================================================
proc PB_CMD_initialise_variables { } {
#=============================================================
global mom_kin_helical_arc_output_mode
set mom_kin_helical_arc_output_mode LINEAR
MOM_reload_kinematics

global mom_prog_name
global mks_first_tool_flag
global mks_comment_count
global mom_sys_tool_change_code
global mks_spindle_code
global mks_cycle_number
global mks_initial_move_flag]

set mks_first_tool_flag "TRUE"
set mks_comment_count 1
set mom_sys_tool_change_code "66"
set mks_cycle_number 0
set mks_initial_move_flag "TRUE"

set mom_prog_name "999999"

set mks_spindle_code "S+"


if {[file exists "C:\\temp\\mike_smiths_temporary_output_file.txt"]} { MOM_remove_file "C:temp\\mike_smiths_temporary_output_file.txt"}
}


#=============================================================
proc PB_CMD_intial_move_flag { } {
#=============================================================
global mks_initial_move_flag
set mks_initial_move_flag "TRUE"
}


#=============================================================
proc PB_CMD_invalid_cycles { } {
#=============================================================
global mom_current_motion
MOM_abort "\n\n*** Unsupported cycle $mom_current_motion ***\n\n"
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
proc PB_CMD_linearize_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_move_cycle_def_blocks { } {
#=============================================================
set fileid_read [open "C:temp\\mike_smiths_temporary_output_file.txt" r]

while {![eof $fileid_read]} { gets $fileid_read str1
                             set test [string first "N*" $str1]
                             if {$test == 0} {MOM_output_literal $str1}
                            }

close $fileid_read
}


#=============================================================
proc PB_CMD_new_procedures { } {
#=============================================================
proc  MOM_operator_message {} {
#_______________________________________________________________________________
# This procedure is executed when the Operator Message command is activated.
#_______________________________________________________________________________
 
# This control does not support operator messages

}
}


#=============================================================
proc PB_CMD_output_arc_radius { } {
#=============================================================
global mom_arc_radius

if {$mom_arc_radius < 0.2} {MOM_output_text "Radius is $mom_arc_radius"}
}


#=============================================================
proc PB_CMD_output_drill_cycle { } {
#=============================================================
global mks_cycle_number

global cycle_name
global old_cycle_name
global mom_cycle_feed_rate
global old_mom_cycle_feed_rate
global mom_spindle_rpm
global old_mom_spindle_rpm
global mom_cycle_feed_to
global old_mom_cycle_feed_to
global mom_cycle_rapid_to
global old_mom_cycle_rapid_to
global mom_cycle_retract_to
global old_mom_cycle_retract_to
global mom_spindle_direction
global old_mom_spindle_direction

global mom_cycle_delay
global old_mom_cycle_delay
global mom_cycle_step1
global old_mom_cycle_step1

global mks_cycle_number

if {![info exists mom_cycle_delay]} {set mom_cycle_delay 0}

if {![info exists old_cycle_name] || $old_cycle_name != $cycle_name} {set CYCLE_RESET_FLAG "TRUE"} elseif {![info exists old_mom_cycle_feed_rate] || $old_mom_cycle_feed_rate != $mom_cycle_feed_rate} {set CYCLE_RESET_FLAG "TRUE"} elseif {![info exists old_mom_spindle_rpm] || $old_mom_spindle_rpm != $mom_spindle_rpm} {set CYCLE_RESET_FLAG "TRUE"} elseif {![info exists old_mom_spindle_direction] || $old_mom_spindle_direction != $mom_spindle_direction} {set CYCLE_RESET_FLAG "TRUE"} elseif {![info exists old_mom_cycle_feed_to] || $old_mom_cycle_feed_to != $mom_cycle_feed_to} {set CYCLE_RESET_FLAG "TRUE"} elseif {![info exists old_mom_cycle_rapid_to] || $old_mom_cycle_rapid_to != $mom_cycle_rapid_to} {set CYCLE_RESET_FLAG "TRUE"} elseif {![info exists old_mom_cycle_retract_to] || $old_mom_cycle_retract_to != $mom_cycle_retract_to} {set CYCLE_RESET_FLAG "TRUE"} else {set CYCLE_RESET_FLAG "FALSE"}

if {$CYCLE_RESET_FLAG == "TRUE"} { set old_cycle_name $cycle_name
                                  set old_mom_cycle_feed_rate $mom_cycle_feed_rate
                                  set old_mom_spindle_rpm $mom_spindle_rpm
                                  set old_mom_cycle_feed_to $mom_cycle_feed_to
                                  set old_mom_cycle_rapid_to $mom_cycle_rapid_to
                                  set old_mom_cycle_retract_to $mom_cycle_retract_to
                                  set old_mom_spindle_direction $mom_spindle_direction
                                 }


switch $cycle_name {
                    DRILL_DWELL {if {![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay} { set CYCLE_RESET_FLAG "TRUE"
                                                                                                                      set old_mom_cycle_delay $mom_cycle_delay
                                                                                                                     }
                                }
                    DRILL_DEEP { if {![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay} { set CYCLE_RESET_FLAG "TRUE"
                                                                                                                     set old_mom_cycle_delay $mom_cycle_delay
                                                                                                                     set old_mom_cycle_step1 $mom_cycle_step1
                                                                                                                    } elseif {![info exists old_mom_cycle_step1] || $old_mom_cycle_step1 != $mom_cycle_step1} { set CYCLE_RESET_FLAG "TRUE"
                                                                                                                         set old_mom_cycle_delay $mom_cycle_delay
                                                                                                                         set old_mom_cycle_step1 $mom_cycle_step1
                                                                                                                        }
                               }
                    DRILL_BREAK_CHIP { if {![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay} { set CYCLE_RESET_FLAG "TRUE"
                                                                                                                           set old_mom_cycle_delay $mom_cycle_delay
                                                                                                                           set old_mom_cycle_step1 $mom_cycle_step1
                                                                                                                          } elseif {![info exists old_mom_cycle_step1] || $old_mom_cycle_step1 != $mom_cycle_step1} { set CYCLE_RESET_FLAG "TRUE"
                                                                                                                               set old_mom_cycle_delay $mom_cycle_delay
                                                                                                                               set old_mom_cycle_step1 $mom_cycle_step1
                                                                                                                              }
                                     }
                    BORE_DRAG {if {![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay} { set CYCLE_RESET_FLAG "TRUE"
                                                                                                                    set old_mom_cycle_delay $mom_cycle_delay
                                                                                                                   }
                               }
                    BORE_DWELL {if {![info exists old_mom_cycle_delay] || $old_mom_cycle_delay != $mom_cycle_delay} { set CYCLE_RESET_FLAG "TRUE"
                                                                                                                     set old_mom_cycle_delay $mom_cycle_delay
                                                                                                                    }
                               }
                   }

if {$CYCLE_RESET_FLAG == "TRUE"} { incr mks_cycle_number
                                  MOM_force once G_motion F S Z_depth Z_retract cycle_dwell
                                  MOM_force once Z_secondary_clearance cycle_step X


                                  switch $cycle_name {
                                                      DRILL {set mks_cycle_name cycle_drill}
                                                      DRILL_DWELL {set mks_cycle_name cycle_drill_dwell}
                                                      DRILL_DEEP {set mks_cycle_name cycle_drill_deep}
                                                      DRILL_BREAK_CHIP {set mks_cycle_name cycle_drill_break_chip}
                                                      TAP {set mks_cycle_name cycle_tap}
                                                      BORE {set mks_cycle_name cycle_bore}
                                                      BORE_DRAG {set mks_cycle_name cycle_bore_drag}
                                                      BORE_DWELL {set mks_cycle_name cycle_bore_dwell}
                                                      default {MOM_abort "\n\n*** Unsupported cycle type $cycle_name ***\n\n"}
                                                     }

                                  set mks_cycle_block [MOM_do_template $mks_cycle_name {CREATE}]

                                  if {$mks_cycle_block != ""} { set test [open C:\\temp\\mike_smiths_temporary_output_file.txt a]
                                                               puts $test $mks_cycle_block
                                                               close $test
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
proc PB_CMD_post_processor_version { } {
#=============================================================
set pp_version 2.3

# V2.1, January 2005
# 1) Set helical mode to "LINEAR"

# V2.2, February 8th 2005
# 1)  Made M7 (lubrication) modal.
#     M7 is output on a rapid move and is reset at tool change,
#     linear motion or circular motion, so M7 is only output on the first of a 
#     sequence of rapid moves.

# V2.3, February 28th 2005
# 1) Removed M7 output

}


#=============================================================
proc PB_CMD_prog_number { } {
#=============================================================
global mom_prog_name

if {[string length $mom_prog_name] > 6} {MOM_abort "\n\n*** Programme Number Limited to 6 Digits ***\n\n"} else {MOM_output_literal "&%$mom_prog_name\n"}
}


#=============================================================
proc PB_CMD_repeat_programme_number { } {
#=============================================================
global mom_prog_name
global mom_parent_group_name
global mom_path_name

if {[info exists mom_parent_group_name]} {set string $mom_parent_group_name} else {set string $mom_path_name}
MOM_output_literal "\n%\n(&%$mom_prog_name/000000\"$string)"
}


#=============================================================
proc PB_CMD_reset_X { } {
#=============================================================
MOM_force once X
}


#=============================================================
proc PB_CMD_reset_cycle_parameters { } {
#=============================================================
global mom_pos
global mom_prev_pos
global mks_initial_move_flag
global mom_cycle_retract_to

if {[expr abs($mom_pos(2)-$mom_prev_pos(2))] > .0001 && $mks_initial_move_flag == "FALSE"} { RAPID_SET
                                                        set mom_pos(2) [expr $mom_pos(2) + $mom_cycle_retract_to]
                                                        MOM_rapid_move
                                                      }

set mks_initial_move_flag "FALSE"
}


#=============================================================
proc PB_CMD_reset_lube { } {
#=============================================================
MOM_force once M_lube
}


#=============================================================
proc PB_CMD_reset_spindle_speed { } {
#=============================================================
MOM_force once S
}


#=============================================================
proc PB_CMD_restart_output { } {
#=============================================================
global ptp_file_name

MOM_open_output_file "C:temp\\mike_smiths_temporary_output_file.txt"
MOM_open_output_file $ptp_file_name
}


#=============================================================
proc PB_CMD_reverse_spindle_speed { } {
#=============================================================
global mom_spindle_direction
global mks_spindle_code

switch $mom_spindle_direction {
                               CLW {set mks_spindle_code "S+"}
                               CCLW {set mks_spindle_code "S-"}
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
proc PB_CMD_set_cycle_drill { } {
#=============================================================
global mks_cycle_name
set mks_cycle_name "cycle_drill"
}


#=============================================================
proc PB_CMD_set_cycle_plane { } {
#=============================================================
#
# Use this command to determine and output proper plane code
# when G17/18/19 is used in the cycle definition.
#


 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # Next option can be set to 1, if the address of cycle's
 # principal axis needs to be suppressed. (Ex. siemens controller)
 #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  set suppress_principal_axis 0


 #++++++++++++++++++++++++++++++++++++++++++++++++++++++
 # Next option can be set to 1, if the plane code needs
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

        if [EQ_is_equal [expr abs($mom_pos(3))] 90.0] {

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
proc PB_CMD_start_of_operation_force_addresses { } {
#=============================================================
  MOM_force once M_spindle X Y Z F
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
global mom_sys_tool_change_code

if {[info exists mks_comment]} { for {set count 1} {$count < $mks_comment_count} {incr count} {MOM_output_literal $mks_comment($count)}
                                 unset mks_comment
                               }

set mks_initial_move_flag "TRUE"
set mks_first_cycle_after_tool_chage_flag "TRUE"
set mks_first_tool_flag "FALSE"
set mom_sys_tool_change_code "6"
}


#=============================================================
proc PB_CMD_stop_output { } {
#=============================================================
global ptp_file_name

MOM_close_output_file $ptp_file_name
MOM_open_output_file "C:temp\\mike_smiths_temporary_output_file.txt"
}


#=============================================================
proc PB_CMD_suppress_cycle_call { } {
#=============================================================
MOM_suppress always G_motion
}


#=============================================================
proc PB_CMD_suppress_tool_axis { } {
#=============================================================
global mom_pos_arc_plane

switch $mom_pos_arc_plane { XY {MOM_suppress once Z}
                           YZ {MOM_suppress once X}
                           ZX {MOM_suppress once Y}
                          }
}


#=============================================================
proc PB_CMD_tell_me_what_the_radius_is { } {
#=============================================================
global mom_arc_radius

MOM_output_text "Radius is $mom_arc_radius"
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  MOM_force once G_adjust H G_motion G64 X Y Z S M_lube
}


#=============================================================
proc PB_CMD_unset_cycle_delay { } {
#=============================================================
global mom_cycle_delay
unset mom_cycle_delay
}


#=============================================================
proc PB_CMD_warning_mks { } {
#=============================================================
proc MOM_catch_warning {} {
#_______________________________________________________________________________
# This procedure generates the warnings for missing procedures and values
# falling out of MIN/MAX. 
#_______________________________________________________________________________
  global mom_warning_info
  global warn_file list_file warn_count
  global group_warn_file group_list_file group_warn_count
  global mom_sequence_mode mom_sequence_number mom_sequence_increment mom_sequence_frequency

  if {[regexp "MOM_msys" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_machine_mode" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_origin" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_translate" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_lintol" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_tlset" $mom_warning_info] == 1} { return }
 
  catch {PB_catch_warning}

  if { [regexp  "mom_seqnum" $mom_warning_info] == 1 } {
    MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
  }

 #if { [regexp "ONE AXIS ARC MOVE" $mom_warning_info] == 1 } {MOM_abort "Problem trapped"}
global mom_mcs_goto
global mom_prev_mcs_goto
if {[regexp "ONE AXIS ARC MOVE" $mom_warning_info] == 1 } { MOM_output_text "Position $mom_mcs_goto(0),$mom_mcs_goto(1),$mom_mcs_goto(2)"
                                                           MOM_output_text "Old Position $mom_prev_mcs_goto(0),$mom_prev_mcs_goto(1),$mom_prev_mcs_goto(2)"
                                                          }

  if {[hiset warn_file]} {
    puts $warn_file "$mom_warning_info " ; incr warn_count +1
    if {[hiset list_file]} {puts $list_file "$mom_warning_info "}
  }
  if {[hiset group_warn_file]} {
    puts $group_warn_file "$mom_warning_info " ; incr group_warn_count +1
    if {[hiset group_list_file]} {puts $group_list_file "$mom_warning_info "}
  }
}
}


#=============================================================
proc PB_CMD_z_cycle_pos { } {
#=============================================================
MOM_do_template rapid_spindle_z
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


if [info exists mom_sys_start_of_program_flag] {
   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }
} else {
   set mom_sys_head_change_init_program 1
   set mom_sys_start_of_program_flag 1
}


