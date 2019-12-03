##############################################################################
#
# MAchine: MAZAK VARIAXIS 630 5X
#
# Created by Javi Garcia - 28-Sep-2006 - javi.garcia@ugs.com
#
##############################################################################


# source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl ; MOM_set_debug_mode ON


#   G code declaration

set mom_sys_rapid_code                      0
set mom_sys_linear_code                     1
set mom_sys_circle_code(CLW)                2
set mom_sys_circle_code(CCLW)               3

set mom_sys_feed_rate(CINCO)                93
set mom_sys_feed_rate(TRES)                 94


#   JG variables

set jg_feed                                 TRES
set feed_calculado                          0
set max_feed_calculado                      1000000.0
set jg_5ejes                                NO
set jg_AC_lock                              SI
set jg_ret_dist                             150
set jg_app_dist                             5
set jg_arc_radio                            0


# Kin definition

set mom_kin_rapid_Feed_rate                    15000
set mom_kin_machine_resolution                 0.001
set mom_kin_machine_type                       5_axis_dual_table
set mom_kin_pivot_gauge_offset                 0
set mom_kin_linearization_tol                  0.01
set mom_kin_linearization_flag                 T   ; # T ON, F OFF
set mom_kin_output_unit                        MM
set mom_kin_arc_output_mode                   "LINEAR"
#set mom_kin_arc_output_mode                   "FULL_CIRCLE"
set mom_kin_arc_valid_plane                   "XY"
set mom_kin_max_arc_radius                    "9999.999"
set mom_kin_min_arc_radius                    "0.1"

set mom_kin_4th_axis_plane                     YZ
set mom_kin_4th_axis_min_incr                  0.001
set mom_kin_4th_axis_min_limit                 -120.0
set mom_kin_4th_axis_max_limit                 30.0
# set mom_kin_4th_axis_rotation                  reverse
set mom_kin_4th_axis_rotation                  standard
set mom_kin_4th_axis_direction                 MAGNITUDE_DETERMINES_DIRECTION
# set mom_kin_4th_axis_direction                 SIGN_DETERMINES_DIRECTION
set mom_kin_4th_axis_zero                      0
set mom_kin_4th_axis_center_offset(0)          0
set mom_kin_4th_axis_center_offset(1)          0
set mom_kin_4th_axis_center_offset(2)          0
set mom_kin_4th_axis_ang_offset                0.0
set mom_kin_4th_axis_limit_action              Warning
set fourth_axis_leader                         A
# set mom_kin_4th_axis_incr_switch               OFF
set mom_kin_4th_axis_type                      Table

set mom_kin_5th_axis_plane                     XY
set mom_kin_5th_axis_min_incr                  0.001
set mom_kin_5th_axis_min_limit                 -99999.0
set mom_kin_5th_axis_max_limit                 99999.0
# set mom_kin_5th_axis_rotation                  reverse
set mom_kin_5th_axis_rotation                  standard
set mom_kin_5th_axis_direction                 MAGNITUDE_DETERMINES_DIRECTION
# set mom_kin_5th_axis_direction                 SIGN_DETERMINES_DIRECTION
set mom_kin_5th_axis_zero                      0
set mom_kin_5th_axis_center_offset(0)          0
set mom_kin_5th_axis_center_offset(1)          0
set mom_kin_5th_axis_center_offset(2)          0
set mom_kin_5th_axis_ang_offset                0.0
set mom_kin_5th_axis_limit_action              Warning
set fifth_axis_leader                          C
# set mom_kin_5th_axis_incr_switch               OFF
set mom_kin_5th_axis_type                      Table

#--------------------------------------------------------------------
#--------------------------------------------------------------------

proc  MOM_start_of_program {} {

  global mom_part_name

  MOM_output_literal "(Part: $mom_part_name)"
  MOM_output_literal "(Post : MAZAK VARIAXIS 630 5X)"
  set t [clock seconds]
  set fecha [clock format $t -format "%d.%m.%Y"]
  MOM_output_literal "(Date: $fecha)"
  MOM_output_literal "G80G0G17"
  MOM_output_literal "G40G80G49"
  MOM_output_literal "G59"
  MOM_output_literal "G90"
  MOM_do_template avance_mm            ; # G94
  MOM_output_literal "G53Z0"
  MOM_output_literal "G00X0Y0A0C0"
}

