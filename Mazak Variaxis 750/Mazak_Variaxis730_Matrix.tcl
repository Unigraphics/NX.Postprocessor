########################## TCL Event Handlers ##########################
#
#  Mazak_Variaxis730_Matrix.tcl -
#
#  Created by MGordon  @  Mon Oct 27 07:59:49 2008 Pacific Daylight Time
#  with Post Builder version  5.0.3.
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
     set mom_sys_warning_output                    "OFF"
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "eia"
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
  set mom_sys_unit_code(IN)                     "20" 
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
  set mom_sys_feed_rate_mode_code(DPM)          "94" 
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
  set mom_sys_coolant_code(THRU)                "51" 
  set mom_sys_coolant_code(TAP)                 "8"  
  set mom_sys_coolant_code(OFF)                 "9"  
  set mom_sys_rewind_code                       "30" 
  set mom_sys_4th_axis_has_limits               "1"  
  set mom_sys_5th_axis_has_limits               "1"  
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
  set mom_sys_home_pos(0)                       "0"  
  set mom_sys_home_pos(1)                       "0"  
  set mom_sys_home_pos(2)                       "0"  
  set mom_sys_zero                              "0"  
  set mom_sys_opskip_block_leader               "/"  
  set mom_sys_seqnum_start                      "10" 
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
  set mom_sys_leader(fifth_axis)                "C"  
  set mom_sys_contour_feed_mode(LINEAR)         "IPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "IPM"
  set mom_sys_cycle_feed_mode                   "Auto"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"
  set mom_sys_vnc_rapid_dogleg                  "1"  
  set mom_sys_prev_mach_head                    ""   
  set mom_sys_curr_mach_head                    ""   
  set mom_sys_contour_feed_mode(ROTARY)         "DPM"
  set mom_sys_contour_feed_mode(LINEAR_ROTARY)  "FRN"
  set mom_sys_feed_param(DPM,format)            "Feed_DPM"
  set mom_sys_rapid_feed_mode(ROTARY)           "DPM"
  set mom_sys_rapid_feed_mode(LINEAR_ROTARY)    "IPM"
  set mom_sys_post_description                  ""
  set mom_sys_ugpadvkins_used                   "0"
  set mom_sys_post_builder_version              "5.0.3"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_ang_offset               "0.0"
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0"  
  set mom_kin_4th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_4th_axis_incr_switch              "OFF"
  set mom_kin_4th_axis_leader                   "A"  
  set mom_kin_4th_axis_limit_action             "Warning"
  set mom_kin_4th_axis_max_limit                "30" 
  set mom_kin_4th_axis_min_incr                 "0.001"
  set mom_kin_4th_axis_min_limit                "-120"
  set mom_kin_4th_axis_plane                    "YZ" 
  set mom_kin_4th_axis_point(0)                 "0.0"
  set mom_kin_4th_axis_point(1)                 "0.0"
  set mom_kin_4th_axis_point(2)                 "0"  
  set mom_kin_4th_axis_rotation                 "standard"
  set mom_kin_4th_axis_type                     "Table"
  set mom_kin_4th_axis_vector(0)                "1"  
  set mom_kin_4th_axis_vector(1)                "0"  
  set mom_kin_4th_axis_vector(2)                "0"  
  set mom_kin_4th_axis_zero                     "0.0"
  set mom_kin_5th_axis_ang_offset               "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0"  
  set mom_kin_5th_axis_direction                "MAGNITUDE_DETERMINES_DIRECTION"
  set mom_kin_5th_axis_incr_switch              "OFF"
  set mom_kin_5th_axis_leader                   "C"  
  set mom_kin_5th_axis_limit_action             "Warning"
  set mom_kin_5th_axis_max_limit                "9999"
  set mom_kin_5th_axis_min_incr                 "0.001"
  set mom_kin_5th_axis_min_limit                "-9999"
  set mom_kin_5th_axis_plane                    "XY" 
  set mom_kin_5th_axis_point(0)                 "0.0"
  set mom_kin_5th_axis_point(1)                 "0.0"
  set mom_kin_5th_axis_point(2)                 "0"  
  set mom_kin_5th_axis_rotation                 "standard"
  set mom_kin_5th_axis_type                     "Table"
  set mom_kin_5th_axis_vector(0)                "0"  
  set mom_kin_5th_axis_vector(1)                "0"  
  set mom_kin_5th_axis_vector(2)                "1"  
  set mom_kin_5th_axis_zero                     "0.0"
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XYZ"
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.001"
  set mom_kin_machine_resolution                ".0001"
  set mom_kin_machine_type                      "5_axis_dual_table"
  set mom_kin_machine_zero_offset(0)            "0.0"
  set mom_kin_machine_zero_offset(1)            "0.0"
  set mom_kin_machine_zero_offset(2)            "0"  
  set mom_kin_max_arc_radius                    "9999.9999"
  set mom_kin_max_dpm                           "9000"
  set mom_kin_max_fpm                           "600"
  set mom_kin_max_fpr                           "100"
  set mom_kin_max_frn                           "99999.999"
  set mom_kin_min_arc_length                    "0.0001"
  set mom_kin_min_arc_radius                    "0.0001"
  set mom_kin_min_dpm                           "0.0"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.01"
  set mom_kin_min_frn                           "0.001"
  set mom_kin_output_unit                       "IN" 
  set mom_kin_pivot_gauge_offset                "0"  
  set mom_kin_pivot_guage_offset                ""   
  set mom_kin_post_data_unit                    "IN" 
  set mom_kin_rapid_feed_rate                   "1575"
  set mom_kin_retract_distance                  "10" 
  set mom_kin_rotary_axis_method                "PREVIOUS"
  set mom_kin_spindle_axis(0)                   "0.0"
  set mom_kin_spindle_axis(1)                   "0.0"
  set mom_kin_spindle_axis(2)                   "1.0"
  set mom_kin_tool_change_time                  "1.2"
  set mom_kin_x_axis_limit                      "28.74"
  set mom_kin_y_axis_limit                      "33.460"
  set mom_kin_z_axis_limit                      "22.05"




if [llength [info commands MOM_SYS_do_template] ] {
   if [llength [info commands MOM_do_template] ] {
      rename MOM_do_template ""
   }
   rename MOM_SYS_do_template MOM_do_template
}


###################
# IS&V Enhancement
###################


if { ![info exists sim_mtd_initialized] } {
   set sim_mtd_initialized 0
}

set mom_sim_vnc_handler [file rootname [info script]]_vnc.tcl

set mom_sim_post_builder_vnc 1


#=============================================================
proc MOM_SIM_initialize_mtd {} {
#=============================================================
  global sim_mtd_initialized
  global mom_sim_vnc_msg_only


   if { ![info exists mom_sim_vnc_msg_only] || !$mom_sim_vnc_msg_only } {
     # Initialized to plugin mode to facilitate machine code simulation
      SIM_mtd_init NC_CONTROLLER_PLUGIN
   }

   uplevel #0 {
      source "$mom_sim_vnc_handler"
   }

   set sim_mtd_initialized 1
}


