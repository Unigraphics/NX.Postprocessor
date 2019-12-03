########################## TCL Event Handlers ##########################
#
#  Created by paffett  @  Wed Aug 24 08:53:15 2005 Eastern Daylight Time
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
     set mom_sys_commentary_list                   "x y z feed speed"

     set mom_sys_control_out                       "(MSG,"
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
  set mom_sys_cycle_start_code                  "79" 
  set mom_sys_cycle_off                         "80" 
  set mom_sys_cycle_drill_code                  "81" 
  set mom_sys_cycle_drill_dwell_code            "82" 
  set mom_sys_cycle_drill_deep_code             "83" 
  set mom_sys_cycle_drill_break_chip_code       "73" 
  set mom_sys_cycle_tap_code                    "84" 
  set mom_sys_cycle_bore_code                   "85" 
  set mom_sys_cycle_bore_drag_code              "86" 
  set mom_sys_cycle_bore_no_drag_code           "76" 
  set mom_sys_cycle_bore_dwell_code             "89" 
  set mom_sys_cycle_bore_manual_code            "88" 
  set mom_sys_cycle_bore_back_code              "87" 
  set mom_sys_cycle_bore_manual_dwell_code      "89" 
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
  set mom_sys_program_stop_code                 "0"  
  set mom_sys_optional_stop_code                "1"  
  set mom_sys_end_of_program_code               "30" 
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
  set mom_sys_sim_cycle_drill_deep              "1"  
  set mom_sys_sim_cycle_drill_break_chip        "1"  
  set mom_sys_sim_cycle_tap                     "1"  
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
  set mom_sys_home_pos(0)                       "10.000"
  set mom_sys_home_pos(1)                       "10.000"
  set mom_sys_home_pos(2)                       "5.000"
  set mom_sys_zero                              "0"  
  set mom_sys_opskip_block_leader               "/"  
  set mom_sys_seqnum_start                      "1"  
  set mom_sys_seqnum_incr                       "1"  
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
  set mom_sys_leader(fourth_axis)               "A"  
  set mom_sys_leader(fifth_axis)                "B"  
  set mom_sys_contour_feed_mode(LINEAR)         "IPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "IPM"
  set mom_sys_cycle_feed_mode                   "IPM"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"
  set mom_sys_vnc_rapid_dogleg                  "1"  
  set mom_sys_prev_mach_head                    ""   
  set mom_sys_curr_mach_head                    ""   
  set mom_sys_contour_feed_mode(ROTARY)         "IPM"
  set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "IPM"
  set mom_sys_rapid_feed_mode(ROTARY)           "IPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "IPM"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
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
  set mom_kin_4th_axis_max_limit                "360"
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "0"  
  set mom_kin_4th_axis_plane                    "YZ" 
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Table"
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_arc_output_mode                   "QUADRANT"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.001"
  set mom_kin_machine_resolution                ".0001"
  set mom_kin_machine_type                      "3_axis_mill"
  set mom_kin_max_arc_radius                    "99.9999"
  set mom_kin_max_dpm                           "10" 
  set mom_kin_max_fpm                           "400"
  set mom_kin_max_fpr                           "100"
  set mom_kin_max_frn                           "99999.999"
  set mom_kin_min_arc_length                    "0.0001"
  set mom_kin_min_arc_radius                    "0.0001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.001"
  set mom_kin_min_frn                           "0.001"
  set mom_kin_output_unit                       "IN" 
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_pivot_guage_offset                ""   
  set mom_kin_post_data_unit                    "IN" 
  set mom_kin_rapid_feed_rate                   "200"
  set mom_kin_tool_change_time                  ""   
  set mom_kin_x_axis_limit                      "40" 
  set mom_kin_y_axis_limit                      "40" 
  set mom_kin_z_axis_limit                      "35" 




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
   PB_CMD_announce_cycle_time
   MOM_do_template end_of_program

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

   PB_CMD_startup_processing
   PB_CMD_program_id
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
   PB_CMD_announce_oper
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
   PB_CMD_start_of_alignment_character
   MOM_force Once G_motion T M
   MOM_do_template tool_change_1
   PB_CMD_end_of_alignment_character
   PB_CMD_announce_tool
   PB_CMD_tool_change_force_addresses
}


#=============================================================
proc PB_auto_tool_change { } {
#=============================================================
   MOM_do_template coolant_off
   MOM_force Once M_spindle
   MOM_do_template spindle_off
   MOM_force Once T
   MOM_do_template tool_change_2
   PB_CMD_start_of_alignment_character
   MOM_force Once G_motion T M
   MOM_do_template tool_change_1
   PB_CMD_end_of_alignment_character
   PB_CMD_announce_tool
   PB_CMD_tool_change_force_addresses
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
   MOM_force Once S M_spindle
   MOM_do_template spindle_rpm
}


#=============================================================
proc MOM_spindle_off { } {
#=============================================================
   MOM_force Once M_spindle
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
   PB_CMD_cutcom_on
}


#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
   CUTCOM_SET
   PB_CMD_cutcom_off
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
   PB_CMD_issue_safe_start
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
   PB_CMD_issue_safe_start
}


