##############################################################################
# 
# By:  Javi Garcia          16-Jun-2003
# Machine: MORISEIKI        NC: FANUC
#
# Revisions
# 16-06-2003 # Javi Garcia # Initial
# 17-07-2003 # Javi Garcia # Released
# 15-03-2005 # Javi Garcia # Updated to NX3
#
##############################################################################


# DEBUGGER
# source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl ; MOM_set_debug_mode ON

# Machine Kinematic
set mom_kin_machine_resolution             0.001
set mom_kin_arc_output_mode                QUADRANT
set mom_kin_arc_valid_plane                XY
set mom_kin_output_unit                    MM
set mom_kin_read_ahead_next_motion         1

set mom_kin_machine_type                   4_axis_table
set mom_kin_4th_axis_plane                 ZX
set mom_kin_4th_axis_min_incr              0.001
set mom_kin_4th_axis_min_limit             -180.0
set mom_kin_4th_axis_max_limit             180.0
#  set mom_kin_4th_axis_rotation              reverse
set mom_kin_4th_axis_rotation              standard
set mom_kin_4th_axis_direction             MAGNITUDE_DETERMINES_DIRECTION
#  set mom_kin_4th_axis_direction             SIGN_DETERMINES_DIRECTION
set mom_kin_4th_axis_zero                  0
set mom_kin_4th_axis_center_offset(0)      0
set mom_kin_4th_axis_center_offset(1)      0
set mom_kin_4th_axis_center_offset(2)      0

set mom_kin_rapid_feed_rate                10000
set mom_kin_tool_change_time               10.0


# M codes
set mom_sys_program_stop_code              0
set mom_sys_optional_stop_code             1
set mom_sys_end_of_program_code            30

set mom_sys_spindle_direction_code(CLW)    3
set mom_sys_spindle_direction_code(CCLW)   4
set mom_sys_spindle_direction_code(OFF)    5

set mom_sys_tool_change_code               6

set mom_sys_coolant_code(MIST)             8
set mom_sys_coolant_code(FLOOD)            8
set mom_sys_coolant_code(TAP)              8
set mom_sys_coolant_code(ON)               8
set mom_sys_coolant_code(OFF)              9


# G codes
set mom_sys_rapid_code                     0
set mom_sys_linear_code                    1
set mom_sys_circle_code(CLW)               2
set mom_sys_circle_code(CCLW)              3

set mom_sys_cutcom_plane_code(XY)          17
set mom_sys_cutcom_plane_code(ZX)          18
set mom_sys_cutcom_plane_code(YZ)          19

set mom_sys_cutcom_code(OFF)               40
set mom_sys_cutcom_code(LEFT)              41
set mom_sys_cutcom_code(RIGHT)             42

set mom_sys_inch_code                      20
set mom_sys_metric_code                    21

set mom_sys_cycle_off                      80
set mom_sys_cycle_drill                    81
set mom_sys_cycle_ream                     82
set mom_sys_cycle_drill_deep               83
set mom_sys_cycle_drill_break_chip         73
set mom_sys_cycle_tap(CLW)                 84
set mom_sys_cycle_tap(CCLW)                74
set mom_sys_cycle_bore                     76

set mom_sys_output_code(ABSOLUTE)          90
set mom_sys_output_code(INCREMENTAL)       91

set jg_last_B                              0
set tiempo_anterior                        0

##############################
# SHOP DOC

  set jg_html_procs_file t:\\pospro\\rymsa_html_procs.tcl
  if {[file exists $jg_html_procs_file]} {
    source $jg_html_procs_file
    set jg_html_included 1
  } else {
    set jg_html_included 0
  }

##############################


proc  MOM_start_of_program {} { }

proc MOM_end_of_program {} {

  global mom_output_file_full_name
  global mom_output_file_directory
  global mom_group_name
  global mom_machine_time
  global jg_html_included

  if {$jg_html_included==1} { foot_of_html ; close_html_file }

  MOM_do_template rapid_z_clear
  MOM_output_literal "G0 G91 G30 X0. Y0. Z0."
  MOM_output_literal "G0 G90 G28 B0"

  MOM_output_literal "(TOTAL TIME = [format "%4.2f" $mom_machine_time] MINUTES)"
  MOM_output_to_listing_device "Total time = [format "%4.2f" $mom_machine_time] minutes"
  MOM_output_literal "M30"
  MOM_output_text "%"

# Close the file and rename it

  set nombre [string range $mom_group_name 1 8]
  set nombre [format "%04d" $nombre]
  set extension ".nc"

  MOM_close_output_file $mom_output_file_full_name
  set new_file $mom_output_file_directory$nombre$extension
  file rename -force $mom_output_file_full_name  $new_file
}