#--------------------------------------------------------------------

proc  MOM_end_of_program {} {

  global mom_group_name
  global mom_path_name
  global mom_output_file_full_name
  global mom_output_file_directory
  global mom_machine_time
  global jg_tiempo_total

  MOM_do_template avance_mm   ; # G94
  MOM_output_literal "G54.2P0G53Z0"
  MOM_do_template desbloquea_a
  MOM_do_template desbloquea_c
  MOM_output_literal "G0A0.C0."
  MOM_do_template bloquea_a
  MOM_do_template bloquea_c
  MOM_output_literal "G90G00G53X0Y0"
  MOM_output_literal "M9"
  MOM_output_literal "M99"
  MOM_output_literal "%"

  set nctime [expr 1.15 * $mom_machine_time]
  MOM_output_literal "[format "(MACHINE TIME: %5.2f MINUTOS)" $nctime]"
  MOM_output_to_listing_device "[format "MACHINE TIME: %5.2f MINUTOS" $nctime]"

  # Close output file and rename it
  if {[info exists mom_group_name]} {
    set nombre $mom_group_name
  } else {
    set nombre $mom_path_name
  }
  set extension ".nc"

  MOM_close_output_file $mom_output_file_full_name
  set new_file $mom_output_file_directory$nombre$extension
  file rename -force $mom_output_file_full_name  $new_file
}

#--------------------------------------------------------------------

proc  MOM_start_of_group {} { }

proc  MOM_end_of_group {} { }

proc  MOM_start_of_path {} {

  global mom_path_name
  global mom_tool_name
  global mom_tool_diameter
  global mom_tool_corner1_radius
  global jg_5ejes mom_operation_type
  global mom_stock_part mom_stock_floor

  set jg_5ejes NO

  if {$mom_operation_type == "Variable-axis Surface Contouring"} { set jg_5ejes SI }
  if {$mom_operation_type == "Zig-Zag Surface"} { set jg_5ejes SI }
  if {$mom_operation_type == "Sequential Mill Main Operation"} { set jg_5ejes SI }

  if {[info exists mom_stock_floor]} {
    set jg_creces [format "XY %2.3lf - Z %2.3lf" $mom_stock_part $mom_stock_floor]
  } else {
    set jg_creces [format "%2.3lf" $mom_stock_part]
  }

  MOM_output_literal "(-------------------------------------)"
  MOM_output_literal "(Operayion: $mom_path_name)"
  MOM_output_literal "(Tool: $mom_tool_name)"
  MOM_output_literal "(Diam: [format "%2.2f" $mom_tool_diameter] Radius: [ format "%2.2f" $mom_tool_corner1_radius])"
  MOM_output_literal "(Stock $jg_creces)"
  MOM_output_literal "(-------------------------------------)"
}

#--------------------------------------------------------------------

proc  MOM_end_of_path {} { }

#--------------------------------------------------------------------

proc  MOM_initial_move {} {

  global jg_5ejes
  global mom_spindle_rpm

  if { $mom_spindle_rpm > 12000 } {
    set mom_spindle_rpm 12000
    MOM_output_to_listing_device " * RPMs changed 12000 *"
    MOM_output_literal "( * RPMs changed to 12000 * )"
  }

  MOM_do_template desbloquea_a
  MOM_do_template desbloquea_c
  MOM_force once  motion_g Z
  MOM_do_template rapid_z
  MOM_force once  S M
  MOM_do_template spindle_on
  MOM_do_template rapid_xyzac
  if {$jg_5ejes == "NO"} {
    MOM_do_template bloquea_a
    MOM_do_template bloquea_c
  }
}

#--------------------------------------------------------------------

