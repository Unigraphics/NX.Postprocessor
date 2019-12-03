##############################################################################
# 
# Created by:  Javi Garcia     11-Mar-2002
# Machine: MURATEC MT12        NC: FANUC 16T
#
# Revisions
# 21-Mar-2002 # Javi Garcia # Initial version
# 02-Apr-2002 # Javi Garcia # G40-G41-G42
# 09-Apr-2002 # Javi Garcia # Tapping cycle added
# 16-Apr-2002 # Javi Garcia # Spindle locking added as needed
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

  set mom_sys_cutcom_code(OFF)               40
  set mom_sys_cutcom_code(LEFT)              41
  set mom_sys_cutcom_code(RIGHT)             42

  set mom_sys_spindle_max_rpm_code           50
  set mom_sys_wcs_change_code                53

  set mom_sys_cycle_off                      80
  set mom_sys_cycle_tap_code_axial           184
  set mom_sys_cycle_tap_code_radial          188
 
  set mom_sys_spindle_mode_code(SFM)         96
  set mom_sys_spindle_mode_code(SMM)         96
  set mom_sys_spindle_mode_code(RPM)         97

  set mom_sys_feedrate_code(IPM)             98
  set mom_sys_feedrate_code(MMPM)            98
  set mom_sys_feedrate_code(IPR)             99
  set mom_sys_feedrate_code(MMPR)            99


# Javi's variables
  set rad2deg [expr 90.0 / asin(1.0)]
  set rapid_feed_flag                        0


# Kin definition
  set mom_kin_machine_resolution           0.001
  set mom_kin_arc_valid_plane              YZ
  set mom_kin_machine_type                 4_axis_table
  set mom_kin_output_unit                  MM
  set mom_kin_read_ahead_next_motion       1
  
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
  global mom_cutcom_mode
  global mom_cutcom_status

  catch {unset mom_coolant_mode}
  catch {unset mom_coolant_status}
  catch {unset mom_cutcom_mode}
  catch {unset mom_cutcom_status}
}


proc MOM_end_of_program {} {

  global mom_output_file_full_name
  global mom_output_file_directory
  global mom_group_name
  global mom_part_name

  MOM_suppress off Y
  MOM_output_literal "M69"
  MOM_output_literal "M99"
  MOM_output_text "%"

# Close output file, rename it and write variables file

  set nombre [string range $mom_group_name 1 8]
  set nombre2 [expr ($nombre + 1)]
  set nombre [format "%04d" $nombre]
  set nombre2 [format "%04d" $nombre2]
  set lado "l"
  set extension ".mur"
  set part_name [file tail $mom_part_name]
  set part_name [string toupper $part_name]
  set part_name [string range $part_name 0 [expr [string length $part_name] -5] ]

  MOM_close_output_file $mom_output_file_full_name
  set new_file $mom_output_file_directory$nombre$lado$extension

  set data_file_name [MOM_ask_env_var local_ugpost]\\datos_post.txt
  set data_file [open $data_file_name w ]
  puts $data_file "$lado";			# Tipo de post 'l' o 'r'
  puts $data_file "$mom_output_file_full_name";	# Nombre del fichero generado
  puts $data_file "$new_file";                  # Nombre del fichero a generar
  puts $data_file "$nombre";                    # Numero del programa principal
  puts $data_file "$nombre2";                   # Numero del programa pieza
  puts $data_file "$part_name";                 # Nombre de la pieza
  puts $data_file "$mom_output_file_directory";	# Directorio del fichero postprocesado
  close $data_file
  MOM_run_user_function [MOM_ask_env_var local_ugpost]\\mt12_ui.dll ufusr
  MOM_remove_file $mom_output_file_full_name
  MOM_remove_file $data_file_name
}


proc MOM_end_of_group {} {

  global toolsaved

  MOM_output_literal "M111"
  MOM_do_template coolant_off
  MOM_output_literal "G28U0.0W0.0T[format "%02d" $toolsaved]00"
  MOM_output_literal "M15"
  MOM_output_literal "T0100"
}


proc MOM_start_of_path {} {

  MOM_force once F
}


proc MOM_end_of_path {} {

  global rapid_feed_flag
  global mom_tool_axis
  global mom_operation_type

  if {$mom_operation_type == "Point to Point"} {
    MOM_do_template unlock_cabezal
  }

  if {$mom_tool_axis(0) == 0} {
    MOM_output_literal "G07.1C0.0"
  } elseif {$mom_tool_axis(0) == 1} {
    MOM_do_template polar_mode_off
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }

  set rapid_feed_flag 0
}


proc MOM_first_tool {} {

  global toolsaved
  global mom_tool_number

  set toolno [expr ($mom_tool_number * 0.1)]

  MOM_output_literal "G28U0.0W0.0"
  MOM_output_literal "M01"
  MOM_do_template tool_change
  MOM_output_literal "M110B[format "%1.1f" $toolno]03"

  set toolsaved $mom_tool_number

  MOM_do_template spindle_rpm
}


proc MOM_tool_change {} {

  global toolsaved
  global mom_tool_number

  set toolno [expr ($mom_tool_number * 0.1)]

  MOM_output_literal "M111"
  MOM_do_template spindle_off
  MOM_do_template coolant_off
  MOM_output_literal "G28U0.0W0.0T[format "%02d" $toolsaved]00"
  MOM_output_literal "M01"
  MOM_force once T
  MOM_do_template tool_change
  MOM_output_literal "M110B[format "%1.1f" $toolno]03"

  set toolsaved $mom_tool_number

  MOM_do_template spindle_rpm
}