#++++++++++++++++++++++++++++++++++++++++++
# Source & initialize VNC for a child post
#++++++++++++++++++++++++++++++++++++++++++
if { $sim_mtd_initialized == 1 } {
  source "$mom_sim_vnc_handler"
  if [llength [info commands PB_VNC_init_sim_vars] ] {
    PB_VNC_init_sim_vars
  }
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


   # If this handler is executed, revPost is not runnning!
    global mom_sim_post_builder_rev_post
    set mom_sim_post_builder_rev_post 0


   # Assign primary channel
    global sim_mtd_initialized
    if { $sim_mtd_initialized == 1 } {
      global mom_sim_primary_channel mom_carrier_name
      if [info exists mom_carrier_name] {
        set mom_sim_primary_channel $mom_carrier_name
      }

      catch { SIM_mtd_init NC_CONTROLLER_MTD_EVENT_HANDLER }
    }



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

  global sim_mtd_initialized
  if { $sim_mtd_initialized == 1 } {
    global mom_sim_vnc_msg_only
    if { ![info exists mom_sim_vnc_msg_only] || !$mom_sim_vnc_msg_only } {
      global mom_sync_number
      if [info exists mom_sync_number] {
        if [llength [info commands PB_VNC_sync] ] {
          PB_VNC_sync
        }
        unset mom_sync_number
      }
    }
  }
}


#=============================================================
proc MOM_set_csys {} {
#=============================================================
  if [llength [info commands PB_CMD_kin_set_csys] ] {
    PB_CMD_kin_set_csys
  }

# Pass the CSYS information that will be used to
# set the ZCS coordinate system for simulation.
  global sim_mtd_initialized
  if $sim_mtd_initialized {
    if [llength [info commands PB_VNC_pass_csys_data] ] {
      global mom_sim_csys_set
      set mom_sim_csys_set 0

      PB_VNC_pass_csys_data

      set mom_sim_csys_set 1
    }
  }
}


#=============================================================
proc MOM_msys {} {
#=============================================================
# Pass the CSYS information, if a CSYS is not set, that will be
# used to set the ZCS coordinate system for simulation.
  global sim_mtd_initialized
  if $sim_mtd_initialized {
    if [llength [info commands PB_VNC_pass_msys_data] ] {
      PB_VNC_pass_msys_data
    }
  }
}


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   PB_CMD_nurbs_end_of_program
   MOM_do_template end_of_path
   MOM_force Once G_return G_mode Z
   MOM_do_template return_home
   MOM_do_template end_of_program_1
   MOM_do_template end_of_program
   MOM_set_seq_off
   MOM_do_template rewind_stop_code

#**** The following procedure lists the tool list with time in commentary data
   LIST_FILE_TRAILER

#**** The following procedure closes the warning and listing files
   CLOSE_files

  # End of simulation
   global sim_mtd_initialized
   if { $sim_mtd_initialized == 1 } {
      if [llength [info commands PB_VNC_end_of_program] ] {
         PB_VNC_end_of_program
      }
   }
}


  incr mom_sys_post_initialized


} ;# uplevel
#***********


 # Initialize simulation
  global sim_mtd_initialized
  if $sim_mtd_initialized {
    global mom_sim_program_has_started
    if { ![info exists mom_sim_program_has_started] } {

      set mom_sim_program_has_started 1

      if [llength [info commands PB_VNC_start_of_program] ] {
        PB_VNC_start_of_program
      }
    }
  }
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

   MOM_do_template cycle_bore_no_drag
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   CIRCLE_SET
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
   MOM_force Once M_coolant
   MOM_do_template coolant_on
}


#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
   CUTCOM_SET
   MOM_do_template cutcom_off
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
}


#=============================================================
proc MOM_cycle_off { } {
#=============================================================
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

   MOM_do_template cycle_drill_dwell
   set cycle_init_flag FALSE
}


#=============================================================
proc MOM_end_of_path { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_end_of_path] ] {
      PB_CMD_kin_end_of_path
   }

   global mom_sys_in_operation
   set mom_sys_in_operation 0

   global sim_mtd_initialized
   if { $sim_mtd_initialized == 1 } {
      if [llength [info commands PB_VNC_end_of_path] ] {
         PB_VNC_end_of_path
      }
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

   PB_CMD_force_FRN_F_code
   MOM_do_template linear_move
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
   set rapid_spindle_blk {G_adjust G_feed G_motion G_mode X Y Z H}
   set rapid_spindle_x_blk {G_adjust G_feed G_motion G_mode X H}
   set rapid_spindle_y_blk {G_adjust G_feed G_motion G_mode Y H}
   set rapid_spindle_z_blk {G_adjust G_feed G_motion G_mode Z H}
   set rapid_traverse_blk {G_feed G_motion G_mode G X Y Z fourth_axis fifth_axis S M_spindle}
   set rapid_traverse_xy_blk {G_feed G_motion G_mode G X Y fourth_axis fifth_axis S M_spindle}
   set rapid_traverse_yz_blk {G_feed G_motion G_mode G Y Z fourth_axis fifth_axis S M_spindle}
   set rapid_traverse_xz_blk {G_feed G_motion G_mode G X Z fourth_axis fifth_axis S M_spindle}
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
   PB_CMD_user_defined_text_commands

   global sim_mtd_initialized
   if { $sim_mtd_initialized == 1 } {
      if [llength [info commands PB_VNC_pass_spindle_data] ] {
         PB_VNC_pass_spindle_data
      }
      if [llength [info commands PB_VNC_start_of_path] ] {
         PB_VNC_start_of_path
      }
   }
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

  # Pass tool name to VNC for simulation.
   global sim_mtd_initialized
   if $sim_mtd_initialized {
      if [llength [info commands PB_VNC_pass_tool_data] ] {
         PB_VNC_pass_tool_data
      }
   }

   MOM_force Once G_mode G Z_zero
   MOM_do_template tool_change
   MOM_set_seq_on
   PB_CMD_operation_header_1
   PB_CMD_tool_change_force_addresses
   MOM_force Once T
   MOM_do_template tool_change_2
   MOM_set_seq_off
   MOM_force Once M
   MOM_do_template tool_change_1
   MOM_do_template tool_preselect
   MOM_force Once M_coolant
   MOM_do_template coolant_on
}


#=============================================================
proc PB_engage_move { } {
#=============================================================
   PB_CMD_init_helix
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
   PB_CMD_program_header
   PB_CMD_init_helix
   MOM_force Once G_cutcom G_plane G_feed G_mode
   MOM_do_template absolute_mode
}