proc  MOM_first_move {} {

  global mom_pos mom_prev_pos
  global jg_5ejes jg_AC_lock
  global mom_spindle_rpm

  if {$jg_5ejes == "NO"} { 
    if {($mom_pos(3) != $mom_prev_pos(3)) || ($mom_pos(4) != $mom_prev_pos(4))} {
      MOM_do_template desbloquea_a
      MOM_do_template desbloquea_c
      MOM_do_template rapid_ac
      MOM_do_template bloquea_a
      MOM_do_template bloquea_c
    }
    MOM_do_template rapid_xyz
  } else {
    MOM_do_template desbloquea_a
    MOM_do_template desbloquea_c
    MOM_do_template rapid_xyzac
  }
  if { $mom_spindle_rpm > 12000 } {
    set mom_spindle_rpm 12000
    MOM_output_to_listing_device " * RPMs changed to 12000 *"
    MOM_output_literal "( * RPMs changed to 12000 * )"
  }
  MOM_do_template spindle_on
}

#--------------------------------------------------------------------

proc  MOM_rapid_move {} { MOM_do_template rapid_xyzac }

#--------------------------------------------------------------------

proc  MOM_linear_move {} {

  global jg_5ejes jg_feed
  global feed_calculado max_feed_calculado
  global mom_feed_rate mom_motion_distance

  if {$jg_5ejes == "SI"} {
    set jg_feed "CINCO"  ; # G93
    set feed_calculado [ expr ($mom_feed_rate / $mom_motion_distance) ]
    if {$feed_calculado > $max_feed_calculado} {
      set feed_calculado $max_feed_calculado
    }
    MOM_force once F
    MOM_do_template linear ; # JG_LINEARIZACION
  } else {
    set jg_feed "TRES"   ; # Para G94
    set feed_calculado $mom_feed_rate
    MOM_do_template linear
  }
}

#--------------------------------------------------------------------

proc  MOM_circular_move {} {

  global jg_5ejes jg_feed
  global mom_feed_rate
  global mom_arc_radius mom_arc_angle
  global jg_arc_radio
  global feed_calculado max_feed_calculado

  if { $mom_arc_angle > 180.0 } {
    set jg_arc_radio [ expr -1 * $mom_arc_radius ]
  } else {
    set jg_arc_radio $mom_arc_radius
  }
  if {$jg_5ejes == "SI"} {
    set jg_feed "CINCO"  ; # Para G93
    if {$mom_feed_rate < 0.01} {
      set jg_feed_rate 0.01
    } else {
      set jg_feed_rate $mom_feed_rate
    }
    set feed_calculado [expr ($jg_feed_rate / $mom_arc_radius)]
    if {$feed_calculado > $max_feed_calculado} {
      set feed_calculado $max_feed_calculado
    }
    MOM_force once F
  } else {
    set jg_feed "TRES"   ; # G94
    set feed_calculado $mom_feed_rate
  }
  MOM_do_template circular
}

#--------------------------------------------------------------------

proc  MOM_first_tool {} { }

proc  MOM_tool_change {} {
  MOM_output_literal "M0"
  MOM_output_to_listing_device " * TOOL CHANGE DETECTED *"
  MOM_output_literal "( * TOOL CHANGE DETECTED * )"
}

#--------------------------------------------------------------------

proc MOM_lintol {} { MOM_output_to_listing_device "Linearizando NX" }

#--------------------------------------------------------------------

proc MOM_rotate {} {

  global mom_rotation_angle
  global mom_pos mom_prev_pos
  global mom_out_angle_pos mom_prev_out_angle_pos

  set mom_pos(4) $mom_rotation_angle
  set mom_prev_pos(4) $mom_rotation_angle
  set mom_out_angle_pos(1) $mom_rotation_angle
  set mom_prev_out_angle_pos(1) $mom_rotation_angle
  MOM_reload_variable -a mom_pos
  MOM_reload_variable -a mom_prev_pos
  MOM_reload_variable -a mom_out_angle_pos
  MOM_reload_variable -a mom_prev_out_angle_pos

  MOM_do_template rapid_ac
}

#--------------------------------------------------------------------

proc  MOM_before_motion {} {}
proc  MOM_before_output {} { }
proc  MOM_load_tool {} { }
proc  MOM_sequence_number {} { }
proc  MOM_cutcom_on {} { }
proc  MOM_cutcom_off {} { }
proc  MOM_spindle_rpm {} { }
proc  MOM_spindle_off {} { }
proc  MOM_coolant_on {} { }
proc  MOM_coolant_off {} { }
proc  MOM_opstop {} { }
proc  MOM_stop {} { }
proc  MOM_delay {} { }
proc  MOM_auxfun {} { }
proc  MOM_prefun {} { }
proc  MOM_length_compensation {} { }
proc  MOM_tool_preselect {} { }
proc  MOM_machine_mode {} { }
proc  MOM_set_csys {} { }
proc  MOM_msys {} { }

