########################## TCL Event Handlers ##########################
#
#  Created by mannino  @  Fri Aug 20 16:14:58 2004 Eastern Standard Time
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
     set mom_sys_list_file_columns                 "30" 
     set mom_sys_warning_output                    "OFF"
     set mom_sys_group_output                      "OFF"
     set mom_sys_list_file_suffix                  "lpt"
     set mom_sys_output_file_suffix                "ptp"
     set mom_sys_commentary_output                 "ON" 
     set mom_sys_commentary_list                   "x z feed speed"

     set mom_sys_control_out                       "("  
     set mom_sys_control_in                        ")"  

     set mom_sys_post_initialized 1
  }


########## SYSTEM VARIABLE DECLARATIONS ##############
  set mom_sys_rapid_code                        "0"  
  set mom_sys_linear_code                       "1"  
  set mom_sys_circle_code(CLW)                  "2"  
  set mom_sys_circle_code(CCLW)                 "3"  
  set mom_sys_lathe_thread_advance_type(1)      "32" 
  set mom_sys_lathe_thread_advance_type(2)      "34" 
  set mom_sys_lathe_thread_advance_type(3)      "35" 
  set mom_sys_delay_code(SECONDS)               "4"  
  set mom_sys_delay_code(REVOLUTIONS)           "4"  
  set mom_sys_cutcom_code(OFF)                  "40" 
  set mom_sys_cutcom_code(LEFT)                 "41" 
  set mom_sys_cutcom_code(RIGHT)                "42" 
  set mom_sys_adjust_code                       "43" 
  set mom_sys_adjust_code_minus                 "44" 
  set mom_sys_adjust_cancel_code                "49" 
  set mom_sys_unit_code(IN)                     "20" 
  set mom_sys_unit_code(MM)                     "21" 
  set mom_sys_cycle_drill_break_chip_code       "73" 
  set mom_sys_cycle_off                         "80" 
  set mom_sys_cycle_drill_code                  "81" 
  set mom_sys_cycle_drill_deep_code             "83" 
  set mom_sys_cycle_drill_dwell_code            "82" 
  set mom_sys_cycle_tap_code                    "84" 
  set mom_sys_cycle_bore_code                   "85" 
  set mom_sys_output_code(ABSOLUTE)             "90" 
  set mom_sys_output_code(INCREMENTAL)          "91" 
  set mom_sys_reset_code                        "92" 
  set mom_sys_feed_rate_mode_code(IPM)          "98" 
  set mom_sys_feed_rate_mode_code(IPR)          "99" 
  set mom_sys_feed_rate_mode_code(FRN)          "93" 
  set mom_sys_spindle_mode_code(SFM)            "96" 
  set mom_sys_spindle_mode_code(RPM)            "97" 
  set mom_sys_return_code                       "28" 
  set mom_sys_cycle_ret_code(AUTO)              "98" 
  set mom_sys_cycle_ret_code(MANUAL)            "99" 
  set mom_sys_program_stop_code                 "0"  
  set mom_sys_optional_stop_code                "1"  
  set mom_sys_end_of_program_code               "2"  
  set mom_sys_spindle_direction_code(CLW)       "3"  
  set mom_sys_spindle_direction_code(CCLW)      "4"  
  set mom_sys_spindle_direction_code(OFF)       "5"  
  set mom_sys_tool_change_code                  "6"  
  set mom_sys_coolant_code(MIST)                "7"  
  set mom_sys_coolant_code(ON)                  "8"  
  set mom_sys_coolant_code(FLOOD)               "8"  
  set mom_sys_coolant_code(OFF)                 "9"  
  set mom_sys_head_code(INDEPENDENT)            "21" 
  set mom_sys_head_code(DEPENDENT)              "22" 
  set mom_sys_rewind_code                       "30" 
  set mom_sys_sim_cycle_drill                   "0"  
  set mom_sys_sim_cycle_drill_dwell             "0"  
  set mom_sys_sim_cycle_drill_deep              "0"  
  set mom_sys_sim_cycle_drill_break_chip        "0"  
  set mom_sys_sim_cycle_tap                     "0"  
  set mom_sys_sim_cycle_bore                    "0"  
  set mom_sys_cir_vector                        "Vector - Arc Start to Center"
  set mom_sys_spindle_max_rpm_code              "92" 
  set mom_sys_spindle_cancel_sfm_code           "93" 
  set mom_sys_spindle_ranges                    "0"  
  set mom_sys_delay_output_mode                 "SECONDS"
  set mom_sys_rewind_stop_code                  "\#" 
  set mom_sys_home_pos(0)                       "0"  
  set mom_sys_home_pos(1)                       "0"  
  set mom_sys_home_pos(2)                       "-7."
  set mom_sys_zero                              "0"  
  set mom_sys_opskip_block_leader               "/"  
  set mom_sys_seqnum_start                      "10" 
  set mom_sys_seqnum_incr                       "10" 
  set mom_sys_seqnum_freq                       "1"  
  set mom_sys_seqnum_max                        "9999"
  set mom_sys_lathe_x_double                    "2"  
  set mom_sys_lathe_i_double                    "1"  
  set mom_sys_lathe_x_factor                    "1"  
  set mom_sys_lathe_y_factor                    "1"  
  set mom_sys_lathe_z_factor                    "1"  
  set mom_sys_leader(N)                         "N"  
  set mom_sys_leader(X)                         "X"  
  set mom_sys_leader(Y)                         "Y"  
  set mom_sys_leader(Z)                         "Z"  
  set mom_sys_turret_index(INDEPENDENT)         "1"  
  set mom_sys_turret_index(DEPENDENT)           "2"  
  set mom_sys_delay_param(SECONDS,format)       "Dwell_SECONDS"
  set mom_sys_delay_param(REVOLUTIONS,format)   "Dwell_REVOLUTIONS"
  set mom_sys_contour_feed_mode(LINEAR)         "IPM"
  set mom_sys_rapid_feed_mode(LINEAR)           "IPM"
  set mom_sys_cycle_feed_mode                   "IPM"
  set mom_sys_feed_param(IPM,format)            "Feed_IPM"
  set mom_sys_feed_param(IPR,format)            "Feed_IPR"
  set mom_sys_feed_param(FRN,format)            "Feed_INV"
  set mom_sys_vnc_rapid_dogleg                  "1"  
  set mom_sys_prev_mach_head                    ""   
  set mom_sys_curr_mach_head                    ""   
  set mom_sys_head_code(INDEPENDENT)            "21" 
  set mom_sys_head_code(DEPENDENT)              "22" 

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_arc_output_mode                   "FULL_CIRCLE"
  set mom_kin_arc_valid_plane                   "XY" 
  set mom_kin_clamp_time                        "2.0"
  set mom_kin_dependent_head                    "NONE"
  set mom_kin_flush_time                        "2.0"
  set mom_kin_ind_to_dependent_head_x           "0"  
  set mom_kin_ind_to_dependent_head_z           "0"  
  set mom_kin_independent_head                  "NONE"
  set mom_kin_linearization_flag                "1"  
  set mom_kin_linearization_tol                 "0.001"
  set mom_kin_machine_resolution                ".0001"
  set mom_kin_machine_type                      "lathe"
  set mom_kin_max_arc_radius                    "9999.9999"
  set mom_kin_max_fpm                           "400"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "99999.999"
  set mom_kin_min_arc_length                    "0.0001"
  set mom_kin_min_arc_radius                    "0.0001"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.001"
  set mom_kin_min_frn                           "0.001"
  set mom_kin_output_unit                       "IN" 
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_post_data_unit                    "IN" 
  set mom_kin_rapid_feed_rate                   "400"
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



