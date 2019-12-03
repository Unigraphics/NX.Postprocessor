##############################################################################
#
# Created by:  Javi Garcia           11-Mar-2002
# Machine: HWACHEON HI-ECO15A        NC: FANUC 0T
#
# Revision history
# 21-Mar-2002 # Javi Garcia # Initial version
# 02-Apr-2002 # Javi Garcia # Removed G40-G41-G42
# 09-Apr-2002 # Javi Garcia # Tapping cycles added
#
###############################################################################

# DEBUGGER
#  source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl ; MOM_set_debug_mode ON 

source "[MOM_ask_env_var UGII_CAM_POST_DIR]ugpost_base.tcl"


# M codes
  set mom_sys_program_stop_code                 0
  set mom_sys_optional_stop_code                1
  set mom_sys_end_of_program_code               2

  set mom_sys_spindle_direction_code(NONE)      3
  set mom_sys_spindle_direction_code(CLW)       3
  set mom_sys_spindle_direction_code(CCLW)      4
  set mom_sys_spindle_direction_code(OFF)       5

  set mom_sys_coolant_code(FLOOD)               8
  set mom_sys_coolant_code(ON)                  8
  set mom_sys_coolant_code(OFF)                 9

  set mom_sys_clamp_code(ON)                    10
  set mom_sys_clamp_code(OFF)                   11
  set mom_sys_clamp_code(AXISON)                45
  set mom_sys_clamp_code(AXISOFF)               46

  set mom_sys_rotary_tool_direction_code(CLW)   13
  set mom_sys_rotary_tool_direction_code(CCLW)  14
  set mom_sys_rotary_tool_direction_code(OFF)   15

  set mom_sys_tailstock_out_code                25
  set mom_sys_tailstock_in_code                 26

  set mom_sys_program_end_code                  30
  set mom_sys_c_axis_on_code                    45
  set mom_sys_c_axis_off_code                   46
  set mom_sys_spindle_brake_clamp_code          68
  set mom_sys_spindle_brake_unclamp_code        69
  set mom_sys_tailstock_clamp_code              78
  set mom_sys_tailstock_unclamp_code            79
  
# G codes
  set mom_sys_rapid_code                     0
  set mom_sys_linear_code                    1
  set mom_sys_circle_code(CLW)               2
  set mom_sys_circle_code(CCLW)              3

  set mom_sys_delay_code(REVOLUTIONS)        4
  set mom_sys_delay_code(SECONDS)            4

  set mom_sys_polar_mode_on                  12.1
  set mom_sys_polar_mode_off                 13.1

  set mom_sys_cutcom_plane_code(XY)          17
  set mom_sys_cutcom_plane_code(ZX)          18
  set mom_sys_cutcom_plane_code(YZ)          19

  set mom_sys_inch_code                      20
  set mom_sys_metric_code                    21

  set mom_sys_ref_point_return_code          28

  set mom_sys_thread_advance_type(CONSTANT)  32

  set mom_sys_spindle_max_rpm_code           50
  set mom_sys_wcs_change_code                53

  set mom_sys_cycle_tap_code_axial           84
  set mom_sys_cycle_tap_code_radial          88
 
  set mom_sys_spindle_mode_code(SFM)         96
  set mom_sys_spindle_mode_code(SMM)         96
  set mom_sys_spindle_mode_code(RPM)         97

  set mom_sys_feedrate_code(IPM)             98
  set mom_sys_feedrate_code(MMPM)            98
  set mom_sys_feedrate_code(IPR)             99
  set mom_sys_feedrate_code(MMPR)            99


# Javi's variables
  set rad2deg [expr 90.0 / asin(1.0)]


# Kin definition
  set mom_kin_machine_resolution           0.001
  set mom_kin_arc_valid_plane              YZ
  set mom_kin_machine_type                 4_axis_table
  set mom_kin_output_unit                  MM
  
  set mom_kin_4th_axis_plane               YZ
  set mom_kin_4th_axis_direction           MAGNITUDE_DETERIMINES_DIRECTION
  set mom_kin_4th_axis_rotation            reverse ; # standard o reverse
  set mom_kin_4th_axis_zero                -90.0
  set mom_kin_4th_axis_center_offset(0)    0.0
  set mom_kin_4th_axis_center_offset(1)    0.0
  set mom_kin_4th_axis_center_offset(2)    0.0
  set mom_kin_4th_axis_min_limit           -360.0
  set mom_kin_4th_axis_max_limit           360.0
    

proc MOM_msys {} { }

proc MOM_from_move {} { }

proc MOM_gohome_move {} { }


proc MOM_start_of_program {} {

  global mom_coolant_mode
  global mom_coolant_status

  catch {unset mom_coolant_mode}
  catch {unset mom_coolant_status}
}


proc MOM_end_of_program {} {

  global mom_output_file_full_name
  global mom_output_file_directory
  global mom_group_name

  MOM_suppress off Y
  MOM_output_literal "M29"
  MOM_output_literal "M30"
  MOM_output_text "%"

# Close the file and rename it

  set nombre [string range $mom_group_name 1 8]
  set nombre [format "%04d" $nombre]
  set extension ".fnt"

  MOM_close_output_file $mom_output_file_full_name
  set new_file $mom_output_file_directory$nombre$extension
  file rename -force $mom_output_file_full_name  $new_file
}