proc MOM_initial_move {} {

  global mom_coolant_mode
  global mom_coolant_status
  global rapid_feed_flag
  global mom_tool_axis
  global mom_pos r_x
  global mom_nxt_motion_event

  MOM_force once  G_motion X Z M_cool F
  if {[info exists mom_coolant_mode]} {
      set mom_coolant_status $mom_coolant_mode
  }

  MOM_force once G_motion
  if {$mom_tool_axis(0) == 0} {
    MOM_output_literal "G07.1C50.0"
    set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
    MOM_do_template rapid_feed_c
  } elseif {$mom_tool_axis(0) == 1} {
    if {$mom_nxt_motion_event != "tap_move"} {
      MOM_do_template polar_mode_on
      MOM_do_template rapid_feed_yz
    }
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }

  set rapid_feed_flag 1

}


proc MOM_first_move {} {

  global mom_coolant_mode
  global mom_coolant_status
  global rapid_feed_flag
  global mom_tool_axis
  global mom_pos r_x

  MOM_force once G_motion
  if {$mom_tool_axis(0) == 0} {
    MOM_output_literal "G07.1C50.0"
    set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
    MOM_do_template rapid_feed_c
  } elseif {$mom_tool_axis(0) == 1} {
    MOM_do_template polar_mode_on
    MOM_do_template rapid_feed_yz
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
  set rapid_feed_flag 1
}


proc MOM_before_motion {} {

  FEEDRATE_SET
}


proc MOM_linear_move {} {

  global mom_tool_axis
  global mom_pos r_x
  global mom_nxt_motion_event mom_cutcom_status
  global mom_operation_type

  if {$mom_nxt_motion_event == "rapid_move"} { set mom_cutcom_status OFF }
  
  if {$mom_tool_axis(0) == 0} {
    set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
    MOM_do_template linear_c
  } elseif {$mom_tool_axis(0) == 1} {
    if {$mom_operation_type == "Point to Point"} {
      MOM_do_template lock_cabezal
      MOM_do_template linear_yz
      MOM_do_template unlock_cabezal
    } else {
      MOM_do_template linear_yz
    }
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
}


proc MOM_circular_move {} {

  global mom_arc_angle
  global mom_arc_radius
  global mom_nxt_motion_event mom_cutcom_status

  if {$mom_nxt_motion_event == "rapid_move"} { set mom_cutcom_status OFF }

  MOM_force once G_motion R
  
  if {$mom_arc_angle*$mom_arc_radius*3.14/180. < 0.01 } {
    MOM_do_template linear
  } elseif {$mom_arc_radius < 0.01 } {
    MOM_do_template linear
  } else {
    if { $mom_arc_angle < 180.0 } {
      MOM_do_template circle_rp
    } else {
      MOM_do_template circle_rn
    }
  }
}


proc MOM_rapid_move {} {

  global mom_coolant_mode
  global mom_coolant_status
  global rapid_feed_flag
  global mom_tool_axis
  global mom_pos r_x
  
  if {[info exists mom_coolant_mode]} {
    set mom_coolant_status $mom_coolant_mode
  }

  if {$mom_tool_axis(0) == 0} {
    set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
    if {$rapid_feed_flag == 1} {
      MOM_do_template rapid_feed_c
    } else {
      MOM_do_template rapid_c
    }
  } elseif {$mom_tool_axis(0) == 1} {
    if {$rapid_feed_flag == 1} {
      MOM_do_template rapid_feed_yz
    } else {
      MOM_do_template rapid_yz
    }
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
}


proc MOM_cycle_off {} { MOM_do_template cycle_off }

proc MOM_tap {} { }

proc MOM_tap_move {} {

  global mom_tool_axis
  global mom_pos r_x

  set r_x [expr sqrt(pow($mom_pos(1),2) + pow($mom_pos(2),2))]
  
  MOM_force once G_motion R Z S F_thread

  if {$mom_tool_axis(0) == 0} {
    MOM_do_template thread_radial
  } elseif {$mom_tool_axis(0) == 1} {
    MOM_do_template polar_mode_on
    MOM_do_template rapid_feed_yz
    MOM_do_template polar_mode_off
    MOM_do_template lock_cabezal
    MOM_do_template thread_axial
    MOM_do_template unlock_cabezal
  } else {
    MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
    MOM_output_to_listing_device "Mill tool axis not valid"
  }
}


proc MOM_load_tool {} { }

proc MOM_sequence_number {} { }

proc MOM_cutcom_on { } { CUTCOM_SET }

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


proc MOM_spindle_rpm {} { MOM_do_template spindle_rpm }

#proc MOM_spindle_css {} { }

proc MOM_spindle_off {} { MOM_do_template spindle_off }

proc MOM_coolant_on {} { MOM_do_template coolant_on }

proc MOM_coolant_off {} { MOM_do_template coolant_off }

proc MOM_opstop {} { MOM_do_template opstop }

proc MOM_operator_message {} {

  global mom_operator_message
         
  if {$mom_operator_message_status == "ON"} {
    MOM_output_literal "#3000=100($mom_operator_message)"
  }
}


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