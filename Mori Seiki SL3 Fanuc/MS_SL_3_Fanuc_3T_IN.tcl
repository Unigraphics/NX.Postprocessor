########################## TCL Event Handlers ##########################
#
#  MS_SL_3_Fanuc_3T_IN.tcl -
#
#  Created by suyo  @  Wed Sep 05 10:58:37 2007 China Standard Time
#  with Post Builder version  3.5.2.
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
  set mom_sys_circle_code(CLW)                  "3"  
  set mom_sys_circle_code(CCLW)                 "2"  
  set mom_sys_lathe_thread_advance_type(1)      "92" 
  set mom_sys_lathe_thread_advance_type(2)      "92" 
  set mom_sys_lathe_thread_advance_type(3)      "92" 
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
  set mom_sys_cycle_drill_break_chip_code       "83" 
  set mom_sys_cycle_off                         "80" 
  set mom_sys_cycle_drill_code                  "83" 
  set mom_sys_cycle_drill_deep_code             "83" 
  set mom_sys_cycle_drill_dwell_code            "83" 
  set mom_sys_cycle_tap_code                    "84" 
  set mom_sys_cycle_bore_code                   "85" 
  set mom_sys_output_code(ABSOLUTE)             "60" 
  set mom_sys_output_code(INCREMENTAL)          "61" 
  set mom_sys_reset_code                        "50" 
  set mom_sys_feed_rate_mode_code(IPM)          "98" 
  set mom_sys_feed_rate_mode_code(IPR)          "99" 
  set mom_sys_feed_rate_mode_code(FRN)          "93" 
  set mom_sys_spindle_mode_code(SFM)            "96" 
  set mom_sys_spindle_mode_code(RPM)            "97" 
  set mom_sys_return_code                       "28" 
  set mom_sys_cycle_ret_code(AUTO)              "14" 
  set mom_sys_cycle_ret_code(MANUAL)            "15" 
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
  set mom_sys_spindle_range_code(1)             "41" 
  set mom_sys_spindle_param(1,max)              "2000"
  set mom_sys_spindle_param(1,min)              "100"
  set mom_sys_spindle_range_code(2)             "42" 
  set mom_sys_spindle_param(2,max)              "99999"
  set mom_sys_spindle_param(2,min)              "2000"
  set mom_sys_spindle_range_code(3)             "0"  
  set mom_sys_spindle_param(3,max)              "0"  
  set mom_sys_spindle_param(3,min)              "0"  
  set mom_sys_spindle_range_code(4)             "0"  
  set mom_sys_spindle_param(4,max)              "0"  
  set mom_sys_spindle_param(4,min)              "0"  
  set mom_sys_spindle_range_code(5)             "0"  
  set mom_sys_spindle_param(5,max)              "0"  
  set mom_sys_spindle_param(5,min)              "0"  
  set mom_sys_spindle_range_code(6)             "0"  
  set mom_sys_spindle_param(6,max)              "0"  
  set mom_sys_spindle_param(6,min)              "0"  
  set mom_sys_spindle_range_code(7)             "0"  
  set mom_sys_spindle_param(7,max)              "0"  
  set mom_sys_spindle_param(7,min)              "0"  
  set mom_sys_spindle_range_code(8)             "0"  
  set mom_sys_spindle_param(8,max)              "0"  
  set mom_sys_spindle_param(8,min)              "0"  
  set mom_sys_spindle_range_code(9)             "0"  
  set mom_sys_spindle_param(9,max)              "0"  
  set mom_sys_spindle_param(9,min)              "0"  
  set mom_sys_sim_cycle_drill                   "0"  
  set mom_sys_sim_cycle_drill_dwell             "0"  
  set mom_sys_sim_cycle_drill_deep              "0"  
  set mom_sys_sim_cycle_drill_break_chip        "0"  
  set mom_sys_sim_cycle_tap                     "0"  
  set mom_sys_sim_cycle_bore                    "0"  
  set mom_sys_cir_vector                        "Vector - Arc Start to Center"
  set mom_sys_spindle_max_rpm_code              "92" 
  set mom_sys_spindle_cancel_sfm_code           "93" 
  set mom_sys_spindle_ranges                    "9"  
  set mom_sys_delay_output_mode                 "SECONDS"
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
  set mom_sys_lathe_x_double                    "2"  
  set mom_sys_lathe_i_double                    "1"  
  set mom_sys_lathe_x_factor                    "-1" 
  set mom_sys_lathe_z_factor                    "1"  
  set mom_sys_lathe_i_factor                    "1"  
  set mom_sys_lathe_k_factor                    "1"  
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
  set mom_sys_post_description                  ""
  set mom_sys_ugpadvkins_used                   "0"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_4th_axis_center_offset(0)         "0.0"
  set mom_kin_4th_axis_center_offset(1)         "0.0"
  set mom_kin_4th_axis_center_offset(2)         "0.0"
  set mom_kin_4th_axis_point(0)                 "0.0"
  set mom_kin_4th_axis_point(1)                 "0.0"
  set mom_kin_4th_axis_point(2)                 "0.0"
  set mom_kin_5th_axis_center_offset(0)         "0.0"
  set mom_kin_5th_axis_center_offset(1)         "0.0"
  set mom_kin_5th_axis_center_offset(2)         "0.0"
  set mom_kin_5th_axis_point(0)                 "0.0"
  set mom_kin_5th_axis_point(1)                 "0.0"
  set mom_kin_5th_axis_point(2)                 "0.0"
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
  set mom_kin_machine_zero_offset(0)            "0.0"
  set mom_kin_machine_zero_offset(1)            "0.0"
  set mom_kin_machine_zero_offset(2)            "0.0"
  set mom_kin_max_arc_radius                    "9999.9999"
  set mom_kin_max_fpm                           "400"
  set mom_kin_max_fpr                           "1000"
  set mom_kin_max_frn                           "99999.999"
  set mom_kin_min_arc_length                    "0.01"
  set mom_kin_min_arc_radius                    "0.0001"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.001"
  set mom_kin_min_frn                           "0.001"
  set mom_kin_output_unit                       "IN" 
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_post_data_unit                    "IN" 
  set mom_kin_rapid_feed_rate                   "600"
  set mom_kin_tool_change_time                  "30" 
  set mom_kin_x_axis_limit                      "17.1"
  set mom_kin_y_axis_limit                      "0"  
  set mom_kin_z_axis_limit                      "33.9"