#--------------------------------------------------------------------

proc MOM_insert {} {
  global mom_Instruction
  MOM_output_literal "$mom_Instruction"
}

proc MOM_pprint {} {
  global mom_pprint
  MOM_output_text "($mom_pprint)"
}

proc MOM_operator_message {} {
  global mom_operator_message
  MOM_output_literal "($mom_operator_message)"
}

proc MOM_text {} {
  global mom_user_defined_text
  MOM_output_literal "($mom_user_defined_text)"
}

#--------------------------------------------------------------------

proc MOM_catch_warning { } {

  global mom_warning_info
  global jg_5ejes

  if {$mom_warning_info == "secondary rotary position being used"} {
    if {$jg_5ejes == "SI"} {
      MOM_output_to_listing_device " * POST RETRACTION *"
      MOM_output_literal "( * POST RETRACTION * )"
      MOM_do_template z_ret
      MOM_do_template rapid_xyac
      MOM_do_template z_app
    } else {
      MOM_output_to_listing_device " * WARNING GENERATED *"
      MOM_output_to_listing_device "$mom_warning_info"
      MOM_output_literal "( AVISO * $mom_warning_info)"
    }
  } else {
    MOM_output_to_listing_device " * WARNING GENERATED *"
    MOM_output_to_listing_device "$mom_warning_info"
    MOM_output_literal "( AVISO * $mom_warning_info)"
  }
}

#--------------------------------------------------------------------
#--------------------------------------------------------------------

###########################################################
########  LINEARIZACION by Javi Garcia  ###################
###########################################################

proc JG_LINEARIZACION  { } {

  global mom_pos mom_out_angle_pos
  global mom_prev_pos mom_prev_out_angle_pos
  global mom_motion_distance
  global pos_x pos_y pos_z pos_a pos_c
  global mom_feed_rate feed_calculado

  set jg_linearization_tol 0.25

  set num_puntos [expr 1 + int($mom_motion_distance/$jg_linearization_tol)]
  set giro_a [expr $mom_out_angle_pos(0) - $mom_prev_out_angle_pos(0) ]
  set giro_c [expr $mom_out_angle_pos(1) - $mom_prev_out_angle_pos(1) ]
  
  if { (abs($giro_a) +  abs($giro_c)) < 0.01} {
    set feed_calculado [ expr ($mom_feed_rate / $mom_motion_distance) ]
    MOM_force once F
    MOM_do_template linear
    return
  }

  set incr_3d [expr $mom_motion_distance/$num_puntos]
  set incr_x [expr ($mom_pos(0) - $mom_prev_pos(0)) / $num_puntos]
  set incr_y [expr ($mom_pos(1) - $mom_prev_pos(1)) / $num_puntos]
  set incr_z [expr ($mom_pos(2) - $mom_prev_pos(2)) / $num_puntos]
  set incr_a [expr $giro_a / $num_puntos]
  set incr_c [expr $giro_c / $num_puntos]

  set feed_calculado [ expr ($mom_feed_rate / $incr_3d) ]

  set contador 1
  while { $contador < $num_puntos} {
    set delta_x [expr $contador * $incr_x]
    set delta_y [expr $contador * $incr_y]
    set delta_z [expr $contador * $incr_z]
    set delta_a [expr $contador * $incr_a]
    set delta_c [expr $contador * $incr_c]
    set pos_x [expr $mom_prev_pos(0) + $delta_x]
    set pos_y [expr $mom_prev_pos(1) + $delta_y]
    set pos_z [expr $mom_prev_pos(2) + $delta_z]
    set pos_a [expr $mom_prev_out_angle_pos(0) + $delta_a]
    set pos_c [expr $mom_prev_out_angle_pos(1) + $delta_c]
    MOM_force once F
    MOM_do_template linearizando
    incr contador
  }

  MOM_force once F
  MOM_do_template linear
}

#--------------------------------------------------------------------
