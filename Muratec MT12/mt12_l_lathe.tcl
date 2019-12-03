##############################################################################
#
# Created by:  Javi Garcia     11-Mar-2002
# Machine: MURATEC MT12        NC: FANUC 16T
#
# Revisions
# 21-Mar-2002 # Javi Garcia # Initial version
# 02-Apr-2002 # Javi Garcia # Removed G40-G41-G42
# 17-Apr-2002 # Javi Garcia # Tapping cycle G184 added
#
###############################################################################


# DEBUGGER
#  source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl ; MOM_set_debug_mode ON 


source [MOM_ask_env_var UGII_CAM_POST_DIR]ugpost_base.tcl


# M codes
set mom_sys_program_stop_code                 0
set mom_sys_optional_stop_code                1
set mom_sys_end_of_program_code               2
  
set mom_sys_spindle_direction_code(CLW)       3
set mom_sys_spindle_direction_code(CCLW)      4
set mom_sys_spindle_direction_code(OFF)       5

set mom_sys_tool_change_code                  6

set mom_sys_coolant_code(MIST)                8
set mom_sys_coolant_code(FLOOD)               8
set mom_sys_coolant_code(TAP)                 8
set mom_sys_coolant_code(ON)                  8
set mom_sys_coolant_code(OFF)                 9


# G codes
set mom_sys_rapid_code                        0
set mom_sys_linear_code                       1
set mom_sys_circle_code(CLW)                  2
set mom_sys_circle_code(CCLW)                 3

set mom_sys_delay_code(REVOLUTIONS)           4
set mom_sys_delay_code(SECONDS)               4

#  set mom_sys_cutcom_plane_code(XY)             17
#  set mom_sys_cutcom_plane_code(ZX)             18
#  set mom_sys_cutcom_plane_code(YZ)             19

set mom_sys_cycle_off                         80
set mom_sys_cycle_tap_code_axial              184

set mom_sys_inch_code                         70
set mom_sys_metric_code                       71

set mom_sys_output_code(ABSOLUTE)             90
set mom_sys_output_code(INCREMENTAL)          91

set mom_sys_spindle_max_rpm_code              50

set mom_sys_feed_rate_mode_code(IPM)          98
set mom_sys_feed_rate_mode_code(MMPM)         98
set mom_sys_feed_rate_mode_code(IPR)          99
set mom_sys_feed_rate_mode_code(MMPR)         99

set mom_sys_spindle_mode_code(SFM)            96
set mom_sys_spindle_mode_code(SMM)            96
set mom_sys_spindle_mode_code(RPM)            97



# Machine Kinematic
set mom_kin_machine_type                   lathe
set mom_kin_machine_resolution             0.001
set mom_kin_arc_valid_plane                XY


# Local global Varaibles
set programa                           0
set toolsaved                          0
set mom_spindle_maximum_rpm         3500
set roscado_activo                     0



proc MOM_start_of_program {} {

#  MOM_output_text "%"
}


proc MOM_end_of_program {} {

  global mom_output_file_full_name
  global mom_output_file_directory
  global mom_group_name
  global mom_part_name

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
  puts $data_file "$new_file";			# Nombre del fichero a generar
  puts $data_file "$nombre";			# Numero del programa principal
  puts $data_file "$nombre2";			# Numero del programa pieza
  puts $data_file "$part_name";			# Nombre de la pieza
  puts $data_file "$mom_output_file_directory";	# Directorio del fichero postprocesado
  close $data_file
  MOM_run_user_function [MOM_ask_env_var local_ugpost]\\mt12_ui.dll ufusr
  MOM_remove_file $mom_output_file_full_name
  MOM_remove_file $data_file_name
}


proc MOM_start_of_group {} {

  global mom_part_name
  global mom_group_name

  set programa [string range $mom_group_name 1 8]
  set a [file tail $mom_part_name]
  set a [string toupper $a]
  set a [string range $a 0 [expr [string length $a] -5] ]
  set b "-L"
  set c $programa ; set programa [expr ($c + 1)]

  MOM_output_text ":[format "%04d" $programa] (PIEZA $a$b)"
}


proc MOM_end_of_group {} {

  global toolsaved
  
  MOM_output_literal "M111"
  MOM_do_template coolant_off
  MOM_output_literal "G28U0.0W0.0T[format "%02d" $toolsaved]00"
  MOM_output_literal "M05"
  MOM_output_literal "T0100"
  MOM_output_literal "M01"
  MOM_output_literal "M99"
}


proc MOM_start_of_path {} {

  global mom_operation_type
  global roscado_activo
  
  if {$mom_operation_type == "Turn Centerline Drilling" } {
    set roscado_activo 1 
  }

  MOM_force once F
}


proc MOM_end_of_path {} { }


proc MOM_first_tool {} {

  global mom_tool_number
  global toolsaved
  global mom_spindle_mode
  global mom_spindle_maximum_rpm

  set toolno [expr ($mom_tool_number * 0.1)]

  MOM_output_literal "M17"
  MOM_output_literal "G28U0.0W0.0"
  MOM_output_literal "M01"
  MOM_do_template tool_change
  MOM_output_literal "M110B[format "%1.1f" $toolno]03"

  set toolsaved $mom_tool_number

  MOM_force once M_spindle
  if {$mom_spindle_mode == "RPM" } {
    MOM_do_template spindle_rpm
  } else {
    MOM_do_template spindle_max
    MOM_do_template spindle_css
  }
}