proc MOM_start_of_group {} {

  global mom_part_name
  global mom_group_name
  global jg_html_included

  if {$jg_html_included==1} { open_html_file ; start_of_html }

  set programa [string range $mom_group_name 1 8]
  set a [file tail $mom_part_name]
  set a [string toupper $a]
  set a [string range $a 0 [expr [string length $a] -5] ]

  MOM_output_text "%"
  MOM_output_text ":[format "%04d" $programa] (PART $a)"
  MOM_output_text "(POSTPROCESOR MORISEIKI HORIZONTAL)"
  MOM_suppress once G_cutcom
  MOM_do_template cutcom_ini
}

proc MOM_end_of_group {} { }

proc  MOM_start_of_path {} {

  global mom_path_name

  MOM_output_literal "(OPERATION: $mom_path_name)"

  MOM_suppress always D

}

proc  MOM_end_of_path {} {
  global mom_machine_time
  global tiempo_anterior
  global jg_html_included

  if {$jg_html_included==1} { put_line_of_html }

  set tiempo_parcial [expr $mom_machine_time - $tiempo_anterior]
  set tiempo_anterior $mom_machine_time

  MOM_output_literal "(PARTIAL TIME= [format "%4.2f" $tiempo_parcial] MINUTOS)"
}

proc MOM_first_tool {} {

  global mom_tool_name
  global mom_tool_number
  global mom_tool_diameter
  global mom_tool_corner1_radius
  global jg_last_B

  MOM_do_template selecciona_hta
  MOM_force once G
  MOM_do_template punto_cambio_hta
  MOM_output_literal "M06"
  MOM_output_literal "M01"

  MOM_output_literal "(TOOL: $mom_tool_name NUMERO: $mom_tool_number)"
  MOM_output_literal "(DIAM: [ format "%2.2f" $mom_tool_diameter] RADIUS: [ format "%2.2f" $mom_tool_corner1_radius])"

  set jg_last_B 0.12345;  # Initialized to an extrange value

  MOM_force once G G_mode G_origen X Y Z F
  MOM_force once S M_spin
}

proc MOM_tool_change {} {

  global mom_tool_name
  global mom_tool_number
  global mom_tool_diameter
  global mom_tool_corner1_radius
  global jg_last_B

  MOM_do_template coolant_off
  MOM_suppress once M_spin
  MOM_do_template spindle_off
  MOM_force once G
  MOM_do_template rapid_z_clear
  MOM_force once G
  MOM_do_template punto_cambio_hta
  MOM_output_literal "M06"
  MOM_output_literal "M01"

  MOM_output_literal "(TOOL: $mom_tool_name NUMERO: $mom_tool_number)"
  MOM_output_literal "(DIAM: [ format  "%2.2f" $mom_tool_diameter] RADIUS: [ format  "%2.2f" $mom_tool_corner1_radius])"

  set jg_last_B 0.12345;  # Initialized to an extrange value

  MOM_force once G G_mode G_origen X Y Z F
  MOM_force once S M_spin
}

proc MOM_msys {} { }
proc MOM_set_csys {} { }

proc  MOM_initial_move {} {

  global mom_cutcom_status
  global mom_pos
  global jg_last_B

  MOM_force once G_mode G_origen B

  if {$mom_pos(3) != $jg_last_B} {
    set jg_last_B $mom_pos(3)
#    MOM_do_template rapid_z_clear
    MOM_do_template origen_giro_b
  } else {
    MOM_do_template origen
  }

  MOM_do_template rapid_00_z_clear
  MOM_force once M_spin
  MOM_do_template spindle_on
  if {$mom_cutcom_status != "OFF"} {
    MOM_force once G_cutcom D
    MOM_do_template rapid_xy_comp
  }
  MOM_do_template rapid_xy
  MOM_do_template rapid_z
}