proc MOM_end_of_group {} {

  global toolsaved
  
  MOM_do_template coolant_off
  MOM_output_literal "G28U0.0W0.0T[format "%02d" $toolsaved]00"
  MOM_output_literal "M5"

}


proc MOM_start_of_path {} {

  MOM_force once F
}


proc MOM_end_of_path {} {
}


proc MOM_first_tool {} {

  global toolsaved
  global mom_tool_number

  set toolno [expr ($mom_tool_number * 0.1)]

  MOM_output_literal "B0.0G04X3.0"
  MOM_output_literal "G28U0.0W0.0"
  MOM_force once T B
  MOM_do_template tool_change

  set toolsaved $mom_tool_number

  MOM_do_template spindle_rpm
}


proc MOM_tool_change {} {

  global toolsaved
  global mom_tool_number

  set toolno [expr ($mom_tool_number * 0.1)]

  MOM_do_template spindle_off
  MOM_do_template coolant_off
  MOM_output_literal "B0.0G04X3.0"
  MOM_output_literal "G28U0.0W0.0T[format "%02d" $toolsaved]00"
  MOM_force once T B
  MOM_do_template tool_change

  set toolsaved $mom_tool_number

  MOM_do_template spindle_rpm
}


proc MOM_initial_move {} {

  global mom_coolant_mode
  global mom_coolant_status
  global mom_tool_axis
  global mom_pos r_x angulo_b
  global rad2deg

  MOM_force once  G_motion X Z M_cool F
  if {[info exists mom_coolant_mode]} {
      set mom_coolant_status $mom_coolant_mode
  }

  MOM_force once G_motion
  set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
  set angulo_b [expr atan2($mom_pos(1),$mom_pos(2)) * $rad2deg]
  if {$mom_tool_axis(0) == 0} {
    MOM_do_template rapid_b
  } elseif {$mom_tool_axis(0) == 1} {
    MOM_do_template polar_b
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
  MOM_do_template rapid_polar
}


proc MOM_first_move {} {

  global mom_coolant_mode
  global mom_coolant_status
  global mom_tool_axis
  global mom_pos r_x angulo_b
  global rad2deg

  MOM_force once G_motion
  set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
  set angulo_b [expr atan2($mom_pos(1),$mom_pos(2)) * $rad2deg]
  if {$mom_tool_axis(0) == 0} {
    MOM_do_template rapid_b
  } elseif {$mom_tool_axis(0) == 1} {
    MOM_do_template polar_b
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
  MOM_do_template rapid_polar
}


proc MOM_before_motion {} {

  FEEDRATE_SET
}


proc MOM_linear_move {} {

  global mom_tool_axis
  global mom_pos r_x

  set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
  MOM_do_template linear_polar
}


proc MOM_circular_move {} {

  global mom_seqnum

  MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
  MOM_output_to_listing_device "Arc movement while milling. Not valid"
}


proc MOM_rapid_move {} {

  global mom_coolant_mode
  global mom_coolant_status
  global mom_tool_axis
  global mom_pos r_x
  global rad2deg
  global angulo_b
  
  if {[info exists mom_coolant_mode]} {
    set mom_coolant_status $mom_coolant_mode
  }

  set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
  set angulo_b [expr atan2($mom_pos(1),$mom_pos(2)) * $rad2deg]
  if {$mom_tool_axis(0) == 0} {
    MOM_do_template rapid_b
    MOM_do_template rapid_polar
  } elseif {$mom_tool_axis(0) == 1} {
    MOM_do_template polar_b
    MOM_do_template rapid_polar
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
}


proc MOM_load_tool {} { }

proc MOM_sequence_number {} { }


proc MOM_cutcom_on {} {

  global mom_seqnum

  MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
  MOM_output_to_listing_device "Tool diameter compensation not supported"
}


proc MOM_cutcom_off {} { }


proc MOM_spindle_rpm {} {

   MOM_do_template spindle_rpm
}


#proc MOM_spindle_css {} { }


proc MOM_spindle_off {} { MOM_do_template spindle_off }

proc MOM_coolant_on {} { MOM_do_template coolant_on }

proc MOM_coolant_off {} { MOM_do_template coolant_off }

proc MOM_opstop {} { MOM_do_template opstop }

proc MOM_operator_message {} { }

proc MOM_stop {} { MOM_do_template stop }

proc MOM_delay {} { MOM_do_template delay }

proc MOM_auxfun {} { MOM_do_template auxiliary }

proc MOM_prefun {} { MOM_do_template preparatory }

proc MOM_length_compensation {} { }

proc MOM_tool_preselect {} { }


proc MOM_catch_warning { } {
  global mom_warning_info
  global mom_seqnum

  MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
  MOM_output_to_listing_device "$mom_warning_info"
}


proc MOM_cycle_off {} { }

proc MOM_tap {} { }

proc MOM_tap_move {} {

  global mom_tool_axis
  global mom_pos r_x

  set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
  
  MOM_force once G_motion

  if {$mom_tool_axis(0) == 0} {
    MOM_force once X
    MOM_do_template thread_radial
  } elseif {$mom_tool_axis(0) == 1} {
    MOM_force once Z
    MOM_do_template thread_axial
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
}