#=============================================================
proc MOM_tool_preselect { } {
#=============================================================
  global mom_tool_preselect_number mom_tool_number mom_next_tool_number
   if {[info exists mom_tool_preselect_number]} {
      set mom_next_tool_number $mom_tool_preselect_number
   }
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

   PB_CMD_coolant_with_spindle_m_code
   PB_CMD_pq_motion
   MOM_do_template linear_move_1
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   CIRCLE_SET
   PB_CMD_pq_motion
   MOM_force Once X Y
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
   PB_CMD_coolant_with_spindle_m_code
   PB_CMD_pq_motion
   MOM_do_template rapid_move
   set rapid_spindle_blk {G_motion G_mode X Y Z}
   set rapid_spindle_x_blk {G_motion G_mode X}
   set rapid_spindle_y_blk {G_motion G_mode Y}
   set rapid_spindle_z_blk {G_motion G_mode Z}
   set rapid_traverse_blk {G_motion P_cutcom X Q_cutcom Y Z S T H M_spindle}
   set rapid_traverse_xy_blk {G_motion P_cutcom X Q_cutcom Y S T H M_spindle}
   set rapid_traverse_yz_blk {G_motion P_cutcom Q_cutcom Y Z S T H M_spindle}
   set rapid_traverse_xz_blk {G_motion P_cutcom X Q_cutcom Z S T H M_spindle}
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
   PB_CMD_sim_cycle_fixup_cycle_off
   MOM_do_template cycle_off
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

   MOM_force Once S
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

   MOM_force Once S
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

   PB_CMD_sim_cycle_drill_deep_move
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

   PB_CMD_sim_cycle_drill_break_chip_move
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

   PB_CMD_set_tap_tpi_and_lead
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

   MOM_force Once S
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

   MOM_force Once S
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

   MOM_force Once S
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

   MOM_force Once S
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

   MOM_force Once S
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

   MOM_force Once S
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

   MOM_force Once S
   MOM_do_template cycle_bore_manual_dwell
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_sequence_number { } {
#=============================================================
   SEQNO_SET
}


#=============================================================
proc PB_CMD_PQ_cutcom_fix { } {
#=============================================================
# ensure that P only outputs if X is commanded
# and that Q only outputs if Y is commanded
# Set P_cutcom and Q_cutcom words to be MODAL

global mom_pos mom_prev_pos
global mom_sys_cutcom_status

# CDC must be turned on...
if { $mom_sys_cutcom_status != "OFF" } {
  set deltax [expr $mom_pos(0)-$mom_prev_pos(0)]
  set deltay [expr $mom_pos(1)-$mom_prev_pos(1)]

  # is X commanded?
  if { $deltax != 0 } {
    MOM_force once P_cutcom
  }

  # is Y commanded?
  if { $deltay != 0 } {
    MOM_force once Q_cutcom
  }
}
}


#=============================================================
proc PB_CMD_announce_cycle_time { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_announce_cycle_time
#
# Reports accumulated machine time
#
# Bind into END_OF_PROGRAM event (after the REWIND STOP)
# to include message in the output file.
# -------------------------------------------------------

global mom_machine_time mom_cutting_time mom_event_time
global mom_sys_control_out  mom_sys_control_in

# set up some variables so that control OUT and IN can be
# used as needed in output blocks:
#  - CONTROL OUT = ${co}
#  - CONTROL IN  = ${ci}
set co $mom_sys_control_out; set ci $mom_sys_control_in

# fetch machine time, format for xx.x minutes
set mtime [format "%1.1f MINUTES" $mom_machine_time]

# output to tape
MOM_output_text "${co}MACHINE TIME: $mtime${ci}"
}


#=============================================================
proc PB_CMD_announce_oper { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_announce_oper
#
# Issues operator message containing operation name
# - ignores MACHINE CONTROL operations
# - cleans operation name by replacing _'s with spaces
#
# Bind somewhere in the START OF PATH event
# -------------------------------------------------------

global mom_sys_control_out  mom_sys_control_in
global mom_path_name  mom_operation_type

# set up some variables so that control OUT and IN can be
# used as needed in output blocks:
#  - CONTROL OUT = ${co}
#  - CONTROL IN  = ${ci}
set co $mom_sys_control_out; set ci $mom_sys_control_in

# issue operator display message at start_of_operation
# -- ignore all MACHINE CONTROL operations

if {![string match "*CONTROL" [string toupper $mom_operation_type]]} {

  # filter operation name, convert underscores to spaces
  # removes brackets, asterisks
  set opname ""
  for {set i 0} {$i<[string length $mom_path_name]} {incr i} {
    set c [string index $mom_path_name $i]
    switch -- $c {
      "_" { append opname " " }
      "\[" -
      "\]" -
      "*" { }
      default { append opname $c }
      }
    }

  MOM_output_text "${co}OPER: $opname${ci}"
  }
}


#=============================================================
proc PB_CMD_announce_tool { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_announce_tool
#
# Issues operator display message for tool change
# - uses TOOL CATALOG NUMBER field if present, else
#   tool parent object name
#
# Bind somewhere in the AUTO TOOL CHANGE event
# -------------------------------------------------------

global mom_sys_control_out  mom_sys_control_in
global mom_tool_number  mom_tool_catalog_number  mom_tool_name

# set up some variables so that control OUT and IN can be
# used as needed in output blocks:
#  - CONTROL OUT = ${co}
#  - CONTROL IN  = ${ci}
set co $mom_sys_control_out; set ci $mom_sys_control_in

if { $mom_tool_catalog_number!="" } {
  set tnam [string toupper $mom_tool_catalog_number]
  } else {
  set tnam [string toupper $mom_tool_name]
  }

MOM_output_text "${co}TOOL: [string toupper $tnam]${ci}"
}


#=============================================================
proc PB_CMD_becomes_MOM_cycle_plane_change { } {
#=============================================================
# replacement handler for MOM_cycle_plane_change

# this version supports Cincinatti Milacron behavior
# of requiring a G80 cycle cancel when the cycle plane
# changes to a more positive Z height

# 1 - chain through the original version of this handler
if { [llength [info commands DEFAULT_cycle_plane_change]] } {
  DEFAULT_cycle_plane_change
}

# 2 - handle cycle plane change
# if this hole's Z-pos is more positive than the last,
# we need to issue a CYCLE/OFF with the new R

global mom_mcs_goto;		# current cycle pos
global mom_prev_mcs_goto;	# last cycle pos

if { $mom_mcs_goto(2) > $mom_prev_mcs_goto(2) } {
  MOM_do_template cycle_plane_change
  MOM_force once Z
}
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
global mom_motion_event
global mom_motion_type
global mom_nxt_motion_event
global mom_nxt_motion_type

# the P&Q cutcom fix
PB_CMD_PQ_cutcom_fix

# don't do this for the simulated cycles:
#  DRILL DEEP and DRILL BREAK CHIP
set nxt_evt [string toupper $mom_nxt_motion_event]
if { $nxt_evt == "DRILL_DEEP_MOVE" } return
if { $nxt_evt == "DRILL_BREAK_CHIP_MOVE" } return

# avoid the rapid moves prior to canned cycles
#MOM_output_text "EVENT: $mom_motion_event; TYPE: $mom_motion_type"

if { $mom_motion_type == "RAPID" && $mom_nxt_motion_type == "CYCLE" } {
  PB_CMD_suppress_spindle
}

if { $mom_motion_type == "CYCLE" && [string toupper $mom_motion_event] == "INITIAL_MOVE" } {
  PB_CMD_suppress_spindle
}
}


#=============================================================
proc PB_CMD_coolant_with_spindle_m_code { } {
#=============================================================
#outputs combined coolant/spindle M codes

global coolant_spindle_m_code

global mom_sys_spindle_direction_code  mom_spindle_direction
global mom_coolant_status

if { $mom_coolant_status == "OFF" || $mom_coolant_status == "UNDEFINED" } {
  set coolant_spindle_m_code  $mom_sys_spindle_direction_code($mom_spindle_direction)
} else {
  set coolant_spindle_m_code  [expr 10+$mom_sys_spindle_direction_code($mom_spindle_direction)]
}

#MOM_output_text "(mom_coolant_status=$mom_coolant_status)"
#MOM_output_text "(coolant_spindle_m_code=$coolant_spindle_m_code)"
}


#=============================================================
proc PB_CMD_cutcom_off { } {
#=============================================================
global mom_sys_cutcom_status

# begin turning CC off
set mom_sys_cutcom_status "END"

# bugfix: clear pending FORCE of P and Q
MOM_force OFF P_cutcom Q_cutcom
}


#=============================================================
proc PB_CMD_cutcom_on { } {
#=============================================================
global mom_sys_cutcom_status
set mom_sys_cutcom_status "START"
}


#=============================================================
proc PB_CMD_cycle { } {
#=============================================================
# handle delayed spindle commands

global special_ptp_processing

if { $special_ptp_processing != 0 } {
  # MOM_suppress off G G_motion X Y Z S M_spindle
  # MOM_force once G G_motion X Y Z S M_spindle
  set special_ptp_processing 0
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
proc PB_CMD_init_helix { } {
#=============================================================
uplevel #0 {
#
# This procedure will be executed automatically at the start of program and
# anytime it is loaded as a slave post of a linked post.
#
# This procedure can be used to enable your post to output helix.
# You can choose from the following options to format the circle 
# block template to output the helix parameters.
#

###set mom_sys_helix_pitch_type	"rise_radian"  
set mom_sys_helix_pitch_type	"rise_revolution"  

#
# The default setting for mom_sys_helix_pitch_type is "rise_radian".
# This is the most common.  Other choices are:
#
#    "rise_radian"              Measures the rise over one radian.
#    "rise_revolution"          Measures the rise over 360 degrees.
#    "none"                     Will suppress the output of pitch.
#    "other"                    Allows you to calculate the pitch
#                               using your own formula.
# 
# This custom command uses the block template circular_move to output
# the helix block.  If your post uses a block template with a different
# name, you must edit the line that outputs the helix block.

#
#  The following variable deines the output mode for helical records.
#
#  FULL_CIRCLE  -- This mode will output a helix record for each 360 
#                  degrees of the helix.
#  QUADRANT  --    This mode will output a helix record for each 90 
#                  degrees of the helix.
#  LINEAR  --      This mode will output the entire helix as linear gotos.
#  END_POINT --    This mode will assume the control can define an entire
#                  helix in a single block.

   set mom_kin_helical_arc_output_mode FULL_CIRCLE

   MOM_reload_kinematics



#=============================================================
proc MOM_helix_move { } {
#=============================================================
   global mom_pos_arc_plane
   global mom_sys_cir_vector
   global mom_sys_helix_pitch_type
   global mom_helix_pitch
   global mom_prev_pos mom_pos_arc_center
   global PI

   switch $mom_pos_arc_plane {
      XY { MOM_suppress once K ; set cir_index 2 }
      YZ { MOM_suppress once I ; set cir_index 0 }
      ZX { MOM_suppress once J ; set cir_index 1 }
   }

   switch $mom_sys_helix_pitch_type {
      none { }
      rise_revolution { set pitch $mom_helix_pitch }
      rise_radian { set pitch [expr $mom_helix_pitch / ($PI * 2.0)]}
      other {
#
#	Place your custom helix pitch code here
#
      }
      default { set mom_sys_helix_pitch_type "none" }
   }
    
   MOM_force once X Y Z

   if {$mom_sys_helix_pitch_type != "none"} {
      MOM_force once I J K

      switch $mom_sys_cir_vector {
         "Vector - Arc Center to Start" {
            set mom_prev_pos($cir_index) $pitch
            set mom_pos_arc_center($cir_index) 0.0
         }
         "Vector - Arc Start to Center" {
            set mom_prev_pos($cir_index) 0.0
            set mom_pos_arc_center($cir_index) $pitch
         }
         "Unsigned Vector - Arc Center to Start" {
            set mom_prev_pos($cir_index) 0.0
            set mom_pos_arc_center($cir_index) $pitch
         }
         "Vector - Absolute Arc Center" {
            set mom_pos_arc_center($cir_index) $pitch
         }
      }
   }


#
# You may need to edit this line if you output more than one block
# or if you have changed the name of your circular_move block template
#
   MOM_do_template circular_move


} ;# MOM_helix_move


} ;# uplevel
}


#=============================================================
proc PB_CMD_init_pq_cutcom { } {
#=============================================================
#
#  This procedure will be executed automatically at the start of program and
#  anytime it is loaded as a slave post of a linked post.
#
#  This procedure is used to establish PQ cutter compensation for Cincinnati
#  controllers.  
# 
#  mom_sys_cutcom_status 
#	OFF	Cutcom is off, no action is needed 
#	ON	Cutcom is on, output pq codes
#	START	Cutcom has been turned on, output startup codes
#	END	Cutcom has been turned off, output off codes
#
#  mom_sys_cutcom_type
#
#	G_CODES	Output G40, G41, G42
#	PQ	Output PQ codes
#
#  mom_sys_cutcom_on_type
#
#	NORMAL	Cutcom offset vector is perpendicular to direction of motion
#	TANGENT Cutcom offset vector is parallel to the direction of motion
#
#  mom_sys_cutcom_off_type
#
#	NORMAL	Cutcom vector for last point is perpendicular 
#               to the direction of last motion
#	TANGENT Cutcom vector for last point is parallel to the 
#               direction of last motion
#
   global mom_sys_cutcom_status
   global mom_sys_cutcom_type
   global mom_sys_cutcom_on_type
   global mom_sys_cutcom_off_type
   global mom_kin_read_ahead_next_motion

   set mom_sys_cutcom_status "OFF"
   set mom_sys_cutcom_type "PQ"
   set mom_sys_cutcom_on_type "NORMAL"
   set mom_sys_cutcom_off_type "NORMAL"
   set mom_kin_read_ahead_next_motion "TRUE"

   MOM_reload_kinematics
}


#=============================================================
proc PB_CMD_init_spindle_axis { } {
#=============================================================
#
# This procedure will be executed automatically at the start of program and
# anytime it is loaded as a slave post of a linked post.
#

  global mom_kin_spindle_axis mom_sys_spindle_axis

# This procedure can be used to set the spindle axis to
# an axis other than the Z axis of the MCS.  If you have 
# a right angle head, then this vector needs to be 
# changed.
#
  if {![info exists mom_kin_spindle_axis]} { 
    set mom_kin_spindle_axis(0)                    0.0
    set mom_kin_spindle_axis(1)                    0.0
    set mom_kin_spindle_axis(2)                    1.0
  }

  if {![info exists mom_sys_spindle_axis]} { 
    set mom_sys_spindle_axis(0)                    0.0
    set mom_sys_spindle_axis(1)                    0.0
    set mom_sys_spindle_axis(2)                    1.0
  }
}


#=============================================================
proc PB_CMD_issue_safe_start { } {
#=============================================================
# output SAFE START BLOCK - using alignment character
# also break certain modals

MOM_force ONCE G_mode G_feed G_plane

PB_CMD_start_of_alignment_character
MOM_do_template safe_start
PB_CMD_end_of_alignment_character

MOM_do_template safe_start_1
MOM_do_template safe_start_2

MOM_force ONCE M_spindle M_coolant G_motion X Y Z F
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
proc PB_CMD_linear_move { } {
#=============================================================
#
# This procedure is used my many automatic postbuilder functions 
# to output a linear move.  Do NOT add this block to events or
# markers.  It is a static block and it is not intended to be added
# to events.  Do NOT change the name of this procedure.  
#
# If you need a custom command to be output with a linear move block, 
# you must place a call to the custom command either before or after 
# the MOM_do_template command.  You may need to edit the output
# line if you have changed the name of the linear move block.
#
# This proc is used for:
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
proc PB_CMD_pause { } {
#=============================================================
# This command enables you to pause the UG/Post processing.
#
  PAUSE
}


#=============================================================
proc PB_CMD_point_to_point_operation { } {
#=============================================================
# delay SPINDLE/ON command until G8x block
#
# detects if operation_type = POINT TO POINT
# Bound to START_OF_OPERATION

global mom_operation_type;     # operation class
global special_ptp_processing; # flag for later processing (in CYCLE/xxx)

if { [string toupper $mom_operation_type] == "POINT TO POINT" } {
  # MOM_suppress always G G_motion X Y Z S M_spindle
  # MOM_force     off   G G_motion X Y Z S M_spindle
  set special_ptp_processing 1
} else {
  set special_ptp_processing 0
}
# MOM_output_text (special_ptp_processing=$special_ptp_processing)
}


#=============================================================
proc PB_CMD_pq_motion { } {
#=============================================================
#
#  Process PQ cutcom.  Calculate PQ vectors and force out as needed.  
#  This custom command must be placed in the linear_move, circular 
#  move and rapid move event markers.

pq_cutcom
}


#=============================================================
proc PB_CMD_program_id { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_program_id
#
# Generates program id sequence at start of file
# - uses parent group name, if group selected
# - uses operation name if single operation selected
# attempts to use digits in group/path name for O-block
#
# Bind at the start of the START OF PPROGRAM event
# -------------------------------------------------------

global mom_part_name   mom_logname  mom_date
global mom_output_file_basename  mom_output_file_suffix

global custom_filename
global mom_sys_control_out  mom_sys_control_in

# set up some variables so that control OUT and IN can be
# used as needed in output blocks:
#  - CONTROL OUT = ${co}
#  - CONTROL IN  = ${ci}
set co $mom_sys_control_out; set ci $mom_sys_control_in

# format system date/time into dd-MMM-yyyy hh:mm AM/PM
set dt [string toupper [clock format [clock seconds] -format "%d-%b-%Y %I:%M %p"]]


# use  output file name  as program ID
set prgid [string toupper "$mom_output_file_basename.$mom_output_file_suffix"]


MOM_output_text "%"
MOM_output_text "${co}$dt${ci}"
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
proc PB_CMD_set_tap_tpi_and_lead { } {
#=============================================================
# This procedure sets global vars my_tap_tpi, my_tap_lead,
# and my_tap_fpm, INTELLIGENTLY, based upon the tool type used:
#
# 1 - TAP TOOL USED
#
# If the user has programmed the tapping operation using a 
# true TAP tool (only available from the holemaking template,
# but it works with point-to-point operations), then the PITCH
# field from the tool is used (TPI = 1/PITCH); if pitch is 
# zero, and error message is issued and processing is aborted.
# Any feedrate value programmed in the operation is ignored.
#
# 2 - DRILL-TYPE TOOL USED
#
# If the user has programmed the operation with a DRILL (the
# old method), the TPI is computed from the FEEDRATE (in IPR)
# from the point-to-point operation. Feedrate of zero produces
# an error message and aborts.
#
# Usage:
#   Call this procedure in the CYCLE TAP event, prior to the
# blocks of output. Set the required word for LEAD in the
# output block, using either $my_tap_tpi, $my_tap_lead or $my_tap_fpm
# (per the control's needs).


global mom_cycle_feed_rate_per_rev	; # cycle feed, in IPR
global mom_spindle_rpm			; # spindle speed, in RPM
global mom_path_name			; # operation name
global mom_tool_name			; # tool name
global mom_tool_pitch			; # tool pitch (TAP tool only)
global mom_tool_ug_type			; # tool type (2=drill tools)
global mom_tool_ug_subtype		; # tool subtype (0=drill, 8=tap)

global my_tap_tpi			; # result, in TPI
global my_tap_lead			; # result, in tap lead
global my_tap_fpm			; # result, in Feed per minute

# NOTE: this proc relies on the value of mom_tool_ug_subtype to
# correctly identify that a true TAP is in use.
# A tap sets mom_tool_ug_type to 2, mom_tool_ug_subtype to 8
# A drill sets mom_tool_ug_type to 2, mom_tool_ug_subtype to 0.

# make sure the spindle is running...
if { $mom_spindle_rpm == 0 } {
  set msg "*ERROR* SPINDLE RPM is ZERO (operation=$mom_path_name)"
  MOM_output_to_listing_device $msg
  MOM_abort $msg
}

# for a true TAP tool, use PITCH field, if > 0
if { $mom_tool_ug_type==2 && $mom_tool_ug_subtype==8 } {
  if { $mom_tool_pitch != 0.0 } {
    set my_tap_tpi  [expr 1.0/$mom_tool_pitch]
    set my_tap_lead $mom_tool_pitch
    set my_tap_fpm  [expr $mom_tool_pitch * $mom_spindle_rpm]
  } else {
    set msg "*ERROR* TAP has zero pitch (tool=$mom_tool_name)"
    MOM_output_to_listing_device $msg
    MOM_abort $msg
  }
} else {
# for DRILL tool, use IPR feed from operation
  if { $mom_cycle_feed_rate_per_rev == 0.0 } {
    set msg "*ERROR* Tap using drill has feed IPR=0 (operation=$mom_path_name)"
    MOM_output_to_listing_device $msg
    MOM_abort $msg
  } else {
    set my_tap_tpi  [expr 1.0/$mom_cycle_feed_rate_per_rev]
    set my_tap_lead $mom_cycle_feed_rate_per_rev
    set my_tap_fpm  [expr $mom_cycle_feed_rate_per_rev * $mom_spindle_rpm]
  }
}
# uncomment for debugging use
#MOM_output_text "-> set_tap_tpi_and_lead: tpi:$my_tap_tpi, lead:$my_tap_lead, fpm:$my_tap_fpm"
}


#=============================================================
proc PB_CMD_sim_cycle_bore_back_move { } {
#=============================================================
  global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos mom_cycle_feed_to_pos

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos
  SIM_RAPID mom_cycle_retract_to_pos
}


#=============================================================
proc PB_CMD_sim_cycle_bore_drag_move { } {
#=============================================================
  global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos mom_cycle_feed_to_pos

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos
  MOM_do_template spindle_off
  SIM_RAPID mom_cycle_retract_to_pos 
  MOM_force once M_spindle
  MOM_do_template spindle_rpm
}


#=============================================================
proc PB_CMD_sim_cycle_bore_dwell_move { } {
#=============================================================
  global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos mom_cycle_feed_to_pos
  global sim_delay_value mom_cycle_delay

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos

  if {![info exists mom_cycle_delay]} {
    set mom_delay_value 2.0
  } else { 
    set mom_delay_value $mom_cycle_delay
  }

  MOM_force once dwell G
  MOM_do_template delay
  SIM_FEED mom_cycle_rapid_to_pos  
  SIM_RTRCTO
  MOM_force once M_spindle
  MOM_do_template spindle_rpm
}


#=============================================================
proc PB_CMD_sim_cycle_bore_manual_dwell_move { } {
#=============================================================
  global mom_cycle_feed_to_pos mom_cycle_rapid_to_pos
  global sim_delay_value mom_cycle_delay

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos

  if {![info exists mom_cycle_delay]} {
    set mom_delay_value 2.0
  } else { 
    set mom_delay_value $mom_cycle_delay
  }

  MOM_force once dwell G
  MOM_do_template delay
  MOM_do_template stop
}


#=============================================================
proc PB_CMD_sim_cycle_bore_manual_move { } {
#=============================================================
  global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos
  MOM_do_template stop
}


#=============================================================
proc PB_CMD_sim_cycle_bore_move { } {
#=============================================================
  global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos mom_cycle_feed_to_pos

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos
  SIM_FEED mom_cycle_rapid_to_pos
  SIM_RTRCTO
}


#=============================================================
proc PB_CMD_sim_cycle_bore_no_drag_move { } {
#=============================================================
  global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos mom_sys_spindle_axis
  global nodrag_offset_move mom_cycle_feed_to_pos mom_cycle_orient
  global mom_cycle_retract_to mom_cycle_feed_to

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos

  if {![info exists mom_spindle_orient_code]} {
    set mom_spindle_orient_code 19
  }

  MOM_output_literal "M$mom_spindle_orient_code"
  if {![info exists mom_cycle_orient]} {set mom_cycle_orient .1}
  set ndv(0) 1.0
  set ndv(1) 0.0
  set ndv(2) 0.0
  set dot [VEC3_dot ndv mom_sys_spindle_axis]

  if {[EQ_is_equal [expr abs($dot)] 1.0]} {
    set ndv(0) 0.0
    set ndv(1) 1.0
  }

  VEC3_cross mom_sys_spindle_axis ndv offset

  for {set i 0} {$i < 3} {incr i} {
    set pos($i) [expr $mom_cycle_feed_to_pos($i) + $offset($i)*$mom_cycle_orient]
    set pos1($i) [expr $pos($i) + $mom_sys_spindle_axis($i)*($mom_cycle_retract_to+$mom_cycle_feed_to)]
  }

  SIM_RAPID pos
  SIM_RAPID pos1
  MOM_force once M_spindle
  MOM_do_template spindle_rpm
}


#=============================================================
proc PB_CMD_sim_cycle_drill_break_chip_move { } {
#=============================================================
  global mom_cycle_step1 top_of_hole mom_cycle_rapid_to mom_cycle_rapid_to_pos
  global mom_cycle_feed_to mom_sys_spindle_axis mom_cycle_retract_to_pos

# 24-Aug-2005
global mom_path_name
if {$mom_cycle_step1 <= 0.0} {
  set msg "*ERROR* cycle step value is ZERO in $mom_path_name"
  MOM_output_to_listing_device $msg
  MOM_abort $msg
  }
# 24-Aug-2005

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos

  set deep_depth [expr -$mom_cycle_step1]
  set rapid_pos $mom_cycle_rapid_to

  while { $mom_cycle_feed_to < $deep_depth } {
    set deep_rapto [expr $deep_depth + $mom_cycle_rapid_to + $mom_cycle_step1 ]
    if { $rapid_pos > $deep_rapto } {
      for {set i 0} {$i < 3} {incr i} {
        set pos($i) [expr $top_of_hole($i) + $deep_rapto*$mom_sys_spindle_axis($i)]
      }
      SIM_RAPID pos 
    }
    for {set i 0} {$i < 3} {incr i} {
      set pos($i) [expr $top_of_hole($i) + $deep_depth*$mom_sys_spindle_axis($i)]
    }
    SIM_FEED pos 
    set deep_depth [expr $deep_depth - $mom_cycle_step1]
  }

  set deep_rapto [expr $deep_depth + $mom_cycle_rapid_to + $mom_cycle_step1 ]

  if { $rapid_pos > $deep_rapto } {
    for {set i 0} {$i < 3} {incr i} {
      set pos($i) [expr $top_of_hole($i) + $deep_rapto*$mom_sys_spindle_axis($i)]
    }
    SIM_RAPID pos 
  }

  for {set i 0} {$i < 3} {incr i} {
  # WJP 07-Mar-2005
  # set pos($i) [expr $top_of_hole($i) + $deep_depth*$mom_sys_spindle_axis($i)]
    set pos($i) [expr $top_of_hole($i) + $mom_cycle_feed_to*$mom_sys_spindle_axis($i)]
  #
  }

  SIM_FEED pos 
  SIM_RAPID mom_cycle_retract_to_pos
}


#=============================================================
proc PB_CMD_sim_cycle_drill_deep_move { } {
#=============================================================
  global mom_cycle_step1 top_of_hole mom_cycle_rapid_to mom_cycle_rapid_to_pos
  global mom_cycle_feed_to mom_sys_spindle_axis mom_cycle_retract_to_pos

# 24-Aug-2005
global mom_path_name
if {$mom_cycle_step1 <= 0.0} {
  set msg "*ERROR* cycle step value is ZERO in $mom_path_name"
  MOM_output_to_listing_device $msg
  MOM_abort $msg
  }
# 24-Aug-2005

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos

  set deep_depth [expr -$mom_cycle_step1]
  set rapid_pos $mom_cycle_rapid_to

  while { $mom_cycle_feed_to < $deep_depth } {
    set deep_rapto [expr $deep_depth + $mom_cycle_rapid_to + $mom_cycle_step1 ]
    if { $rapid_pos > $deep_rapto } {
      for {set i 0} {$i < 3} {incr i} {
        set pos($i) [expr $top_of_hole($i) + $deep_rapto*$mom_sys_spindle_axis($i)]
      }
      SIM_RAPID pos 
    }
    for {set i 0} {$i < 3} {incr i} {
      set pos($i) [expr $top_of_hole($i) + $deep_depth*$mom_sys_spindle_axis($i)]
    }
    SIM_FEED pos 
    SIM_RAPID mom_cycle_rapid_to_pos 
    set deep_depth [expr $deep_depth - $mom_cycle_step1]
  }

  set deep_rapto [expr $deep_depth + $mom_cycle_rapid_to + $mom_cycle_step1 ]

  if { $rapid_pos > $deep_rapto } {
    for {set i 0} {$i < 3} {incr i} {
      set pos($i) [expr $top_of_hole($i) + $deep_rapto*$mom_sys_spindle_axis($i)]
    }
    SIM_RAPID pos 
  }

  for {set i 0} {$i < 3} {incr i} {
  # WJP 07-Mar-2005
  # set pos($i) [expr $top_of_hole($i) + $deep_depth*$mom_sys_spindle_axis($i)]
    set pos($i) [expr $top_of_hole($i) + $mom_cycle_feed_to*$mom_sys_spindle_axis($i)]
  #
  }

  SIM_FEED pos 
  SIM_RAPID mom_cycle_retract_to_pos
}


#=============================================================
proc PB_CMD_sim_cycle_drill_dwell_move { } {
#=============================================================
  global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_rapid_to_pos
  global mom_delay_value mom_cycle_delay mom_cycle_retract_to_pos

  CYCLE_TOOL_AXIS 
  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos

  if {![info exists mom_cycle_delay]} {
    set mom_delay_value 2.0
  } else { 
    set mom_delay_value $mom_cycle_delay
  }

  MOM_force once dwell G
  MOM_do_template delay
  SIM_RAPID mom_cycle_retract_to_pos
}


#=============================================================
proc PB_CMD_sim_cycle_drill_move { } {
#=============================================================
  global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_retract_to_pos

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos
  SIM_RAPID mom_cycle_retract_to_pos
}


#=============================================================
proc PB_CMD_sim_cycle_fixup_cycle_off { } {
#=============================================================
# prevent CYCLE/OFF from working if the canceled cycle is
# one that we've simulated

global mom_motion_event

#MOM_output_text "-> SIM_CYCLE_FIXUP_CYCLE_OFF: event=$mom_motion_event"

# test the event type of the last motion event
# include any cycle motions that are simulated
switch [string tolower $mom_motion_event] {
  drill_deep_move -
  drill_break_chip_move {
    MOM_suppress once G_motion R
    #MOM_output_text "  ->suppressed<-"
  }
  default {
    MOM_force once R
  }
}
}


#=============================================================
proc PB_CMD_sim_cycle_tap_move { } {
#=============================================================
  global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos mom_cycle_feed_to_pos
  global mom_spindle_direction

  CYCLE_TOOL_AXIS 

  SIM_RAPID_APPROACH mom_cycle_rapid_to_pos
  SIM_FEED mom_cycle_feed_to_pos
  MOM_do_template spindle_off
  set save_dir $mom_spindle_direction

  if {$mom_spindle_direction == "CLW"} {
    set mom_spindle_direction "CCLW"
  } elseif {$mom_spindle_direction == "CCLW"} {
    set mom_spindle_direction "CLW"
  }

  MOM_do_template spindle_rpm  
  SIM_FEED mom_cycle_rapid_to_pos
  set mom_spindle_direction $save_dir 
  SIM_RTRCTO
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
  set mom_sys_leader(N) "O"
}


#=============================================================
proc PB_CMD_start_of_operation_force_addresses { } {
#=============================================================
MOM_force once X Y Z F F_cycle R S M_spindle
}


#=============================================================
proc PB_CMD_startup_processing { } {
#=============================================================
# Stitch in our local wrapper for MOM_cycle_plane_change
# - rename existing proc so the replacement can chain into it

if { [llength [info commands MOM_cycle_plane_change]] } {
  rename MOM_cycle_plane_change DEFAULT_cycle_plane_change
  rename PB_CMD_becomes_MOM_cycle_plane_change MOM_cycle_plane_change
}
}


#=============================================================
proc PB_CMD_suppress_spindle { } {
#=============================================================
# used to prevent output of S-word prior to tapping G84 block
#
# called from PB_CMD_before_motion

global my_G84_rapid_suppress_flag

MOM_suppress once S M_spindle

# set flag for complementary routine
set my_G84_rapid_suppress_flag 1

#MOM_output_text "-> SUPPRESS_RAPIDS"
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
MOM_force once G_motion G_adjust H S M_spindle
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
proc CYCLE_SET {  } {
#=============================================================
}


#=============================================================
proc SIM_RAPID { pos } {
#=============================================================
  upvar $pos p  

  global mom_pos mom_kin_rapid_feed_rate feed

#  set mom_feed_rate $mom_kin_rapid_feed_rate

#  FEEDRATE_SET

  set feed $mom_kin_rapid_feed_rate

  VMOV 3 p mom_pos
  PB_CMD_linear_move
  MOM_reload_variable -a mom_pos
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
proc SIM_RTRCTO {  } {
#=============================================================
  global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos mom_sys_spindle_axis

  VEC3_sub mom_cycle_retract_to_pos mom_cycle_rapid_to_pos v1
  if {[EQ_is_gt [VEC3_dot v1 mom_sys_spindle_axis] 0.0]} {SIM_RAPID mom_cycle_retract_to_pos}
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
proc CYCLE_TOOL_AXIS {  } {
#=============================================================
  global mom_cycle_rapid_to_pos 
  global mom_cycle_feed_to_pos 
  global mom_cycle_retract_to_pos
  global mom_cycle_rapid_to 
  global mom_cycle_feed_to 
  global mom_cycle_rapid_to 
  global mom_cycle_feed_to 
  global mom_cycle_retract_to
  global mom_kin_4th_axis_type 
  global mom_kin_5th_axis_type 
  global mom_kin_4th_axis_plane
  global mom_kin_5th_axis_plane
  global top_of_hole 
  global mom_tool_axis 
  global mom_sys_spindle_axis 
  global mom_motion_type 
  global mom_kin_spindle_axis
  global mom_pos
  global DEG2RAD

  PB_CMD_init_spindle_axis

  set mom_motion_type "SIMULATED_CYCLES"

  if {$mom_kin_4th_axis_type == "Table"} {
    VMOV 3 mom_kin_spindle_axis mom_sys_spindle_axis 
  } elseif {$mom_kin_5th_axis_type == "Table"} {
    VMOV 3 mom_tool_axis vec1
    set ang [expr -$mom_pos(4)*$DEG2RAD]
    if {$mom_kin_5th_axis_plane == "XY"} {
      ROTATE_VECTOR 2 $ang vec1 vec 
    } elseif {$mom_kin_5th_axis_plane == "ZX"} {
      ROTATE_VECTOR 1 $ang vec1 vec 
    } elseif {$mom_kin_5th_axis_plane == "YZ"} {
      ROTATE_VECTOR 0 $ang vec1 vec 
    }
    if {$mom_kin_4th_axis_plane == "XY"} {
      set vec(2) 0.0
    } elseif {$mom_kin_4th_axis_plane == "ZX"} {
      set vec(1) 0.0
    } elseif {$mom_kin_4th_axis_plane == "YZ"} {
      set vec(0) 0.0
    }
    set l [VEC3_unitize vec mom_sys_spindle_axis]
    if {[EQ_is_zero $l]} {set mom_sys_spindle_axis(2) 1.0}
  } else {
    VMOV 3 mom_tool_axis mom_sys_spindle_axis
  }

  for {set i 0} {$i < 3} {incr i} {
    set top_of_hole($i) [expr $mom_cycle_rapid_to_pos($i) - $mom_cycle_rapid_to*$mom_sys_spindle_axis($i)] 
  }

  for {set i 0} {$i < 3} {incr i} {
    set mom_cycle_rapid_to_pos($i) [expr $top_of_hole($i) + $mom_cycle_rapid_to*$mom_sys_spindle_axis($i)]
    set mom_cycle_feed_to_pos($i) [expr $top_of_hole($i) + $mom_cycle_feed_to*$mom_sys_spindle_axis($i)]
    set mom_cycle_retract_to_pos($i) [expr $top_of_hole($i) + $mom_cycle_retract_to*$mom_sys_spindle_axis($i)]
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
proc SIM_RAPID_APPROACH { pos } {
#=============================================================
  upvar $pos p  

  global mom_pos mom_sys_spindle_axis mom_prev_pos

  VEC3_sub p mom_prev_pos v1
  if {[VEC3_is_zero v1]} {return}
  set dist [VEC3_unitize v1 v2]
  set dot [VEC3_dot v2 mom_sys_spindle_axis]
  set dist [expr $dist*$dot]
  VEC3_scale dist mom_sys_spindle_axis sp_move
  VEC3_sub v1 sp_move trav_move

  if {$dist < 0.0} {
    if {![VEC3_is_zero trav_move]} {
      VEC3_add mom_prev_pos trav_move v1
      SIM_RAPID v1
    }
    if {![VEC3_is_zero sp_move]} {
      SIM_RAPID p
    }
  } else {
    if {![VEC3_is_zero sp_move]} {
      VEC3_add mom_prev_pos sp_move v1
      SIM_RAPID v1
    }
    if {![VEC3_is_zero trav_move]} {
      SIM_RAPID p
    }
  }
}


#=============================================================
proc ARCTAN { y x } {
#=============================================================
   global PI

   if [EQ_is_zero $y] {
      if {$x < 0.0} {return $PI}

      return 0.0
   }

   if [EQ_is_zero $x] {
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
proc pq_cutcom {  } {
#=============================================================

   global mom_mcs_goto mom_prev_mcs_goto mom_nxt_mcs_goto 
   global mom_sys_cutcom_status mom_sys_cutcom_type mom_sys_cutcom_on_type
   global mom_sys_cutcom_off_type pval qval cur_vec nxt_vec
   global mom_nxt_event mom_nxt_event_count mom_nxt_motion_event mom_nxt_arc_center
   global mom_motion_event mom_nxt_arc_axis mom_arc_axis mom_arc_center
   global mom_pos mom_prev_pos mom_kin_machine_resolution
   global mom_cutcom_status PI


   if {[info exists mom_sys_cutcom_type] && $mom_sys_cutcom_type == "PQ"} {
 
      if {$mom_sys_cutcom_type == "PQ" && $mom_sys_cutcom_status != "OFF"} {

         if {$mom_nxt_event_count != 0} {
            for {set i 0} {$i < $mom_nxt_event_count} {incr i 1} {
               if {$mom_nxt_event($i) == "cutcom_off"} {set mom_sys_cutcom_status "END"}
            }
         }

         if {$mom_motion_event == "linear_move" || $mom_nxt_motion_event == "rapid_move"} {
            VEC3_sub mom_prev_mcs_goto mom_mcs_goto tmp_vec
            VEC3_unitize tmp_vec cur_vec
         } elseif {$mom_motion_event == "circular_move"} {
            VEC3_sub mom_mcs_goto mom_arc_center cur_vec
            VEC3_unitize cur_vec tmp_vec
            VEC3_cross mom_arc_axis tmp_vec cur_vec
         }

         if {$mom_nxt_motion_event == "linear_move" || $mom_nxt_motion_event == "rapid_move"} {
            VEC3_sub mom_nxt_mcs_goto mom_mcs_goto tmp_vec
            VEC3_unitize tmp_vec nxt_vec
         } elseif {$mom_nxt_motion_event == "circular_move"} {
            VEC3_sub mom_nxt_arc_center mom_mcs_goto nxt_vec
            VEC3_unitize nxt_vec tmp_vec
            VEC3_cross mom_nxt_arc_axis tmp_vec nxt_vec
         }

         if {$mom_sys_cutcom_status != "END" && $mom_sys_cutcom_status != "START"} {
            set xdel [expr abs($mom_pos(0)-$mom_prev_pos(0))]
            if {$xdel > $mom_kin_machine_resolution} {MOM_force once P_cutcom}
            set ydel [expr abs($mom_pos(1)-$mom_prev_pos(1))]
            if {$ydel > $mom_kin_machine_resolution} {MOM_force once Q_cutcom}
         }

         if {$mom_sys_cutcom_status == "START"} {
            if {$mom_sys_cutcom_on_type == "NORMAL"} {
               set cur_vec(0) [expr -$nxt_vec(0)]
               set cur_vec(1) [expr -$nxt_vec(1)]
            } elseif {$mom_sys_cutcom_on_type == "TANGENT"} {
               set cur_vec(0) $nxt_vec(1)
               set cur_vec(1) [expr -$nxt_vec(0)]
               set nxt_vec(0) [expr -$cur_vec(0)]
               set nxt_vec(1) [expr -$cur_vec(1)]
            }
            set mom_sys_cutcom_status "ON"
            MOM_force once X Y P_cutcom Q_cutcom
         } elseif {$mom_sys_cutcom_status == "END"} {
            if {$mom_sys_cutcom_off_type == "NORMAL"} {
               set nxt_vec(0) [expr -$cur_vec(0)]
               set nxt_vec(1) [expr -$cur_vec(1)]
            } elseif {$mom_sys_cutcom_off_type == "TANGENT"} {
               set nxt_vec(0) [expr -$cur_vec(1)]
               set nxt_vec(1) $cur_vec(0)
               set cur_vec(0) [expr -$nxt_vec(0)]
               set cur_vec(1) [expr -$nxt_vec(1)]
            }
            set mom_sys_cutcom_status "OFF"
            MOM_force once X Y P_cutcom Q_cutcom
         }

         set a1 [ARCTAN $cur_vec(1) $cur_vec(0)]
         set a2 [ARCTAN $nxt_vec(1) $nxt_vec(0)]
         set a3 [expr $a1-$a2]
         if {$a3 < 0.0} {set a3 [expr $a3+$PI*2.0]}
         set a4 [expr $a2+($a3/2.0)]
         set cosa [expr cos($a4)]
         set sina [expr sin($a4)]
         set div [expr abs(sin($a3/2.0))]

         if [EQ_is_zero $div] {

            if {![EQ_is_zero $cosa]} {
               if {$cosa < 0.0} {
                  set pval -3.2767
               } else {
                  set pval 3.2767
               }
            } else {
               set pval 0.0
            }

            if {![EQ_is_zero $sina]} {
               if {$sina < 0.0} {
                  set qval -3.2767
               } else {
                  set qval 3.2767
               }
            } else {
               set qval 0.0
            }
         } else {
            set pval [expr $cosa/$div]

            if {$pval < -3.2767} {
               set pval -3.2767
            } elseif {$pval > 3.2767} {
               set pval 3.2767
            }

            set qval [expr $sina/$div]

            if {$qval < -3.2767} {
               set qval -3.2767
            } elseif {$qval > 3.2767} {
               set qval 3.2767
            }
         }

         if {$mom_cutcom_status == "RIGHT" } {
            set pval [expr -$pval]
            set qval [expr -$qval]
         }
      }
   }
}






#=============================================================
proc SIM_FEED { pos } {
#=============================================================
  upvar $pos p

  global mom_pos mom_cycle_feed_rate mom_feed_rate feed

#  set mom_feed_rate $mom_cycle_feed_rate

#  FEEDRATE_SET
  set feed $mom_cycle_feed_rate

  VMOV 3 p mom_pos
  PB_CMD_linear_move
  MOM_reload_variable -a mom_pos
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


