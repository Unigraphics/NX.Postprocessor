########################## TCL Event Handlers ##########################
#
#  Created by jscott  @  Fri Sep 29 16:51:24 2006 GMT Standard Time
#  with Post Builder version  3.5.1.
#
########################################################################


  set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]


  if { ![info exists mom_sys_post_initialized] } {

     source ${cam_post_dir}ugpost_base.tcl
 
 
     set mom_sys_debug_mode OFF
 
 
     if { ![info exists env(PB_SUPPRESS_UGPOST_DEBUG)] } {
        set env(PB_SUPPRESS_UGPOST_DEBUG) 0
     }
 
     if $env(PB_SUPPRESS_UGPOST_DEBUG) {
        set mom_sys_debug_mode OFF
     }
 
     if { $mom_sys_debug_mode == "OFF" } {
 
        proc MOM_before_each_add_var {} {}
        proc MOM_before_each_event {} {}
 
     } else {
 
        set cam_debug_dir [MOM_ask_env_var UGII_CAM_DEBUG_DIR]
        source ${cam_debug_dir}mom_review.tcl
     }
 
     MOM_set_debug_mode $mom_sys_debug_mode


   ####  Listing File variables 
     set mom_sys_list_output                       "OFF"
     set mom_sys_header_output                     "OFF"
     set mom_sys_list_file_rows                    "40" 
     set mom_sys_list_file_columns                 "30" 
     set mom_sys_warning_output                    "ON" 
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "cnc"
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
  set mom_sys_unit_code(MM)                     "21" 
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
  set mom_sys_feed_rate_mode_code(MMPM)         "94" 
  set mom_sys_feed_rate_mode_code(MMPR)         "95" 
  set mom_sys_feed_rate_mode_code(DPM)          "94" 
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
  set mom_sys_coolant_code(THRU)                "8"  
  set mom_sys_coolant_code(TAP)                 "8"  
  set mom_sys_coolant_code(OFF)                 "9"  
  set mom_sys_rewind_code                       "30" 
  set mom_sys_4th_axis_has_limits               "1"  
  set mom_sys_5th_axis_has_limits               "1"  
  set mom_sys_sim_cycle_drill                   "0"  
  set mom_sys_sim_cycle_drill_dwell             "0"  
  set mom_sys_sim_cycle_drill_deep              "0"  
  set mom_sys_sim_cycle_drill_break_chip        "0"  
  set mom_sys_sim_cycle_tap                     "1"  
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
  set mom_sys_home_pos(0)                       "0"  
  set mom_sys_home_pos(1)                       "0"  
  set mom_sys_home_pos(2)                       "0"  
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
  set mom_sys_contour_feed_mode(ROTARY)         "MMPM"
  set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "MMPM"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
  set mom_sys_rapid_feed_mode(ROTARY)           "MMPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "MMPM"
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"
  set mom_sys_retract_distance                  "10" 
  set mom_sys_post_description                  "This is a 5-Axis Milling Machine With\n\
                                                  Dual Rotary Tables."
  set mom_sys_ugpadvkins_used                   "0"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "OFF"
  set mom_kin_4th_axis_leader                   "A"  
  set mom_kin_4th_axis_limit_action             "Warning"
  set mom_kin_4th_axis_max_limit                "130"
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "0"  
  set mom_kin_4th_axis_plane                    "YZ" 
  set mom_kin_4th_axis_point(0)                 "0.0"
  set mom_kin_4th_axis_point(1)                 "0.0"
  set mom_kin_4th_axis_point(2)                 "0.0"
  set mom_kin_4th_axis_rotation                 "reverse"
  set mom_kin_4th_axis_type                     "Table"
  set mom_kin_4th_axis_vector(0)                "1"  
  set mom_kin_4th_axis_vector(1)                "0"  
  set mom_kin_4th_axis_vector(2)                "0"  
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_ang_offset               "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0.0"
  set mom_kin_5th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_5th_axis_leader                   "B"  
  set mom_kin_5th_axis_limit_action             "Warning"
  set mom_kin_5th_axis_max_limit                "72000"
  set mom_kin_5th_axis_min_incr                 "0.001"
  set mom_kin_5th_axis_min_limit                "-72000"
  set mom_kin_5th_axis_plane                    "XY" 
  set mom_kin_5th_axis_point(0)                 "0.0"
  set mom_kin_5th_axis_point(1)                 "0.0"
  set mom_kin_5th_axis_point(2)                 "0.0"
  set mom_kin_5th_axis_rotation                 "standard"
  set mom_kin_5th_axis_type                     "Table"
  set mom_kin_5th_axis_vector(0)                "0"  
  set mom_kin_5th_axis_vector(1)                "0"  
  set mom_kin_5th_axis_vector(2)                "1"  
  set mom_kin_5th_axis_zero                     "0.0"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XY" 
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.01"
  set mom_kin_machine_resolution                "0.001"
  set mom_kin_machine_type                      "5_axis_dual_table"
  set mom_kin_machine_zero_offset(0)            "0.0"
  set mom_kin_machine_zero_offset(1)            "0.0"
  set mom_kin_machine_zero_offset(2)            "0.0"
  set mom_kin_max_arc_radius                    "99999.999"
  set mom_kin_max_dpm                           "4800"
  set mom_kin_max_fpm                           "15000"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "1000"
  set mom_kin_min_arc_length                    "0.20"
  set mom_kin_min_arc_radius                    "0.001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.1"
  set mom_kin_min_frn                           "0.01"
  set mom_kin_output_unit                       "MM" 
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_pivot_guage_offset                ""   
  set mom_kin_post_data_unit                    "MM" 
  set mom_kin_rapid_feed_rate                   "10000"
  set mom_kin_retract_distance                  "500"
  set mom_kin_rotary_axis_method                "PREVIOUS"
  set mom_kin_spindle_axis(0)                   "0.0"
  set mom_kin_spindle_axis(1)                   "0.0"
  set mom_kin_spindle_axis(2)                   "1.0"
  set mom_kin_tool_change_time                  "30" 
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
   PB_CMD_endofeverything

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
proc PB_init_new_iks { } {
#=============================================================
  global mom_kin_iks_usage mom_kin_spindle_axis
  global mom_kin_4th_axis_vector mom_kin_5th_axis_vector


   set mom_kin_iks_usage 1

  # Override spindle axis vector defined in PB_CMD_init_rotary
   set mom_kin_spindle_axis(0)  0.0
   set mom_kin_spindle_axis(1)  0.0
   set mom_kin_spindle_axis(2)  1.0

  # Unitize vectors
   foreach i { 0 1 2 } {
      set vec($i) $mom_kin_spindle_axis($i)
   }
   VEC3_unitize vec mom_kin_spindle_axis

   foreach i { 0 1 2 } {
      set vec($i) $mom_kin_4th_axis_vector($i)
   }
   VEC3_unitize vec mom_kin_4th_axis_vector

   foreach i { 0 1 2 } {
      set vec($i) $mom_kin_5th_axis_vector($i)
   }
   VEC3_unitize vec mom_kin_5th_axis_vector

  # Reload kinematics
   MOM_reload_kinematics
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
proc MOM_auxfun { } {
#=============================================================
   MOM_do_template auxfun
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_bore
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_bore_back
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_bore_drag
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_bore_dwell
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_bore_manual
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_bore_manual_dwell
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_bore_no_drag
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   CIRCLE_SET
   MOM_force Once G_motion X Y I J
   MOM_do_template circular_move
}


#=============================================================
proc MOM_coolant_off { } {
#=============================================================
   COOLANT_SET
   MOM_do_template coolant_off
}


#=============================================================
proc MOM_coolant_on { } {
#=============================================================
   COOLANT_SET
}


#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
   CUTCOM_SET
   PB_CMD_fixupD_off
}


#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
   CUTCOM_SET

   global mom_cutcom_adjust_register
   set cutcom_register_min 1
   set cutcom_register_max 99
   if [info exists mom_cutcom_adjust_register] {
      if { $mom_cutcom_adjust_register < $cutcom_register_min ||\
           $mom_cutcom_adjust_register > $cutcom_register_max } {
         global mom_warning_info
         set mom_warning_info "CUTCOM register $mom_cutcom_adjust_register must be within the range between 1 and 99"
         MOM_catch_warning
      }
   }
   PB_CMD_fixupD
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
   PB_CMD_mmperminute
   MOM_do_template cycle_off
}


#=============================================================
proc MOM_cycle_plane_change { } {
#=============================================================
  global cycle_init_flag

   set cycle_init_flag TRUE
}


#=============================================================
proc MOM_delay { } {
#=============================================================
   PB_DELAY_TIME_SET
   MOM_do_template delay
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_drill
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_drill_break_chip
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_drill_deep
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

   PB_CMD_cycle_nanny
   MOM_do_template cycle_drill_dwell
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_end_of_path { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_end_of_path] ] {
      PB_CMD_kin_end_of_path
   }

   PB_CMD_NormalB
   global mom_sys_in_operation
   set mom_sys_in_operation 0
}


#=============================================================
proc MOM_first_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_G_adjust
   PB_CMD_sameTool_superstop
   global mom_operation_name
   MOM_output_literal "($mom_operation_name)"
   PB_CMD_fix_G54
   MOM_force Once G
   MOM_do_template initial_move
   PB_CMD_changeHON
   PB_CMD_index_status
   PB_CMD_rapid_nanny
   catch {MOM_$mom_motion_event}
}


#=============================================================
proc MOM_first_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   PB_CMD_partno
   PB_CMD_setN
   MOM_force Once NN T M Text
   MOM_do_template tool_change_1
   PB_CMD_AUGER-FORWARD
   MOM_do_template tool_change_2
   global mom_operation_name
   MOM_output_literal "( $mom_operation_name )"
   PB_CMD_fix_G54
   PB_CMD_Approach
   PB_CMD_HON_codes
}


#=============================================================
proc MOM_from_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
}


#=============================================================
proc MOM_gohome_move { } {
#=============================================================
   MOM_rapid_move
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_fix_G54
   MOM_force Once G
   MOM_do_template initial_move
   PB_CMD_index_status
   PB_CMD_rapid_nanny

  global mom_programmed_feed_rate
   if { [EQ_is_equal $mom_programmed_feed_rate 0] } {
      MOM_rapid_move
   } else {
      MOM_linear_move
   }
}


#=============================================================
proc MOM_length_compensation { } {
#=============================================================
   TOOL_SET MOM_length_compensation
   MOM_do_template tool_length_adjust
}


#=============================================================
proc MOM_linear_move { } {
#=============================================================
  global first_linear_move

   if { !$first_linear_move } {
      PB_first_linear_move
      incr first_linear_move
   }

   PB_CMD_limitA
   PB_CMD_conditional_unclamp
   PB_CMD_conditional_forceF
   MOM_do_template linear_move
   PB_CMD_save_tablepos
   PB_CMD_unwindB
}


#=============================================================
proc MOM_load_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
}


#=============================================================
proc MOM_opstop { } {
#=============================================================
   MOM_do_template opstop
}


#=============================================================
proc MOM_prefun { } {
#=============================================================
   MOM_do_template prefun
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
   PB_CMD_limitA
   PB_CMD_fixupH
   PB_CMD_do_rotary_axes
   MOM_do_template rapid_move
   set rapid_spindle_blk {G_cutcom G_adjust G_motion G_mode X Y Z H}
   set rapid_spindle_x_blk {G_cutcom G_adjust G_motion G_mode X H}
   set rapid_spindle_y_blk {G_cutcom G_adjust G_motion G_mode Y H}
   set rapid_spindle_z_blk {G_cutcom G_adjust G_motion G_mode Z H}
   set rapid_traverse_blk {G_cutcom G_motion G_mode X Y Z fourth_axis fifth_axis M_coolant}
   set rapid_traverse_xy_blk {G_cutcom G_motion G_mode X Y fourth_axis fifth_axis M_coolant}
   set rapid_traverse_yz_blk {G_cutcom G_motion G_mode Y Z fourth_axis fifth_axis M_coolant}
   set rapid_traverse_xz_blk {G_cutcom G_motion G_mode X Z fourth_axis fifth_axis M_coolant}
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
   PB_CMD_conditional_HON
   PB_CMD_save_tablepos
}


#=============================================================
proc MOM_sequence_number { } {
#=============================================================
   SEQNO_SET
}


#=============================================================
proc MOM_set_modes { } {
#=============================================================
   MODES_SET
}


#=============================================================
proc MOM_spindle_off { } {
#=============================================================
   MOM_do_template spindle_off
}


#=============================================================
proc MOM_spindle_rpm { } {
#=============================================================
   SPINDLE_SET
   MOM_force Once S M_spindle
   MOM_do_template spindle_rpm
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
   PB_CMD_trap_zeros
}