if [llength [info commands MOM_SYS_do_template] ] {
   if [llength [info commands MOM_do_template] ] {
      rename MOM_do_template ""
   }
   rename MOM_SYS_do_template MOM_do_template
}




if { ![info exists mom_sys_lathe_x_double] } { set mom_sys_lathe_x_double 1 }
if { ![info exists mom_sys_lathe_y_double] } { set mom_sys_lathe_y_double 1 }
if { ![info exists mom_sys_lathe_i_double] } { set mom_sys_lathe_i_double 1 }
if { ![info exists mom_sys_lathe_j_double] } { set mom_sys_lathe_j_double 1 }
if { ![info exists mom_sys_lathe_x_factor] } { set mom_sys_lathe_x_factor 1 }
if { ![info exists mom_sys_lathe_y_factor] } { set mom_sys_lathe_y_factor 1 }
if { ![info exists mom_sys_lathe_z_factor] } { set mom_sys_lathe_z_factor 1 }
if { ![info exists mom_sys_lathe_i_factor] } { set mom_sys_lathe_i_factor 1 }
if { ![info exists mom_sys_lathe_j_factor] } { set mom_sys_lathe_j_factor 1 }
if { ![info exists mom_sys_lathe_k_factor] } { set mom_sys_lathe_k_factor 1 }


