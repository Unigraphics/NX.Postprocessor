########################## TCL Event Handlers ##########################
#
#  Created by suyo  @  Fri Aug 04 13:44:20 2006 China Standard Time
#  with Post Builder version  3.5.0.
#
########################################################################


  set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]


  if { ![info exists mom_sys_post_initialized] } {

     source ${cam_post_dir}ugpost_base.tcl
 
 
     set mom_sys_debug_mode ON
 
 
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
  set mom_sys_cutcom_code(LEFT)                 "42" 
  set mom_sys_cutcom_code(RIGHT)                "41" 
  set mom_sys_adjust_code                       "43" 
  set mom_sys_adjust_code_minus                 "44" 
  set mom_sys_adjust_cancel_code                "49" 
  set mom_sys_unit_code(IN)                     "20" 
  set mom_sys_unit_code(MM)                     "21" 
  set mom_sys_cycle_drill_break_chip_code       "83.5"
  set mom_sys_cycle_off                         "80" 
  set mom_sys_cycle_drill_code                  "83" 
  set mom_sys_cycle_drill_deep_code             "83.6"
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
  set mom_sys_feed_rate_mode_code(MMPM)         "98" 
  set mom_sys_feed_rate_mode_code(MMPR)         "99" 
  set mom_sys_program_stop_code                 "0"  
  set mom_sys_optional_stop_code                "1"  
  set mom_sys_end_of_program_code               "2"  
  set mom_sys_spindle_direction_code(CLW)       "4"  
  set mom_sys_spindle_direction_code(CCLW)      "3"  
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
  set mom_sys_lathe_i_factor                    "-1" 
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
  set mom_sys_feed_param(MMPM,format)           "Feed_MMPM"
  set mom_sys_feed_param(MMPR,format)           "Feed_MMPR"
  set mom_sys_lathe_y_factor                    "1"  
  set mom_sys_post_description                  "Mori Seiki NT4200  Lower Turret Main Spindle Turning\n\
                                                 Head Name:  turning"
  set mom_sys_ugpadvkins_used                   "0"

####### KINEMATIC VARIABLE DECLARATIONS ##############
  set mom_kin_arc_output_mode                   "QUADRANT"
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
  set mom_kin_min_arc_length                    "0.01"
  set mom_kin_min_arc_radius                    "0.0001"
  set mom_kin_min_fpm                           "0.1"
  set mom_kin_min_fpr                           "0.001"
  set mom_kin_min_frn                           "0.001"
  set mom_kin_output_unit                       "IN" 
  set mom_kin_pivot_gauge_offset                "0.0"
  set mom_kin_post_data_unit                    "IN" 
  set mom_kin_rapid_feed_rate                   "1181.1"
  set mom_kin_tool_change_time                  ""   
  set mom_kin_x_axis_limit                      "10.2"
  set mom_kin_y_axis_limit                      "0"  
  set mom_kin_z_axis_limit                      "23.2"




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


#=========================
# Linked posts definition
#=========================
 set mom_sys_master_post   "[file rootname $mom_event_handler_file_name]"
 set mom_sys_master_head                       "TURN_LOWER_MAIN"

 set mom_sys_postname(TURN_LOWER_MAIN)         "$mom_sys_master_post"
 set mom_sys_postname(MILL_LOWER_MAIN)         "MS_NL1500Y_mill_in"


#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   MOM_do_template coolant_off
   MOM_do_template spindle_off
   MOM_do_template output_caxis_release_code
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

    global mom_pos mom_ref_pos
    set mom_pos(0) $mom_ref_pos(0)
    set mom_pos(1) $mom_ref_pos(1)
    set mom_pos(2) $mom_ref_pos(2)

    switch $mom_motion_event {
      circular_move {
        global mom_ref_pos_arc_center mom_pos_arc_center
        if {[hiset mom_ref_pos_arc_center(0)]} {set mom_pos_arc_center(0) $mom_ref_pos_arc_center(0)}
        if {[hiset mom_ref_pos_arc_center(1)]} {set mom_pos_arc_center(1) $mom_ref_pos_arc_center(1)}
        if {[hiset mom_ref_pos_arc_center(2)]} {set mom_pos_arc_center(2) $mom_ref_pos_arc_center(2)}
      }
      from_move {
        global mom_from_ref_pos mom_from_pos
        if {[hiset mom_from_ref_pos(0)]} {set mom_from_pos(0) $mom_from_ref_pos(0)}
        if {[hiset mom_from_ref_pos(1)]} {set mom_from_pos(1) $mom_from_ref_pos(1)}
        if {[hiset mom_from_ref_pos(2)]} {set mom_from_pos(2) $mom_from_ref_pos(2)}
      }
      gohome_move {
        global mom_gohome_ref_pos mom_gohome_pos
        if {[hiset mom_gohome_ref_pos(0)]} {set mom_gohome_pos(0) $mom_gohome_ref_pos(0)}
        if {[hiset mom_gohome_ref_pos(1)]} {set mom_gohome_pos(1) $mom_gohome_ref_pos(1)}
        if {[hiset mom_gohome_ref_pos(2)]} {set mom_gohome_pos(2) $mom_gohome_ref_pos(2)}
      }
    }

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


#=============================================================
proc MOM_head { } {
#=============================================================
   global mom_warning_info

   global mom_sys_in_operation
   if { [info exists mom_sys_in_operation] && $mom_sys_in_operation == 1 } {
      global mom_operation_name
      set mom_warning_info "HEAD event should not be assigned to an operatrion ($mom_operation_name)."
      MOM_catch_warning
return
   }

   global mom_head_name mom_sys_postname
   global mom_load_event_handler
   global CURRENT_HEAD NEXT_HEAD
   global mom_sys_prev_mach_head mom_sys_curr_mach_head
   global mom_sys_head_change_init_program

   if { ![info exists CURRENT_HEAD] } {
      set CURRENT_HEAD ""
   }

   if { [info exists mom_head_name] } {
      set NEXT_HEAD $mom_head_name
   } else {
      set mom_warning_info "No HEAD event has been assigned."
      MOM_catch_warning
return
   }

   set head_list [array names mom_sys_postname]
   foreach h $head_list {
      if { [regexp -nocase ^$mom_head_name$ $h] == 1 } {
         set NEXT_HEAD $h
         break
      }
   }


   set tcl_file ""

   if { ![info exists mom_sys_postname($NEXT_HEAD)] } {

      set mom_warning_info "Post is not specified with Head ($NEXT_HEAD)."
      MOM_catch_warning

   } elseif { ![string match "$NEXT_HEAD" $CURRENT_HEAD] } {

      if { [llength [info commands PB_end_of_HEAD__$CURRENT_HEAD]] } {
         PB_end_of_HEAD__$CURRENT_HEAD
      }

      set mom_sys_prev_mach_head $CURRENT_HEAD
      set mom_sys_curr_mach_head $NEXT_HEAD

      set CURRENT_HEAD $NEXT_HEAD


      global mom_sys_master_head mom_sys_master_post cam_post_dir

      if [string match "$CURRENT_HEAD" $mom_sys_master_head] {

         set mom_load_event_handler "\"$mom_sys_master_post.tcl\""
         MOM_load_definition_file   "$mom_sys_master_post.def"

         set tcl_file "$mom_sys_master_post.tcl"

      } else {

         set tcl_file "[file dirname $mom_sys_master_post]/$mom_sys_postname($CURRENT_HEAD).tcl"
         set def_file "[file dirname $mom_sys_master_post]/$mom_sys_postname($CURRENT_HEAD).def"

         if [file exists "$tcl_file"] {

            global tcl_platform

            if [string match "*windows*" $tcl_platform(platform)] {
               regsub -all {/} $tcl_file {\\} tcl_file
               regsub -all {/} $def_file {\\} def_file
            }

            set mom_load_event_handler "\"$tcl_file\""
            MOM_load_definition_file   "$def_file"

         } else {


            set tcl_file "${cam_post_dir}$mom_sys_postname($CURRENT_HEAD).tcl"
            set def_file "${cam_post_dir}$mom_sys_postname($CURRENT_HEAD).def"

            if [file exists "$tcl_file"] {

               set mom_load_event_handler "\"$tcl_file\""
               MOM_load_definition_file   "$def_file"

            } else {
               set mom_warning_info  "Post ($mom_sys_postname($CURRENT_HEAD)) for HEAD ($CURRENT_HEAD) not found."
               MOM_catch_warning
            }
         }
      }


      set mom_sys_head_change_init_program 1

      rename MOM_start_of_program MOM_start_of_program_save
      rename MOM_end_of_program MOM_end_of_program_save
      rename MOM_head MOM_head_save
   }
}


#=============================================================
proc MOM_Head { } {
#=============================================================
   MOM_head
}


#=============================================================
proc MOM_HEAD { } {
#=============================================================
   MOM_head
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
}


#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
   CUTCOM_SET

   global mom_cutcom_adjust_register
   set cutcom_register_min 1
   set cutcom_register_max 99
   if { $mom_cutcom_adjust_register < $cutcom_register_min ||\
        $mom_cutcom_adjust_register > $cutcom_register_max } {
      global mom_warning_info
      set mom_warning_info "CUTCOM register $mom_cutcom_adjust_register must be within the range between 1 and 99"
      MOM_catch_warning
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
   MOM_force Once G_dwell dwell
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

   PB_CMD_end_of_operation
   MOM_do_template opstop
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
   PB_CMD_part_transfer_gohome_detector
   MOM_do_template home_u_axis
   MOM_do_template home_w_axis
}


#=============================================================
proc MOM_initial_move { } {
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   PB_CMD_thread_set_up

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
   PB_CMD_thread_output
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
  global first_linear_move

   if { !$first_linear_move } {
      PB_first_linear_move
      incr first_linear_move
   }

   PB_CMD_thread_check
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
   PB_CMD_thread_check
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

   PB_CMD_turn_start
   PB_CMD_output_path_name
   PB_CMD_unclamp_C_axis
   MOM_do_template output_caxis_release_code
   MOM_do_template output_work_plane_code
   MOM_do_template output_mcs_work_offset_code
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
   MOM_force Once T
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
   MOM_force Once T
   MOM_do_template manual_tool_change
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

   PB_CMD_UDE_UPLEVEL_POLAR_xzc   
   PB_CMD_init_set_polar
   PB_CMD_combine_rotary_init
   
   PB_CMD_init_thread
   PB_CMD_lower_turret_tcode
   MOM_set_seq_off
   PB_CMD_program_header
   PB_CMD_date_time_stamp
   PB_CMD_start_of_program_initial_codes
}


#=============================================================
proc PB_CMD_UDE_UPLEVEL_POLAR_xzc { } {
#=============================================================
uplevel #0 {

#=============================================================
proc MOM_set_polar_xzc { } {
#=============================================================
  global mom_sys_coordinate_calculation_method 
  global mom_kin_arc_output_mode 
  global mom_saved_arc_output_mod
  global mom_lock_axis
  global mom_lock_axis_plane
  global mom_lock_axis_value 
  global mom_lock_axis_value_defined

# Custom Defined in this UGPost
  global mom_coordinate_output_mode
  global current_head_name
  

# MOM_output_text "current_head_name= $current_head_name"
# UDE SETTINGS "XZC Output","C-Axis Mill Rotary Interpolate"
   
   if { $mom_coordinate_output_mode == "XZC OUTPUT" } {
      set mom_kin_arc_output_mode "LINEAR"
      set mom_sys_coordinate_calculation_method "POLAR"

   } elseif { $mom_coordinate_output_mode == "C-AXIS MILL ROTARY INTERPOLATE"} {
      set mom_kin_arc_output_mode "QUADRANT"
      set mom_sys_coordinate_calculation_method "CARTESIAN" 
   }

  MOM_reload_kinematics

  # MOM_output_literal "MOM_set_polar UDE XZC FOR LIVE TOOLING MODE= $mom_coordinate_output_mode"
}
} ; # uplevel
}