if { $mom_sys_lathe_x_double != 1 || \
     $mom_sys_lathe_i_double != 1 || \
     $mom_sys_lathe_x_factor != 1 || \
     $mom_sys_lathe_y_factor != 1 || \
     $mom_sys_lathe_z_factor != 1 } {

   rename MOM_do_template MOM_SYS_do_template

   #==================================
   proc MOM_do_template { args } {
   #==================================
     global mom_sys_lathe_x_double
     global mom_sys_lathe_i_double
     global mom_sys_lathe_x_factor
     global mom_sys_lathe_y_factor
     global mom_sys_lathe_z_factor

     global mom_prev_pos mom_pos mom_pos_arc_center mom_from_pos mom_from_ref_pos
     global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_retract_to_pos
     global mom_cycle_clearance_to_pos
     global mom_cycle_feed_to mom_cycle_rapid_to
     global mom_tool_x_offset mom_tool_y_offset mom_tool_z_offset


     #-----------------------------------
     # Lists of variables to be modified
     #-----------------------------------
      set var_list_1 { mom_pos(\$i) \
                       mom_from_pos(\$i) \
                       mom_from_ref_pos(\$i) \
                       mom_cycle_rapid_to_pos(\$i) \
                       mom_cycle_feed_to_pos(\$i) \
                       mom_cycle_retract_to_pos(\$i) \
                       mom_cycle_clearance_to_pos(\$i) }

      set var_list_2 { mom_prev_pos(\$i) \
                       mom_pos_arc_center(\$i) }

      set var_list_3 { mom_cycle_feed_to \
                       mom_cycle_rapid_to }


     # Retain current values
      set var_list [concat $var_list_1 $var_list_2]
      foreach var $var_list {
         for { set i 0 } { $i < 3 } { incr i } {
            if [eval info exists [set var]] {
               set val [eval format $[set var]]
               eval set __[set var] $val
            }
         }
      }

      foreach var $var_list_3 {
         if [eval info exists [set var]] {
             set val [eval format $[set var]]
             eval set __[set var] $val
         }
      }

     # Adjust values
      set _factor(0) [expr $mom_sys_lathe_x_double * $mom_sys_lathe_x_factor]
      set _factor(1) $mom_sys_lathe_y_factor
      set _factor(2) $mom_sys_lathe_z_factor

      foreach var $var_list_1 {
         for { set i 0 } { $i < 3 } { incr i } {
            if [eval info exists [set var]] {
               set val [eval format $[set var]]
               eval set [set var] [expr $val * $_factor($i)]
            }
         }
      }

      foreach var $var_list_2 {
         for { set i 1 } { $i < 3 } { incr i } {
            if [eval info exists [set var]] {
               set val [eval format $[set var]]
               eval set [set var] [expr $val * $_factor($i)]
            }
         }
      }

     # Adjust values for I
      if { $mom_sys_lathe_i_double != 1 } {
         set _factor(0) [expr $mom_sys_lathe_x_factor * $mom_sys_lathe_i_double]
         if [info exists mom_prev_pos(0)] {
            set mom_prev_pos(0)       [expr $mom_prev_pos(0)       * $_factor(0)]
         }
         if [info exists mom_pos_arc_center(0)] {
            set mom_pos_arc_center(0) [expr $mom_pos_arc_center(0) * $_factor(0)]
         }
      }

      foreach var $var_list_3 {
         if [eval info exists [set var]] {
            set val [eval format $[set var]]
            eval set [set var] [expr $val * $_factor(2)]
         }
      }

     # Neutralize all factors to avoid double multiplication in the legacy posts.
      set _lathe_x_double $mom_sys_lathe_x_double
      set _lathe_i_double $mom_sys_lathe_i_double
      set _lathe_x_factor $mom_sys_lathe_x_factor
      set _lathe_y_factor $mom_sys_lathe_y_factor
      set _lathe_z_factor $mom_sys_lathe_z_factor

      set mom_sys_lathe_x_double 1
      set mom_sys_lathe_i_double 1
      set mom_sys_lathe_x_factor 1
      set mom_sys_lathe_y_factor 1
      set mom_sys_lathe_z_factor 1


     #-----------------------
     # Output block template
     #-----------------------
      MOM_SYS_do_template $args


     # Restore values
      foreach var $var_list {
         for { set i 0 } { $i < 3 } { incr i } {
            if [eval info exists [set var]] {
               set v __[set var]
               set val [eval format $$v]
               eval set [set var] $val
            }
         }
      }
      foreach var $var_list_3 {
         if [eval info exists [set var]] {
            set v __[set var]
            set val [eval format $$v]
            eval set [set var] $val
         }
      }

     # Restore factors
      set mom_sys_lathe_x_double $_lathe_x_double
      set mom_sys_lathe_i_double $_lathe_i_double
      set mom_sys_lathe_x_factor $_lathe_x_factor
      set mom_sys_lathe_y_factor $_lathe_y_factor
      set mom_sys_lathe_z_factor $_lathe_z_factor
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
   MOM_do_template end_of_program
   PB_CMD_announce_cycle_time
   MOM_do_template rewind_stop_code

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
proc PB_TURRET_HEAD_SET { } {
#=============================================================
  global mom_kin_independent_head mom_tool_head
  global turret_current mom_warning_info

    set turret_current INDEPENDENT
    set ind_head NONE
    set dep_head NONE

    if {$mom_tool_head != $mom_kin_independent_head} {
       set turret_current DEPENDENT
    }

    if {$mom_tool_head != "$ind_head" && \
         $mom_tool_head != "$dep_head"} {
       set mom_warning_info "mom_tool_head = $mom_tool_head IS INVALID, USING NONE"
       MOM_catch_warning
    }
}


#=============================================================
proc PB_LATHE_THREAD_SET { } {
#=============================================================
  global mom_lathe_thread_type mom_lathe_thread_advance_type
  global mom_lathe_thread_lead_i mom_lathe_thread_lead_k
  global mom_motion_distance
  global mom_lathe_thread_increment mom_lathe_thread_value
  global thread_type thread_increment feed_rate_mode

    switch $mom_lathe_thread_advance_type {
      1 {set thread_type CONSTANT ; MOM_suppress once E}
      2 {set thread_type INCREASING ; MOM_force once E}
      default {set thread_type DECREASING ; MOM_force once E}
    }

    if {$thread_type == "INCREASING" || $thread_type == "DECREASING"} {
      if {$mom_lathe_thread_type != 1} {
        set LENGTH $mom_motion_distance
        set LEAD $mom_lathe_thread_value
        set INCR $mom_lathe_thread_increment
        set E [expr abs(pow(($LEAD + ($INCR * $LENGTH)) , 2) - pow($LEAD , 2)) / 2 * $LENGTH]
        set thread_increment $E
      }
    }

    if {$mom_lathe_thread_lead_i == 0} {
      MOM_suppress once I ; MOM_force once K
    } elseif {$mom_lathe_thread_lead_k == 0} {
      MOM_suppress once K ; MOM_force once I
    } else {
      MOM_force once I ; MOM_force once K
    }
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

   MOM_set_seq_off
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

   MOM_set_seq_off
   PB_CMD_announce_oper
}


#=============================================================
proc MOM_from_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   MOM_set_seq_off
}


#=============================================================
proc MOM_first_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   PB_TURRET_HEAD_SET
   MOM_set_seq_off
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
   PB_CMD_alignment_block
   PB_CMD_announce_tool
   MOM_set_seq_off
   PB_CMD_SAFE_INDEX_BEFORE
   MOM_force Once M_spindle
   MOM_do_template auto_tool_change_1
   MOM_force Once G T
   MOM_do_template auto_tool_change
}