#=============================================================
proc PB_CMD_FEEDRATE_NUMBER { } {
#=============================================================
#
#  This command allows you to modify the feed rate number
#  after it has been calculated by the system.
#
#
#  Import this command as needed.  It will be executed automatically.
#
#
   global mom_feed_rate_number

   set mom_sys_frn_factor 1.0

   if {[info exists mom_feed_rate_number]} {
      return [expr $mom_feed_rate_number * $mom_sys_frn_factor]
   } else {
      return 0.0
   }
}


#=============================================================
proc PB_CMD_automatic_retract { } {
#=============================================================
#
#  Calling PB_CMD_automatic_retract in the PB_CMD_before_motion
#  custom command will perform an automatic retract, tape break and re-engage
#  sequence when the maximum NC tape file length is reached.
#
#  The custom command PB_CMD_output_operation_tape may be used to output
#  a new tape for each operation.  Place it at the VERY top of the
#  "Start of Path" event marker.
#
#  The custom command PB_CMD_operation_header may be used to output a header
#  for the new tape.  Place it immediately after the PB_CMD_output_operation
#  custom command.
#
#  The custom command PB_CMD_operation_end may be used to output the end of tape
#  code and reset 
#

   global tape_bytes
   global mom_sys_max_tape_bytes
   global mom_sys_min_tape_bytes
   global mom_sys_automatic_retract_distance
   global mom_sys_automatic_reengage_distance
   global mom_sys_automatic_reengage_feedrate
   global mom_pos
   global mom_prev_pos
   global mom_prev_tool_axis
   global mom_operation_name
   global mom_motion_event
   global feed
   global operation_sequence
   global mom_kin_4th_axis_type
   global mom_sys_tool_change_motion_types
   global mom_motion_type


   set ix [lsearch -exact $mom_sys_tool_change_motion_types $mom_motion_type]
   if {$mom_sys_max_tape_bytes < $tape_bytes  || ($ix < 0 && $mom_sys_min_tape_bytes < $tape_bytes)} {

      MOM_output_literal "G40"
      MOM_output_literal "M00"

      if {[info exists mom_kin_4th_axis_type] && $mom_kin_4th_axis_type == "Table"} {
         set vec(0) 0.0
         set vec(1) 0.0
         set vec(2) 1.0
      } else {
         set vec(0) $mom_prev_tool_axis(0)
         set vec(1) $mom_prev_tool_axis(1)
         set vec(2) $mom_prev_tool_axis(2)
      }

      for {set i 0} {$i < 3} {incr i} {
         set sav_pos($i) $mom_pos($i)
         set mom_pos($i) [expr $mom_prev_pos($i) + $mom_sys_automatic_retract_distance*$vec($i)]
      }

      MOM_rapid_move

      MOM_force once M
      MOM_do_template end_of_program

      incr operation_sequence 

      PB_CMD_output_operation_tape
      PB_CMD_operation_header

    #
    # The following commands will force out all active data.  Add or remove 
    # words that are not applicable
    #

    # coordinate data
      MOM_force once X Y Z 

    # g code
      MOM_force once G_motion 

    # feedrate 
      MOM_force once F 

    # spindle and coolant
      MOM_force once S M_spindle M_coolant

      set save_event $mom_motion_event
      set mom_motion_event "first_move"
      MOM_rapid_move
      set mom_motion_event $save_event

      for {set i 0} {$i < 3} {incr i} {
         set mom_pos($i) [expr $mom_prev_pos($i) + $mom_sys_automatic_reengage_distance*$mom_prev_tool_axis($i)]
      }

      MOM_rapid_move

      for {set i 0} {$i < 3} {incr i} {
         set mom_pos($i) $mom_prev_pos($i)
      }

      set save_feed $feed
      set feed $mom_sys_automatic_reengage_feedrate
      MOM_force once G_cutcom

      MOM_linear_move

      set feed $save_feed

      for {set i 0} {$i < 3} {incr i} {
         set mom_pos($i) $sav_pos($i)
      }
   }
}