#=============================================================
proc PB_CMD_alignment_block { } {
#=============================================================

  MOM_force once X Z M_coolant F G G_feed
  MOM_force once M_spindle S G_spin

  global first_tool_change
  set first_tool_change 1
}


#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
}


#=============================================================
proc PB_CMD_combine_rotary_init { } {
#=============================================================
global mom_kin_read_ahead_next_motion
global combine_mode

set combine_mode "0"
set mom_kin_read_ahead_next_motion 		      "TRUE"
MOM_reload_kinematics
}


#=============================================================
proc PB_CMD_date_time_stamp { } {
#=============================================================
global mom_date

set date1 [string toupper $mom_date]

MOM_output_text "( UGNX POSTING DATE: $date1)"
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
proc PB_CMD_end_of_operation { } {
#=============================================================

MOM_output_literal "G28 U0"
MOM_output_literal "G28 W0"

PB_CMD_reset_all_motion_variables_to_zero
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
proc PB_CMD_head_name_end_operation { } {
#=============================================================

# Custom Tracking System of previous versus current head and previous operation machining mode
 global prev_head_name
 global current_head_name
 global mom_machine_mode
 global last_oper_machine_mode

 set prev_head_name $current_head_name
 set last_oper_machine_mode $mom_machine_mode

# MOM_output_text "END PATH prev_head_name= $prev_head_name"
# MOM_output_text "END PATH last_oper_machine_mode= $last_oper_machine_mode"
}


#=============================================================
proc PB_CMD_head_post_detect_start_operation { } {
#=============================================================
# Custom Tracking System of previous versus current head

global mom_head_name
global CURRENT_HEAD

global mom_machine_mode
global mom_prev_machine_mode

global prev_head_name
global current_head_name
global new_mom_head_name_ucased
global reset_process_trigger
global last_oper_machine_mode

set locally_saved_mom_head_name $mom_head_name

## De-Bug Start
# if { [info exists mom_machine_mode]} {
#    MOM_output_text "A1- NEW START of OPER mom_machine_mode= $mom_machine_mode"
# }

# if { [info exists mom_prev_machine_mode]} {
#    MOM_output_text "A2- PREV OPER mom_prev_machine_mode= $mom_prev_machine_mode"
# }

#### End De-Bug

###############################################

if { [info exists mom_head_name] } {
    if { $mom_head_name == "" } {
        set new_mom_head_name_ucased "NONE"
    } else {       
        set new_mom_head_name_ucased [string toupper $mom_head_name]

         ###### CHANNEL REPORTED AS 1 OR 2 ???  <rws 05-04-06  Needs Investigation>

        if { $new_mom_head_name_ucased == 1 || $new_mom_head_name_ucased == 2 } {
            set new_mom_head_name_ucased "NONE"
            # MOM_output_text "ORIGINAL UGNX mom_head_name is: $locally_saved_mom_head_name" ; # De-Bug only
        }
    }
} else {
    set new_mom_head_name_ucased "NONE"
}

# MOM_output_literal "ENTRY A new_mom_head_name_ucased= $new_mom_head_name_ucased"
# MOM_output_literal "ENTRY B CURRENT_HEAD= $CURRENT_HEAD"
# MOM_output_literal "ENTRY C prev_head_name= $prev_head_name"
# MOM_output_literal "ENTRY D current_head_name= $current_head_name"

if { $new_mom_head_name_ucased == "NONE" } {
  set $current_head_name $prev_head_name
 # MOM_output_literal "BECAUSE OF NONE value of new_mom_head_name_ucased-- THIS JUST SET current_head_name to prev_head_name:  $current_head_name"
  return ; # NOTE RETURN
}

if { $new_mom_head_name_ucased != $prev_head_name } {
    set current_head_name $new_mom_head_name_ucased

    # MOM_output_text "RELOAD VARIABLES HERE WITH TRIGGER $last_oper_machine_mode IS NOW: $current_head_name"
    # MOM_output_literal "ENTRY F current_head_name= $current_head_name" ; # De-Bug Only

    MOM_output_text " " ; # Skip a Line for clarity
    MOM_output_text "(***** NEW UGPOST INVOKED VIA METHOD GROUP: $current_head_name *****)"
}
}


#=============================================================
proc PB_CMD_init_set_polar { } {
#=============================================================
#
#  This custom command will output the NC code necessary to perform G12.1 or
#  G112 type polar coordinate machining.
#
#  It is assumed that the machine tool has a B axis head and a C axis chuck.
#  The tool axis for the entire operation is either 0,0,1 for the main spindle
#  or 0,0,-1 for the sub spindle.  
#
#  All rapid moves will be output in G113 or G13.1 mode with Y always zero.
#  All linear or circular moves will be output in G112 or G12.1 mode with
#  the Y moves being output with the C word address.
#
#
## <rws 05-12-2006> The following outdated
#  XXXX The UDE SET/POLAR,ON must be active in the operation to activate this mode.  
#  XXXX SET/POLAR,OFF returns the post to normal programming.
#
# <rws 05-19-2006 Three Way Polar UDE>
#   UDE SETTINGS  "Cartesian XYZ","AXIAL Z PTP Cycles Polar XC","C-Axis Mill Rotary Interpolate"
#   SET/POLAR_UPPER_HEAD_TABLE   C-AXIS MILL ROTARY INTERPOLATE must be active in the operation to activate G112 mode.  
#   SET/POLAR_UPPER_HEAD_TABLE   CARTESIAN_XYZ returns the post to normal programming.
#   SET/POLAR_UPPER_HEAD_TABLE   AXIAL Z PTP CYCLES POLAR XC uses Lock/Axis Y0 XYPLAN
#
#  Place the custom command PB_CMD_init_set_polar in the start of program
#  event marker of the master post of a linked post.
#
#  Add the following line (without the #) into the custom command 
#  PB_CMD_before_motion.
#
#PB_CMD_set_polar_mode 
#
uplevel #0 {
#  There are several parameters that can be set to control the output.  
#
#  This parameter allows you to control whether you approach the part from
#  positive X or negative X side of the part.  Posible choices are
#  ALWAYS_POSITIVE or ALWAYS_NEGATIVE.
#
set mom_sys_radius_output_mode "ALWAYS_POSITIVE"
#
#  These parameters activate and deactive polar mode.
#
set mom_sys_polar_on_code "G112"
set mom_sys_polar_off_code "G113"
#

#=============================================================
proc CONVERT_POINT_POLAR { input_point tool_axis prev_pos conversion_method converted_point } {
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
   global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit
   global mom_kin_5th_axis_point mom_kin_5th_axis_center_offset
   global mom_kin_5th_axis_ang_offset
   global mom_kin_5th_axis_rotation


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

   if {[info exists mom_kin_5th_axis_point]} {
      VEC3_add temp mom_kin_5th_axis_point temp
   } else {
      VEC3_add temp mom_kin_5th_axis_center_offset temp
   }

   if {( [EQ_is_equal $mom_sys_spindle_axis(2) 1.0] && [EQ_is_equal $ta(2) 1.0] ) || ( [EQ_is_equal $mom_sys_spindle_axis(2) -1.0] && [EQ_is_equal $ta(2) -1.0] )} {

      set v2(0) [expr sqrt(pow($temp(0),2) + pow($temp(1),2))]
      set v2(1) 0.0
      set v2(2) $temp(2)
      set v2(4) [expr ([ARCTAN $temp(1) $temp(0)])*$RAD2DEG*$mom_sys_spindle_axis(2)]
      if {$mom_kin_5th_axis_rotation == "reverse"} {set v2(4) [expr -$v2(4)]}  
      set v2(4) [expr $v2(4) + $mom_kin_5th_axis_ang_offset]
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
      set ap(4) [expr $v2(4) + 180.0]
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
            set mom_warning_info "Fifthh axis rotary angle not valid"
            MOM_catch_warning
         }
      } elseif {$meth == "ALWAYS_NEGATIVE"} {
         if {$ang2bad} {
            set mom_warning_info "Fifth axis rotary angle not valid"
            MOM_catch_warning
         }
         set v2(0) $ap(0)
         set v2(1) $ap(1)
         set v2(2) $ap(2)
         set v2(4) $ap(4)
      } elseif {$ang2bad && $ang1bad} {
         set mom_warning_info "Fifth axis rotary angle not valid"
         MOM_catch_warning
      } elseif {$ang1bad == 1} {
         set v2(0) $ap(0)
         set v2(1) $ap(1)
         set v2(2) $ap(2)
         set v2(4) $ap(4)
      } elseif {!$ang1bad && !$ang2bad} {
         set d1 [LIMIT_ANGLE [expr $v2(4) - $pp(4)]]
         if {$d1 > 180.} {set d1 [expr 360.0 - $d1]}
         set d2 [LIMIT_ANGLE [expr $ap(3) - $pp(4)]]
         if {$d2 > 180.} {set d2 [expr 360.0 - $d2]}
         if {$d2 < $d1} {
           set v2(0) $ap(0)
           set v2(1) $ap(1)
           set v2(2) $ap(2)
           set v2(4) $ap(4)
         }
      }
      return "OK" 
   } else {
      return "INVALID"
   }

return "OK"
}

}
}