#=============================================================
proc MOM_stop { } {
#=============================================================
   MOM_do_template stop
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

   PB_CMD_cycle_nanny
   PB_CMD_tapfix
   MOM_do_template cycle_tap
   set cycle_init_flag FALSE
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
proc MOM_tool_preselect { } {
#=============================================================
  global mom_tool_preselect_number mom_tool_number mom_next_tool_number
   if {[info exists mom_tool_preselect_number]} {
      set mom_next_tool_number $mom_tool_preselect_number
   }
   MOM_do_template tool_preselect
}


#=============================================================
proc PB_approach_move { } {
#=============================================================
}


#=============================================================
proc PB_auto_tool_change { } {
#=============================================================
   PB_CMD_beforetoolchange
   PB_CMD_setN
   MOM_force Once NN T M Text
   MOM_do_template tool_change_1
   MOM_do_template tool_change_2
   global mom_operation_name
   MOM_output_literal "( $mom_operation_name )"
   MOM_force Once G_mode
   MOM_do_template auto_tool_change_1
   PB_CMD_fix_G54
   PB_CMD_Approach
   PB_CMD_HON_codes
   PB_CMD_force_tables
}


#=============================================================
proc PB_engage_move { } {
#=============================================================
}


#=============================================================
proc PB_feedrates { } {
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
proc PB_manual_tool_change { } {
#=============================================================
   PB_CMD_tool_change_force_addresses
   MOM_do_template stop
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
proc PB_start_of_program { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }

   MOM_set_seq_off
   PB_CMD_init_vars
   PB_CMD_version
   PB_CMD_notes_on_post
   PB_CMD_replacement_procedures
   PB_CMD_threadmill_handler
   PB_CMD_NPARSE
   PB_CMD_superstop
}


#=============================================================
proc PB_CMD_AUGER-FORWARD { } {
#=============================================================
MOM_output_literal "M31 "  ;#auger start forward
}


#=============================================================
proc PB_CMD_Approach { } {
#=============================================================
# conditionally rapid to x0y0 after tchange if name includes "PROBE"

global mom_tool_name global mom_fixture_offset js_fixoff pn_tool_adjust_register

# MOM_output_literal "$mom_tool_name"

if {  [string first "PROBE" $mom_tool_name ]  < 0 } { return }

PB_CMD_fixupH  ;# set special H for probe

MOM_output_literal "G$js_fixoff G43 G0 X0.0 Y0.0 H$pn_tool_adjust_register "
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
proc PB_CMD_G_adjust { } {
#=============================================================

MOM_force once G_adjust H
#MOM_output_literal " trace for G adjust "
}


#=============================================================
proc PB_CMD_HON_codes { } {
#=============================================================
# part of toolchange - used in rapid
global mom_operation_type
global js_HON_waiting

set js_HON_waiting "FALSE"	     	;# FALSE for drilling

if {[ string first "Point to Point" $mom_operation_type ] < 0 } {
	set js_HON_waiting "TRUE" 	;# TRUE for milling
}
}


#=============================================================
proc PB_CMD_NPARSE { } {
#=============================================================
# -------------------------- 
proc NPARSE { input_string startpos index_of_numeric_field }   {
# --------------------------
# returns fff'th numeric out of string of numbers and letters starting at sss'th char

# usage  set returnval   [ NPARSE ttt sss  fff  ] 
# where       	ttt = text_string to parse    
#  		sss = starting character pos in string 0 == first char
#		fff = index of numeric field_to_get  0 == first numeric field 
# 

  set ttt $input_string ; set sss $startpos ; set fff $index_of_numeric_field

  set nums 1234567890.+-			;# numeric characters
  set s2 ""					;# target return string

  if { $sss > 0 } { set ttt [string range $ttt $sss end] } ;# remove unwanted left hand chars

  #  character-by-character in  $text
  set j -1 					;# no. of numeric fields found-and-begun so far 
  set k 0 					;# am(not) reading numbers right now

  for { set i 0 } { $i < [string length $ttt ] } { incr i }  {
    
     set ch [ string index $ttt $i ]		;# get character from string
     if { [ string first $ch $nums]  >= 0 } {	;# if char is a number
	if { $k == 0 } {			;# if i wasn't reading numbers
		set k 1				;# ...then i am now
		incr j				;# ... the index of the new number-field
	}
	if { $j == $fff }  {			;# if the index is the one we want
		set s2 $s2$ch			;# add char to return string
	}
     }  else {
	set k 0 				;# no nonger numeric
	if { $j == $fff  }  {			;# index is one we want _and_ nolonger numeric
	   break	 			;# out of for-loop - contiguous finished
	}
     } ;# end if numeric
  }    ;# end of for-loop
  if { $s2 == "" } { set s2 "err" }  		;# no numeric string found
  return $s2					

} ;# END OF NPARSE
}


#=============================================================
proc PB_CMD_NormalB { } {
#=============================================================
#  to re-zero B axis at end of VARIABLE   path - otherwise NO-OP 

global mom_operation_type  

if { [string first "Variable" $mom_operation_type ] > -1 } { 
# end of VAP or Variable-contour - won't do many revs with Sequential
	 PB_CMD_nBwork
}
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_beforetoolchange { } {
#=============================================================
# fixed format - before subsequent toolchange
global js_HON_status  js_superstop_flag  pn_just_toolchanged
if { $js_HON_status == "TRUE" } { 
	MOM_output_literal "  ( HIGH SPEED OFF ) "
	MOM_output_literal "G187 "	
}

set js_HON_status "FALSE"

MOM_output_literal "G91 G28 Z0. "
MOM_output_literal "G28 Y0. "	
MOM_output_literal "G28 X0. "	;# TBD
#MOM_output_literal "M11 "
MOM_output_literal "G90 G0 A0. "	;# stand trunnion up do_rotary_axes after tc



MOM_output_literal "M09 "
MOM_output_literal "M05 "
 
if { $js_superstop_flag == 0 } { 
	MOM_output_literal "M1 " 
} else { 	
	# conditional delayed inspection stop 
	set js_superstop_flag 0
 
	global mom_superstop_type  		;# stop/opstop
	 if {[info exists mom_superstop_type ] } {
	    if { $mom_superstop_type == "OPTIONALSTOP"  } { 	
			MOM_output_literal "M01 "
	    } else {
			MOM_output_literal "M00 "
	    }
	} else { 
	    # no type, old ude
	    MOM_output_literal "M00 " 
	}
 
	global mom_superstop_text
	if {[info exists mom_superstop_text ] } {
	   if { $mom_superstop_text != "" } { 	
	 	MOM_output_literal " ( [string toupper $mom_superstop_text ] ) "
	   }	;# end of text not ""
	} 	;# end of info exists superstop_text
} 		;# end of else

MOM_output_literal "   "

set pn_just_toolchanged "TRUE"
}


#=============================================================
proc PB_CMD_changeHON { } {
#=============================================================
# this allows user to change HON <-> HOF <-> HON using UDE away from t/change

global js_HON_status js_HON_waiting mom_HighSpeed   mom_operation_type

set js_HON_waiting "FALSE"	;# flag to trigger HON/HOF codes at start of next op.

if {$mom_HighSpeed == "OFF" && $js_HON_status == "TRUE"} { ;# Currently-on, but UDE off
    set js_HON_waiting "TRUE"
}	

if {$mom_HighSpeed == "ON" && $js_HON_status == "FALSE"} {  ;# currently OFF but UDE on ( or default )
    if {[ string first "Point to Point" $mom_operation_type ] < 0 } { ;# AND Milling operation
	set js_HON_waiting "TRUE" 	 
    }
}
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
proc PB_CMD_conditional_HON { } {
#=============================================================
global js_HON_status js_HON_waiting mom_HighSpeed

if { $js_HON_waiting == "TRUE" } { 	;# if just toolchanged

    if { $mom_HighSpeed == "OFF" } { 	;# only if disabled from UDE
 	if {  $js_HON_status == "TRUE" } { 
	  MOM_output_literal "  ( HIGH SPEED OFF ) "
          MOM_output_literal "G187 "   ;# for haas set to default
       	}
	set js_HON_status "FALSE"
    } else {
	MOM_output_literal "  ( HIGH SPEED MACHINING ON ) "
        MOM_output_literal "G187 E.05  "   ;# for haas set high speed accuracy


	set js_HON_status "TRUE"
    }
}

set js_HON_waiting "FALSE"
}


#=============================================================
proc PB_CMD_conditional_forceF { } {
#=============================================================
global feed_mode
#   needs F on every block if G93

if { $feed_mode == "FRN" } { MOM_force once F }
}


#=============================================================
proc PB_CMD_conditional_unclamp { } {
#=============================================================
# unclamp rotary axes if reqd, ie. if multax-ing 


global mom_out_angle_pos
global js_lastB js_lastA

set indexflag 0							;# default dont unclamp

if {![info exists js_lastB] } { set js_lastB -999 }
if {![info exists js_lastA] } { set js_lastA -999 }

if { $js_lastA != $mom_out_angle_pos(0) } { set indexflag 1 }	;# index if changed
if { $js_lastB != $mom_out_angle_pos(1) } { set indexflag 1 }

if { $indexflag } {
   #MOM_do_template AClampOff    ;#    M11
   #MOM_do_template BClampOff    ;#    M13
 }
}


#=============================================================
proc PB_CMD_cycle_nanny { } {
#=============================================================
global mom_cycle_retract_mode			;# AUTO or MANUAL 
global mom_clearance_plane_usage		;# 1 == start and end
global mom_clearance_plane_status		;# 1 == defined and active
global mom_operation_name
global mom_cycle_cam

set alarm 0
set em "\n\n Operation : $mom_operation_name  \n\n  "

if { $mom_cycle_retract_mode != "AUTO" } { 
	incr alarm 
	set tt "\n\n RTCTO Mode not set to AUTO \n\n "
 	set em $em$tt  
   }

if { $mom_clearance_plane_status != 1 } { 
	incr alarm
	set tt "\n\n Clearance Plane not Defined and Active \n\n "
 	set em $em$tt  
   }

if { $mom_clearance_plane_usage != 1 } { 
	incr alarm
	set tt "\n\n Clearance Plane not set to Start and End \n\n "
 	set em $em$tt  
   }


if {[ info exists mom_cycle_cam ]} {
   if { $mom_cycle_cam > 0 } {
		incr alarm
		set tt "\n\n Illegal CAM setting in canned cycle \n Set Spindle Speed on Feedrate Dialog \n\n "
 		set em $em$tt  
       }
    }  

if { $alarm > 0 } { MOM_abort $em }
}


#=============================================================
proc PB_CMD_do_rotary_axes { } {
#=============================================================
# index rotary axes if reqd, retract first, restate TLO after
# this deliberately moves both axes - even if only one has moved
# called from rapid move

global mom_out_angle_pos
global js_lastB js_lastA
global mom_SafeIndex
global js_safe_once_count

set indexflag 0					;# default dont index

global just_indexed	;# for emergency fix in conditional Z

if {![info exists js_lastA] } { set js_lastA -9999 }
if {![info exists js_lastB] } { set js_lastB -9999 }

if { $js_lastA != $mom_out_angle_pos(0) } { set indexflag 1 }	;# index if A changed
if { $js_lastB != $mom_out_angle_pos(1) } { set indexflag 1 }

# ###################### version 0.1 ###################################
#        default is safe index. non-default was not safe index

if { $mom_SafeIndex == "ON" } {		;# UDE can suppress safe index for 5x
  if { $indexflag == 1 } {
    
   MOM_force once fourth_axis fifth_axis 
 
   PB_CMD_gohomeZonly			;# set of retracts
 
   MOM_output_literal "  "		  
   MOM_output_literal "( TABLE INDEX ) "  

   MOM_force once MA MB			;#  ensure it really unclamps
   #MOM_do_template AClampOff    	;#  "M11"
   #MOM_do_template BClampOff    	;#  "M13"

   MOM_do_template AandBaxis			

   #MOM_do_template BClampOn	    	;#  "M12"
   #MOM_do_template AClampOn    		;#  "M10"
   MOM_output_literal "   "		 
 
   MOM_force once Z G_motion 		;# force out Z after index on next rapid
   set just_indexed 1
  }
}

# ###################### version 0.2 ###################################
#   ude == safe index OFF   make safe index first time after UDE or toolchange 

if { $mom_SafeIndex == "OFF" } {	;# UDE can suppress safe index for 5x

   if {![hiset js_safe_once_count ] } { set js_safe_once_count 0 } ;# _should_ be 0 after toolchange
   incr js_safe_once_count 

   if { $js_safe_once_count == 1 } { 
      if { $indexflag } {
   
        MOM_force once fourth_axis fifth_axis G
	MOM_output_literal "  "
        MOM_output_literal "( *** SAFE INDEX ONCE ONLY *** ) "

	PB_CMD_gohomeZonly

        MOM_output_literal "  "		  
   	MOM_output_literal "( TABLE INDEX ) "  

   	#MOM_do_template AClampOff    	;#  "M11"
   	#MOM_do_template BClampOff    	;#  "M13"

  	MOM_force once MA MB			;#  ensure it really unclamps
   	MOM_do_template AandBaxis			

   	#MOM_do_template BClampOn	    	;#  "M12"
   	#MOM_do_template AClampOn    		;#  "M10"
   	MOM_output_literal "   "		 

	MOM_force once Z G_motion		;# force out Z
	set just_indexed 1
      }
  }
}

# ######################## end v1.5 #####################################

 #MOM_output_literal " do_rotary_axes proc end.."
 #MOM_output_literal "   "
}


#=============================================================
proc PB_CMD_drill_text { } {
#=============================================================
# MOM_output_literal "  PB_CMD_drill_text called   " 
# called via handler from MOM_drill_text event
# this parses up string which looks like 
#	INNER_ddd_hhhh_nnn_S_sss_X_xxx	# INNER OR OUTER

set bigerr        "\n *  INNER_ddd_hhhh_nnn_S_sss_X_xxx	 INNER OR OUTER  "
set bigerr " $bigerr \n *     ddd is dia	"
set bigerr " $bigerr \n *     hhh is LEFT or RIGHT or R or L		  ( default Right )"
set bigerr " $bigerr \n *     nnn is number of helix laps 		  ( default 2 ) "
set bigerr " $bigerr \n *     sss is value of stock to come off	          ( default 0 ) "
set bigerr " $bigerr \n *     xxx is no. addit. passes on side of thread  ( default 0 ) "
set bigerr " $bigerr \n *  "
set bigerr " $bigerr \n *   Eg: IN_12.345_R_3_S_0.25_X_3  \n\n "

#
global mom_cycle_text mom_tool_type mom_tool_pitch mom_operation_name
global mom_prev_pos ZretBetweenHoles 
global pn_tm_type
global mom_tool_diameter mom_tool_pitch
# "return variables"
global pn_threadmill_dia pn_thread_left pn_thread_pitches pn_threadmill_stock pn_threadmill_r_passes

set    ZretBetweenHoles $mom_prev_pos(2)        ;# used later drill_text_move 

# sanity check text string

set err " \n \n  **** wrong text $mom_cycle_text ****\n\n**** must be IN or OUT ****\n "
set err " $err $bigerr "
set eflag 1
set pn_tm_type INNER
set test IN
if { [ string first $test $mom_cycle_text ] >=0 } { set eflag 0 }
set test OUT
if { [ string first $test $mom_cycle_text ] >=0 } { set eflag 0 ; set pn_tm_type OUTER }

if { $eflag == 1 } { MOM_abort $err }

if { $mom_tool_type != "Thread Mill" } { 
set err " \n \n  **** threadmill attempted with wrong tool type ****\n**** must be THREAD MILL ****\n \n "
MOM_abort $err
}

# diameter #
set pn_threadmill_dia  [ NPARSE  $mom_cycle_text 0 0 ] ;# get first number
 
if { $pn_threadmill_dia  == "err" } { 
        set err " \n \n  **** no diameter specified wrong text $mom_cycle_text  ****\n\n**** expected IN_12.345_R_3_S_0.25_X_3 **** \n **** where 9.876 is hole dia **** \n \n "
	set err " $err $bigerr "
	MOM_abort $err
} 

set min "-"
if { [ string first $min $pn_threadmill_dia ]  >= 0 } {	;# if negative sign
      set err " \n \n  **** Negative diameter $mom_cycle_text  ****\n**** expected IN_9.876_RIGHT_3 **** \n **** where 9.876 is hole dia **** \n \n "
      set err " $err $bigerr "
      MOM_abort $err
}	 
 
# hand of thread #
set  pn_thread_left 0	;# NOT Left Hand ie. default Right Hand Thread
if { [ string first L  $mom_cycle_text ]  >= 0 } { set pn_thread_left 1 } 

# number of pitches of helix #
set pn_thread_pitches  [ NPARSE  $mom_cycle_text 0 1 ] 		;# get 2ND number 1==2 in tcl <sigh>
if { $pn_thread_pitches == "err" } { set pn_thread_pitches 2 } 	;# default to 2 pitches-of-helix
if { $pn_thread_pitches <=0 } { set pn_thread_pitches 2 } 	;# not zero pitches-of-helix
set pn_thread_pitches [ expr int($pn_thread_pitches) ] 		;# force integer
 
# side stock #
set ss [ string first  S $mom_cycle_text ] ;# if string contains S for Stock
if { $ss >= 0 } {	
    set pn_threadmill_stock [ NPARSE $mom_cycle_text $ss 0 ] ;#  user specified stock
} else {
    set pn_threadmill_stock  0 			;# default to zero stock ( == 1pass ) cut up thread
} 

# no of rough-passes for thread #
set ss [ string first  X $mom_cycle_text ] 	;# if string contains X for TIMES
if { $ss >= 0 } {	
    set pn_threadmill_r_passes [ NPARSE $mom_cycle_text $ss 0 ] ;#  user specified NO OF PASSES
} else {
    set pn_threadmill_r_passes  0 		;# default to zero rough passes ( == 1pass ) cut up thread
} 
set  pn_threadmill_r_passes [ expr int($pn_threadmill_r_passes) ] ;# integer

MOM_output_literal " ( THREADMILL CYCLE FROM CYCLE TEXT $mom_cycle_text ) "
MOM_output_literal " ( DIAMETER $pn_threadmill_dia ) "
if { $pn_thread_left } {
	MOM_output_literal " ( LEFT HAND THREAD ) "
} else { 
 	MOM_output_literal " ( RIGHT HAND THREAD ) "
}
set inc [expr int($pn_thread_pitches) ] 	 
MOM_output_literal " ( NUMBER OF LAPS IS  $inc ) "

MOM_output_literal " ( SIDE STOCK IS  $pn_threadmill_stock ) "
MOM_output_literal " ( NO OF ROUGH PASSES  $pn_threadmill_r_passes ) "

# V0.5 safety 
set d [format  "%.3f" $mom_tool_diameter ]
set p [format  "%.3f" $mom_tool_pitch ]
MOM_output_literal " ( USING $d DIA TOOL WITH  $p PITCH ) "

if { $pn_tm_type == "OUTER" } { return }
# for INNER - check there's room  tool - given dia, pitch, and sidestock
  set min   $pn_threadmill_dia	 			;# begin  
  set min [ expr $min - 2 * $pn_threadmill_stock ]	;# sidestock 
# set min [ expr $min - 2 * 0.6 * $mom_tool_pitch ]	;# OFTEN _ISN'T_ room for pitch 

if { $min < $mom_tool_diameter }  { 
   set p  [ format  "%.3f" [ expr 0.6 * $mom_tool_pitch ]]
   set td [ format  "%.3f" $mom_tool_diameter ]
   set s  [ format "%.3f" $pn_threadmill_stock ]
   set dd [ format "%.3f" $pn_threadmill_dia ]
   set err "  \n \n    **** $mom_operation_name **** \n  "
   set err "$err \n    **** $mom_cycle_text           \n "
   set err "$err \n    **** tool                    $td  "
   set err "$err \n    **** sidestock               $s   "
   set err "$err \n\n    **** doesn't leave room for thread $dd **** \n \n "

   MOM_abort $err
}
}


#=============================================================
proc PB_CMD_drill_text_move { } {
#=============================================================
# called from threadmill_handler  
global pn_tm_type 

if { $pn_tm_type == "INNER" } {  PB_CMD_inner_text_move }
if { $pn_tm_type == "OUTER" } {  PB_CMD_outer_text_move }
}


#=============================================================
proc PB_CMD_end_of_alignment_character { } {
#=============================================================
 # Return sequnece number back to orignal
 # This command may be used with the command "PM_CMD_start_of_alignment_character"

  global mom_sys_leader saved_seq_num

  set mom_sys_leader(N) $saved_seq_num
}


#=============================================================
proc PB_CMD_endofeverything { } {
#=============================================================
global   js_HON_status
if { $js_HON_status == "TRUE" } { 
	MOM_output_literal "  ( HIGH SPEED OFF ) "
	MOM_output_literal "G187  "   
}

MOM_output_literal "M09 "
MOM_output_literal "M05 "
MOM_output_literal "G28 G91 Z0. "
MOM_output_literal "G28 G91 Y0. "
MOM_output_literal "G28 G91 X0. "
#MOM_output_literal "M11  "
#MOM_output_literal "M13  "
MOM_output_literal "G90 G0 A0. B0. "
MOM_output_literal "M33"    ;#auger off
MOM_output_literal "M30"
MOM_output_literal "% "
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
proc PB_CMD_fix_G54 { } {
#=============================================================
 
# returns errorchecked fixture offset from system one..

global mom_fixture_offset_value 
global js_fixoff

if { ![ info exists mom_fixture_offset_value ] } {  ;# if var not set
    set mom_fixture_offset_value 54 
   } 
if { $mom_fixture_offset_value == 0 } {  ;# if user not set
    set mom_fixture_offset_value 54 
   } 

if { ( $mom_fixture_offset_value > 6  && $mom_fixture_offset_value < 54 ) ||  ( $mom_fixture_offset_value > 59 ) } {    
    
   	MOM_output_literal " bad fixture offset number $mom_fixture_offset_value " 
	MOM_abort "\n\n ***** bad fixture offset number $mom_fixture_offset_value  ***** \n\n" 
   }

if { $mom_fixture_offset_value < 7 } {		;# handle 1,2 for 54, 55
   set mom_fixture_offset_value [expr $mom_fixture_offset_value +53 ] 
   }

 set js_fixoff $mom_fixture_offset_value
}


#=============================================================
proc PB_CMD_fixupD { } {
#=============================================================
#    reckon that we want cutcom register D output if :
#    mom_tool_cutcom_register is non-zero ( use user value )
#    or mom_tool_cutcom_register is zero  ( use tool value )
#    AND mom_cutcom_status is RIGHT or LEFT but not UNDEFINED or OFF
 
global mom_cutcom_status 
global mom_tool_cutcom_register
global mom_tool_number

global js_cutcom_register 	;# return value

if [info exists js_cutcom_register ] { unset js_cutcom_register }

if { $mom_cutcom_status != "RIGHT" && $mom_cutcom_status != "LEFT" } { return }

set js_cutcom_register $mom_tool_number		;# tool no. if not set

if { $mom_tool_cutcom_register != 0 }  {
   set js_cutcom_register $mom_tool_cutcom_register
}
MOM_force once D
}


#=============================================================
proc PB_CMD_fixupD_off { } {
#=============================================================
global js_cutcom_register

if [info exists js_cutcom_register ] { unset js_cutcom_register }
}


#=============================================================
proc PB_CMD_fixupH { } {
#=============================================================
global pn_tool_adjust_register mom_tool_adjust_register mom_tool_number

# use tool number same as H number unless specified different


set pn_tool_adjust_register $mom_tool_number

if { $mom_tool_adjust_register != 0      }  {

	;# if the above  is true use the adjust number set in UG
        set pn_tool_adjust_register $mom_tool_adjust_register
        

}
}


#=============================================================
proc PB_CMD_force_tables { } {
#=============================================================
#  flick rotary table angles by setting bogus value for table after t/change
global js_lastB 
set js_lastB -999
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
proc PB_CMD_gohomeZonly { } {
#=============================================================
# several blocks used before index  
# put into single calling routine for tidiness

 
MOM_force once G_mode G Z M_coolant
MOM_do_template gohome1			;# G91 G28 Z0. M09
 
MOM_force once G_mode G Y  
MOM_do_template gohome2			;# G91 G28 Y0.

MOM_force once G_mode
MOM_do_template gohome3			;# G90

MOM_force once G X Y 			;# re-force xy for next move

global spindle_first 			;# force XY before Z in next block
set spindle_first FALSE			;# spindle_first setting used in mom_rapid_move
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
proc PB_CMD_index_status { } {
#=============================================================
# trace index status
global mom_SafeIndex
global last_reported_status

# conditional ( now ) 

if { $mom_SafeIndex != "ON" } {  
	MOM_output_literal "( SAFE INDEX STATUS  : $mom_SafeIndex )"
	set last_reported_status "OFF"
} else { 

    if {[info exists last_reported_status]} {
	if { $last_reported_status == "OFF" } {
	    # only if previous report was OFF - don't repeat...
	    MOM_output_literal "( SAFE INDEX STATUS  : $mom_SafeIndex )"
	    set last_reported_status "ON"
	}
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
# Handling option on the Machine Tool dialog to Retract/Re-Engage.  
#
# The sequence of actions that take place when a rotary limit violation
# occurs is a retract to the clearance geometry at the rapid feedrate, 
# reposition the rotary axes so they do not violate, move back to 
# the engage point at the retract feedrate and engage into the part again.
#
# You can set additional parameters that will control the retract 
# and re-engage motion.
#
#
#  mom_kin_retract_type ------- specifies the method used to
#                               calculate the retract point.
#                               The method can be of
#
#    DISTANCE : The retract will be to a point at a fixed distance
#               along the spindle axis.
#
#    SURFACE  : For a 4-axis rotary head machine, the retract will
#               be to a cylinder.  For a 5-axis dual heads machine,
#               the retract will be to a sphere.  For machine with
#               only rotary table(s), the retract will be to a plane
#               normal & along the spindle axis.
#
#  mom_kin_retract_distance --- specifies the distance or radius for
#                               defining the geometry of retraction.
#
#  mom_kin_reengage_distance -- specifies the re-engage point above
#                               the part.
#

set mom_kin_retract_type                "DISTANCE"
set mom_kin_retract_distance            10.0
set mom_kin_reengage_distance           .20



#
# The following parameters are used by UG Post.  Do NOT change 
# them unless you know what you are doing.
#
if ![info exists mom_kin_spindle_axis] {
  set mom_kin_spindle_axis(0)                    0.0
  set mom_kin_spindle_axis(1)                    0.0
  set mom_kin_spindle_axis(2)                    1.0
}

set spindle_axis_defined 1
if ![info exists mom_sys_spindle_axis] {
  set spindle_axis_defined 0
} else {
  if ![array exists mom_sys_spindle_axis] {
    unset mom_sys_spindle_axis
    set spindle_axis_defined 0
  }
}
if !$spindle_axis_defined {
  set mom_sys_spindle_axis(0)                    0.0
  set mom_sys_spindle_axis(1)                    0.0
  set mom_sys_spindle_axis(2)                    1.0
}

set mom_sys_lock_status                        "OFF"

} ;# uplevel
}


#=============================================================
proc PB_CMD_init_vars { } {
#=============================================================
global pn_fixture_offset_value	; set pn_fixture_offset_value 54	;# may make variable later

global js_HON_waiting ; set js_HON_waiting "FALSE" 	;# (not) waiting to be output 
global js_HON_status  ; set js_HON_status  "FALSE"  	;# (not) output-and-not-cancelled

global mom_HighSpeed  ; set mom_HighSpeed  "OFF"	 ;# or ON from UDE - USED TO BE ON 


global mom_prog_name ; set mom_prog_name "NONAME"	;# initialised in init-vars
global mom_mam_prog_text ; set mom_mam_prog_text "NO DESCRIPTION "

global mom_mam_part_text ; set mom_mam_part_text -1 	;# from UDE

global mom_coolant_status ; set mom_coolant_status ON
global js_superstop_flag  ; set js_superstop_flag 0	;# superstop waiting code

global js_blockno	; set js_blockno 1		;# for N-number

global mom_SafeIndex	; set mom_SafeIndex "ON" 	;# FROM   UDE

global pn_just_toolchanged ; set pn_just_toolchanged "FALSE" ;# used/unset in PB_CMD_split_this_block
}


#=============================================================
proc PB_CMD_inner_text_move { } {
#=============================================================
# INNER - thread mill 
# called for each hole  when we are at clearplane over first hole
# or after previous call to this proc. at previous hole 

# works are moved to inner_text_pass - which we will call multiple
# times so Andy can make rough and finish cuts

global pn_threadmill_dia pn_thread_left pn_thread_pitches pn_threadmill_stock pn_threadmill_r_passes
global pn_this_dia

set inc 0
if { $pn_threadmill_r_passes > 0 } { 		;# pass size if any ...
   set inc [ expr 1.0 * $pn_threadmill_stock / ( 1.0 + $pn_threadmill_r_passes ) ] 
}
# MOM_output_literal " inc $inc "

set pn_this_dia  [ expr $pn_threadmill_dia - 2.0 * $pn_threadmill_stock ]	;# could be threadmill_dia
 
# MOM_output_literal " pn_this_dia before for loop inner dia $pn_this_dia "

for { set ii 0 } { $ii <  $pn_threadmill_r_passes } { incr ii } {
  set pn_this_dia [ expr $pn_this_dia + 2 * $inc ] 
  #  MOM_output_literal " pn_this_dia $pn_this_dia "
  PB_CMD_inner_text_pass
}

set pn_this_dia $pn_threadmill_dia 	;#   final dia
MOM_output_literal " ( FINAL CUT $pn_this_dia DIA ) "
PB_CMD_inner_text_pass			;# finish ( fundamental ) pass
}


#=============================================================
proc PB_CMD_inner_text_pass { } {
#=============================================================
# INNER pass for - thread mill 
# called for each pass from inner_text_move   
#  inner_text_move may call this several times with different dia to give rough and finsh 

global pn_this_dia	;# will be pn_threadmill_dia for last ( fundamental ) pass

global mom_pos mom_cycle_rapid_to feed mom_cycle_feed_to mom_prev_pos 
global mom_tool_diameter mom_tool_pitch
global thX thY thZ thI thJ thF thG
global pn_threadmill_dia pn_thread_left pn_thread_pitches
global mom_cutcom_status 
#

# set tr [ expr ( $pn_threadmill_dia - $mom_tool_diameter ) / 2 ] ;# toolpath rad
set tr   [ expr ( $pn_this_dia - $mom_tool_diameter ) / 2 ] 	  ;# thispass rad
set er [ expr $tr / 2 ]						  ;# engage retract rad
#
 
global mom_prev_pos ZretBetweenHoles 
# ## set startZ $mom_prev_pos(2) ;# come back here at end 
set startZ $ZretBetweenHoles      ;# set once and for all in PB_CMD_drill_text 

# #### xy move to this  hole   #####
MOM_do_template RapXYforThread 

# ####   z move to Rplane   #####
set thZ [ expr $mom_pos(2) + $mom_cycle_rapid_to]
MOM_do_template RapZforThread 

# ####   z feed to btm      #####
set thF [ expr 0.5 * $feed ] 		;# slow down approach
# # mod - start 1/8pitch lower so full thread == programmed value
set thZ [ expr $mom_pos(2) + $mom_cycle_feed_to -( $mom_tool_pitch / 8 ) ]
set runningZ $thZ
MOM_do_template FeedZforThread 

# ### xy feed to start point at -45 ( or +45 degrees for LHThread ) ###
set thX [ expr $mom_pos(0) + $er ]	
set thY [ expr $mom_pos(1) - $er ]
if { $pn_thread_left == 1 } { set thY [ expr $mom_pos(1) + $er ] }

set mom_cutcom_status LEFT
if { $pn_thread_left == 1 } { set mom_cutcom_status RIGHT }

PB_CMD_fixupD
MOM_do_template FeedXYforThread

#  ### G3 in (G2 for LHT )half rad to 3oclock posn. with Z lift  of 1/8pitch ###
set thG 3
set thX [ expr $mom_pos(0) + $tr ]	
set thY  $mom_pos(1)
set thZ [ expr $runningZ + ( $mom_tool_pitch / 8 ) ]
set runningZ $thZ
set thI 0 
set thJ $er
if { $pn_thread_left == 1 } {    set thG 2 ; set thJ [expr -1.0 * $er ] }
# feedrate mod for engage
set thF [ expr 0.5 * $feed *  ( $pn_threadmill_dia - $mom_tool_diameter ) / $pn_threadmill_dia ]

MOM_force once G_motion X Y I J 
MOM_do_template ArcForThread

 
#   ### n trips round with Z increment upwards by 1 pitch   ###
for { set i 1 } { $i <= $pn_thread_pitches } { incr i }  {
	set thG 3
	set thX [ expr $mom_pos(0) + $tr ]	
	set thY  $mom_pos(1)
	set thZ [ expr $runningZ + $mom_tool_pitch ]
	set runningZ $thZ
	set thI [expr -1.0 * $tr ]
	set thJ 0
	if { $pn_thread_left == 1 } { set thG 2  }
	# feedrate mod for main cut
	set thF [ expr  $feed *  ( $pn_threadmill_dia - $mom_tool_diameter ) / $pn_threadmill_dia ]
	MOM_force once G_motion X Y I J 
	MOM_do_template ArcForThread
} 


#   ### arc out to end point at 45 ( or -45 degrees for LHThread ) ### 
#       G3 out (G2 for LHT )half rad end pt with Z lift  of 1/8pitch
set thG 3
set thX [ expr $mom_pos(0) + $er ]	
set thY [ expr $mom_pos(1) + $er ]
if { $pn_thread_left == 1 } { set thY [ expr $mom_pos(1) - $er ] }

set thZ [ expr $runningZ + ( $mom_tool_pitch / 8 ) ]
set runningZ $thZ
set thI [expr -1.0 * $er ] 
set thJ 0
if { $pn_thread_left == 1 } { set thG 2 }
 
MOM_force once G_motion X Y I J 
MOM_do_template ArcForThread

#   ### xy feed to middle of hole  ###
set thX $mom_pos(0)	
set thY $mom_pos(1)

set mom_cutcom_status OFF
PB_CMD_fixupD_off
MOM_do_template FeedXYforThread

#    ### Z rapid to clearplane    ###
set thZ $startZ
MOM_do_template RapZforThread
MOM_force once Z
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
# This command supercedes the functionalites provided by the
# FEEDRATE_SET in ugpost_base.tcl.  Post Builder automatically
# generates proper call sequences to this command in the
# Event handlers.
#
# This command must be used in conjunction with ugpost_base.tcl.
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
proc PB_CMD_kin_init_new_iks { } {
#=============================================================
   global mom_new_iks_exists

  # Revert legacy dual-head kinematic parameters when new IKS is absent.
   if ![info exists mom_new_iks_exists] {
      set ugii_version [string trim [MOM_ask_env_var UGII_VERSION]]
      if ![string match "v3" $ugii_version] {

         if [llength [info commands PB_CMD_revert_dual_head_kin_vars] ] {
            PB_CMD_revert_dual_head_kin_vars
         }
return
      }
   }

  # Initialize new IKS parameters.
   if [llength [info commands PB_init_new_iks] ] {
      PB_init_new_iks
   }

  # Users can provide next command to modify or disable new IKS options.
   if [llength [info commands PB_CMD_revise_new_iks] ] {
      PB_CMD_revise_new_iks
   }

  # Revert legacy dual-head kinematic parameters when new IKS is disabled.
   global mom_kin_iks_usage
   if { $mom_kin_iks_usage == 0 } {
      if [llength [info commands PB_CMD_revert_dual_head_kin_vars] ] {
         PB_CMD_revert_dual_head_kin_vars
      }
   }
}


#=============================================================
proc PB_CMD_kin_init_rotary { } {
#=============================================================

   global mom_kin_machine_type

   if [info exists mom_kin_machine_type] {
      if { [string match "*3_axis_mill*" $mom_kin_machine_type] || [string match "*lathe*" $mom_kin_machine_type] } {
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
  global mom_out_angle_pos
  global unlocked_prev_pos mom_sys_leader
  global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
  global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
  global mom_prev_pos
  global mom_prev_rot_ang_4th mom_prev_rot_ang_5th

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
         if { $mom_kin_machine_type == "5_axis_head_table"  ||  $mom_kin_machine_type == "5_AXIS_HEAD_TABLE" } {
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


#<05-10-06 sws> pb351 - Corrected logic
   if {$axis == "3" } { 
      if {![info exists mom_prev_rot_ang_4th]} {
          set prev_angles(0) [MOM_ask_address_value fourth_axis]
      } else {
          set prev_angles(0) $mom_prev_rot_ang_4th
      }
   } elseif {$axis == "4"} { 
      if {![info exists mom_prev_rot_ang_5th]} {
          set prev_angles(1) [MOM_ask_address_value fifth_axis]
      } else {
          set prev_angles(1) $mom_prev_rot_ang_5th
      }
   } 

   set p [expr $axis + 1]
   set a [expr $axis - 3]
   if {$axis == "3" && $mom_kin_4th_axis_direction == "MAGNITUDE_DETERMINES_DIRECTION"} {
      set dirtype 0
      global mom_sys_4th_axis_dir_mode
      if [info exists mom_sys_4th_axis_dir_mode] {
        if {$mom_sys_4th_axis_dir_mode == "ON"} {
          set del $dir
          if {$del == 0} {
            set del [expr $ang-$mom_prev_pos(3)]
            if {$del > 180.0} {set del [expr $del-360.0]}
            if {$del < -180.0} {set del [expr $del+360.0]}
          }
          global mom_sys_4th_axis_cur_dir
          if {$del > 0.0} {
            global mom_sys_4th_axis_clw_code 
            set mom_sys_4th_axis_cur_dir $mom_sys_4th_axis_clw_code
          } elseif {$del < 0.0} {
            global mom_sys_4th_axis_cclw_code            
            set mom_sys_4th_axis_cur_dir $mom_sys_4th_axis_cclw_code
          }
        }
      }
   } elseif { $axis == "4"  &&  $mom_kin_5th_axis_direction == "MAGNITUDE_DETERMINES_DIRECTION" } {
      set dirtype 0
      global mom_sys_5th_axis_dir_mode
      if [info exists mom_sys_5th_axis_dir_mode] {
        if {$mom_sys_5th_axis_dir_mode == "ON"} {
          set del $dir
          if {$del == 0} {
            set del [expr $ang-$mom_prev_pos(4)]
            if {$del > 180.0} {set del [expr $del-360.0]}
            if {$del < -180.0} {set del [expr $del+360.0]}
          }
          global mom_sys_5th_axis_cur_dir
          if {$del > 0.0} {
            global mom_sys_5th_axis_clw_code 
            set mom_sys_5th_axis_cur_dir $mom_sys_5th_axis_clw_code
          } elseif {$del < 0.0} {
            global mom_sys_5th_axis_cclw_code            
            set mom_sys_5th_axis_cur_dir $mom_sys_5th_axis_cclw_code
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
         set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(0)  $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader  mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
      } else {
         set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(1)  $mom_kin_5th_axis_direction   $mom_kin_5th_axis_leader   mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
      }

 #     if {$axis == 3} {set prot $prev_angles(0)}
 #     if {$axis == 4} {set prot $prev_angles(1)}
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
            set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(0)  $mom_kin_4th_axis_direction   $mom_kin_4th_axis_leader   mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
         } else {
            set mom_out_angle_pos($a) [ROTSET $ang  $prev_angles(1)  $mom_kin_5th_axis_direction   $mom_kin_5th_axis_leader  mom_sys_leader(fifth_axis)  $mom_kin_5th_axis_min_limit  $mom_kin_5th_axis_max_limit]
         }
      } elseif {$dir == 1} {
         set mom_out_angle_pos($a) $ang
      }
   }

   global mom_sys_auto_clamp
 
   if {[info exists mom_sys_auto_clamp]} {
     if {$mom_sys_auto_clamp == "ON"} {
       set out1 "1"
       set out2 "0"
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
      if {$mom_kin_4th_axis_direction == "SIGN_DETERMINES_DIRECTION"} {
        set mom_prev_rot_ang_4th [expr abs($mom_out_angle_pos(0))]
      } else {
        set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
      }
      MOM_reload_variable mom_prev_rot_ang_4th
   } else {
      if [info exists mom_kin_5th_axis_direction] {
        PB_CMD_fifth_axis_rotate_move
        if {$mom_kin_5th_axis_direction == "SIGN_DETERMINES_DIRECTION"} {
          set mom_prev_rot_ang_5th [expr abs($mom_out_angle_pos(1))]
        } else {
          set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
        }
        MOM_reload_variable mom_prev_rot_ang_5th
      }
   }


#<05-10-06 sws> pb351 - Uncommented next 3 lines
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
         LOCK_AXIS_INITIALIZE
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


#=============================================================
proc MOM_lintol { } {
#=============================================================
  global mom_kin_linearization_flag
  global mom_kin_linearization_tol
  global mom_lintol_status
  global mom_lintol

  if {$mom_lintol_status == "ON"} {
     set mom_kin_linearization_flag "TRUE"
     if [info exists mom_lintol] {set mom_kin_linearization_tol $mom_lintol}
  } elseif {$mom_lintol_status == "OFF"} {
     set mom_kin_linearization_flag "FALSE"
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
  # Output NC code according to CSYS
   if [llength [info commands PB_CMD_set_csys] ] {
      PB_CMD_set_csys
   }

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # Incase Axis Rotation has been set to "reverse"
   if [llength [info commands PB_CMD_reverse_rotation_vector] ] {
      PB_CMD_reverse_rotation_vector
   }
}


#=============================================================
proc PB_CMD_kin_start_of_path { } {
#=============================================================
#  This command is executed at the start of every operation.
#  It will check to see if a new head (post) was loaded and 
#  will then initialize any functionality specific to that post.
#
#  It will also restore the initial Start of Program or End
#  of program event handlers.
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

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # Incase Axis Rotation has been set to "reverse"
   if [llength [info commands PB_CMD_reverse_rotation_vector] ] {
      PB_CMD_reverse_rotation_vector
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
#  This command will execute the following custom commands for
#  initialization.  They will be executed once at the start of 
#  program and again each time they are loaded as a linked post.  
#  After execution they will be deleted so that they are not 
#  present when a different post is loaded.  You may add a call 
#  to any command that you want executed when a linked post is 
#  loaded.  
#
#  Note when a linked post is called in, the Start of Program
#  event marker is not executed again.
#
#  DO NOT REMOVE ANY LINES FROM THIS PROCEDURE UNLESS YOU KNOW
#  WHAT YOU ARE DOING.  DO NOT CALL THIS PROCEDURE FROM ANY
#  OTHER CUSTOM COMMAND.
#
   global mom_kin_machine_type


   set command_list [list]

   if [info exists mom_kin_machine_type] {
      if { ![string match "*3_axis_mill*" $mom_kin_machine_type] && ![string match "*lathe*" $mom_kin_machine_type] } {

         lappend command_list  PB_CMD_kin_init_rotary
      }
   }

   lappend command_list  PB_CMD_kin_init_new_iks

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
proc PB_CMD_limitA { } {
#=============================================================
# AXIS TRAVEL LIMIT ON A table is -120 to +122
# ( table can really go to +123 , but we choose not to  )

# mom_out_angle_pos doesn't output anything in overtravel so allow bigger 
# limits in PB and check here

global   mom_out_angle_pos mom_operation_name

if { $mom_out_angle_pos(0) < 0 } {
  set err "\n\n\n *** ROTARY AXIS OVERTRAVEL IN OPERATION $mom_operation_name *** "
  set err "$err \n \n ***          A AXIS IS $mom_out_angle_pos(0)             *** "
  set err "$err \n \n ***          LIMITS ARE +122 TO 0                   *** "
  set err "$err \n \n \n "

  MOM_abort $err
}

if { $mom_out_angle_pos(0) > 122  } {
  set err "\n\n\n *** ROTARY AXIS OVERTRAVEL IN OPERATION $mom_operation_name *** "
  set err "$err \n \n ***          A AXIS IS $mom_out_angle_pos(0)           *** "
  set err "$err \n \n ***          LIMITS ARE +122 TO 0                   *** "
  set err "$err \n \n \n "

  MOM_abort $err
}
}


#=============================================================
proc PB_CMD_limitA_visible { } {
#=============================================================
# original command which made part rotate towards operator so he could see whats going on --grin
# used to use post builder axis travel limts on A set to Min -47 and Max +180.

# AXIS TRAVEL LIMIT ON A table is +120 to -46
# ( table can really go to -120 , but we choose not to  )

# mom_out_angle_pos doesn't output anything in overtravel so allow bigger 
# limits in PB and check here

global   mom_out_angle_pos mom_operation_name

if { $mom_out_angle_pos(0) < -46 } {
  set err "\n\n\n *** ROTARY AXIS OVERTRAVEL IN OPERATION $mom_operation_name *** "
  set err "$err \n \n ***          A AXIS IS $mom_out_angle_pos(0)             *** "
  set err "$err \n \n ***          LIMITS ARE -46 TO +119                   *** "
  set err "$err \n \n \n "

  MOM_abort $err
}

if { $mom_out_angle_pos(0) > 119  } {
  set err "\n\n\n *** ROTARY AXIS OVERTRAVEL IN OPERATION $mom_operation_name *** "
  set err "$err \n \n ***          A AXIS IS $mom_out_angle_pos(0)           *** "
  set err "$err \n \n ***          LIMITS ARE -46 TO +119                   *** "
  set err "$err \n \n \n "

  MOM_abort $err
}
}


#=============================================================
proc PB_CMD_linear_move { } {
#=============================================================
#
#  This procedure is used by many automatic postbuilder functions 
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
#
# This procedure is to obliterate the same proc in the previous
# Post Builder release (v2.0).  In case this command has been
# attached to the Linear Move event of the existing Posts, this
# will prevent the linearization being performed twice, since
# PB_CMD_kin_linearize_motion is executed automatically already.
#
}


#=============================================================
proc PB_CMD_mmperminute { } {
#=============================================================
# only after tapping
global pn_tapflag
if [info exists pn_tapflag] { 
   if {$pn_tapflag == 1 } {
      set pn_tapflag 0 
 	MOM_output_literal "G94" ;# back to mm/min
   }
}
}


#=============================================================
proc PB_CMD_nBwork { } {
#=============================================================
#  normalise B works - called from _normalB  and from _unwindB   

global mom_operation_type 
global mom_out_angle_pos mom_prev_out_angle_pos
global mom_pos mom_prev_pos

	# NOTE # mom_pos(3) is mom_out_angle_pos(0) normalised to value 
	# between 0&360 - so gives "remainder" value after subtracting
	# multiples of 360 degrees.

	set mom_out_angle_pos(1) $mom_pos(4)  
	set mom_prev_out_angle_pos(1) $mom_pos(4)  	

	# this "pushes back" the values to the event generator.
	# IMPORTANT not reload of mom_prev_pos as well

         MOM_reload_variable -a mom_prev_pos
  	 MOM_reload_variable -a mom_out_angle_pos
 
   	# NormalBaxis does : " G92 B$mom_out_angle_pos(1) <remainder> "
	# which is VM/MAM style. Haas Reccomendation is to
	# use G28 which _may_ be : " G91 G28 B<remainder> "
	# if so - we'll change the NormalBaxis template

#############################haas recomendation########################
#... They can, however,
#program A99720.0 (nearest multiple of 360) then program G91 G28 A0.
#With setting 108 (QUICK ROTARY G28) set to ON and parameter 43 bit 10 
#(A-AXIS CIRC. WRAP) set to 1, this will effectively reset the 
#Machine Coordinate for A-axis back to zero without unwinding. 
#They can then continue A-axis rotation from zero.
#############################haas recomendation########################

	 MOM_force once fourth_axis G fifth_axis
	 MOM_do_template NormalBaxis
}


#=============================================================
proc PB_CMD_normalB { } {
#=============================================================
#  to re-zero B axis at end of VARIABLE   path - otherwise NO-OP 

global mom_operation_type  

set xx "Variable-axis Surface Contouring"
if { $mom_operation_type == $xx } {
  # if this is end of variable new op - normalize B
  
  PB_CMD_nBwork

}
}


#=============================================================
proc PB_CMD_notes_on_post { } {
#=============================================================
# qualified machine has a C axis called B - don't blame us...

# Threadmill
# contains CYCL/TEXT implementation of INNER/OUTER with sidepasses
# Auto axis clamping codes removed. controller undertakes thi sautomatically
# 26 September 2006


# 29 Sept - changed axis travel limits to be 0 - 122 to keep 
# 	    machining on the visible side of the trunnion.


}


#=============================================================
proc PB_CMD_nurbs_end_of_program { } {
#=============================================================
  global nurbs_move_flag

  if {[info exists nurbs_move_flag]} {MOM_output_literal "G05 P0"}
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

  set mom_kin_nurbs_output_type              BSPLINE

  MOM_reload_kinematics

proc MOM_nurbs_move {} {
#_______________________________________________________________________________
# This procedure is executed for each nurbs move.
#_______________________________________________________________________________
  global mom_nurbs_knot_count
  global mom_nurbs_point_count
  global mom_nurbs_order

  global nurbs_knot_count
  global nurbs_precision
  global nurbs_move_flag
  global anchor_flag

  if {![info exists nurbs_move_flag]} {
    MOM_output_literal "G05 P10000"
    set nurbs_move_flag 1
  }

  FEEDRATE_SET
  if {![info exists anchor_flag]} {
    MOM_do_template anchor_point
    set anchor_flag 0
  }

  set nurbs_knot_count 0
  MOM_force once G_motion order X Y Z

  while {$nurbs_knot_count < $mom_nurbs_point_count} {
    MOM_do_template nurbs
    set nurbs_knot_count [expr $nurbs_knot_count + 1]
  }

  while {$nurbs_knot_count < $mom_nurbs_knot_count} {
    MOM_do_template knots
    set nurbs_knot_count [expr $nurbs_knot_count + 1]
  }
}




}
}


#=============================================================
proc PB_CMD_outer_text_move { } {
#=============================================================
# OUTER - thread mill
# called for each hole  when we are at clearplane over first hole
# or after previous call to this proc. at previous hole

# working parts are moved to outer_text_pass procedure - called multiple times
# 
global pn_threadmill_dia pn_thread_left pn_thread_pitches pn_threadmill_stock pn_threadmill_r_passes
global pn_this_dia

set inc 0
if { $pn_threadmill_r_passes > 0 } { 		;# pass size if any ...
   set inc [ expr 1.0 * $pn_threadmill_stock / ( 1.0 + $pn_threadmill_r_passes ) ] 
}
# MOM_output_literal " inc $inc "

set pn_this_dia  [ expr $pn_threadmill_dia + 2.0 * $pn_threadmill_stock ]	;# could be threadmill_dia
 
# MOM_output_literal " pn_this_dia before for loop inner dia $pn_this_dia "

for { set ii 0 } { $ii <  $pn_threadmill_r_passes } { incr ii } {
  set pn_this_dia [ expr $pn_this_dia - 2 * $inc ] 
  # MOM_output_literal " pn_this_dia $pn_this_dia "
  PB_CMD_outer_text_pass
}

set pn_this_dia $pn_threadmill_dia 	;#   final dia
MOM_output_literal " ( FINAL CUT $pn_this_dia DIA ) "
PB_CMD_outer_text_pass			;# finish ( fundamental ) pass
}


#=============================================================
proc PB_CMD_outer_text_pass { } {
#=============================================================
# OUTER - pass for thread mill
# called for each pass from outer_text_move   

global pn_this_dia	;# will be pn_threadmill_dia for last ( fundamental ) pass

global mom_pos mom_cycle_rapid_to feed mom_cycle_feed_to mom_prev_pos 
global mom_tool_diameter mom_tool_pitch
global thX thY thZ thI thJ thF thG
global pn_threadmill_dia pn_thread_left pn_thread_pitches
global mom_cutcom_status 

#
set tr [ expr ( $pn_this_dia + $mom_tool_diameter ) / 2 ] ;# OUTER toolpath rad 
# set er [ expr $tr / 2 ]						
set er 3.0 				;# OUTER engage retract rad hardwired for now
#
 
global mom_prev_pos ZretBetweenHoles 
# ## set startZ $mom_prev_pos(2) ;# come back here at end 
set startZ $ZretBetweenHoles      ;# set once and for all in PB_CMD_drill_text 

# #### xy move over centre this OUTER   #####
MOM_do_template RapXYforThread 

# move to point at 3 o'clock 6mm beyond stud diameter
set deltapos  [ expr $mom_pos(0) + $tr + $er + $er   ] ;# delta move destination

# temporarily change mom_pos to make output easier 
set saved_mom_pos $mom_pos(0)	;# store X of hole centre
set mom_pos(0) $deltapos	;# delta position

MOM_do_template RapXYforThread  ;# move over delta point

# ####   z move to Rplane   #####
set thZ [ expr $mom_pos(2) + $mom_cycle_rapid_to]
MOM_do_template RapZforThread 

# ####   z feed to btm      #####
set thF $feed
# # mod - start 1/8pitch lower so full thread == programmed value
set thZ [ expr $mom_pos(2) + $mom_cycle_feed_to -( $mom_tool_pitch / 8 ) ]
set runningZ $thZ
MOM_do_template FeedZforThread 

# ### xy feed to OUTER start point at -135 ( or +135 degrees for LHThread ) ###
set thX [ expr $mom_pos(0) - $er ]	
set thY [ expr $mom_pos(1) - $er ]
if { $pn_thread_left == 1 } { set thY [ expr $mom_pos(1) + $er ] }

set mom_cutcom_status RIGHT	;# reversed for OUTER
if { $pn_thread_left == 1 } { set mom_cutcom_status LEFT }
PB_CMD_fixupD
MOM_do_template FeedXYforThread

#  ### G2 in OUTER (G3 for LHT )half rad to 3oclock posn. with Z lift  of 1/8pitch ###
set thG 2

set mom_pos(0) $saved_mom_pos		;# RESTORE hole centre

set thX [ expr $mom_pos(0) + $tr ]	
set thY  $mom_pos(1)
set thZ [ expr $runningZ + ( $mom_tool_pitch / 8 ) ]
set runningZ $thZ
set thI 0 
set thJ $er
if { $pn_thread_left == 1 } { set thG 3 ; set thJ [expr -1.0 * $er ] }
# feedrate mod for engage
set thF [ expr 0.5 * $feed ]		;# half specified feedrate entry

MOM_force once G_motion X Y I J 
MOM_do_template ArcForThread
 
#   ### n trips round with Z increment upwards by 1 pitch   ###
for { set i 1 } { $i <= $pn_thread_pitches } { incr i }  {
	set thG 3			;# OUTER - main cut goes opposite to arc in/out
	set thX [ expr $mom_pos(0) + $tr ]	
	set thY  $mom_pos(1)
	set thZ [ expr $runningZ + $mom_tool_pitch ]
	set runningZ $thZ
	set thI [expr -1.0 * $tr ]
	set thJ 0
	if { $pn_thread_left == 1 } { set thG 2  }
	# feedrate mod for main cut
	set thF [ expr  $feed ]
	MOM_force once G_motion X Y I J 
	MOM_do_template ArcForThread
} 

#   ### arc out to end point at 45 ( or -45 degrees for LHThread ) ### 
#       G2 out (G3 for LHT )half rad end pt with Z lift  of 1/8pitch
set thG 2	;# OUTER

set thX [ expr $mom_pos(0) + $tr + $er ]	
set thY [ expr $mom_pos(1) + $er ]
if { $pn_thread_left == 1 } { set thY [ expr $mom_pos(1) - $er ] }

set thZ [ expr $runningZ + ( $mom_tool_pitch / 8 ) ]
set runningZ $thZ
set thI [expr $er ] ;# bugfix 16nov
set thJ 0
if { $pn_thread_left == 1 } { set thG 3 }
 
MOM_force once G_motion X Y I J 
MOM_do_template ArcForThread

#   ### xy feed to start of hole  ###
set thX  $deltapos 
set thY $mom_pos(1)

set mom_cutcom_status OFF
PB_CMD_fixupD_off
MOM_do_template FeedXYforThread

#    ### Z rapid to clearplane    ###
set thZ $startZ
MOM_do_template RapZforThread
}


#=============================================================
proc PB_CMD_partno { } {
#=============================================================
# PROGRAM HEADER HERE - can't see UDE in start of program.

global mom_prog_name		;# initialised in init-vars
global mom_mam_prog_text mom_mam_part_text ;# from UDE
global mom_path_name

global mom_parent_group_name  mom_part_name
global mom_date pn_version    mom_G10lines

# tce partno start
# if mom_part_name contains literal string "%" it's come from TCE 
 

set percent \%

if { [string first $percent $mom_part_name ] >= 0 } { 
	# TCE
	set start [expr [string first PN= $mom_part_name] + 3 ]	;# loc of PN= in string 
	set end [string range $mom_part_name $start 999]		;# tail of string
	set blank "\ "
	set blankpos [string first $blank $end ]				;# loc of space in string
	set partno [string toupper [string range $end 0 $blankpos]]	;# bit from PN= to space
	
}  else {
	# NATIVE
	set partno [ string toupper [ file rootname [ file tail $mom_part_name ] ] ]
}

# tce partno end

MOM_output_literal "%"
MOM_output_literal "O$mom_prog_name  ( $partno ) "		;# O1999 or UDE Val

set mom_mam_part_text [ string toupper $mom_mam_part_text   ]	;# FIRST comment
set mom_mam_prog_text [ string toupper $mom_mam_prog_text   ]	;# second comment

MOM_output_literal "( $mom_mam_part_text  ISSUE: $mom_mam_prog_text )"

if {[info exists mom_parent_group_name]} {set identifier_text $mom_parent_group_name} else {set identifier_text $mom_path_name}
MOM_output_literal "( NX4 Operation  $identifier_text ) "
MOM_output_literal "( [ string toupper $mom_date ] ) "
MOM_output_literal "( HAAS VF2_SS_Trunion_table 5AXIS POSTPROCESSOR VERSION $pn_version ) "

#MOM_output_literal "M98 P9000 " 
MOM_do_template absolute_mode 	;# G90 etc..
MOM_output_literal "G187" 	;# 

MOM_output_literal "   "		;# 
MOM_output_literal "G91 G28 Z0.0 M09 "
MOM_output_literal "G91 G28 Y0.0 "
MOM_output_literal "G90 "
#MOM_output_literal "M11 "
#MOM_output_literal "M13 "
MOM_output_literal "G0 A0.0 B0.0 "
MOM_output_literal "    "
}


#=============================================================
proc PB_CMD_pause { } {
#=============================================================
  set cam_aux_dir  [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]

  if { [file exists ${cam_aux_dir}ugwish.exe] && [file exists ${cam_aux_dir}mom_pause.tcl] } {
    exec ${cam_aux_dir}ugwish.exe ${cam_aux_dir}mom_pause.tcl
  }
}


#=============================================================
proc PB_CMD_rapid_nanny { } {
#=============================================================
# called from first-move, initial-move, 
# to prevent user programming moves which are normally Rapid at Feedrate 
# which can lead to variables not being initialised the post.
#
# this could be called from ordinary linear feedrate move as well.
# # not done to keep linear uncluttered # 
# use in first- and initial-move traps case where user sets Rapid == Feed
# for whole operation. 
# other possibly case is where ( say ) non-cutting moves for Check avoidance
# are programmed for feedrate, not rapid. that's not a problem - as everything
# will be initialised by then...

global mom_motion_type mom_operation_name mom_programmed_feed_rate feed

if { $mom_motion_type != "RAPID" } {  return }
 
if { $mom_programmed_feed_rate != 0 } { 
  	set err "\n\n\n *** ILLEGAL RAPID FEEDRATE IN $mom_operation_name *** "
  	set err " $err  \n\n\n *** RAPID FEEDRATE SET TO $feed *** "
  	set err " $err \n *** SHOULD BE SET TO 0 IN THIS POST *** "
  	set err "$err \n \n \n "

	MOM_abort $err 
}
}


#=============================================================
proc PB_CMD_reload_iks_parameters { } {
#=============================================================
# This command overloads new IKS params from a machine model.(NX4)
# It will be executed automatically at the start of each path
# or when CSYS has changed.
#
   global mom_csys_matrix
   global mom_kin_iks_usage

  #----------------------------------------------------------
  # Set a classification to fetch kinematic parameters from
  # a particular set of K-components of a machine.
  # - Default is NONE.
  #----------------------------------------------------------
   set custom_classification NONE

   if { [info exists mom_kin_iks_usage] && $mom_kin_iks_usage == 1 } {
      if [info exists mom_csys_matrix] {
         if [llength [info commands MOM_validate_machine_model] ] {
            if { [MOM_validate_machine_model] == "TRUE" } {
               MOM_reload_iks_parameters "$custom_classification"
               MOM_reload_kinematics
            }
         }
      }
   }
}


#=============================================================
proc PB_CMD_replacement_procedures { } {
#=============================================================
# modified standard procedures

proc MOM_catch_warning {} {
#_______________________________________________________________________________
# This procedure generates the warnings for missing procedures and values
# falling out of MIN/MAX. 
#_______________________________________________________________________________
  global mom_warning_info
  global warn_file list_file warn_count
  global group_warn_file group_list_file group_warn_count
  global mom_sequence_mode mom_sequence_number mom_sequence_increment mom_sequence_frequency
  global mom_motion_type

  if {[regexp "MOM_msys" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_machine_mode" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_origin" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_translate" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_lintol" $mom_warning_info] == 1} { return }
  if {[regexp "MOM_tlset" $mom_warning_info] == 1} { return }
  
  if {![info exists mom_motion_type]} { set mom_motion_type "UNSET" } 
  if { $mom_motion_type == "RAPID" && [regexp "FEED RATE LIMIT" $mom_warning_info] == 1} { return }

  # if {[regexp "FEED RATE LIMIT" $mom_warning_info] == 1} { 
#	MOM_output_literal " ( FEED RATE LIMIT HERE ) " 
# 	MOM_output_literal " ( FEED RATE LIMIT HERE ) " 
# 	MOM_output_literal " ( FEED RATE LIMIT HERE ) " 
# 	MOM_output_literal " ( FEED RATE LIMIT HERE ) " 
# 
#   return }


  catch {PB_catch_warning}

  if { [regexp  "mom_seqnum" $mom_warning_info] == 1 } {
    MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
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

proc MOM_SafeIndex {} { # no-op }
proc MOM_prog_identifier { } { # no-op }
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
proc PB_CMD_reverse_rotation_vector { } {
#=============================================================
# This command fixes the vectors of rotary axes.
# It will be executed automatically when present.
# Do not attach it with any Event markers.
#

  global mom_kin_iks_usage
  global mom_csys_matrix

   set reverse_vector 0

   if { [info exists mom_kin_iks_usage] && $mom_kin_iks_usage == 1 } {
      if [info exists mom_csys_matrix] {
         if [llength [info commands MOM_validate_machine_model] ] {
            if { [MOM_validate_machine_model] == "TRUE" } {
               set reverse_vector 1
            }
         }
      }
   }

   if $reverse_vector {

     global mom_kin_4th_axis_vector mom_kin_5th_axis_vector
     global mom_kin_4th_axis_rotation mom_kin_5th_axis_rotation

      foreach axis { 4th_axis 5th_axis } {

         if { [info exists mom_kin_${axis}_rotation] && [string match "reverse" [set mom_kin_${axis}_rotation]] } {

            if [info exists mom_kin_${axis}_vector] {
               foreach i { 0 1 2 } {
                  set mom_kin_${axis}_vector($i) [expr -1 * [set mom_kin_${axis}_vector($i)]]
               }
            }
         }
      }

      MOM_reload_kinematics
   }
}


#=============================================================
proc PB_CMD_revert_dual_head_kin_vars { } {
#=============================================================
# Only dual-head 5-axis mill posts will be affected by this
# command.
#
# This command reverts kinematic parameters for dual-head 5-axis
# mill posts to maintain compatibility and to allow the posts
# to run in UG/Post prior to NX3.
#
# Attributes of the 4th & 5th Addresses, their locations in
# the Master Word Sequence and all the Blocks that use these
# Addresses will be reconditioned with call to
#
#     PB_swap_dual_head_elements
#
#-------------------------------------------------------------
# 04-15-05 gsl - Added for PB v3.4
#-------------------------------------------------------------

  global mom_kin_machine_type


  if ![string match  "5_axis_dual_head"  $mom_kin_machine_type] {
return
  }


  set var_list { ang_offset center_offset(0) center_offset(1) center_offset(2) direction incr_switch leader limit_action max_limit min_incr min_limit plane rotation zero }

  set center_offset_set 0

  foreach var $var_list {
    # Global declaration
    if [string match "center_offset*" $var] {
      if { !$center_offset_set } {
         global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset 
         set center_offset_set 1
      }
    } else {
      global mom_kin_4th_axis_[set var] mom_kin_5th_axis_[set var] 
    }

    # Swap values
    set val [set mom_kin_4th_axis_[set var]]
    set mom_kin_4th_axis_[set var] [set mom_kin_5th_axis_[set var]]
    set mom_kin_5th_axis_[set var] $val
  }

  # Update kinematic parameters
  MOM_reload_kinematics


  # Swap address leaders
  global mom_sys_leader

  set val $mom_sys_leader(fourth_axis)
  set mom_sys_leader(fourth_axis) $mom_sys_leader(fifth_axis)
  set mom_sys_leader(fifth_axis)  $val

  # Swap elements in definition file
  if [llength [info commands PB_swap_dual_head_elements] ] {
     PB_swap_dual_head_elements
  }
}


#=============================================================
proc PB_CMD_revise_new_iks { } {
#=============================================================
# This command is executed automatically, which allows you
# to change the default IKS parameters or disable the IKS
# service completely.
#
# *** Do not attach this command to any event marker! ***
#
   global mom_kin_iks_usage
   global mom_kin_rotary_axis_method
   global mom_kin_spindle_axis
   global mom_kin_4th_axis_vector
   global mom_kin_5th_axis_vector


  # Uncomment next statement to disable new IKS service
  # set mom_kin_iks_usage           0


  # Uncomment next statement to change rotary solution method
  # set mom_kin_rotary_axis_method  "ZERO"


  # Uncomment next statement, if any parameter above has changed.
  # MOM_reload_kinematics
}


#=============================================================
proc PB_CMD_sameTool_superstop { } {
#=============================================================
# conditinally between two ops with same tool - if user programs superstop
# triggers a bogus toolchange 

# this 5x version returns some axes to original positions ( 3x doesn't )

# reinstated...

global js_HON_status js_superstop_flag js_blockno

if { $js_superstop_flag == 0 } { return } 
set js_superstop_flag 0
 
if { $js_HON_status == "TRUE" } { 
	MOM_output_literal "  ( HIGH SPEED OFF ) "
	MOM_output_literal "G187 "  ;# for haas set high speed default

}

global mom_pos mom_out_angle_pos
global sstX sstY sstA sstB	;# positions of ab xy at end of prev. op
 
MOM_output_literal "G91 G28 Z0. "
MOM_output_literal "G28 Y0. "	;# 3 line gohome  

MOM_output_literal "M09 "
MOM_output_literal "M05 "
MOM_output_literal "   "
 	
global mom_superstop_type  

#MOM_do_template AClampOff	;# M13 
#MOM_do_template BClampOff	;# M11

if {[info exists mom_superstop_type ] } {
    if { $mom_superstop_type == "OPTIONALSTOP"  } { 	
		MOM_output_literal "M01 "
    } else {
		MOM_output_literal "M00 "
    }
} else { 
    # no type, old ude
    MOM_output_literal "M00 " 
}

global mom_superstop_text
if {[info exists mom_superstop_text ] } {
   if { $mom_superstop_text != "" } { 	
 	MOM_output_literal " ( [string toupper $mom_superstop_text ] ) "
   }
}
MOM_output_literal "   "
 
# Restate tool change  here
PB_CMD_setN		;# will give N2701
MOM_force once M
MOM_do_template tool_change_1
MOM_do_template tool_change_2

if { $js_HON_status == "TRUE" } { 
	MOM_output_literal "  ( HIGH SPEED ON ) "
        MOM_output_literal "G187 E0.5 "  ;#  for haas set high speed on
}
MOM_output_literal "G90  "

# RESTORE LAST KNOWN A THEN B THEN XY NOW5x only 
set  mom_pos(0) $sstX		;# restore last known pos from proc superstop 
set  mom_pos(1) $sstY
set  mom_out_angle_pos(0) $sstA ;# restore  pos
set  mom_out_angle_pos(1) $sstB

MOM_force once G_motion fourth_axis fifth_axis
#MOM_do_template AClampOff    	;#  M11
#MOM_do_template BClampOff    	;#  M13

MOM_do_template Aaxis		;# return to last known posn
MOM_force once G_motion
MOM_do_template Baxis		;# in case user's been jogging

#MOM_do_template AClampOn   	;# M10 
#MOM_do_template BClampOn   	;# M12 

MOM_force once G_motion X Y 		 
MOM_do_template RapXYforThread	;# misnomer here G0 X Y
# END RESTORE  

MOM_force once X Y Z R F  S M_spindle
}


#=============================================================
proc PB_CMD_save_tablepos { } {
#=============================================================
# Save last known table pos - at end of rapid, linear 
global js_lastB js_lastA mom_out_angle_pos

set js_lastA $mom_out_angle_pos(0)
set js_lastB $mom_out_angle_pos(1)
}


#=============================================================
proc PB_CMD_setN { } {
#=============================================================
# This command sets block no. for output on toolchange only

global js_blockno mom_tool_number
global pn_used_tool_numbers 			;# array for used numbers

if { ![info exists pn_used_tool_numbers] } {  	;# first time only
    set i 0					;# initialise all to zero 
    while { $i < 100 } {
    set pn_used_tool_numbers($i) 0 
    incr i
   }
}
set counter 0 					;# start of array 
set repeat_no 0					;# added to Nnumber 
while { $pn_used_tool_numbers($counter) != 0 } { ;# check each pre-used toolno.

	if { $pn_used_tool_numbers($counter) == $mom_tool_number } {
		incr repeat_no			;# if seen before need a repeat no
	}
	
	incr counter	
    }

# add _current_ toolno to array for checking next time
set pn_used_tool_numbers($counter) $mom_tool_number 

# calculate tool number including borrowed repeat no.)
set js_blockno [expr 100 * $mom_tool_number + $repeat_no ]


#V0.10 don't presel tool in spindle 
global mom_next_tool_number pn_next_tool_number

set pn_next_tool_number $mom_next_tool_number
if { $mom_next_tool_number == $mom_tool_number } { set pn_next_tool_number 24 }
}


#=============================================================
proc PB_CMD_set_csys { } {
#=============================================================
# This custom command is provided as the default to nullify
# the same command in a linked post that may have been
# imported from pb_cmd_coordinate_system_rotation.tcl.
#
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
  MOM_force once G_motion G_return G_adjust M_spindle M_coolant S X Y Z F R  
  MOM_force once M_coolant G_feed
}


#=============================================================
proc PB_CMD_superstop { } {
#=============================================================
# replace standard STOP code

proc  MOM_superstop {} {
	global js_superstop_flag mom_pos mom_out_angle_pos
	set js_superstop_flag 1

	# For 5x case only - need to store xy ab before-stop
	#  ie. at moment that superstop is called at end of previous operation
	# because same_tool_superstop proc restores them
	global sstX sstY sstA sstB

	set sstX $mom_pos(0)		;# store present xypos
	set sstY $mom_pos(1)
	set sstA $mom_out_angle_pos(0)		;# store present pos
	set sstB $mom_out_angle_pos(1)

}
}


#=============================================================
proc PB_CMD_superstop_old { } {
#=============================================================
# replace standard STOP code to do what user wants

proc  MOM_superstop {} {
	 
global js_HON_status js_superstop_flag js_blockno

if { $js_HON_status == "TRUE" } { 
	MOM_output_literal "  ( HIGH SPEED OFF ) "
	MOM_output_literal "G187 "  ;# for haas set high speed
}

global mom_pos
set tX $mom_pos(0)		;# store present pos
set tY $mom_pos(1)

set tA $mom_pos(3)		;# store present pos
set tB $mom_pos(4)

MOM_output_literal "G91 G28 Z0. "
MOM_output_literal "G28 Y0. "	;# 3 line gohome  
# MOM_output_literal "G28 X0 "
MOM_output_literal "M09 "
MOM_output_literal "M05 "
MOM_output_literal "   "
 	
global mom_superstop_type  

MOM_do_template AClampOff	;# M13 
MOM_do_template BClampOff	;# M11

 if {[info exists mom_superstop_type ] } {
    if { $mom_superstop_type == "OPTIONALSTOP"  } { 	
		MOM_output_literal "M01 "
    } else {
		MOM_output_literal "M00 "
    }
} else { 
    # no type, old ude
    MOM_output_literal "M00 " 
}

global mom_superstop_text
if {[info exists mom_superstop_text ] } {
   if { $mom_superstop_text != "" } { 	
 	MOM_output_literal " ( [string toupper $mom_superstop_text ] ) "
   }
}
MOM_output_literal "   "
 
# Restate tool change  here
# incr js_blockno 	;# will give N2701
PB_CMD_setN
 
MOM_do_template tool_change_1
MOM_do_template tool_change_2

if { $js_HON_status == "TRUE" } { 
	MOM_output_literal "  ( HIGH SPEED ON ) "
        MOM_output_literal "G187  "  ;#  for haas set high speed back to default
}
MOM_output_literal "G90  "

# 5x only return to 
set  mom_pos(0) $tX	;# restore last known pos
set  mom_pos(1) $tY
set  mom_pos(3) $tA  	;# restore  pos
set  mom_pos(4) $tB

MOM_force once G_motion fourth_axis fifth_axis
MOM_do_template AClampOff    	;#  M11
MOM_do_template BClampOff    	;#  M13

MOM_do_template Aaxis		;# return to last known posn
MOM_force once G_motion
MOM_do_template Baxis		;# in case user's been jogging

MOM_do_template AClampOn   	;# M10 
MOM_do_template BClampOn   	;# M12 

MOM_force once G_motion X Y 		 
MOM_do_template RapXYforThread	;# misnomer here G0 X Y

MOM_force once X Y Z R F  S M_spindle
MOM_force once Z
}
}


#=============================================================
proc PB_CMD_tapfix { } {
#=============================================================
global feed ;# mm/min
global pn_tapfeed mom_spindle_speed pn_tapflag mom_spindle_direction pn_tap_Gcode

set pn_tapfeed $feed

if ![info exists pn_tapflag] { set pn_tapflag 0 }

set pn_tapflag 1
set pn_tap_Gcode 84

if { $mom_spindle_direction == "CCLW"  } { set pn_tap_Gcode 74 }
}


#=============================================================
proc PB_CMD_threadmill_handler { } {
#=============================================================
# spots text cycle and calls PB procs

uplevel #0 { 

	proc MOM_drill_text { } {
	   PB_CMD_drill_text
	}

	proc MOM_drill_text_move { } {
	   PB_CMD_drill_text_move
	}

}
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  MOM_force once G_adjust H
}


#=============================================================
proc PB_CMD_trap_zeros { } {
#=============================================================
# trap zero tool number  and spindle speed

global mom_tool_number
global mom_spindle_speed
global mom_operation_name
global mom_operation_type
set xx "Mill Machine Control"

if { $mom_operation_type == $xx } { return } 		;# don't check machine controls

if { $mom_tool_number  == 0.0 } {
	MOM_output_literal " ( TOOL ZERO PROGRAMMED ) "
	MOM_output_literal " M00 "
	set errmes "\n\n *** Tool Number Not set    ***\n***  in operation $mom_operation_name  ***\n\n"
 	MOM_abort "$errmes"	
   }
 
if { $mom_spindle_speed == 0.0 } {
	MOM_output_literal " ( ZERO SPINDLE SPEED PROGRAMMED )"
	MOM_output_literal " M00 "	
	set mom_spindle_speed 20.	;# dodge div.by zero in tap
	set errmes "\n\n *** Spindle Speed Not set    ***\n***  in operation $mom_operation_name  ***\n\n"
 	MOM_abort "$errmes"	
   }

# VF2-TR Specific

if { $mom_spindle_speed > 15000 } {
	set errmes "\n\n *** Spindle Speed Over Max 15000    ***\n***  in operation $mom_operation_name  ***\n\n"
 	MOM_abort "$errmes"	
   }

if { $mom_spindle_speed < 50  } {
	set errmes "\n\n *** Spindle Speed Under Min 50    ***\n***  in operation $mom_operation_name  ***\n\n"
 	MOM_abort "$errmes"	
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
proc PB_CMD_unwindB { } {
#=============================================================
# machine axis travel limit on B table is +/- 99999 (
# we set 99600 as limit in PB 
# handle repos by non-PB means
set tangle 99400 	;# use 99400 here 

 set tangle 2500 	;# test with small number
set mangle [ expr -1.0 * $tangle ]



global mom_out_angle_pos mom_operation_name mom_pos
global mom_prev_pos  mom_prev_out_angle_pos mom_feed_cut_value


#MOM_output_literal " tangle $tangle "
#MOM_output_literal " mangle $mangle "
#MOM_output_literal " anglepos $mom_out_angle_pos(1) "

# slight lift at feedrate G92 to unset and then carryon.

set windupflag 0
if { $mom_out_angle_pos(1) > $tangle } {
   set ba [format  "%.3f" $mom_out_angle_pos(1) ]
   set msg " ( B AXIS LIMIT REACHED $ba IN  $mom_operation_name ) "
   set windupflag 1
}

if { $mom_out_angle_pos(1) < $mangle } {
   set ba [format  "%.3f" $mom_out_angle_pos(1) ]
   set msg " ( B AXIS LIMIT REACHED $ba IN  $mom_operation_name ) "
   set windupflag 1
}

if { $windupflag } { 

# allow natural move to take place ( before repos )

# save mom_pos etc
	set js_temp_saveZ $mom_pos(2)			;# STORE Z

# save old feed    
	global feed mom_sys_feed_rate_mode_code feed_mode
	set save_feed $feed
 
	# set saveMode $feed_mode
	# set saveG93 $mom_sys_feed_rate_mode_code($feed_mode)
	set feed 100					;# arbitrary
	set feed_mode "MMPM"

# godel Z 1.0 mm
### suspect we need to switch from G93 to G94 to do this ### 
	set js_lift	1.0				;# lift dimension 1.0mm
	set mom_pos(2) [ expr $mom_pos(2) + $js_lift ]	;# SET NEW Z
	MOM_force once G_feed F
	MOM_do_template linear_move			;# DO retract-LINEAR
	MOM_output_literal "    "
	MOM_output_literal $msg
	

# g92 block
	PB_CMD_nBwork

 # goto orig pos at feed
	set mom_pos(2) $js_temp_saveZ			;# REINSTATE Z
	MOM_force once G_feed F
	MOM_do_template linear_move			;# return
#	
set feed $save_feed
# set mom_sys_feed_rate_mode_code($saveMode) $saveG93
MOM_force once G_feed F

}
}


#=============================================================
proc PB_CMD_version { } {
#=============================================================
global pn_version
set pn_version 1.0 ;# Generic 5axis trunion Table
set pn_version 1.1 ;#  axis travel limits to 0 - 122 


##
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
proc AUTO_CLAMP_1 { out } {
#=============================================================
#
   global clamp_rotary_fourth_status 
 
   if {![info exists clamp_rotary_fourth_status]} {
      PB_CMD_unclamp_fourth_axis
      set clamp_rotary_fourth_status "UNCLAMPED"
   } elseif {$out  == 0 && $clamp_rotary_fourth_status != "UNCLAMPED"} {
     #<sws 01-09-06> pb350
      PB_CMD_unclamp_fourth_axis
      set clamp_rotary_fourth_status "UNCLAMPED"
   } elseif {$out == 1 && $clamp_rotary_fourth_status != "CLAMPED"} {
      PB_CMD_clamp_fourth_axis
      set clamp_rotary_fourth_status "CLAMPED"
   }
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

   if {![info exists clamp_rotary_fifth_status]} {
      PB_CMD_unclamp_fifth_axis
      set clamp_rotary_fifth_status "UNCLAMPED"
   } elseif {$out == 0 && $clamp_rotary_fifth_status != "UNCLAMPED"} {
     #<sws 01-09-06> pb350
      PB_CMD_unclamp_fifth_axis
      set clamp_rotary_fifth_status "UNCLAMPED"
   } elseif {$out == 1 && $clamp_rotary_fifth_status != "CLAMPED"} {
      PB_CMD_clamp_fifth_axis
      set clamp_rotary_fifth_status "CLAMPED"
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
proc EQ_is_equal { s t } {
#=============================================================
   global mom_system_tolerance

   if [info exists mom_system_tolerance] {
      set tol $mom_system_tolerance
   } else {
      set tol 0.000000001
   }

   if { [expr abs($s - $t) <= $tol] } { return 1 } else { return 0 }
}


#=============================================================
proc EQ_is_zero { s } {
#=============================================================
   global mom_system_tolerance

   if [info exists mom_system_tolerance] {
      set tol $mom_system_tolerance
   } else {
      set tol 0.0000001
   }

   if { [expr abs($s) <= $tol] } { return 1 } else { return 0 }
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


#=============================================================
proc LINEARIZE_LOCK_MOTION {  } {
#=============================================================
#
#  This procedure linearizes the move between two positions that
#  have both linear and rotary motion.  The rotary motion is 
#  created by LOCK_AXIS from the coordinates in the locked plane.
#  The combined linear and rotary moves result in non-linear
#  motion.  This procedure will break the move into shorter moves
#  that do not violate the tolerance.
#  
   global mom_pos 
   global mom_prev_pos 
   global unlocked_pos 
   global unlocked_prev_pos 
   global mom_kin_linearization_tol 
   global mom_kin_machine_resolution 
   global mom_out_angle_pos 

   VMOV 5 mom_pos locked_pos 
   VMOV 5 mom_prev_pos locked_prev_pos 

   UNLOCK_AXIS locked_pos unlocked_pos 
   UNLOCK_AXIS locked_prev_pos unlocked_prev_pos 

   VMOV 5 unlocked_pos save_unlocked_pos 
   VMOV 5 locked_pos save_locked_pos 

   set loop 0
   set count 0

   set tol $mom_kin_linearization_tol

   while { $loop == 0 } {

      for {set i 3} {$i < 5} {incr i} {
         set del [expr $locked_pos($i) - $locked_prev_pos($i)]
         if {$del > 180.0} {
            set locked_prev_pos($i) [expr $locked_prev_pos($i)+360.0]
         } elseif {$del < -180.0} {
            set locked_prev_pos($i) [expr $locked_prev_pos($i)-360.0]
         }
      }

      set loop 1

      for {set i 0} {$i < 5} {incr i} {
         set mid_unlocked_pos($i) [expr ($unlocked_pos($i)+$unlocked_prev_pos($i))/2.0]
         set mid_locked_pos($i) [expr ($locked_pos($i)+$locked_prev_pos($i))/2.0]
      }

      UNLOCK_AXIS mid_locked_pos temp

      VEC3_sub temp mid_unlocked_pos work

      set error [VEC3_mag work]

      if {$count > 20} {

         VMOV 5 locked_pos mom_pos
         VMOV 5 unlocked_pos mom_prev_pos

         LINEARIZE_LOCK_OUTPUT $count
           
      } elseif { $error < $tol} {

         VMOV 5 locked_pos mom_pos
         VMOV 5 unlocked_pos mom_prev_pos

         LINEARIZE_LOCK_OUTPUT $count

         VMOV 5 unlocked_pos unlocked_prev_pos
         VMOV 5 locked_pos locked_prev_pos
 
         if {$count != 0} {
            VMOV 5 save_unlocked_pos unlocked_pos
            VMOV 5 save_locked_pos locked_pos
            set loop 0
            set count 0
         }

      } else {
         if {$error < $mom_kin_machine_resolution} {
            set error $mom_kin_machine_resolution
         }
         set error [expr sqrt($mom_kin_linearization_tol*.98/$error)]
         if {$error < .5} {set error .5}
         for {set i 0} {$i < 5} {incr i} {
            set locked_pos($i) [expr $locked_prev_pos($i)+($locked_pos($i)-$locked_prev_pos($i))*$error]
            set unlocked_pos($i) [expr $unlocked_prev_pos($i)+($unlocked_pos($i)-$unlocked_prev_pos($i))*$error]
         }
         LOCK_AXIS unlocked_pos locked_pos mom_outangle_pos

         set loop 0
         incr count 
      }
   }
}


#=============================================================
proc LINEARIZE_LOCK_OUTPUT { count } {
#=============================================================      
   global mom_out_angle_pos 
   global mom_pos 
   global mom_prev_rot_ang_4th 
   global mom_prev_rot_ang_5th
   global mom_kin_4th_axis_direction 
   global mom_kin_5th_axis_direction
   global mom_kin_4th_axis_leader 
   global mom_kin_5th_axis_leader 
   global mom_sys_leader 
   global mom_prev_pos
   global mom_mcs_goto
   global mom_prev_mcs_goto
   global mom_motion_distance
   global mom_feed_rate_number
   global mom_feed_rate
   global mom_kin_machine_resolution
   global mom_kin_max_frn
   global mom_kin_machine_type
   global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
   global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
   global mom_out_angle_pos
   global unlocked_pos unlocked_prev_pos

   
   set mom_out_angle_pos(0)  [ROTSET $mom_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
   if {[info exists mom_kin_5th_axis_direction]} {
       set mom_out_angle_pos(1)  [ROTSET $mom_pos(4) $mom_prev_rot_ang_5th $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
   }
#
#  Re-calcualte the distance and feed rate number 
#

   if {$count < 0} {
     VEC3_sub mom_mcs_goto mom_prev_mcs_goto delta
   } else {
     VEC3_sub unlocked_pos unlocked_prev_pos delta
   }
   set mom_motion_distance [VEC3_mag delta]
   if {[EQ_is_lt $mom_motion_distance $mom_kin_machine_resolution]} {
       set mom_feed_rate_number $mom_kin_max_frn
   } else {
       set mom_feed_rate_number [expr $mom_feed_rate / $mom_motion_distance ]
   } 

   set mom_pos(3) $mom_out_angle_pos(0)

   FEEDRATE_SET

   if {$count > 0} { PB_CMD_linear_move }

#   set mom_prev_pos(3) $mom_out_angle_pos(0)
}


#=============================================================
proc LOCK_AXIS { input_point output_point output_rotary } {
#=============================================================
  upvar $input_point ip ; upvar $output_point op ; upvar $output_rotary or
  
  global mom_kin_4th_axis_center_offset 
  global mom_kin_5th_axis_center_offset
  global mom_sys_lock_value 
  global mom_sys_lock_plane
  global mom_sys_lock_axis 
  global mom_sys_unlocked_axis 
  global mom_sys_4th_axis_index
  global mom_sys_5th_axis_index
  global mom_sys_linear_axis_index_1
  global mom_sys_linear_axis_index_2
  global mom_sys_rotary_axis_index
  global mom_kin_machine_resolution
  global mom_prev_lock_angle
  global mom_out_angle_pos
  global mom_prev_rot_ang_4th 
  global mom_prev_rot_ang_5th
  global positive_radius
  global DEG2RAD 
  global RAD2DEG

   if ![info exists positive_radius] {set positive_radius 0}

   if {$mom_sys_rotary_axis_index == 3} {
       if ![info exists mom_prev_rot_ang_4th] {set mom_prev_rot_ang_4th 0.0}
       set mom_prev_lock_angle $mom_prev_rot_ang_4th
   } else {
       if ![info exists mom_prev_rot_ang_5th] {set mom_prev_rot_ang_5th 0.0}
       set mom_prev_lock_angle $mom_prev_rot_ang_5th
   }

   if {![info exists mom_kin_4th_axis_center_offset]} {
       set temp(0) $ip(0)
       set temp(1) $ip(1)
       set temp(2) $ip(2)
   } else {
       VEC3_sub ip mom_kin_4th_axis_center_offset temp
   }

   if [info exists mom_kin_5th_axis_center_offset] {
      VEC3_sub temp mom_kin_5th_axis_center_offset temp
   }

   set temp(3) $ip(3)
   set temp(4) $ip(4)

   if {$mom_sys_lock_axis > 2} {
      set angle [expr ($mom_sys_lock_value-$temp($mom_sys_lock_axis))*$DEG2RAD]
      ROTATE_VECTOR $mom_sys_lock_plane $angle temp temp1
      VMOV 3 temp1 temp
      set temp($mom_sys_lock_axis) $mom_sys_lock_value
   } else {
      if {$mom_sys_lock_plane == $mom_sys_5th_axis_index} {
         set angle [expr ($temp(4))*$DEG2RAD]
         ROTATE_VECTOR $mom_sys_5th_axis_index $angle temp temp1
         VMOV 3 temp1 temp
         set temp(4) 0.0
     }
      set rad [expr sqrt($temp($mom_sys_linear_axis_index_1)*$temp($mom_sys_linear_axis_index_1) + $temp($mom_sys_linear_axis_index_2)*$temp($mom_sys_linear_axis_index_2))]
      set angle [ARCTAN $temp($mom_sys_linear_axis_index_2) $temp($mom_sys_linear_axis_index_1)]
      if { $rad < [expr abs($mom_sys_lock_value) + $mom_kin_machine_resolution]} {
         if {$mom_sys_lock_value < 0.0} {
            set temp($mom_sys_lock_axis) [expr -$rad]
         } else {
            set temp($mom_sys_lock_axis) $rad
         }
      } else {
         set temp($mom_sys_lock_axis) $mom_sys_lock_value
      }

      set temp($mom_sys_unlocked_axis)  [expr sqrt($rad*$rad - $temp($mom_sys_lock_axis)*$temp($mom_sys_lock_axis))]

      VMOV 5 temp temp1
      set temp1($mom_sys_unlocked_axis) [expr -$temp($mom_sys_unlocked_axis)]
      set ang1 [ARCTAN $temp($mom_sys_linear_axis_index_2) $temp($mom_sys_linear_axis_index_1)]
      set ang2 [ARCTAN $temp1($mom_sys_linear_axis_index_2) $temp1($mom_sys_linear_axis_index_1)]
      set temp($mom_sys_rotary_axis_index) [expr ($angle-$ang1)*$RAD2DEG]
      set temp1($mom_sys_rotary_axis_index) [expr ($angle-$ang2)*$RAD2DEG]
      set ang1 [LIMIT_ANGLE [expr $mom_prev_lock_angle-$temp($mom_sys_rotary_axis_index)]]
      set ang2 [LIMIT_ANGLE [expr $mom_prev_lock_angle-$temp1($mom_sys_rotary_axis_index)]]
      if {$ang1 > 180.0} {set ang1 [LIMIT_ANGLE [expr -$ang1]]}  
      if {$ang2 > 180.0} {set ang2 [LIMIT_ANGLE [expr -$ang2]]}
      if {$positive_radius == "0"} {
        if {$ang1 > $ang2} {
          VMOV 5 temp1 temp
          set positive_radius "-1"
        } else {
          set positive_radius "1"
        }
      } elseif {$positive_radius == "-1"} {
          VMOV 5 temp1 temp
      }

   }

   if {[info exists mom_kin_4th_axis_center_offset]} {
      VEC3_add temp mom_kin_4th_axis_center_offset op
   } else {
      set op(0) $temp(0)
      set op(1) $temp(1)
      set op(2) $temp(2)
   }
   if {[info exists mom_kin_5th_axis_center_offset]} {
      VEC3_add op mom_kin_5th_axis_center_offset op
   }

   if {![info exists or]} {
      set or(0) 0.0
      set or(1) 0.0
   }
   set mom_prev_lock_angle $temp($mom_sys_rotary_axis_index)
   set op(3) $temp(3)
   set op(4) $temp(4)
}


#=============================================================
proc LOCK_AXIS_INITIALIZE {  } {
#=============================================================

  global mom_sys_lock_plane
  global mom_sys_lock_axis
  global mom_sys_unlocked_axis
  global mom_sys_unlock_plane
  global mom_sys_4th_axis_index
  global mom_sys_5th_axis_index
  global mom_sys_linear_axis_index_1
  global mom_sys_linear_axis_index_2
  global mom_sys_rotary_axis_index
  global mom_kin_4th_axis_plane
  global mom_kin_5th_axis_plane

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
      set mom_sys_4th_axis_index 2
   } elseif {$mom_kin_4th_axis_plane == "ZX"} {
      set mom_sys_4th_axis_index 1
   } elseif {$mom_kin_4th_axis_plane == "YZ"} {
      set mom_sys_4th_axis_index 0
   }

   if {[info exists mom_kin_5th_axis_plane]} {
      if {$mom_kin_5th_axis_plane == "XY"} {
         set mom_sys_5th_axis_index 2
      } elseif {$mom_kin_5th_axis_plane == "ZX"} {
         set mom_sys_5th_axis_index 1
      } elseif {$mom_kin_5th_axis_plane == "YZ"} {
         set mom_sys_5th_axis_index 0
      }
   } else {
      set mom_sys_5th_axis_index -1
   }


     if {$mom_sys_lock_plane == 0} {
         set mom_sys_linear_axis_index_1 1
         set mom_sys_linear_axis_index_2 2
      } elseif {$mom_sys_lock_plane == 1} {
         set mom_sys_linear_axis_index_1 2
         set mom_sys_linear_axis_index_2 0
      } elseif {$mom_sys_lock_plane == 2} {
         set mom_sys_linear_axis_index_1 0
         set mom_sys_linear_axis_index_2 1
      }

      if {$mom_sys_5th_axis_index == -1} {
         set mom_sys_rotary_axis_index 3
      } else {
         set mom_sys_rotary_axis_index 4
      }

      set mom_sys_unlocked_axis [expr $mom_sys_linear_axis_index_1 + $mom_sys_linear_axis_index_2 - $mom_sys_lock_axis]
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
  global mom_pos mom_out_angle_pos 
  global mom_current_motion 
  global mom_motion_type
  global mom_cycle_feed_to_pos 
  global mom_cycle_feed_to mom_tool_axis
  global mom_motion_event 
  global mom_sys_lock_status 
  global mom_cycle_rapid_to_pos 
  global mom_cycle_retract_to_pos
  global mom_cycle_rapid_to 
  global mom_cycle_retract_to 
  global mom_prev_pos
  global mom_kin_4th_axis_type
  global mom_kin_spindle_axis 
  global mom_kin_5th_axis_type 
  global mom_kin_4th_axis_plane
  global mom_sys_cycle_after_initial 
  global mom_kin_4th_axis_min_limit 
  global mom_kin_4th_axis_max_limit
  global mom_kin_5th_axis_min_limit 
  global mom_kin_5th_axis_max_limit
  global mom_prev_rot_ang_4th 
  global mom_prev_rot_ang_5th
  global mom_kin_4th_axis_direction 
  global mom_kin_5th_axis_direction
  global mom_kin_4th_axis_leader 
  global mom_kin_5th_axis_leader

  if {$mom_sys_lock_status == "ON"} {  

      if {$mom_current_motion == "circular_move"} {return}
      if {![info exists mom_sys_cycle_after_initial]} {set mom_sys_cycle_after_initial "FALSE"}
      if {$mom_sys_cycle_after_initial == "FALSE"} {
          LOCK_AXIS mom_pos mom_pos mom_out_angle_pos
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
      global mom_kin_linearization_flag

      if { $mom_kin_linearization_flag == "TRUE" && $mom_motion_type != "RAPID" && $mom_motion_type != "RETRACT"} { 
         LINEARIZE_LOCK_MOTION 
      } else {
         if ![info exists mom_prev_rot_ang_4th] {set mom_prev_rot_ang_4th 0.0}
         if ![info exists mom_prev_rot_ang_5th] {set mom_prev_rot_ang_5th 0.0}
         set mom_out_angle_pos(0)  [ROTSET $mom_pos(3) $mom_prev_rot_ang_4th $mom_kin_4th_axis_direction $mom_kin_4th_axis_leader mom_sys_leader(fourth_axis) $mom_kin_4th_axis_min_limit $mom_kin_4th_axis_max_limit]
         if {[info exists mom_kin_5th_axis_direction]} {
           set mom_out_angle_pos(1)  [ROTSET $mom_pos(4) $mom_prev_rot_ang_5th $mom_kin_5th_axis_direction $mom_kin_5th_axis_leader mom_sys_leader(fifth_axis) $mom_kin_5th_axis_min_limit $mom_kin_5th_axis_max_limit]
           set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
           MOM_reload_variable mom_prev_rot_ang_5th
         }
         LINEARIZE_LOCK_OUTPUT -1
      }
      set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
      MOM_reload_variable mom_prev_rot_ang_4th
      MOM_reload_variable -a mom_pos
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

         global mom_kin_output_unit mom_part_unit
         if {$mom_kin_output_unit == $mom_part_unit} {
             set mom_sys_unit_conversion "1.0"
         } elseif {$mom_kin_output_unit == "IN"} {
             set mom_sys_unit_conversion [expr 1.0/25.4]
         } else {
             set mom_sys_unit_conversion 25.4
         }
 
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
            set mom_feed_rate [expr $mom_feed_retract_value*$mom_sys_unit_conversion]
            if [EQ_is_equal $mom_feed_rate 0.0] {set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]}
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
            set mom_feed_rate [expr $mom_feed_approach_value*$mom_sys_unit_conversion]
            if [EQ_is_equal $mom_feed_rate 0.0] {set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]}
            set dist [expr $dist-$mom_kin_reengage_distance]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            MOM_suppress once fourth_axis fifth_axis
            PB_CMD_linear_move
	     #
	     #  feed back to part at engage feed rate
	     #        
            MOM_suppress once fourth_axis fifth_axis
            if {$mom_feed_engage_value  > 0.0} {
               set mom_feed_rate [expr $mom_feed_engage_value*$mom_sys_unit_conversion]
            } elseif {$mom_feed_cut_value  > 0.0} {
               set mom_feed_rate [expr $mom_feed_cut_value*$mom_sys_unit_conversion]
            } else {
               set mom_feed_rate [expr 10.0*$mom_sys_unit_conversion]
            }
            VEC3_sub mom_pos mom_prev_pos del_pos
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $mom_kin_reengage_distance $mom_feed_rate]
            FEEDRATE_SET
            VMOV 3 mom_prev_pos mom_pos
            PB_CMD_linear_move

            VEC3_sub mom_pos save_pos del_pos
            set dist [VEC3_mag del_pos]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
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

            set mom_prev_pos(3) $mom_pos(3)
            set mom_prev_pos(4) $mom_pos(4)
            FEEDRATE_SET

            if {$retract == "yes"} {PB_CMD_retract_move}
           #
           # move to alternate rotary position
           #
            set mom_pos(3) $mom_prev_alt_pos(3)
            set mom_pos(4) $mom_prev_alt_pos(4)
            set mom_prev_rot_ang_4th $mom_out_angle_pos(0)
            set mom_prev_rot_ang_5th $mom_out_angle_pos(1)
            VMOV 3 mom_prev_pos mom_pos
            FEEDRATE_SET
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
            set mom_feed_rate [expr $mom_feed_approach_value*$mom_sys_unit_conversion]
            if [EQ_is_equal $mom_feed_rate 0.0] {set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]}
            set dist [expr $dist-$mom_kin_reengage_distance]
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
            FEEDRATE_SET
            PB_CMD_linear_move

	     #
	     #  feed back to part at engage feed rate
	     #        
            MOM_suppress once fourth_axis fifth_axis
            if {$mom_feed_engage_value  > 0.0} {
               set mom_feed_rate [expr $mom_feed_engage_value*$mom_sys_unit_conversion]
            } elseif {$mom_feed_cut_value  > 0.0} {
               set mom_feed_rate [expr $mom_feed_cut_value*$mom_sys_unit_conversion]
            } else {
               set mom_feed_rate [expr 10.0*$mom_sys_unit_conversion]
            }
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $mom_kin_reengage_distance $mom_feed_rate]
            VMOV 3 mom_prev_alt_pos mom_pos
            FEEDRATE_SET
            PB_CMD_linear_move

 
            VEC3_sub mom_pos save_pos del_pos
            set dist [VEC3_mag del_pos]
            if {$dist <= 0.0} {set dist $mom_kin_reengage_distance}
            set mom_feed_rate_number [SET_FEEDRATE_NUMBER $dist $mom_feed_rate]
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
   
         set mom_feed_rate $save_feedrate
         FEEDRATE_SET
      }
   }
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
      set angle [expr abs($angle)]
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
proc SET_FEEDRATE_NUMBER { dist feed } {
#=============================================================
global mom_sys_frn_factor
global mom_kin_max_frn

  if [EQ_is_zero $dist] {
      return $mom_kin_max_frn
  } else {
      set f [expr ($mom_sys_frn_factor*$feed) / $dist ]
      if [EQ_is_lt $f $mom_kin_max_frn] {
          return $f
      } else {
          return $mom_kin_max_frn
      }
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
proc UNLOCK_AXIS { locked_point unlocked_point } {
#=============================================================
  upvar $locked_point ip ; upvar $unlocked_point op 

  global mom_sys_4th_axis_index
  global mom_sys_5th_axis_index
  global mom_sys_lock_plane
  global mom_sys_linear_axis_index_1
  global mom_sys_linear_axis_index_2
  global mom_sys_rotary_axis_index
  global mom_kin_4th_axis_center_offset 
  global mom_kin_5th_axis_center_offset
  global DEG2RAD 
 

   if {[info exists mom_kin_4th_axis_center]} {
       VEC3_add ip mom_kin_4th_axis_center_offset temp
   } else {
       set temp(0) $ip(0)
       set temp(1) $ip(1)
       set temp(2) $ip(2)
   }
   if {[info exists mom_kin_5th_axis_center_offset]} {
      VEC3_add temp mom_kin_5th_axis_center_offset temp
   }

   set op(3) $ip(3)
   set op(4) $ip(4)

   set ang [expr $op($mom_sys_rotary_axis_index)*$DEG2RAD] 
   ROTATE_VECTOR $mom_sys_lock_plane $ang temp op

   set op($mom_sys_rotary_axis_index) 0.0

   if {[info exists mom_kin_4th_axis_center_offset]} {
      VEC3_sub op mom_kin_4th_axis_center_offset op
   }
   if [info exists mom_kin_5th_axis_center_offset] {
      VEC3_sub op mom_kin_5th_axis_center_offset op
   }
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




if [info exists mom_sys_start_of_program_flag] {
   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }
} else {
   set mom_sys_head_change_init_program 1
   set mom_sys_start_of_program_flag 1
}