#=============================================================
proc PB_manual_tool_change { } {
#=============================================================
   PB_CMD_alignment_block
   MOM_do_template stop
   PB_CMD_start_of_alignment_character
   MOM_force Once T
   MOM_do_template manual_tool_change_1
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_spindle_sfm_prestart

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
   PB_CMD_spindle_sfm_prestart
   catch {MOM_$mom_motion_event}
}


#=============================================================
proc PB_approach_move { } {
#=============================================================
}


#=============================================================
proc PB_engage_move { } {
#=============================================================
   MOM_set_seq_off
}


#=============================================================
proc PB_first_cut { } {
#=============================================================
   MOM_set_seq_off
}


#=============================================================
proc PB_first_linear_move { } {
#=============================================================
   PB_CMD_output_spindle
}


#=============================================================
proc PB_retract_move { } {
#=============================================================
   MOM_set_seq_off
}


#=============================================================
proc PB_return_move { } {
#=============================================================
   MOM_set_seq_off
}


#=============================================================
proc MOM_gohome_move { } {
#=============================================================
   MOM_do_template gohome_move_1
   PB_CMD_SAFE_INDEX_AFTER
   MOM_force Once M
   MOM_do_template gohome_move
}


#=============================================================
proc MOM_end_of_path { } {
#=============================================================

   if [llength [info commands PB_CMD_kin_end_of_path] ] {
      PB_CMD_kin_end_of_path
   }

   MOM_set_seq_off
   global mom_sys_in_operation
   set mom_sys_in_operation 0
}