#=============================================================
proc PB_CMD_init_thread { } {
#=============================================================

uplevel #0 {

proc MOM_start_of_thread {} {

global mom_sys_thread_mode

set mom_sys_thread_mode "ON"

}

proc MOM_end_of_thread {} {

global mom_sys_thread_mode

set mom_sys_thread_mode "OFF"

}


}
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


     # Execute start of head callback in new post's context.
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
proc PB_CMD_lower_turret_tcode { } {
#=============================================================

global mom_warning_info
global mom_tool_number
global mom_tool_adjust_register
global lower_tcode

set b0 "0"

if { [info exists mom_tool_number] && [info exists mom_tool_adjust_register]} {
   if { $mom_tool_number >99 } {
   
set mom_warning_info "the tool number IS INVALID, It should not be greater than 99"
    #  MOM_catch_warning "$mom_warning_info"
     
#extract the last two number as the tool number

     set len [string length $mom_tool_number]
     set idx [expr $len - 2]
     set mom_tool_number [string range $mom_tool_number $idx end]
     set t1 $mom_tool_number   

    } else { 
   if { $mom_tool_number < 10} {
        set t1 $b0$mom_tool_number
    } else {
        set t1 $mom_tool_number
    }
}
    if { $mom_tool_adjust_register >99 } {
   set mom_warning_info "the tool ajust register IS INVALID, It should not be greater than 99"
      # MOM_catch_warning "$mom_warning_info"

      set len [string length $mom_tool_adjust_register]
      set idx [expr $len - 2]
      set mom_tool_number [string range $mom_tool_adjust_register $idx end]
      set t2 $mom_tool_adjust_register
    } else { 
    if { $mom_tool_adjust_register < 10} {
        set t2 $b0$mom_tool_adjust_register
    } else {
        set t2 $mom_tool_adjust_register
    }
}

    set lower_tcode $t1$t2

} else {
    set lower_tcode "0000"
}
}