if { $mom_sys_lathe_x_double != 1 || \
     $mom_sys_lathe_y_double != 1 || \
     $mom_sys_lathe_i_double != 1 || \
     $mom_sys_lathe_j_double != 1 || \
     $mom_sys_lathe_x_factor != 1 || \
     $mom_sys_lathe_y_factor != 1 || \
     $mom_sys_lathe_z_factor != 1 || \
     $mom_sys_lathe_i_factor != 1 || \
     $mom_sys_lathe_j_factor != 1 || \
     $mom_sys_lathe_k_factor != 1 } {

   rename MOM_do_template MOM_SYS_do_template

   #====================================
   proc MOM_do_template { block args } {
   #====================================
     global mom_sys_lathe_x_double
     global mom_sys_lathe_y_double
     global mom_sys_lathe_i_double
     global mom_sys_lathe_j_double
     global mom_sys_lathe_x_factor
     global mom_sys_lathe_y_factor
     global mom_sys_lathe_z_factor
     global mom_sys_lathe_i_factor
     global mom_sys_lathe_j_factor
     global mom_sys_lathe_k_factor

     global mom_prev_pos mom_pos mom_pos_arc_center mom_from_pos mom_from_ref_pos
     global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_retract_to_pos
     global mom_cycle_clearance_to_pos
     global mom_cycle_feed_to mom_cycle_rapid_to
     global mom_tool_x_offset mom_tool_y_offset mom_tool_z_offset

     global mom_lathe_thread_lead_i mom_lathe_thread_lead_k


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
                       mom_cycle_rapid_to \
                       mom_lathe_thread_lead_i \
                       mom_lathe_thread_lead_k }


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

     # Adjust X, Y & Z values
      set _factor(0) [expr $mom_sys_lathe_x_double * $mom_sys_lathe_x_factor]
      set _factor(1) [expr $mom_sys_lathe_y_double * $mom_sys_lathe_y_factor]
      set _factor(2) $mom_sys_lathe_z_factor

      foreach var $var_list_1 {
         for { set i 0 } { $i < 3 } { incr i } {
            if [expr $_factor($i) != 1] {
               if [eval info exists [set var]] {
                  set val [eval format $[set var]]
                  eval set [set var] [expr $val * $_factor($i)]
               }
            }
         }
      }

     # Adjust I, J & K
      set _factor(0) [expr $mom_sys_lathe_i_factor * $mom_sys_lathe_i_double]
      set _factor(1) [expr $mom_sys_lathe_j_factor * $mom_sys_lathe_j_double]
      set _factor(2)       $mom_sys_lathe_k_factor

      foreach var $var_list_2 {
         for { set i 0 } { $i < 3 } { incr i } {
            if [expr $_factor($i) != 1] {
               if [eval info exists [set var]] {
                  set val [eval format $[set var]]
                  eval set [set var] [expr $val * $_factor($i)]
               }
            }
         }
      }

     # Adjust Cycle's & threading registers
      foreach var $var_list_3 {
         if [eval info exists [set var]] {

            set val [eval format $[set var]]

            switch "$var" {
               "mom_cycle_feed_to"  -
               "mom_cycle_rapid_to" {
                  eval set [set var] [expr $val * $mom_sys_lathe_z_factor]
               }
               "mom_lathe_thread_lead_i" {
                  eval set [set var] [expr $val * $mom_sys_lathe_i_factor * $mom_sys_lathe_i_double]
               }
               "mom_lathe_thread_lead_k" {
                  eval set [set var] [expr $val * $mom_sys_lathe_k_factor]
               }
            }
         }
      }


     # Neutralize all factors to avoid double multiplication in the legacy posts.
      set _lathe_x_double $mom_sys_lathe_x_double
      set _lathe_y_double $mom_sys_lathe_y_double
      set _lathe_i_double $mom_sys_lathe_i_double
      set _lathe_j_double $mom_sys_lathe_j_double
      set _lathe_x_factor $mom_sys_lathe_x_factor
      set _lathe_y_factor $mom_sys_lathe_y_factor
      set _lathe_z_factor $mom_sys_lathe_z_factor
      set _lathe_i_factor $mom_sys_lathe_i_factor
      set _lathe_j_factor $mom_sys_lathe_j_factor
      set _lathe_k_factor $mom_sys_lathe_k_factor

      set mom_sys_lathe_x_double 1
      set mom_sys_lathe_y_double 1
      set mom_sys_lathe_i_double 1
      set mom_sys_lathe_j_double 1
      set mom_sys_lathe_x_factor 1
      set mom_sys_lathe_y_factor 1
      set mom_sys_lathe_z_factor 1
      set mom_sys_lathe_i_factor 1
      set mom_sys_lathe_j_factor 1
      set mom_sys_lathe_k_factor 1


     #-----------------------
     # Output block template
     #-----------------------
      MOM_SYS_do_template $block $args


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
      set mom_sys_lathe_y_double $_lathe_y_double
      set mom_sys_lathe_i_double $_lathe_i_double
      set mom_sys_lathe_j_double $_lathe_j_double
      set mom_sys_lathe_x_factor $_lathe_x_factor
      set mom_sys_lathe_y_factor $_lathe_y_factor
      set mom_sys_lathe_z_factor $_lathe_z_factor
      set mom_sys_lathe_i_factor $_lathe_i_factor
      set mom_sys_lathe_j_factor $_lathe_j_factor
      set mom_sys_lathe_k_factor $_lathe_k_factor
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
   MOM_do_template end_of_path
   MOM_do_template end_of_program
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
proc MOM_circular_move { } {
#=============================================================
   PB_CMD_output_spindle
   MOM_force Once X Z I K
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
   MOM_do_template cutcom_on
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

   MOM_do_template coolant_off
   PB_CMD_end_of_path
   global mom_sys_in_operation
   set mom_sys_in_operation 0
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

   PB_CMD_output_spindle
   MOM_do_template linear_move_1
   MOM_do_template linear_move
}


#=============================================================
proc MOM_load_tool { } {
#=============================================================
  global mom_tool_change_type mom_manual_tool_change
   PB_TURRET_HEAD_SET
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
   PB_CMD_output_spindle
   MOM_do_template rapid_move
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
proc MOM_spindle_css { } {
#=============================================================
   SPINDLE_SET
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

   MOM_set_seq_on
   PB_CMD_output_sn
   MOM_set_seq_off
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
proc MOM_tool_preselect { } {
#=============================================================
  global mom_tool_preselect_number mom_tool_number mom_next_tool_number
   if {[info exists mom_tool_preselect_number]} {
      set mom_next_tool_number $mom_tool_preselect_number
   }
}


#=============================================================
proc PB_approach_move { } {
#=============================================================
}


#=============================================================
proc PB_auto_tool_change { } {
#=============================================================
   PB_CMD_alignment_block
   MOM_force Once G X Z
   MOM_do_template tool_change_axis_preset
   PB_CMD_spindle_table
   PB_CMD_spindle_sfm_range_select
   MOM_force Once G_motion T M_range
   MOM_do_template auto_tool_change
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
   PB_CMD_alignment_block
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
   MOM_do_template rewind_stop_code
   PB_CMD_program_header
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
proc PB_CMD_alignment_block { } {
#=============================================================
  global spindle_is_out  

   MOM_force once X Z M_spindle M_coolant F G_feed

   if {[info exists spindle_is_out]} {unset spindle_is_out}
}


#=============================================================
proc PB_CMD_alignment_block_1 { } {
#=============================================================
   MOM_force once X Z M_spindle M_coolant F G_feed
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_end_of_alignment_character { } {
#=============================================================
#  Return sequnece number back to orignal
#  This command may be used with the command "PM_CMD_start_of_alignment_character"

  global mom_sys_leader saved_seq_num
  if [info exists saved_seq_num] {
    set mom_sys_leader(N) $saved_seq_num
  }
}


#=============================================================
proc PB_CMD_end_of_path { } {
#=============================================================
  global mom_next_oper_has_tool_change
  global mom_next_tool_status
  global mom_current_oper_is_last_oper_in_program

  if {[info exists mom_next_oper_has_tool_change]} {
    if {$mom_next_oper_has_tool_change == "YES" || $mom_next_tool_status == "FIRST"} {
         
         MOM_do_template tool_offset_cancel 
         MOM_do_template spindle_off    
        }
      }
	  
  if {[info exists mom_current_oper_is_last_oper_in_program]} {
    if {$mom_current_oper_is_last_oper_in_program == "NO" } {
         
         MOM_do_template opstop
           
        }
      }
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
proc PB_CMD_handle_sync_event { } {
#=============================================================
  global mom_sync_code
  global mom_sync_index
  global mom_sync_start
  global mom_sync_incr
  global mom_sync_max


  set mom_sync_start  99
  set mom_sync_incr   1
  set mom_sync_max    199


  if {![info exists mom_sync_code] } {
    set mom_sync_code $mom_sync_start
  }
  
  set mom_sync_code [expr $mom_sync_code + $mom_sync_incr]

  MOM_output_literal "M$mom_sync_code"
}


#=============================================================
proc PB_CMD_kin_end_of_path { } {
#=============================================================
  # Record tool time for this operation.
   if [llength [info commands PB_CMD_set_oper_tool_time] ] {
      PB_CMD_set_oper_tool_time
   }

  # Clear tool holder angle used in operation
   global mom_use_b_axis
   UNSET_VARS mom_use_b_axis
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
proc PB_CMD_kin_init_new_iks { } {
#=============================================================
   global mom_kin_machine_type mom_kin_iks_usage

   if { $mom_kin_machine_type == "lathe" } {
      set mom_kin_iks_usage 0
      MOM_reload_kinematics
   }
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

     # Reset solver state for lathe post
      if [llength [info commands PB_CMD_reset_lathe_post] ] {
         PB_CMD_reset_lathe_post
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
#  Note when a linked post is called in, the Start of Program
#  event is not executed again.
#
#  DO NOT REMOVE ANY LINES FROM THIS PROCEDURE UNLESS YOU KNOW
#  WHAT YOU ARE DOING.  DO NOT CALL THIS PROCEDURE FROM ANY
#  OTHER CUSTOM COMMAND.
#
 
   set command_list [list]

   lappend command_list  PB_CMD_kin_init_new_iks

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
proc PB_CMD_output_sn { } {
#=============================================================
MOM_output_literal "\t"
}


#=============================================================
proc PB_CMD_output_spindle { } {
#=============================================================
  global mom_spindle_mode 
  global spindle_is_out
  global mom_spindle_maximum_rpm

   if { ![info exists spindle_is_out] } { 
      if {$mom_spindle_mode == "RPM"} {
         MOM_force once M_spindle S G_spin
         MOM_do_template spindle_rpm
      } elseif {$mom_spindle_mode == "SFM" || $mom_spindle_mode == "SMM"} {
         MOM_force once M_spindle S G G_spin

         if { [info exists mom_spindle_maximum_rpm] && [expr $mom_spindle_maximum_rpm > 0] } {
            MOM_do_template spindle_max_rpm
         }

         MOM_do_template spindle_css
      }
      set spindle_is_out 1
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
MOM_output_literal "O$mom_attr_PROGRAMVIEW_PROGRAM_NUMBER ($mom_group_name)"
}


#=============================================================
proc PB_CMD_reset_lathe_post { } {
#=============================================================
  global mom_kin_machine_type

   if { $mom_kin_machine_type == "lathe" } {
      set mom_kin_machine_type "3_axis_mill"
      MOM_reload_kinematics

      set mom_kin_machine_type "lathe"
      MOM_reload_kinematics
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
proc PB_CMD_spindle_sfm_prestart { } {
#=============================================================
  global mom_spindle_mode

  if {$mom_spindle_mode == "SFM" || $mom_spindle_mode == "SMM"} {
    MOM_force once G_spin M_spindle S
    MOM_do_template spindle_rpm_preset
  }
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
   global mom_surface_speed mom_spindle_maximum_rpm

   if {![info exist mom_sys_spindle_param]} {
      set mom_spindle_range 1
      return
   }  
   

   set speed $mom_spindle_rpm

  if 0 {
   if {$mom_spindle_mode == "RPM"} {
      if {[info exist mom_spindle_rpm]} {
         set speed $mom_spindle_rpm
      } else {
         set speed $mom_spindle_speed
      }  
   } elseif {$mom_spindle_mode == "SFM" || $mom_spindle_mode == "SMM"} {
      if {[info exist mom_surface_speed]} {
         set speed $mom_surface_speed
      } else {
         set speed $mom_spindle_speed
      }  
   }
   
  MOM_output_literal "mom_spindle_rpm:$mom_spindle_rpm"
  MOM_output_literal "mom_spindle_maximum_rpm:$mom_spindle_maximum_rpm"
  MOM_output_literal "mom_surface_speed:$mom_surface_speed"
  MOM_output_literal "mom_spindle_speed:$mom_spindle_speed"
   
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
proc UNSET_VARS { args } {
#=============================================================
   if { [llength $args] == 0 } {
return
   }

   foreach VAR $args {
      upvar $VAR var

      global tcl_version

      if [array exists var] {
         if [expr $tcl_version < 8.4] {
            foreach a [array names var] {
               if [info exists var($a)] {
                  unset var($a)
               }
            }
            unset var
         } else {
            array unset var
         }
      }

      if [info exists var] {
         unset var
      }
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