#=============================================================
proc MOM_tool_change { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   PB_TURRET_HEAD_SET
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
   PB_CMD_set_spindle_code
}


#=============================================================
proc MOM_spindle_css { } {
#=============================================================
   SPINDLE_SET
   PB_CMD_set_spindle_code
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
   MOM_do_template coolant_on
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
   MOM_do_template cutcom_on
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
   PB_TURRET_HEAD_SET
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

   MOM_do_template linear_move
}


#=============================================================
proc MOM_circular_move { } {
#=============================================================
   MOM_force Once G_motion X Z R
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
   MOM_do_template rapid_move
}


#=============================================================
proc MOM_lathe_thread { } {
#=============================================================
  global cycle_name
  global cycle_init_flag

   set cycle_init_flag TRUE
   set cycle_name LATHE_THREAD
}


#=============================================================
proc MOM_lathe_thread_move { } {
#=============================================================
  global cycle_init_flag

   PB_LATHE_THREAD_SET
   MOM_do_template thread_move
   set cycle_init_flag FALSE
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
proc MOM_sequence_number { } {
#=============================================================
   SEQNO_SET
}


#=============================================================
proc PB_CMD_N_seq { } {
#=============================================================
global mom_tool_adjust_register
MOM_output_literal "N$mom_tool_adjust_register"
}


#=============================================================
proc PB_CMD_SAFE_INDEX_AFTER { } {
#=============================================================
MOM_output_text "G0 G53 X0 Z#500 M9"
}


#=============================================================
proc PB_CMD_SAFE_INDEX_BEFORE { } {
#=============================================================
MOM_output_text "G0 G53 X0 Z#500"
}


#=============================================================
proc PB_CMD_alignment_block { } {
#=============================================================
  MOM_force once X Z M_spindle M_coolant F G_feed
}


#=============================================================
proc PB_CMD_alignment_block_1 { } {
#=============================================================
  MOM_force once X Z M_spindle M_coolant F G_feed
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
set mtime [format "%6.1f MINUTES" $mom_machine_time]

# output to tape
PB_CMD_comment_bar
MOM_output_literal "(MACHINE TIME: $mtime)"
PB_CMD_comment_bar
}


#=============================================================
proc PB_CMD_announce_oper { } {
#=============================================================
PB_CMD_comment_bar
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

  MOM_output_text "${co}OPER - $opname${ci}"
  }
PB_CMD_comment_bar
}