#=============================================================
proc PB_CMD_machine_mode_switching_reload { } {
#=============================================================

global last_oper_machine_mode
global mom_machine_mode

## Use this within the Start of Operation to detect switch back from Mill-to-Turn
## Re-load some kinematic settings
## This is a custom proc that uses others
## <rws 05-05-06>


if { [info exists last_oper_machine_mode] && [info exists mom_machine_mode]} {
    if { $last_oper_machine_mode == "MILL" && $mom_machine_mode == "TURN" } {

        PB_CMD_reset_all_motion_variables_to_zero
        set last_oper_machine_mode $mom_machine_mode ; # Avoid redundant resets

        # MOM_output_text "RESET MILL BACK TO TURN HERE"
    }
}
}


#=============================================================
proc PB_CMD_output_path_name { } {
#=============================================================
global mom_path_name

MOM_output_text " " ; # Skip a Line
MOM_set_seq_on
MOM_output_literal "(NX OPER NAME: $mom_path_name)"
MOM_set_seq_off
}


#=============================================================
proc PB_CMD_part_transfer_gohome_detector { } {
#=============================================================
# Use in Lathe Turning GOHOME Event

global transfer_gohome_used
global mom_attr_OPER_TRANSFER

if { [info exists mom_attr_OPER_TRANSFER] && $mom_attr_OPER_TRANSFER != "" } {
    # MOM_output_literal "mom_attr_OPER_TRANSFER $mom_attr_OPER_TRANSFER"
    set transfer_gohome_used 1
    MOM_abort_event
} else {
    set transfer_gohome_used 0
}
}