#=============================================================
proc PB_CMD_before_motion { } {
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
  MOM_output_literal "M44"
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
  MOM_output_literal "M47"
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
proc PB_CMD_force_FRN_F_code { } {
#=============================================================
#
#  This command can be used to force out F codes for FRN mode.
#  All F codes output with IPM or MMPM will still be  modal.
#
#
#  Import this command and place it at the start of your Linear Move
#  event.
#
#
   global feed_mode

   if {$feed_mode == "FRN" || $feed_mode == "INVERSE"} {MOM_force once F}
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

set mom_sys_helix_pitch_type	"rise_radian"  

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
      if {$mom_sys_cir_vector == "Vector - Arc Center to Start"} {
         set mom_prev_pos($cir_index) 0.0
         set mom_pos_arc_center($cir_index) $pitch
      } elseif {$mom_sys_cir_vector == "Vector - Arc Start to Center"} {
         set mom_prev_pos($cir_index) $pitch
         set mom_pos_arc_center($cir_index) 0.0
      } elseif {$mom_sys_cir_vector == "Unsigned Vector - Arc Center to Start"} {
         set mom_prev_pos($cir_index) 0.0
         set mom_pos_arc_center($cir_index) $pitch
      } elseif {$mom_sys_cir_vector == "Absolute Arc Center"} {
         set mom_pos_arc_center($cir_index) $pitch
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
proc PB_CMD_init_rotary { } {
#=============================================================
uplevel #0 {

#
# Fourth and Fifth Axis Auto Clamping is activated by programming the
# UDE CLAMP/AUTO,ON in your tool path.  Fourth and Fifth Axis Auto
# Clamping may be turned off by programming the UDE CLAMP/AUTO,OFF.
#
# An M10 will be output to clamp the XYZ axis for fourth axis 
# motion. An M11 will be output to un-clamp the fourth axis 
# when fourth axis motion occurs in the block.  You may edit 
# the custom commands PB_CMD_clamp_fourth_axis or 
# PB_CMD_unclamp_fourth_axis to output codes other than M10 or M11.
# The same is true for the fifth axis except you must edit the custom
# commands PB_CMD_clamp_fifth_axis or PB_CMD_unclamp_fifth_axis.  If you
# have a five axis machine tool and only want fourth or fifth axis auto
# clamping, you will need to comment out the line that outputs the unneed
# code
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
proc PB_CMD_init_tape_break { } {
#=============================================================
#
#  This procedure will be executed automatically at the start of program and
#  anytime it is loaded as a slave post of a linked post.
#
#  This procedure will perform an automatic retract, tape break and re-engage
#  sequence when the maximum nc tape file length is reached.  
#
#  There are four procedures that can be placed with event markers
#  to check for tape footage and output the needed codes.
#
#  Add the following line of code (without the #) to the PB_CMD_before_motion 
#  custom command.
#PB_CMD_automatic_retract
#
#  The custom command PB_CMD_output_operation_tape may also be used to output
#  a new tape for each operation.  Place that custom command at the VERY top
#  of the start of operation event marker.
#
#  The custom command PB_CMD_operation_header may be used to output a header
#  for the new tape.  Place it immediately after the PB_CMD_output_operation
#  custom command.
#
   global mom_sys_max_tape_bytes
   global mom_sys_min_tape_bytes
   global mom_sys_automatic_retract_distance
   global mom_sys_automatic_reengage_distance
   global mom_sys_automatic_reengage_feedrate
   global operation_sequence
   global mom_kin_4th_axis_type
   global mom_sys_cut_motion_types
   global mom_sys_tool_change_motion_types

#
#  These variables may be used to control the size of the nc file.  The post
#  will start checking for an appropriate motion type when the minimum 
#  tape bytes is reached.  If an appropriate motion type has not been 
#  encountered by the time the maximum tape bytes is reached, a tape break
#  will occur regardless of the motion type. 1 KB is approximately 1000 bytes.
#
   set mom_sys_max_tape_bytes	 		100000
   set mom_sys_min_tape_bytes	 		 90000

#
#  This variable is used to control the delta move along the tool axis when 
#  breaking the tape.
#
   set mom_sys_automatic_retract_distance 	100.0

#
#  This variable is used to define how close the reengage distance gets to 
#  the previous point.
#
   set mom_sys_automatic_reengage_distance 	10

#
#  This variable defines the feedrate used to reengage to the previous point.
#  It is assumed to be in IPM or MMPM.
#
   set mom_sys_automatic_reengage_feedrate 	100.0

#
#  This list contains the cut types that will NOT be used for automatic retract
#  and tape break.  If you know that your stepovers will be off the part, you
#  may want to remove STEPOVER from this list.
#
   set mom_sys_tool_change_motion_types   	{CUT FIRSTCUT STEPOVER CYCLE} 

   set operation_sequence 1
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

   if { [info exists mom_kin_machine_type] } {
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
   if { [llength [info commands PB_CMD_set_oper_tool_time] ] } {
      PB_CMD_set_oper_tool_time
   }

  # Clear tool holder angle used in operation
   global mom_use_b_axis
   UNSET_VARS mom_use_b_axis
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
      if { [info exists mom_sys_cycle_feed_mode] } {
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
  if { [info exists mom_sys_feed_param(${feed_mode},format)] } {
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
  if { [llength [info commands "PB_CMD_FEEDRATE_SET"]] } {
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
   if { ![info exists mom_new_iks_exists] } {
      set ugii_version [string trim [MOM_ask_env_var UGII_VERSION]]
      if { ![string match "v3" $ugii_version] } {

         if { [llength [info commands PB_CMD_revert_dual_head_kin_vars] ] } {
            PB_CMD_revert_dual_head_kin_vars
         }
return
      }
   }

  # Initialize new IKS parameters.
   if { [llength [info commands PB_init_new_iks] ] } {
      PB_init_new_iks
   }

  # Users can provide next command to modify or disable new IKS options.
   if { [llength [info commands PB_CMD_revise_new_iks] ] } {
      PB_CMD_revise_new_iks
   }

  # Revert legacy dual-head kinematic parameters when new IKS is disabled.
   global mom_kin_iks_usage
   if { $mom_kin_iks_usage == 0 } {
      if { [llength [info commands PB_CMD_revert_dual_head_kin_vars] ] } {
         PB_CMD_revert_dual_head_kin_vars
      }
   }
}


#=============================================================
proc PB_CMD_kin_init_probing_cycles { } {
#=============================================================
   set cmd PB_CMD_init_probing_cycles
   if { [llength [info commands "$cmd"]] } {
      eval $cmd
   }
}


#=============================================================
proc PB_CMD_kin_init_rotary { } {
#=============================================================

   global mom_kin_machine_type

   if { [info exists mom_kin_machine_type] } {
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
      if { [info exists mom_sys_4th_axis_dir_mode] } {
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
      if { [info exists mom_sys_5th_axis_dir_mode] } {
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
      if { [info exists mom_kin_5th_axis_direction] } {
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
     if { [info exists mom_lintol] } {set mom_kin_linearization_tol $mom_lintol}
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
   if { [llength [info commands PB_CMD_set_csys] ] } {
      PB_CMD_set_csys
   }

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # Incase Axis Rotation has been set to "reverse"
   if { [llength [info commands PB_CMD_reverse_rotation_vector] ] } {
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

   if { [info exists mom_sys_head_change_init_program] } {

      PB_CMD_kin_start_of_program
      unset mom_sys_head_change_init_program


     #<06-17-03 gsl> Moved from MOM_head to
     # execute start of head callback in new post's context.
      global CURRENT_HEAD
      if { [info exists CURRENT_HEAD] &&  [llength [info commands PB_start_of_HEAD__$CURRENT_HEAD]] } {
         PB_start_of_HEAD__$CURRENT_HEAD
      }

      # Restore master start & end of program handlers
      if { [llength [info commands "MOM_start_of_program_save"]] } {
         if { [llength [info commands "MOM_start_of_program"]] } {
            rename MOM_start_of_program ""
         }
         rename MOM_start_of_program_save MOM_start_of_program 
      }
      if { [llength [info commands "MOM_end_of_program_save"]] } {
         if { [llength [info commands "MOM_end_of_program"]] } {
            rename MOM_end_of_program ""
         }
         rename MOM_end_of_program_save MOM_end_of_program 
      }

     # Restore master head change event handler
      if { [llength [info commands "MOM_head_save"]] } {
         if { [llength [info commands "MOM_head"]] } {
            rename MOM_head ""
         }
         rename MOM_head_save MOM_head
      }
   }

  # Overload IKS params from machine model.
   PB_CMD_reload_iks_parameters

  # Incase Axis Rotation has been set to "reverse"
   if { [llength [info commands PB_CMD_reverse_rotation_vector] ] } {
      PB_CMD_reverse_rotation_vector
   }

  # Initialize tool time accumulator for this operation.
   if { [llength [info commands PB_CMD_init_oper_tool_time] ] } {
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

   if { [info exists mom_kin_machine_type] } {
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

   lappend command_list  PB_CMD_kin_init_probing_cycles


   if { [info exists mom_kin_machine_type] } {
      if { [string match "*3_axis_mill_turn*" $mom_kin_machine_type] } {

          lappend command_list  PB_CMD_kin_init_mill_xzc
          lappend command_list  PB_CMD_kin_mill_xzc_init
          lappend command_list  PB_CMD_kin_init_mill_turn
          lappend command_list  PB_CMD_kin_mill_turn_initialize
      }
   }


   foreach cmd $command_list {

      if { [llength [info commands "$cmd"]] } {

         # <PB v2.0.2>
         # Old init commands for XZC/MILL_TURN posts are not executed.
         # Parameters set by these commands in the v2.0 legacy posts
         # will need to be transfered to PB_CMD_init_mill_xzc &
         # PB_CMD_init_mill_turn commands respectively.

         switch $cmd {
            "PB_CMD_kin_mill_xzc_init" -
            "PB_CMD_kin_mill_turn_initialize" {}
            default { eval $cmd }
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
proc PB_CMD_operation_end { } {
#=============================================================
#
#  This procedure is used to output the end of program info when each
#  operation has a separate tape.
#

   global operation_sequence

   set operation_sequence 1

   MOM_force once M
   MOM_do_template end_of_program
}


#=============================================================
proc PB_CMD_operation_header { } {
#=============================================================
#
#  This procedure will output a header for each operation.  Place this custom 
#  command at the start of operation event marker. 
# 

   global operation_sequence
   global mom_tool_number
   global mom_tool_diameter
   global mom_tool_corner1_radius 
   global mom_sys_control_out mom_sys_control_in
   global mom_seqnum
   global mom_pos
   global mom_feed_rate
   global mom_spindle_rpm

   set str [format "SEQ= %d  TOOL NUMBER = %d  CUTTER DIAMETER = %.2f" $operation_sequence $mom_tool_number $mom_tool_diameter]
   MOM_output_literal "$mom_sys_control_out$str$mom_sys_control_in"

   set seqstr ""
   if {$mom_seqnum < 9998} {set seqstr "0${seqstr}"}
   if {$mom_seqnum < 998} {set seqstr "0${seqstr}"}
   if {$mom_seqnum < 98} {set seqstr "0${seqstr}"}
   if {$mom_seqnum < 8} {set seqstr "0${seqstr}"}

   set str [format "START= N%s%.0f  X= %.3f  Y= %.3f  Z= %.3f" $seqstr [expr $mom_seqnum+2] $mom_pos(0) $mom_pos(1) $mom_pos(2)]   
   MOM_output_literal "$mom_sys_control_out$str$mom_sys_control_in"
   set str [format "STEP=  CORNER RADIUS= %.4f  FEED= %.2f  RPM= %.0f" $mom_tool_corner1_radius $mom_feed_rate $mom_spindle_rpm]
   MOM_output_literal "$mom_sys_control_out$str$mom_sys_control_in"
}


#=============================================================
proc PB_CMD_operation_header_1 { } {
#=============================================================
#
#  This procedure will output a header for each operation.  Place this custom 
#  command at the start of operation event marker. 
# 

   global operation_sequence
   global mom_tool_number
   global mom_tool_diameter
   global mom_tool_corner1_radius 
   global mom_sys_control_out mom_sys_control_in
   global mom_seqnum
   global mom_pos
   global mom_feed_rate
   global mom_spindle_rpm

   set str [format "SEQ= %d  TOOL NUMBER = %d  CUTTER DIAMETER = %.2f" $operation_sequence $mom_tool_number $mom_tool_diameter]
   MOM_output_literal "$mom_sys_control_out$str$mom_sys_control_in"

   set seqstr ""
   if {$mom_seqnum < 9998} {set seqstr "0${seqstr}"}
   if {$mom_seqnum < 998} {set seqstr "0${seqstr}"}
   if {$mom_seqnum < 98} {set seqstr "0${seqstr}"}
   if {$mom_seqnum < 8} {set seqstr "0${seqstr}"}

   set str [format "START= N%s%.0f  X= %.3f  Y= %.3f  Z= %.3f" $seqstr [expr $mom_seqnum+2] $mom_pos(0) $mom_pos(1) $mom_pos(2)]   
   MOM_output_literal "$mom_sys_control_out$str$mom_sys_control_in"
   set str [format "STEP=  CORNER RADIUS= %4.3f  FEED= %.4f  RPM= %.0f" $mom_tool_corner1_radius $mom_feed_rate $mom_spindle_rpm]
   MOM_output_literal "$mom_sys_control_out$str$mom_sys_control_in"
}


#=============================================================
proc PB_CMD_output_operation_tape { } {
#=============================================================
#
#  This procedure can be used to output an N/C tape with each operation.
#  Place this custom command at the VERY begining of the Start of Operation
#  event marker.
#
#  This proc will also delete the initial program tape and rename it to 
#  {operation_name}{sequence number}{extension}.
#  Any N/C code output with the Program Start sequence will be lost.
#  
   global ptp_file_name
   global mom_output_file_directory
   global mom_operation_name
   global mom_output_file_basename
   global output_extn
   global tape_bytes
   global operation_sequence
   global mom_sys_output_file_suffix

#
#  Remove the next two lines of code if you don't want the original nc tape
#  and the start of program output to be deleted.
#
   set fn ${mom_output_file_directory}${mom_output_file_basename}${output_extn}
   if { [file exists $fn] == "1" } { MOM_remove_file $fn }

   MOM_close_output_file $ptp_file_name

   set op_seq_leader ""
   if {$operation_sequence < 10} {set op_seq_leader "0"}

   set ptp_file_name "${mom_output_file_directory}${mom_operation_name}${op_seq_leader}${operation_sequence}.${mom_sys_output_file_suffix}"
   MOM_remove_file $ptp_file_name
   MOM_open_output_file $ptp_file_name

   set tape_bytes 0
}


#=============================================================
proc PB_CMD_pause { } {
#=============================================================
# This command enables you to pause the UG/Post processing.
#
  PAUSE
}


#=============================================================
proc PB_CMD_program_header { } {
#=============================================================
#
#  This procedure will output a program header with the following format:
#
#       Attribute assigned to program (Name of program group)
#
#       Example: O0001 (NC_PROGRAM)
#
#
#  Place this custom command in the start of program event marker.  This 
#  custom command must be placed after any initial codes (such as #).  The
#  custom command MOM_set_seq_off must precede this custom command to 
#  prevent sequence numbers from being output with the program number.
#
#  If you are adding this custom command to a linked post, this custom
#  command must be added to the main post only.  It will not be output by
#  any subordinate posts.
#
#  If there is no attribute assigned to the program group, the string O0001 
#  will be used.  In any case the name of the program in Program View will
#  be output as a comment.
#
#  To assign an attribute to the program, right click on the program.  Under
#  properties, select attribute.  Use the string "program_number" as the 
#  title of the attribute.  Enter the string you need for the program
#  name, O0010 for example, as the value of the attribute.  Use type string for the
#  the attribute.  Each program group can have a unique program number.
#


global mom_attr_PROGRAMVIEW_PROGRAM_NUMBER
global mom_group_name

if {![info exists mom_group_name]} {set mom_group_name ""}
if {![info exists mom_attr_PROGRAMVIEW_PROGRAM_NUMBER]} {set mom_attr_PROGRAMVIEW_PROGRAM_NUMBER "O0001"}
MOM_output_literal "$mom_attr_PROGRAMVIEW_PROGRAM_NUMBER ($mom_group_name)"
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

  foreach var $var_list {
    # Global declaration
    if [string match "center_offset*" $var] {
      global mom_kin_4th_axis_center_offset mom_kin_5th_axis_center_offset 
    } else {
      global mom_kin_4th_axis_[set var] mom_kin_5th_axis_[set var] 
    }

    # Swap values
    set kin_var mom_kin_4th_axis_[set var]
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
proc PB_CMD_spindle_rpm_check { } {
#=============================================================
#
# This procedure will verify that the speficied RPM falls
# within the limits defined for that spindle range. 
#
# This procedure should be placed in an event marker after
# the range has been determined and before the spindle code
# is output.
#

   global mom_sys_spindle_param
   global mom_spindle_mode 
   global mom_spindle_rpm 
   global mom_spindle_speed 
   global mom_spindle_range 
   global mom_warning_info

   if {![info exist mom_sys_spindle_param]} { return }
   if {![info exist mom_spindle_range]} { return }

   if {[info exist mom_spindle_rpm] && $mom_spindle_rpm > 0.0} {
       set speed $mom_spindle_rpm
   } else {
       set speed $mom_spindle_speed
   }  

   if {$speed < $mom_sys_spindle_param($mom_spindle_range,min)} {
       set mom_warning_info "Spindle RPM less than minimum"
       MOM_catch_warning
   } elseif {$speed > $mom_sys_spindle_param($mom_spindle_range,max)} {
       set mom_warning_info "Spindle RPM greater than maximum"
       MOM_catch_warning
   }
}


#=============================================================
proc PB_CMD_spindle_rpm_range_select { } {
#=============================================================
#
# This procedure will output RPM mode only.  use this in mill posts. 
#  
# This procedure will select the appropriate spindle range based 
# on the spindle table provided in post builder.  This procedure 
# will generate the mom variable mom_spindle_range which is
# used in the WORD M_range.  The user must define the code for the 
# mom_variable mom_sys_spindle_range_code($mom_range_code).  By 
# default this is an m code.  You can change it to any code desired 
# by making the M_range leader blank, the format string and the 
# code any text needed.
#
# You must place the word M_range in the appropriate block template.
# You must place this custom command in a block before you output
# the spindle range code.
#
# Any unused ranges must contain min 0 and max 0.  Posts created before
# PB v2.0.1 may have a min 1 and max 9999.  These posts will not
# correctly check for min and max rpm.
#

   global mom_sys_spindle_param
   global mom_spindle_rpm 
   global mom_spindle_speed 
   global mom_spindle_range 


   if {![info exist mom_sys_spindle_param]} {
      set mom_spindle_range 1
      return
   }

   if { [info exist mom_spindle_rpm] && $mom_spindle_rpm > 0.0 } {
      set speed $mom_spindle_rpm
   } else {
      set speed $mom_spindle_speed
   }  


   for {set i 1} {$i < 10} {incr i} {
      if { $mom_sys_spindle_param($i,min) == 0 && $mom_sys_spindle_param($i,max) == 0 } {
         set mom_spindle_range 1
         PB_CMD_spindle_rpm_check    
         return
      }
      if {$speed > $mom_sys_spindle_param($i,min) && $speed <= $mom_sys_spindle_param($i,max) } {
         set mom_spindle_range $i
         return
      }
   }

   set mom_spindle_range 1
   PB_CMD_spindle_rpm_check
}


#=============================================================
proc PB_CMD_spindle_sfm_range_select { } {
#=============================================================
#
# This procedure will output RPM or SFM.  Use this lathe posts. 
#
# This procedure will select the appropriate spindle range based 
# on the spindle table provided in post builder.  This procedure 
# will generate the mom variable mom_spindle_range which is
# used in the WORD M_range.  The user must define the code for the 
# mom_variable mom_sys_spindle_range_code($mom_range_code).  By 
# default this is an m code.  You can change it to any code desired 
# by making the M_range leader blank, the format string and the 
# code any text needed.
#
# You must place the word M_range in the appropriate block template.
# You must place this custom command in a block before you output
# the spindle range code.
#

   global mom_sys_spindle_range_code mom_sys_spindle_param
   global mom_spindle_mode mom_spindle_rpm mom_spindle_sfm mom_spindle_speed 
   global mom_spindle_range mom_number_of_ranges

   if {![info exist mom_sys_spindle_param]} {
      set mom_spindle_range 1
      return
   }

   if {$mom_spindle_mode == "RPM"} {
      if {[info exist mom_spindle_rpm]} {
         set speed $mom_spindle_rpm
      } else {
         set speed $mom_spindle_speed
      }  
   } elseif {$mom_spindle_mode == "SFM" || $mom_spindle_mode == "SMM"} {
      if {[info exist mom_spindle_sfm]} {
         set speed $mom_spindle_sfm
      } else {
         set speed $mom_spindle_speed
      }  
   }


   if {![info exist mom_number_of_ranges]} {
      set mom_number_of_ranges 9
   }

   for {set i 1} {$i <= $mom_number_of_ranges} {incr i} {
      if {$speed > $mom_sys_spindle_param($i,min) && $speed <= $mom_sys_spindle_param($i,max) } {
         set mom_spindle_range $i
         return
      }
   }
   set mom_spindle_range 1
}


#=============================================================
proc PB_CMD_spindle_table { } {
#=============================================================
#
#  This procedure should be placed in an event marker before you output your spindle code.  
#  If you output your spindle code with motion, you can place this custom command in the 
#  initial move event marker.
#
#  This procedure will return the scode nearest to your specified rpm.  You can modify
#  this table as needed.  You may add, delete or modify  rpm and scodes as needed.  
#  The rpm values must increase.  For instance,  rpm(2) must be larger that rpm(1).
#  Spindle range LOW will use spindle range, spindle range MEDIUM will use
#  spindle range 2 and spindle range HIGH will use spindle range 3  The variable
#  range_table_max_index  must set the number of entries in the table for that
#  range.
#
#  The default is for nine ranges and nine s codes per range.
#

   global mom_spindle_range  mom_spindle_speed mom_warning_info


   if {![info exist mom_spindle_range] } {set mom_spindle_range 1}
   if {$mom_spindle_range < 1} {set mom_spindle_range 1}

   if {$mom_spindle_range == 1 || $mom_spindle_range == "LOW"} {

#
# Spindle Range 1
#
      set rpm(0)         100    ; set scode(0)  1
      set rpm(1)         200    ; set scode(1)  2
      set rpm(2)         300    ; set scode(2)  3
      set rpm(3)         400    ; set scode(3)  4
      set rpm(4)         500    ; set scode(4)  5
      set rpm(5)         600    ; set scode(5)  6
      set rpm(6)         700    ; set scode(6)  7
      set rpm(7)         800    ; set scode(7)  8
      set rpm(8)         900    ; set scode(8)  9
      set rpm(9)        1000    ; set scode(9)  10
      set range_table_max_index 9

   } elseif {$mom_spindle_range == 2 || $mom_spindle_range == "MEDIUM"} { 
#
# Spindle Range 2
#
      set rpm(0)        1100    ; set scode(0)  11
      set rpm(1)        1200    ; set scode(1)  12
      set rpm(2)        1300    ; set scode(2)  13
      set rpm(3)        1400    ; set scode(3)  14
      set rpm(4)        1500    ; set scode(4)  15
      set rpm(5)        1600    ; set scode(5)  16
      set rpm(6)        1700    ; set scode(6)  17
      set rpm(7)        1800    ; set scode(7)  18
      set rpm(8)        1900    ; set scode(8)  19
      set rpm(9)        2000    ; set scode(9)  20
      set range_table_max_index 9

   } elseif {$mom_spindle_range == 3 || $mom_spindle_range == "HIGH"} { 
#
# Spindle Range 3
#
      set rpm(0)        2100    ; set scode(0)  21
      set rpm(1)        2200    ; set scode(1)  22
      set rpm(2)        2300    ; set scode(2)  23
      set rpm(3)        2400    ; set scode(3)  24
      set rpm(4)        2500    ; set scode(4)  25
      set rpm(5)        2600    ; set scode(5)  26
      set rpm(6)        2700    ; set scode(6)  27
      set rpm(7)        2800    ; set scode(7)  28
      set rpm(8)        2900    ; set scode(8)  29
      set rpm(9)        3000    ; set scode(9)  30
      set range_table_max_index 9

   } elseif {$mom_spindle_range == 4} {
#
# Spindle Range 4
#
      set rpm(0)        3100    ; set scode(0)  31
      set rpm(1)        3200    ; set scode(1)  32
      set rpm(2)        3300    ; set scode(2)  33
      set rpm(3)        3400    ; set scode(3)  34
      set rpm(4)        3500    ; set scode(4)  35
      set rpm(5)        3600    ; set scode(5)  36
      set rpm(6)        3700    ; set scode(6)  37
      set rpm(7)        3800    ; set scode(7)  38
      set rpm(8)        3900    ; set scode(8)  39
      set rpm(9)        4000    ; set scode(9)  40
      set range_table_max_index 9
  
   } elseif {$mom_spindle_range == 5} {
#
# Spindle Range 5
#
      set rpm(0)        4100    ; set scode(0)  41
      set rpm(1)        4200    ; set scode(1)  42
      set rpm(2)        4300    ; set scode(2)  43
      set rpm(3)        4400    ; set scode(3)  44
      set rpm(4)        4500    ; set scode(4)  45
      set rpm(5)        4600    ; set scode(5)  46
      set rpm(6)        4700    ; set scode(6)  47
      set rpm(7)        4800    ; set scode(7)  48
      set rpm(8)        4900    ; set scode(8)  49
      set rpm(9)        5000    ; set scode(9)  50
      set range_table_max_index 9

   } elseif {$mom_spindle_range == 6} {
#
# Spindle Range 6
#
      set rpm(0)        5100    ; set scode(0)  51
      set rpm(1)        5200    ; set scode(1)  52
      set rpm(2)        5300    ; set scode(2)  53
      set rpm(3)        5400    ; set scode(3)  54
      set rpm(4)        5500    ; set scode(4)  55
      set rpm(5)        5600    ; set scode(5)  56
      set rpm(6)        5700    ; set scode(6)  57
      set rpm(7)        5800    ; set scode(7)  58
      set rpm(8)        5900    ; set scode(8)  59
      set rpm(9)        6000    ; set scode(9)  60
      set range_table_max_index 9
 
   } elseif {$mom_spindle_range == 7} {
#
# Spindle Range 7
#
      set rpm(0)        6100    ; set scode(0)  61
      set rpm(1)        6200    ; set scode(1)  62
      set rpm(2)        6300    ; set scode(2)  63
      set rpm(3)        6400    ; set scode(3)  64
      set rpm(4)        6500    ; set scode(4)  65
      set rpm(5)        6600    ; set scode(5)  66
      set rpm(6)        6700    ; set scode(6)  67
      set rpm(7)        6800    ; set scode(7)  68
      set rpm(8)        6900    ; set scode(8)  69
      set rpm(9)        7000    ; set scode(9)  70
      set range_table_max_index 9
 
   } elseif {$mom_spindle_range == 8} {
#
# Spindle Range 8
#
      set rpm(0)        7100    ; set scode(0)  71
      set rpm(1)        7200    ; set scode(1)  72
      set rpm(2)        7300    ; set scode(2)  73
      set rpm(3)        7400    ; set scode(3)  74
      set rpm(4)        7500    ; set scode(4)  75
      set rpm(5)        7600    ; set scode(5)  76
      set rpm(6)        7700    ; set scode(6)  77
      set rpm(7)        7800    ; set scode(7)  78
      set rpm(8)        7900    ; set scode(8)  79
      set rpm(9)        8000    ; set scode(9)  80
      set range_table_max_index 9
 
   } elseif {$mom_spindle_range == 9} {
#
# Spindle Range 9
#
      set rpm(0)        8100    ; set scode(0)  81
      set rpm(1)        8200    ; set scode(1)  82
      set rpm(2)        8300    ; set scode(2)  83
      set rpm(3)        8400    ; set scode(3)  84
      set rpm(4)        8500    ; set scode(4)  85
      set rpm(5)        8600    ; set scode(5)  86
      set rpm(6)        8700    ; set scode(6)  87
      set rpm(7)        8800    ; set scode(7)  88
      set rpm(8)        8900    ; set scode(8)  89
      set rpm(9)        9000    ; set scode(9)  90
      set range_table_max_index 9
  
   } elseif {$mom_spindle_range == 10} {
#
# Spindle Range 10
#
      set rpm(0)        9100    ; set scode(0)  91
      set rpm(1)        9200    ; set scode(1)  92
      set rpm(2)        9300    ; set scode(2)  93
      set rpm(3)        9400    ; set scode(3)  94
      set rpm(4)        9500    ; set scode(4)  95
      set rpm(5)        9600    ; set scode(5)  96
      set rpm(6)        9700    ; set scode(6)  97
      set rpm(7)        9800    ; set scode(7)  98
      set rpm(8)        9900    ; set scode(8)  99
      set rpm(9)        10000   ; set scode(9)  100
      set range_table_max_index 9
 
   }


   set s_code $scode(0)

   if {$mom_spindle_speed  <  $rpm(0)} {
      set mom_warning_info "spindle speed under minimum, assumed minimum"
      MOM_catch_warning

   } elseif {$mom_spindle_speed  >  $rpm($range_table_max_index)} {
      set mom_warning_info "spindle speed over maximum, assumed maximum"
      MOM_catch_warning
      set s_code $scode($range_table_max_index)

   } else {
      for {set i 1} {$i  <=  $range_table_max_index} {incr i} {
         set max [expr ($rpm($i) +  $rpm([expr $i-1])) / 2.0]
         if {$mom_spindle_speed <=  $max} {
            set s_code $scode([expr $i-1])
            break
         }
      }
   }


   global mom_spindle_speed

   set mom_spindle_speed $s_code
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
  MOM_force once M_spindle S X Y Z F R fourth_axis fifth_axis
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  MOM_force once G_adjust H S
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
  MOM_output_literal "M46"
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
  MOM_output_literal "M43"
}


#=============================================================
proc PB_CMD_user_defined_text_commands { } {
#=============================================================
#
# This custom command will add the handling of OPSKIP, OPSTOP and STOP
# when programmed as uder defined text.  Place this command in the start 
# of operation event marker.
#
  uplevel #0 {
  
    proc  MOM_text {} {
    #_______________________________________________________________________________
    # This procedure is executed when the Text command is activated.
    #_______________________________________________________________________________
      global mom_user_defined_text mom_record_fields
      global mom_sys_control_out mom_sys_control_in
      global mom_record_text mom_pprint set mom_Instruction mom_operator_message
      global mom_pprint_defined mom_operator_message_defined
  
      switch $mom_record_fields(0) {
      "PPRINT" 
           {
             set mom_pprint_defined 1
             set mom_pprint $mom_record_text
             MOM_pprint
           }
      "INSERT"
           {
             set mom_Instruction $mom_record_text
             MOM_insert
           }
      "DISPLY"
           {
             set mom_operator_message_defined 1
             set mom_operator_message $mom_record_text
             MOM_operator_message
           } 
      "OPSKIP"
           {
             if {$mom_record_fields(1) == "ON"} {MOM_opskip_on}
             if {$mom_record_fields(1) == "OFF"} {MOM_opskip_off}
           }
      "OPSTOP"
           {
             MOM_opstop
           }
      "STOP"
           {
             MOM_stop
           }
      default
           {
             if {[info exists mom_user_defined_text]} {
               MOM_output_literal "${mom_sys_control_out}${mom_user_defined_text}${mom_sys_control_in}"
             }
           }
    }
  }
}
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

   if { [EQ_is_zero $y] } { set y 0 }
   if { [EQ_is_zero $x] } { set x 0 }

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
  if { [EQ_is_zero $dir] } {return 0}
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
   for { set i 1 } { $i < $level } { incr i } {
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

   if { [info exists mom_system_tolerance] } {
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

   if { [info exists mom_system_tolerance] } {
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
    if { [EQ_is_zero $len] } {set mom_sys_spindle_axis(2) 1.0}
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

   if { ![info exists positive_radius] } {set positive_radius 0}

   if {$mom_sys_rotary_axis_index == 3} {
       if { ![info exists mom_prev_rot_ang_4th] } {set mom_prev_rot_ang_4th 0.0}
       set mom_prev_lock_angle $mom_prev_rot_ang_4th
   } else {
       if { ![info exists mom_prev_rot_ang_5th] } {set mom_prev_rot_ang_5th 0.0}
       set mom_prev_lock_angle $mom_prev_rot_ang_5th
   }

   if {![info exists mom_kin_4th_axis_center_offset]} {
       set temp(0) $ip(0)
       set temp(1) $ip(1)
       set temp(2) $ip(2)
   } else {
       VEC3_sub ip mom_kin_4th_axis_center_offset temp
   }

   if { [info exists mom_kin_5th_axis_center_offset] } {
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
           if { [EQ_is_zero $len] } {
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
         if { ![info exists mom_prev_rot_ang_4th] } {set mom_prev_rot_ang_4th 0.0}
         if { ![info exists mom_prev_rot_ang_5th] } {set mom_prev_rot_ang_5th 0.0}
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

  if { [string match "*windows*" $tcl_platform(platform)] } {
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

  if { [EQ_is_equal [expr $rot(0)+$rot(1)] [expr $rotalt(0)+$rotalt(1)]] } {return}
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


  #<sws 9-21-06> Make sure mom_sys_rotary_error is always unset.

   if { ![info exists mom_sys_rotary_error] } {
return
   }

   set rotary_error_code $mom_sys_rotary_error
   unset mom_sys_rotary_error


   if { [info exists mom_motion_event] } {
     if {$rotary_error_code != 0 && $mom_motion_event == "linear_move"} {
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

         if {$rotary_error_code == "ROTARY CROSSING LIMIT." } {
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
            if { [info exists mom_kin_retract_plane] } {
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
         if { [string match "PLANE" $mom_kin_retract_type] } {
            set mom_kin_retract_type "SURFACE"
         }

         switch $mom_kin_retract_type {
             SURFACE {
               set cen(0) 0.0
               set cen(1) 0.0
               set cen(2) 0.0
               if { [info exists mom_kin_4th_axis_center_offset] } {
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
            if { [EQ_is_equal $mom_feed_rate 0.0] } {set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]}
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
            if { [info exists mom_kin_4th_axis_direction] } {
               set mom_out_angle_pos(0) [ROTSET $mom_prev_pos(3) $mom_out_angle_pos(0)  $mom_kin_4th_axis_direction  $mom_kin_4th_axis_leader  mom_sys_leader(fourth_axis)  $mom_kin_4th_axis_min_limit  $mom_kin_4th_axis_max_limit]
            }
            if { [info exists mom_kin_5th_axis_direction] } {
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
            if { [EQ_is_equal $mom_feed_rate 0.0] } {set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]}
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
            if { [EQ_is_equal $mom_feed_rate 0.0] } {set mom_feed_rate [expr $mom_kin_rapid_feed_rate*$mom_sys_unit_conversion]}
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

  if { [EQ_is_zero $dist] } {
      return $mom_kin_max_frn
  } else {
      set f [expr ($mom_sys_frn_factor*$feed) / $dist ]
      if { [EQ_is_lt $f $mom_kin_max_frn] } {
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
   if { [EQ_is_zero $mag] } {return 0}
   set acoeff [expr $c(2)/$mag]
   set bcoeff [expr $c(1)/$mag]
   set ccoeff [expr $c(0)/$mag]
   if {![EQ_is_zero $acoeff]} {
      set deg 2
      set denom [expr $acoeff*2.]
      set dscrm [expr $bcoeff*$bcoeff - $acoeff*$ccoeff*4.0]
      if { [EQ_is_zero $dscrm] } {
         set dsqrt1 0.0
      } else {
         set dsqrt1 [expr sqrt(abs($dscrm))]
      }
      if { [EQ_is_ge $dscrm 0.0] } {
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
   } elseif { [EQ_is_zero $ccoeff] } {
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
   for { set i $start_idx } { $i < $level } { incr i } {
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
   if { [info exists mom_kin_5th_axis_center_offset] } {
      VEC3_sub op mom_kin_5th_axis_center_offset op
   }
}


#=============================================================
proc UNSET_VARS { args } {
#=============================================================
   if { [llength $args] == 0 } {
return
   }

   foreach VAR $args {
      upvar $VAR var

      global tcl_version

      if { [array exists var] } {
         if { [expr $tcl_version < 8.4] } {
            foreach a [array names var] {
               if { [info exists var($a)] } {
                  unset var($a)
               }
            }
            unset var
         } else {
            array unset var
         }
      }

      if { [info exists var] } {
         unset var
      }
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