#=============================================================
proc PB_CMD_announce_tool { } {
#=============================================================
PB_CMD_comment_bar
# -------------------------------------------------------
# PB_CMD_announce_tool
#
# Issues operator display message for tool change
# - uses TOOL CATALOG NUMBER field if present, else
#   tool parent object name
#
# Bind somewhere in the AUTO TOOL CHANGE event
# -------------------------------------------------------

global mom_tool_adjust_register
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

MOM_output_text "N$mom_tool_adjust_register ${co}TOOL # $mom_tool_number - $tnam${ci}"
PB_CMD_comment_bar
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_check_update_post_from_tool { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_check_update_post_from_tool
#
# Verifies that UPDATE POST FROM TOOL is set in
# UG's Manufacturing preferences
#
# Bind to START_OF_PATH event (note that this will not
# operate correctly from START_OF_PROGRAM event)
# -------------------------------------------------------

global mom_update_post_cmds_from_tool

# make sure variable exists (does at START OF PATH)
if { [info exists mom_update_post_cmds_from_tool] } {
  if {$mom_update_post_cmds_from_tool == 0} {
    set errmsg "*FATAL* must set Mfg Operation preference UPDATE POST FROM TOOL"
    MOM_output_to_listing_device $errmsg
    MOM_abort $errmsg
    }
  }
}


#=============================================================
proc PB_CMD_comment_bar { } {
#=============================================================

MOM_output_literal "(=======================)"
}


#=============================================================
proc PB_CMD_copy_output_file { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_copy_output_file
#
# Copy file from <whatever>.PTP to some other arbitrary 
# output file name; assumes file name has been stored
# in global "custom_filename" (see PB_CMD_program_id).
# -------------------------------------------------------

global ptp_file_name
global mom_output_file_directory  mom_output_file_basename

global custom_filename

# ensure that custom_filename has been established
if { ![info exists custom_filename] } {
  set msg "global variable CUSTOM_FILENAME not set "
  append msg "in procedure PB_CMD_copy_output_file"
  ABORT $msg
  }

# extract PATH portion of output filename for in-place copies
set ptp_file_path [file dirname $ptp_file_name]

# build up output file name - recode this as required
set outfile "$ptp_file_path/$custom_filename"

# close the current PTP output file
MOM_close_output_file $ptp_file_name
if { [file exists $ptp_file_name] } {
  file copy -force -- $ptp_file_name $outfile
  MOM_output_to_listing_device "$ptp_file_name copied to $outfile"
  }
}


#=============================================================
proc PB_CMD_cycle_assume_G99 { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_cycle_assume_G99
#
# bind to CYCLE Common Parameters event, before G- block
#
# forces G99 output if RTRCTO is set to NONE in operation
#
# RTRCTO/AUTO still outputs G99 also;
# use DISTANCE for RTRCTO to output G98

global mom_cycle_retract_mode
#MOM_output_text "(mom_cycle_retract_mode=$mom_cycle_retract_mode)"

if {$mom_cycle_retract_mode == ""} {
  set mom_cycle_retract_mode AUTO
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
proc PB_CMD_init_ABORT { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_init_ABORT
#
# Registers a general ABORT handler that wraps around
# MOM_abort(); prints message in the INFO window, and
# issues a verbose error message, including current
# operation name, if any, and aborts processing
#
# Bind this command at START_OF_PROGRAM, then call ABORT 
# from any custom commands you write.
#
# ABORT usage:
#
#    ABORT "message text"
# -------------------------------------------------------
#

uplevel #0 {

proc ABORT { msg } {
  global mom_path_name

  if { [info exists mom_path_name] } {
    set pthnam $mom_path_name
    } else {
    set pthnam "-none-"
    }

  set errmsg "*FATAL* $msg"
  MOM_output_to_listing_device "******************************"
  MOM_output_to_listing_device $errmsg
  MOM_output_to_listing_device " "
  MOM_output_to_listing_device "  current operation is \[$pthnam\]"
  MOM_output_to_listing_device "******************************"
  MOM_output_to_listing_device "Postprocessing aborted"
  MOM_abort "Postprocessing aborted - see info window for details"
  }
} ;# uplevel
}


#=============================================================
proc PB_CMD_init_text { } {
#=============================================================
# -------------------------------------------------------
# PB_CMD_init_text
#
# Package to provide support for legacy-style UDE's that
# worked with GPM postprocessors
#
# This package replaces the default handler for the MOM_text event
# that is normally provided by the ugpost_base.tcl file.
#
# Bind this command at START_OF_PROGRAM
# -------------------------------------------------------

uplevel #0 {

proc  MOM_text {} {
#--------------------
# replaces the default MOM_text handler
#
# designed to better handle legacy GPM-style user-defined UDE's
# adds support for numerous user-defined (text) UDE's that
# should be interpreted as their "normal" counterparts:
# - PARTNO (no output, sets global my_partno to contents)
# - INSERT (without a slash)
# - SEQNO
# - STOP
# - OPSTOP
# - REWIND
#--------------------
global mom_user_defined_text mom_record_fields
global mom_sys_control_out mom_sys_control_in
global mom_record_text mom_pprint set mom_Instruction mom_operator_message
global mom_pprint_defined mom_operator_message_defined

switch $mom_record_fields(0) {

  "PPRINT" {
    set mom_pprint_defined 1
    set mom_pprint $mom_record_text
    MOM_pprint
    }

  "INSERT" {
    if { [string range $mom_user_defined_text 5 5] == "/" } {
      set mom_Instruction $mom_record_text
      MOM_insert
      } else {
      set mom_Instruction [string range $mom_user_defined_text 6 end]
      MOM_insert
      }
    }

  "DISPLY" {
    set mom_operator_message_defined 1
    set mom_operator_message $mom_record_text
    MOM_operator_message
    }

  "PARTNO" {
    set my_partno $mom_record_text
    # MOM_output_text "PARTNO/$my_partno"
    }

  "SEQNO" {
    switch $mom_record_fields(1) {
      "ON" -
      "on" { MOM_set_seq_on }
      "OFF" -
      "off" { MOM_set_seq_off }
      default {
        set errmsg "*FATAL* - bad user-defined ($mom_user_defined_text)"
        MOM_output_to_listing_device $errmsg
        MOM_abort $errmsg
        }
      }
    }

  "STOP" {
    MOM_stop
    }

  "OPSTOP" {
    MOM_opstop
    }

  "REWIND" {
    MOM_output_text "M30"
    }

  default {
MOM_output_text "TEXT: $mom_user_defined_text"
    switch -regexp [string toupper $mom_user_defined_text] {
      "^INSERT" {
        # output everything past the string INSERT
        set mom_Instruction [string range $mom_user_defined_text 6 end]
        MOM_insert
        }
      default {
        if {[info exists mom_user_defined_text]} {
          set stg [string toupper "$mom_user_defined_text"
          MOM_output_literal "$mom_sys_control_out$stg$mom_sys_control_in"
          }
        }
      }
    }
  }
}; # end proc MOM_text


proc  MOM_insert {} {
#--------------------
# handle INSERT UDE - folds input text to UPPER CASE
#--------------------
global mom_Instruction

MOM_output_literal [string toupper $mom_Instruction]
}; # end proc MOM_insert


}; # end uplevel #0
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
         rename MOM_start_of_program ""
         rename MOM_start_of_program_save MOM_start_of_program 
      }
      if [llength [info commands "MOM_end_of_program_save"]] {
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
 
   set command_list [list]

   lappend command_list  PB_CMD_initialize_tool_list
   lappend command_list  PB_CMD_init_tool_list
   lappend command_list  PB_CMD_init_tape_break
   lappend command_list  PB_CMD_set_lathe_arc_plane


   foreach cmd $command_list {
      if [llength [info commands "$cmd"]] {
         $cmd
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
proc PB_CMD_output_spindle { } {
#=============================================================
  global mom_spindle_mode

  if {$mom_spindle_mode == "RPM"} {
     MOM_force once M_spindle S G_spin
     MOM_do_template spindle_rpm
  } elseif {$mom_spindle_mode == "SFM" || $mom_spindle_mode == "SMM"} {
     MOM_force once M_spindle S G G_spin
     MOM_do_template spindle_max_rpm
     MOM_do_template spindle_css
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
global mom_group_name  mom_path_name
global mom_sys_control_out mom_sys_control_in
global mom_machine_name
global custom_filename
#set fname [split $mom_part_name "/\\"]
set fname [file tail [file rootname $mom_part_name]]

#
# Split at decimal point, but only get .prt as fname1
#
set fname1 [split $fname "."]
# set up some variables so that control OUT and IN can be
# used as needed in output blocks:
#  - CONTROL OUT = ${co}
#  - CONTROL IN  = ${ci}
set co $mom_sys_control_out; set ci $mom_sys_control_in

# format system date/time into dd-MMM-yyyy hh:mm AM/PM
set dt [string toupper [clock format [clock seconds] -format "%d-%b-%Y %I:%M %p"]]

# use  program group name as program ID
if { [info exists mom_group_name] } {
  set prgid $mom_group_name
  } else { 
  set prgid $mom_path_name
  }

set default_program_number 1999; # this MUST be a number

# locate any embedded digits in the group/path name, use for O-block
if { ![regexp "\[0-9\]+" $prgid prgnum] } {
  set prgnum $default_program_number
  }

# create global file name (see PB_CMD_copy_output)
set custom_filename "$prgid.TXT"

MOM_output_text "%"
MOM_output_text [format "O%04d ([string toupper [lindex $fname end]])" $prgnum ] 
MOM_output_literal "(MACHINE: MORI MIllTURN)"
MOM_output_text "${co}$prgid - $dt - [string toupper $mom_logname]${ci}"
}


#=============================================================
proc PB_CMD_set_csys { } {
#=============================================================
#  This custom command is provided as the default to nullify
#  the same command in a linked post that may have been
#  imported from pb_cmd_coordinate_system_rotation.tcl.
}


#=============================================================
proc PB_CMD_set_lathe_arc_plane { } {
#=============================================================
# This custom command will switch the valid arc plane for lathes
# from XY to ZX when the users selects the ZX lathe work
# plane in the MCS dialog.  If this custom command is not used then
# all arcs will be output as linear moves when the user selects the 
# ZX Plane.
#
# Post Builder v3.0.1 executes this custom command automatically
# for all lathe posts.

  global mom_lathe_spindle_axis
  global mom_kin_arc_valid_plane

   if { [info exists mom_lathe_spindle_axis] && $mom_lathe_spindle_axis == "MCSZ" } {
      set mom_kin_arc_valid_plane  "ZX" 
      MOM_reload_kinematics
   }
}


#=============================================================
proc PB_CMD_set_spindle_code { } {
#=============================================================
# Check to see if tool offset grearter than 39 is being used (assumed for sub spindle), if so
# change M3 to M203 and M4 to M204 for sub spindle support.
#

global mom_sys_spindle_direction_code
global mom_tool_adjust_register

if {$mom_tool_adjust_register > 39} {
       set mom_sys_spindle_direction_code(CCLW) 204
       set mom_sys_spindle_direction_code(CLW) 203
}
if {$mom_tool_adjust_register < 40} {
       set mom_sys_spindle_direction_code(CCLW) 4
       set mom_sys_spindle_direction_code(CLW) 3
}
}


#=============================================================
proc PB_CMD_spindle_sfm_prestart { } {
#=============================================================
  global mom_spindle_mode

  if {$mom_spindle_mode == "SFM" || $mom_spindle_mode == "SMM"} {
     MOM_force once G_spin M_spindle S
     MOM_do_template spindle_rpm_preset
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
proc PB_CMD_temp { } {
#=============================================================
# Check to see if fixture offset 2 is being used (assumed for sub spindle), if so
# invert Z axis output

global mom_fixture_offset_value
global mom_sys_lathe_z_factor
global mom_pos

#if {$mom_fixture_offset_value > 1} {
#       set mom_pos(2) [expr -1.0*$mom_pos(2)]
#}
if {$mom_fixture_offset_value > 1} {
        set mom_sys_lathe_z_factor -1
}
if {$mom_fixture_offset_value < 2} {
        #set mom_sys_lathe_z_factor 1
}
}


#=============================================================
proc PB_CMD_tool_change_force_addresses { } {
#=============================================================
  MOM_force once G_adjust H
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






if [info exists mom_sys_start_of_program_flag] {
   if [llength [info commands PB_CMD_kin_start_of_program] ] {
      PB_CMD_kin_start_of_program
   }
} else {
   set mom_sys_head_change_init_program 1
   set mom_sys_start_of_program_flag 1
}