#=============================================================
proc PB_CMD_part_transfer_unset_variables { } {
#=============================================================

 global skip_tool_name_output_transfer_mode
 global skip_tool_number_output_transfer_mode
 global part_transfer_start
 global transfer_gohome_used
 global mom_attr_OPER_TRANSFER

 catch {unset skip_tool_name_output_transfer_mode}
 catch {unset skip_tool_number_output_transfer_mode}
 catch {unset part_transfer_start}
 catch {unset transfer_gohome_used}
 catch {unset mom_attr_OPER_TRANSFER}
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
#  Program Header with Tape Number
#
#  This procedure will output a program header with the following format:
#
#  Attribute assigned to program (Name of program group)
#  O0001 (NC_PROGRAM)
#
#  Place this custom command in the start of program event marker.  This 
#  custom command must be placed after any intial codes (such as #).  The
#  custom comand MOM_set_seq_off must precede this custom command to 
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
global mom_run_number 
global mom_attr_PROGRAMVIEW_PROGRAM_1
global mom_attr_PROGRAMVIEW_PROGRAM_2
global program_header_output

if [info exists program_header_output] { return }
if ![info exists mom_run_number] {set mom_run_number 1}

set program_header_output 1

if {![info exists mom_attr_PROGRAMVIEW_PROGRAM_1]} {set mom_attr_PROGRAMVIEW_PROGRAM_1 "O0001"}
if {![info exists mom_attr_PROGRAMVIEW_PROGRAM_2]} {set mom_attr_PROGRAMVIEW_PROGRAM_2 "O0002"}

MOM_set_seq_off

switch $mom_run_number {
                       1 {MOM_output_literal "$mom_attr_PROGRAMVIEW_PROGRAM_1"}
                       2 {MOM_output_literal "$mom_attr_PROGRAMVIEW_PROGRAM_2"}
                       }
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
proc PB_CMD_spindle_sfm_prestart { } {
#=============================================================

  global mom_spindle_mode
  global spindle_is_out
  global mom_spindle_speed

  if {$mom_spindle_mode == "SFM" || $mom_spindle_mode == "SMM"} {
    if { $mom_spindle_speed > 0} {
        MOM_force once G_spin M_spindle S
        MOM_do_template spindle_rpm_preset
    }

  } else {
    if { $mom_spindle_speed > 0} {
        MOM_force once G_spin M_spindle S
        MOM_do_template spindle_rpm
    }
    set spindle_is_out 1
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
proc PB_CMD_start_of_program_initial_codes { } {
#=============================================================

   MOM_force Once G_motion G_feed
   MOM_do_template output_inch_metric_code
   MOM_do_template output_rapid_G0_code
   MOM_do_template output_cutcom_off_code
   MOM_do_template output_ipr_feed_code
   
  # MOM_force Once M
  # MOM_do_template output_caxis_release_code   

   global count_paths_used
   set    count_paths_used 0

   global cycle_hole_counter
   set    cycle_hole_counter 0

   global csys_mode
   set    csys_mode "OFF"

   global need_tool_change
   set    need_tool_change 1

   global saved_lock_yaxis_setting  
   set    saved_lock_yaxis_setting "FALSE"  

## prev_head_name and current_head_name are custom implementation
   global prev_head_name
   set    prev_head_name "NONE"

   global current_head_name
   set    current_head_name "NONE"

   global mom_kin_coordinate_system_type
   set    mom_kin_coordinate_system_type "LOCAL"


# Up-Date this variable at the end of operation-  channels not considered
#  mom_prev_machine_mode -- does not reset last end of operation situation

##  Setttings:  "NONE" (start program default) SAME TURN_OPER  MILL_OPER
   global last_oper_machine_mode
   set    last_oper_machine_mode "NONE"

   # Values in design -- "VOID" - No reload of variables procs to be called
   #                     "MT_A" - Milling Process reverting back to Turning

   global reset_process_trigger
   set    reset_process_trigger "VOID"
#########
}


#=============================================================
proc PB_CMD_thread_check { } {
#=============================================================

global mom_sys_thread_mode
global mom_motion_type

if {[info exists mom_sys_thread_mode]} {
    if {[info exists mom_motion_type]} {
        if {$mom_motion_type == "RETURN" } {
            set mom_sys_thread_mode "OFF"
        }
    }

# MOM_output_literal "mom_sys_thread_mode= $mom_sys_thread_mode"

    if {$mom_sys_thread_mode == "ON"} {
        MOM_abort_event
    }
}
}


#=============================================================
proc PB_CMD_thread_output { } {
#=============================================================
global mom_lathe_thread_lead_i mom_lathe_thread_lead_k 


if {$mom_lathe_thread_lead_i == 0} {
  MOM_suppress once Z ; MOM_force once X
} elseif {$mom_lathe_thread_lead_k == 0} {
  MOM_suppress once X ; MOM_force once Z
} else {
  MOM_force once X ; MOM_force once Z
}

global force_G92_block_once

if {$force_G92_block_once == "0"} {
  set force_G92_block_once "1"
  MOM_force once G X Z F
}
}


#=============================================================
proc PB_CMD_thread_set_up { } {
#=============================================================
global mom_operation_type

if {$mom_operation_type == "Turn Threading" || $mom_operation_type == "Lathe Thread" } {

MOM_output_literal "M24"

}
}


#=============================================================
proc PB_CMD_tool_change { } {
#=============================================================
  global mom_tool_number
  global mom_tool_adjust_register
  
  MOM_output_literal "G0 T$mom_tool_number$mom_tool_adjust_register"
}


#=============================================================
proc PB_CMD_tool_name { } {
#=============================================================
  global mom_oper_tool
  global mom_tool_name

  if {$mom_oper_tool != "NONE"} {
      MOM_output_literal "(*** NX TOOL NAME: $mom_tool_name ***)"
  }
}


#=============================================================
proc PB_CMD_turn_start { } {
#=============================================================
  global mom_sys_init_turn_start
  global mom_tool_axis
  global work_plane

 if { [EQ_is_equal $mom_tool_axis(2) 0.0] } {
    set work_plane 19
 } else {
    set work_plane 17
 }

  global spindle_is_out
  catch {unset spindle_is_out}

  MOM_force once G_motion G_feed X Z F


  if [info exist mom_sys_turn_mill_start] [return]

  set mom_sys_init_turn_start "1"
}


#=============================================================
proc PB_CMD_unclamp_C_axis { } {
#=============================================================

MOM_output_literal "M69"
}


#=============================================================
proc PB_CMD_xzc_spindle_axis { } {
#=============================================================
uplevel #0 {

#=============================================================
proc MOM_head_change { } {
#=============================================================
MOM_first_head
}
#=============================================================
proc MOM_first_head { } {
#=============================================================

  global mom_kin_machine_type

  if [info exists mom_kin_machine_type] {
     if { [string match "*3_axis_mill_turn*" $mom_kin_machine_type] } {

        global mom_head_spindle_axis
        global mom_kin_spindle_axis
        global mom_sys_spindle_axis

        VMOV 3 mom_head_spindle_axis mom_kin_spindle_axis
        VMOV 3 mom_head_spindle_axis mom_sys_spindle_axis

        global mom_cycle_spindle_axis
        global mom_kin_caxis_rotary_pos

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
        MOM_reload_kinematics
     }
  }
}
}
}

#=============================================================
proc PB_CMD_reset_all_motion_variables_to_zero { } {
#=============================================================
   global mom_prev_pos
   global mom_pos
   global mom_prev_out_angle_pos
   global mom_out_angle_pos
   global mom_prev_rot_ang_4th
   global mom_prev_rot_ang_5th
   global mom_rotation_angle
   
   set mom_prev_pos(0) 0.0
   set mom_prev_pos(1) 0.0
   set mom_prev_pos(2) 0.0
   set mom_prev_pos(3) 0.0
   set mom_prev_pos(4) 0.0

   set mom_pos(0) 0.0
   set mom_pos(1) 0.0
   set mom_pos(2) 0.0
   set mom_pos(3) 0.0
   set mom_pos(4) 0.0

    set mom_prev_out_angle_pos(0) 0.0
    set mom_prev_out_angle_pos(1) 0.0
  
    set mom_out_angle_pos(0) 0.0
    set mom_out_angle_pos(1) 0.0

    set mom_prev_rot_ang_4th 0.0
    set mom_prev_rot_ang_5th 0.0

    set mom_rotation_angle 0.0

    MOM_reload_variable -a mom_prev_pos
    MOM_reload_variable -a mom_pos
    MOM_reload_variable -a mom_prev_out_angle_pos
    MOM_reload_variable -a mom_out_angle_pos   ;  # no effect
    MOM_reload_variable mom_prev_rot_ang_4th
    MOM_reload_variable mom_prev_rot_ang_5th
    MOM_reload_variable mom_rotation_angle

    MOM_reload_kinematics

# MOM_output_text "ALL MOTION VARIABLES RE-LOADED THIS IS MASTER POST"
# MOM_output_text " Name of proc-- PB_CMD_reset_all_motion_variables_to_zero"
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