proc MOM_tool_change {} {

  global mom_tool_number
  global toolsaved
  global mom_spindle_mode
  global mom_spindle_maximum_rpm
  
  set toolno [expr ($mom_tool_number * 0.1)]

  MOM_output_literal "M111"
  MOM_do_template coolant_off
  MOM_output_literal "G28U0.0W0.0T[format "%02d" $toolsaved]00"
  MOM_output_literal "M01"
  MOM_force once T
  MOM_do_template tool_change
  MOM_output_literal "M110B[format "%1.1f" $toolno]03"
  
  set toolsaved $mom_tool_number
  
  MOM_force once M_spindle
  if {$mom_spindle_mode == "RPM" } {
    MOM_do_template spindle_rpm
  } else {
    MOM_do_template spindle_max
    MOM_do_template spindle_css
  }
}


proc MOM_load_tool {} {

#  MOM_do_template tool_change
}


proc MOM_initial_move {} {

  global mom_coolant_status 
  global mom_coolant_mode

  set mom_coolant_status $mom_coolant_mode
 
  MOM_force once  G_motion X Z 
  MOM_suppress once T

  MOM_do_template rapid
}


proc MOM_first_move {} {

  global mom_coolant_status 
  global mom_coolant_mode

  set mom_coolant_status $mom_coolant_mode

  MOM_do_template rapid
}


proc MOM_linear_move {} {

  global roscado_activo

  if {$roscado_activo == 1 } {
    set roscado_activo 0
    MOM_do_template thread_axial
    MOM_do_template cycle_off
  } else {
    MOM_do_template linear
  }

}


proc MOM_circular_move {} {

  global mom_arc_angle
  global mom_arc_radius
  
  if {$mom_arc_angle*$mom_arc_radius*3.14/180. < 0.01 } {
    MOM_do_template linear
  } elseif {$mom_arc_radius < 0.01 } {
    MOM_do_template linear
  } else {
    MOM_force once X
    MOM_force once Z
    MOM_force once R
    if { $mom_arc_angle < 180.0 } {
      MOM_do_template circle_rp
    } else {
      MOM_do_template circle_rn
    }
  }
}


proc MOM_rapid_move {} {

  global mom_coolant_status
  global mom_coolant_mode

  set mom_coolant_status $mom_coolant_mode

  MOM_do_template rapid
}


proc MOM_cycle_off {} { MOM_do_template cycle_off }
#proc MOM_lathe_thread {} { }
#proc MOM_lathe_thread_move {} { MOM_do_template thread_axial }


proc MOM_cutcom_on {} {

  global mom_seqnum

  MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
  MOM_output_to_listing_device "Tool diameter compensation not supported"
}


proc MOM_cutcom_off {} { }


proc MOM_spindle_rpm {} {
  MOM_do_template spindle_rpm
}


proc MOM_spindle_css {} {
  MOM_do_template spindle_max
  MOM_do_template spindle_css
}


proc MOM_spindle_off {} {

  MOM_do_template spindle_off
}


proc MOM_coolant_on {} {

  global mom_coolant_mode
  global mom_coolant_status

#...BUG: mom_coolant_mode default value is not getting set. So 
#...     setting the default value here.

  if {$mom_coolant_status == "SAME"} {
    set mom_coolant_mode FLOOD
  }

  set mom_coolant_status $mom_coolant_mode

  MOM_do_template coolant_on

}


proc MOM_coolant_off {} {

  MOM_do_template coolant_off
}


proc MOM_opstop {} {

  global mom_sys_optional_stop_code
  MOM_output_literal "M$mom_sys_optional_stop_code"
}


proc MOM_stop {} {

  global mom_sys_program_stop_code
  MOM_output_literal "M$mom_sys_program_stop_code"
}


proc MOM_opskip_on {} { }

proc MOM_opskip_off {} { }


proc MOM_delay {} {

  MOM_force once G dwell
  MOM_do_template delay
}


proc MOM_auxfun {} {

  MOM_force once M
  MOM_do_template auxiliary
}


proc MOM_prefun {} {

  MOM_force once G
  MOM_do_template preparatory
}


proc MOM_text {} {

  global mom_user_defined_text

  MOM_output_literal "$mom_user_defined_text" 
}


proc MOM_pprint {} {

  global mom_pprint

  MOM_output_literal "($mom_pprint)"
}


proc MOM_operator_message {} {

  global mom_operator_message
         
  if {$mom_operator_message_status == "ON"} {
    MOM_output_literal "#3000=100($mom_operator_message)"
  }
}


proc MOM_catch_warning { } {
  global mom_warning_info
  global mom_seqnum

  MOM_output_to_listing_device "ERROR * NC Line [format "%5.0f" $mom_seqnum]"
  MOM_output_to_listing_device "$mom_warning_info"
}

proc MOM_msys { } { }