proc  MOM_first_move {} {

  global mom_cutcom_status
  global mom_pos
  global jg_last_B

  MOM_do_template rapid_z_clear
  MOM_force once G_mode G_origen B
  if {$mom_pos(3) != $jg_last_B} {
    set jg_last_B $mom_pos(3)
  }
  MOM_do_template origen_giro_b

  MOM_do_template spindle_on

  if {$mom_cutcom_status != "OFF"} {
    MOM_force once G_cutcom D
    MOM_do_template rapid_xy_comp
  }

  MOM_do_template rapid
}

proc MOM_linear_move {} {

  MOM_do_template linear
}

proc MOM_rapid_move {} {

  MOM_do_template rapid
}

proc MOM_circular_move {} {

  global mom_arc_angle
  global mom_arc_radius

  if {$mom_arc_angle*$mom_arc_radius*3.14/180. < 0.01 || $mom_arc_radius > 9000} {
     MOM_do_template linear
  } else {
    MOM_force once X Y R
    if { $mom_arc_angle < 180.0 } {
      MOM_do_template circle_rp
    } else {
      MOM_do_template circle_rn
    }
  }
}

proc MOM_catch_warning { } {

  global mom_warning_info

  if { $mom_warning_info == "WARNING: ONE AXIS ARC MOVE; ABORTED TO LINEAR MOVE" } {
    # IGNORE
  } else {
    MOM_output_to_listing_device " * ERROR *"
    MOM_output_to_listing_device "$mom_warning_info"
  }
}

proc MOM_coolant_on {} { MOM_output_to_listing_device "* Coolant is always ON *" }

proc MOM_coolant_off {} { MOM_output_to_listing_device " * Coolant is always ON *" }

proc MOM_cutcom_on { } {
  CUTCOM_SET
  MOM_force once D
}

proc MOM_cutcom_off { } {
  CUTCOM_SET
  MOM_do_template cutcom_off
}

proc CUTCOM_SET {} {

  global mom_cutcom_status mom_cutcom_mode

  if { $mom_cutcom_status == "UNDEFINED" } { return }
  if { $mom_cutcom_status != "OFF" } { set mom_cutcom_status ON }
  if { $mom_cutcom_status == "ON" } {
    if { $mom_cutcom_mode != "" } { set mom_cutcom_status $mom_cutcom_mode }
  }
}

proc MOM_before_motion {} {
  global jg_html_included
  if {$jg_html_included==1} { jg_calcula_limites }
}

proc MOM_machine_mode {} { }

proc MOM_spindle_rpm {} { MOM_do_template spindle_on }

proc MOM_spindle_off {} { MOM_do_template spindle_off }

proc MOM_opstop {} {
   MOM_force once M
   MOM_do_template opstop
}

proc MOM_stop {} {
   MOM_force once M
   MOM_do_template stop
}

proc MOM_delay {} { MOM_output_to_listing_device "* DELAY not supported *" }

proc MOM_auxfun {} {
   MOM_force once M
   MOM_do_template auxiliary
}

proc MOM_prefun {} {
   MOM_force once G
   MOM_do_template preparatory
}

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


#############
# CICLOS
proc MOM_cycle_off {} {
  MOM_do_template cycle_off
}

proc MOM_cycle_plane_change {} { }

proc  MOM_drill {} {
  MOM_force once cycle_g Z R
}

proc  MOM_drill_move {} {

  MOM_do_template cycle_drill
}

proc  MOM_drill_deep {} {
  MOM_force once cycle_g Z R Q
}

proc  MOM_drill_deep_move {} {

  MOM_do_template cycle_drill_deep
}

proc  MOM_drill_break_chip {} {
  MOM_force once cycle_g Z R Q
}

proc  MOM_drill_break_chip_move {} {

  MOM_do_template cycle_drill_break_chip
}

proc  MOM_tap {} {
   MOM_force once cycle_g Z R F
   MOM_force once S_tap
   MOM_do_template spindle_tap
}

proc  MOM_tap_move {} {

  MOM_do_template cycle_tap
}

proc  MOM_drill_dwell {} {
  MOM_force once cycle_g Z R P
}

proc  MOM_drill_dwell_move {} {

  MOM_do_template cycle_ream
}

proc  MOM_bore {} {
   MOM_force once cycle_g Z R Q P
}

proc  MOM_bore_move {} {

  MOM_do_template cycle_bore
}
