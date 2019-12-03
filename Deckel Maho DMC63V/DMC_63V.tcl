################# TCL FILE #####################################
###############################################################
# Description												#
# Postprocessor for machine: DMU-63V with HAIDENHAIN TNC-430	 	#
# Serial number: 											#
# CNC Control: HAIDENHAIN TNC-430 							#
# Software version: 280-473-XX	                                                                                #
#														#
# Revisions												#
#														#
#   Date            		Who				Reason					#
#  01-Mar-2002		Oleg Chizh 		First Release
#														#
# $HISTORY$												#
#														#
###############################################################
# Вызывается системная переменная %UGII_CAM_POST_DIR% которая указывает на каталог
# где находится базовый файл постпроцессора "ugpost_base.tcl"
set cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]
# Вызывается системная переменная %UGII_CAM_DEBUG_DIR% которая указывает на каталог
# где находится отладчик постпроцессоров
set cam_debug_dir [MOM_ask_env_var UGII_CAM_DEBUG_DIR]
# Загружается базовый файл ugpost_base.tcl в котором заданы все основные процедуры
source ${cam_post_dir}/ugpost_base.tcl
# Если убрать коментарий в начале следующей строки, постпроцессор
# вызывается в режиме отладки
# source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_debug.tcl ; source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl ; MOM_set_debug_mode ON

# Задаются базовые G и М коды
set mom_sys_program_stop_code                 				0
set mom_sys_optional_stop_code                				1
set mom_sys_end_of_program_code               				2
set mom_sys_spindle_direction_code(CLW)       			3
set mom_sys_spindle_direction_code(CCLW)      			4
set mom_sys_spindle_direction_code(OFF)       				5
set mom_sys_coolant_code(MIST)                				8
set mom_sys_coolant_code(ON)                  				25
set mom_sys_coolant_code(TAP)                 				8
set mom_sys_coolant_code(FLOOD)               				25
set mom_sys_coolant_code(OFF)                 				9
set mom_sys_rewind_code                       					30
set mom_sys_leader(fourth_axis)               					A
set mom_short_rotation								126
# Следующие переменные описывают кинематику станка
set mom_kin_4th_axis_ang_offset               				0.0
set mom_kin_4th_axis_center_offset(0)         				0.0
set mom_kin_4th_axis_center_offset(1)         				0.0
set mom_kin_4th_axis_center_offset(2)         				0.0
set mom_kin_4th_axis_direction                					SIGN_DETERMINES_DIRECTION
set mom_kin_4th_axis_leader                   					A
set mom_kin_4th_axis_max_limit                					5400.0
set mom_kin_4th_axis_min_incr                 					0.001
set mom_kin_4th_axis_min_limit                					-5400.0
set mom_kin_4th_axis_limit_action             					Retract
set mom_kin_4th_axis_plane                    					YZ
set mom_kin_4th_axis_rotation                 					standard
set mom_kin_4th_axis_type                     					table
set mom_kin_4th_axis_zero                     					0.0
set mom_kin_5th_axis_leader                   					C
set mom_kin_arc_output_mode                   					FULL_CIRCLE
set mom_kin_arc_valid_planes                  					XYZ
set mom_kin_clamp_time                        					2.0
set mom_kin_flush_time                        					2.0
set mom_kin_linearization_flag                					1
set mom_kin_linearization_tol                 					0.02
set mom_kin_machine_resolution                				0.001
set mom_kin_machine_type                      				 	3_axis_mill
set mom_kin_max_arc_radius                    					99999.999
set mom_kin_min_arc_radius                    					0.001
set mom_kin_output_unit                       					MM
set mom_kin_post_data_unit                    					MM
set mom_kin_rapid_feed_rate                   					10000.0
set mom_kin_tool_change_time                  					12.0
set mom_kin_x_axis_limit                      					800.0
set mom_kin_y_axis_limit                      					800.0
set mom_kin_z_axis_limit                      					600.0
set mom_kin_nurbs_output_type						HEIDENHAIN_POLY
#  Задаются переменные для файла листинга
set mom_sys_list_output                       					ON
set mom_sys_header_output                     					ON
set mom_sys_list_file_rows                    					40
set mom_sys_list_file_columns                 					30
set mom_sys_warning_output                    					OFF
set mom_sys_group_output                      					OFF
set mom_sys_list_file_suffix                  					lpt
set mom_list_file_suffix              							lpt
set mom_sys_output_file_suffix                					H
set mom_output_file_suffix                						H
set mom_spindle_speed								1000.0
# Задаются внутренние переменные для этого постпроцессора
set header_check_status								0
set mom_smooth_path								"OFF"
set mom_tolerance_on_off							"OFF"
set mom_small_steps								"OFF"
set status_block_create								0
set mom_point1_pos(0) 								-100.0
set mom_point1_pos(1) 								-100.0
set mom_point1_pos(2) 								-50.0
set mom_point2_pos(0) 								100.0
set mom_point2_pos(1) 								100.0
set mom_point2_pos(2) 								0.0
set mom_offset_block								10.0
set mom_cycle_cam									"0"
set mom_cycle_orient								"0"
set mom_cycle_step3								0.2
set mom_cycle_delay								"0.1"
set mom_from_pos(0)								0.0
set mom_from_pos(1)								0.0
set mom_from_pos(2)								100.0
set mom_pos(0)									-999999.999
set mom_pos(1)									-999999.999
set mom_pos(2)									-999999.999
set mom_prev_pos(0)								-9999999.999
set mom_prev_pos(1)								-9999999.999
set mom_prev_pos(2)								-9999999.999
set length 											0
set accom_length									0
set max_length										9999999999999
set i												1
set mom_divide_by									"NONE"
set accumulated_time								0
set mom_retract_to									"OFFSET"
set mom_offset_dist									100.0
set d_time											0
set cutcom_on 										0

#=============================================================
proc MOM_start_of_program { } {
# Эта процедура вызывается в начале программы
#=============================================================
  	global mom_logname mom_date
  	global mom_coolant_status mom_cutcom_status
  	global mom_clamp_status mom_cycle_status
  	global mom_spindle_status mom_cutcom_plane
  	global mom_cutcom_adjust_register mom_tool_adjust_register
  	global mom_tool_length_adjust_register mom_length_comp_register
  	global mom_flush_register mom_wire_cutcom_adjust_register
  	global mom_output_file_basename file_name

  	set mom_coolant_status UNDEFINED
	set mom_cutcom_status  UNDEFINED
  	set mom_clamp_status   UNDEFINED
  	set mom_cycle_status   UNDEFINED
  	set mom_spindle_status UNDEFINED
  	set mom_cutcom_plane   UNDEFINED

  	catch {unset mom_cutcom_adjust_register}
  	catch {unset mom_tool_adjust_register}
  	catch {unset mom_tool_length_adjust_register}
  	catch {unset mom_length_comp_register}
  	catch {unset mom_flush_register}
  	catch {unset mom_wire_cutcom_adjust_register}

  	OPEN_files ; #открываются файлы вывода (программы ЧПУ) и листинга

  	LIST_FILE_HEADER ; #в файл листинга записывается "шапка"
}
#=============================================================
proc MOM_start_of_group {} {
# Эта процедура вызывается если в UG выбрана группа операций,
# а не одна операция
#=============================================================
	global mom_output_file_basename mom_group_name
	global header_check_status mom_operation_name

	if {[info exists mom_group_name] != 0} {
		set mom_group_name $mom_group_name
	} else {
		set mom_group_name $mom_operation_name
	}
#	set mom_group_name $mom_output_file_basename
	if { $header_check_status == 0} {
		MOM_output_literal "BEGIN PGM $mom_group_name MM"
		set header_check_status 1
	}
}

#=============================================================
proc MOM_block_create { } {
# Эта процедура создает 2-й и 3-й кадры программы ЧПУ, которые задают
# заготовку для визуализации программы в ЧПУ
#=============================================================
	global mom_point1_pos
	global mom_point2_pos
	global header_check_status
	global status_block_create
	global mom_offset_block

	MOM_force once X Y Z
	set mom_point1_pos(0) [expr $mom_point1_pos(0)-$mom_offset_block]
	set mom_point1_pos(1) [expr $mom_point1_pos(1)-$mom_offset_block]
	set mom_point1_pos(2) [expr $mom_point1_pos(2)-$mom_offset_block]
	set mom_point2_pos(0) [expr $mom_point2_pos(0)+$mom_offset_block]
	set mom_point2_pos(1) [expr $mom_point2_pos(1)+$mom_offset_block]
	MOM_do_template start_block
	MOM_do_template end_block
	set status_block_create 1
}
#=============================================================
proc MOM_start_of_path { } {
# Эта процедура вызывается в начале каждой операции
#=============================================================
  	MOM_force once M_spindle S X Y Z R F
}
#=============================================================
proc MOM_nurbs_move { } {
# Эта процедура генерирует перемещение со сплайн интерполяцией
#=============================================================
	global mom_nurbs_point_count
	global mom_nurbs_points
	global mom_nurbs_coefficients
	global xe ye ze
	global ii
	global x0 x1 x2
	global y0 y1 y2
	global z0 z1 z2
	global E_string_x0 E_string_x1 E_string_x2
	global E_string_y0 E_string_y1 E_string_y2
	global E_string_z0 E_string_z1 E_string_z2
	global nurbs_precision
	global comp_value mom_smooth_path

	set E_string_x0 ""
	set E_string_x1 ""
	set E_string_x2 ""
	set E_string_y0 ""
	set E_string_y1 ""
	set E_string_y2 ""
	set E_string_z0 ""
	set E_string_z1 ""
	set E_string_z2 ""

	MOM_force once X Y Z K3X K2X K1X K3Y K2Y K1Y K3Z K2Z K1Z

	for {set ii 1} {$ii < [expr $mom_nurbs_point_count-1]} {incr ii} {
		set xe $mom_nurbs_points($ii,0)
		set ye $mom_nurbs_points($ii,1)
		set ze $mom_nurbs_points($ii,2)
		set nurbs_precision 100.0

		set x0 [expr $mom_nurbs_coefficients($ii,0)*$nurbs_precision]
		set x1 [expr $mom_nurbs_coefficients($ii,1)*$nurbs_precision]
		set x2 [expr $mom_nurbs_coefficients($ii,2)*$nurbs_precision]
		set y0 [expr $mom_nurbs_coefficients($ii,3)*$nurbs_precision]
		set y1 [expr $mom_nurbs_coefficients($ii,4)*$nurbs_precision]
		set y2 [expr $mom_nurbs_coefficients($ii,5)*$nurbs_precision]
		set z0 [expr $mom_nurbs_coefficients($ii,6)*$nurbs_precision]
		set z1 [expr $mom_nurbs_coefficients($ii,7)*$nurbs_precision]
		set z2 [expr $mom_nurbs_coefficients($ii,8)*$nurbs_precision]

		set comp_value [expr abs($x0)]

		if { $comp_value  >= 10.0 } {
			set x0 [expr $x0/10.0] ; set E_string_x0 "E1"
		} elseif { $comp_value >= 100.0 } {
			set x0 [expr $x0/100.0] ; set E_string_x0 "E2"
		} elseif { $comp_value >=  1000.0 } {
			set x0 [expr $x0/1000.0] ; set E_string_x0 "E3"
		} else { set E_string_x0 ""}

		set comp_value [expr abs($x1)]

		if { $comp_value >=  10.0} {
			set x1 [expr $x1/10.0] ; set E_string_x1 "E1"
		} elseif { $comp_value >=  100.0} {
			set x1 [expr $x1/100.0] ; set E_string_x1 "E2"
		} elseif { $comp_value >=  1000.0} {
			set x1 [expr $x1/1000.0] ; set E_string_x1 "E3"
		} else {
			set E_string_x1 ""}

		set comp_value [expr abs($x2)]


		if {$comp_value >=  10.0} {
			set x2 [expr $x2/10.0] ; set E_string_x2 "E1"
		} elseif { $comp_value >=  100.0} {
			set x2 [expr $x2/100.0] ; set E_string_x2 "E2"
		} elseif { $comp_value >=  1000.0} {
			set x2 [expr $x2/1000.0] ; set E_string_x2 "E3"
		} else {set E_string_x2 ""}

		set comp_value [expr abs($y0)]

		if {$comp_value >=  10.0} {
			set y0 [expr $y0/10.0] ; set E_string_y0 "E1"
		} elseif { $comp_value >=  100.0} {
			set y0 [expr $y0/100.0] ; set E_string_y0 "E2"
		} elseif { $comp_value >=  1000.0} {
			set y0 [expr $y0/1000.0] ; set E_string_y0 "E3"
		} else {set E_string_y0 ""}

		set comp_value [expr abs($y1)]

		if { $comp_value >=  10.0 } {
			set y1 [expr $y1/10.0] ; set E_string_y1 "E1"
		} elseif { $comp_value >=  100.0 } {
			set y1 [expr $y1/100.0] ; set E_string_y1 "E2"
		} elseif { $comp_value >=  1000.0 } {
			set y1 [expr $y1/1000.0] ; set E_string_y1 "E3"
		} else {set E_string_y1 ""}

		set comp_value [expr abs($y2)]

		if { $comp_value >=  10.0 } {
			set y2 [expr $y2/10.0] ; set E_string_y2 "E1"
		} elseif { $comp_value >=  100.0 } {
			set y2 [expr $y2/100.0] ; set E_string_y2 "E2"
		} elseif { $comp_value >=  1000.0 } {
			set y2 [expr $y2/1000.0] ; set E_string_y2 "E3"
		} else {set E_string_y2 ""}

		set comp_value [expr abs($z0)]

		if { $comp_value >=  10.0 } {
			set z0 [expr $z0/10.0] ; set E_string_z0 "E1"
		} elseif { $comp_value >=  100.0 } {
			set z0 [expr $z0/100.0] ; set E_string_z0 "E2"
		} elseif {$comp_value >=  1000.0} {
			set z0 [expr $z0/1000.0] ; set E_string_z0 "E3"
		} else {set E_string_z0 ""}

		set comp_value [expr abs($z1)]

		if {$comp_value >=  10.0} {
			set z1 [expr $z1/10.0] ; set E_string_z1 "E1"
		} elseif {$comp_value >=  100.0} {
			set z1 [expr $z1/100.0] ; set E_string_z1 "E2"
		} elseif {$comp_value >=  1000.0} {
			set z1 [expr $z1/1000.0] ; set E_string_z1 "E3"
		} else {set E_string_z1 ""}

		set comp_value [expr abs($z2)]

		if { $comp_value >=  10.0 } {
			set z2 [expr $z2/10.0] ; set E_string_z2 "E1"
		} elseif {$comp_value >=  100.0} {
			set z2 [expr $z2/100.0] ; set E_string_z2 "E2"
		} elseif {$comp_value >=  1000.0} {
			set z2 [expr $z2/1000.0] ; set E_string_z2 "E3"
		} else {set E_string_z2 ""}

#		if {$mom_smooth_path == "ON"} {
#			if {$ii == 1} {
#				MOM_do_template start_spline_m90
#			} else {MOM_do_template spline_tnc_m90}
#		} else  {
#			if {$ii == 1} {
#				MOM_do_template start_spline
#			} else {MOM_do_template spline_tnc}
#		}
#
		if {$mom_smooth_path == "ON"} {
			MOM_do_template spline_tnc_m90
		} else  {
			MOM_do_template spline_tnc
		}
#		MOM_do_template spline_tnc
	}
}
#=============================================================
proc MOM_from_move { } {
#=============================================================
  	global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm mom_pos mom_prev_pos

  	COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET ;  MODES_SET
}
#=============================================================
proc MOM_initial_move { } {
#=============================================================
  	global mom_motion_type
  	global mom_pos mom_prev_pos

  		MOM_force Once X Y Z

  	if {$mom_motion_type == "RAPID" } {

  	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}

  	} elseif { $mom_motion_type == "CYCLE" } {
  		MOM_rapid_cycle
  	} else {
  		MOM_linear_move
  	}
}
#=============================================================
proc MOM_initial_move_prev { } {
#=============================================================
  	global mom_motion_type
  	global mom_pos mom_prev_pos

#  		MOM_force Once X Y Z F

  	if {$mom_motion_type == "RAPID" } {

	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy_prev
   		MOM_do_template rapid_cycle_z_prev
   	} else {
   		MOM_do_template rapid_cycle_z_prev
   		MOM_do_template rapid_cycle_xy_prev
   	}
  	} elseif { $mom_motion_type == "CYCLE" } {
    			MOM_do_template rapid_cycle_xy_prev
   			MOM_do_template rapid_cycle_z_prev

  	} else {
	        MOM_do_template feedrate_tnc
		MOM_do_template linear_move_prev
  	}
}
#=============================================================
proc MOM_first_move { } {
#=============================================================
  	global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  	global mom_kin_max_fpm mom_pos mom_prev_pos

  	COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET ;  MODES_SET
	if {[info exists mom_kin_max_fpm] != 0} {
	if {$mom_feed_rate >= $mom_kin_max_fpm}  {MOM_rapid_move ; return}}
	if {$mom_motion_type == "RAPID"} {MOM_rapid_move} else {MOM_linear_move}

	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
	}
}

#=============================================================
proc MOM_end_of_path { } {
#=============================================================
}
#=============================================================
proc MOM_end_of_program { } {
#=============================================================
   	global mom_group_name mom_machine_time line1 d_time

    	MOM_output_literal "M30"
	set line1 [format "; MACHINE TIME = %.2f " $mom_machine_time]
    	MOM_output_literal "$line1"
    	set mom_group_name [string toupper $mom_group_name]
	MOM_output_literal "END PGM $mom_group_name MM"

  	LIST_FILE_TRAILER

  	CLOSE_files
}
#=============================================================
proc MOM_set_modes { } {
#=============================================================
  	MODES_SET
}
#=============================================================
proc MOM_first_tool { } {
#=============================================================
}
#=============================================================
proc MOM_load_tool { } {
#=============================================================
}
#=============================================================
proc MOM_msys { } {
#=============================================================
	global mom_spindle_speed
	global status_block_create mom_tolerance_on_off

	if {$status_block_create == "0"} {
		MOM_block_create
	}
	if {$mom_tolerance_on_off == "ON"} {
  		MOM_do_template tolerances_1
  		MOM_do_template tolerances_2
  	}
	MOM_spindle_rpm
}

#=============================================================
proc MOM_spindle_rpm { } {
#=============================================================
	global mom_tool_number
	global mom_spindle_speed
	global line
	global mom_tool_name mom_tool_diameter

   	set line [format "TOOL CALL %d Z S%.0f ; TOOL NAME = %s RADIUS = %.2f" $mom_tool_number $mom_spindle_speed $mom_tool_name [expr $mom_tool_diameter/2]]
   	MOM_output_literal "$line"
   	MOM_do_template spindle_rpm
    	MOM_do_template coolant_on
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
#    	MOM_do_template coolant_on
}
#=============================================================
proc MOM_coolant_off { } {
#=============================================================
  	COOLANT_SET
    	MOM_do_template coolant_off
}
#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
	global mom_cutcom_mode
	global cutcom_mode
	global mom_cutcom_status
	global cutcom_on

	set cutcom_mode "R"
   	if {$mom_cutcom_mode == "OFF"} {
      		set cutcom_mode "0"
   	} elseif {$mom_cutcom_mode == "RIGHT"} {
      		set cutcom_mode "R"
   	} elseif {$mom_cutcom_mode == "LEFT"} {
      		set cutcom_mode "L"
   	} elseif {$mom_cutcom_mode == "ON"} {
      		set cutcom_mode "R"
   	}
   	if {$mom_cutcom_status == "OFF"} {
   		set 	cutcom_mode "0"
   	}
   	set cutcom_on 1
}
#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
	global cutcom_mode
	set cutcom_mode "0"
	set cutcom_on 0
	MOM_force once R
}
#=============================================================
proc MOM_linear_move { } {
#=============================================================
	global cutcom_mode mom_cutcom_mode mom_cutcom_status
	global mom_pos mom_prev_pos
	global mom_smooth_path mom_small_steps
	global mom_motion_distance mom_tool_diameter
	global cutcom_on

	MOM_do_template feedrate_tnc

	if {$mom_small_steps == "ON" 		&&
		$mom_cutcom_status == "ON"	&&
		$mom_motion_distance <= $mom_tool_diameter} {
		MOM_do_template linear_move_m97
	} elseif {$mom_smooth_path == "ON"} {
		if {$cutcom_on == 1} {
			MOM_do_template linear_move
			set cutcom_on 0
		} else {
			MOM_do_template linear_move_m90
		}
	} else  {
		MOM_do_template linear_move
	}
}
#=============================================================
proc MOM_rotate { } {
#=============================================================
	global cutcom_mode
	global mom_pos
	global mom_alt_pos
	global mom_rotate_axis_type
	global mom_rotation_mode
	global mom_rotation_angle
	global mom_rotation_direction

	if {$mom_rotation_mode == "ABSOLUTE" } {
		if {$mom_rotate_axis_type == "AAXIS" } {set mom_pos(3) $mom_rotation_angle }
	}

	MOM_do_template linear_move
}

#=============================================================
proc MOM_circular_move { } {
#=============================================================
	global mom_arc_direction
	global mom_arc_axis

	if {[format "%.6f" $mom_arc_axis(2)] == "1" || [format "%.6f" $mom_arc_axis(2)] == "-1"} {
		MOM_force once XC YC
		MOM_suppress once ZC
	} elseif {[format "%.6f" $mom_arc_axis(1)] == "1" || [format "%.6f" $mom_arc_axis(1)] == "-1"} {
		 MOM_force once XC ZC
		 MOM_suppress once YC
	} elseif {[format "%.6f" $mom_arc_axis(0)] == "1" || [format "%.6f" $mom_arc_axis(0)] == "-1"} {
		 MOM_force once YC ZC
		 MOM_suppress once XC
	}
	MOM_do_template feedrate_tnc
   	MOM_do_template circle_center
   	if {[format "%.6f" $mom_arc_axis(2)] == "1" || [format "%.6f" $mom_arc_axis(2)] == "-1"} {
		 MOM_force once X Y
		MOM_suppress once Z
	} elseif {[format "%.6f" $mom_arc_axis(1)] == "1" || [format "%.6f" $mom_arc_axis(1)] == "-1"} {
		 MOM_force once X Z
		 MOM_suppress once Y
	} elseif {[format "%.6f" $mom_arc_axis(0)] == "1" || [format "%.6f" $mom_arc_axis(0)] == "-1"} {
		 MOM_force once Y Z
		 MOM_suppress once X
	}
   	if { $mom_arc_direction == "CLW"} {
      		MOM_do_template circle_end_cw
   	} elseif { $mom_arc_direction == "CCLW" } {
     		MOM_do_template circle_end_ccw
   	}
}
#=============================================================
proc MOM_rapid_cycle { } {
#=============================================================
	global mom_pos mom_prev_pos

	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
}

#=============================================================
proc MOM_rapid_move { } {
#=============================================================
	MOM_do_template rapid_move
}
#=============================================================
proc MOM_drill { } {
#=============================================================
  	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_feed_to mom_cycle_rapid_to_pos

 	MOM_force once Q200 Q201 Q206 Q202 Q210 Q203 Q204 Q211

  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
  		set 	dwell_at_top 0.1
  	}
  	MOM_do_template cycle_200
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
  	set mom_cycle_feed_to [expr abs($mom_cycle_feed_to)]
  	MOM_do_template tnc_q202
  	MOM_do_template tnc_q210
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
  	MOM_do_template tnc_q211
  	MOM_suppress off    N
}

#=============================================================
proc  MOM_drill_move { } {
#=============================================================
   	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
  	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}

#=============================================================
proc MOM_drill_dwell { } {
#=============================================================
  	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_delay_revs
  	global mom_cycle_feed_to

#  	set mom_cycle_delay 0.1

   	MOM_force once Q200 Q201 Q206 Q202 Q210 Q203 Q204 Q211

  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_200
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
  	set mom_cycle_feed_to [expr abs($mom_cycle_feed_to)]
  	MOM_do_template tnc_q202
  	MOM_do_template tnc_q210
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
  	MOM_do_template tnc_q211
  	MOM_suppress off    N
}

#=============================================================
proc  MOM_drill_dwell_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}

#=============================================================
proc MOM_drill_deep { } {
#=============================================================
  	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to

  	set mom_cycle_cam "0"

   	MOM_force once Q200 Q201 Q206 Q202 Q210 Q203 Q204 Q211 Q212 Q213 Q205 Q208 Q256

  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_203
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
  	MOM_do_template tnc_q202_1
  	MOM_do_template tnc_q210
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
 	MOM_do_template tnc_q212
	set mom_cycle_cam $mom_cycle_cam
  	MOM_do_template tnc_q213
  	MOM_do_template tnc_q205
   	MOM_do_template tnc_q211_1
  	MOM_do_template tnc_q208
	MOM_force once Q256
  	MOM_do_template tnc_q256_1
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_drill_deep_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_drill_break_chip { } {
#=============================================================
 	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to

   	MOM_force once Q200 Q201 Q206 Q202 Q210 Q203 Q204 Q211 Q212 Q213 Q205 Q208 Q256

  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_203
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
  	MOM_do_template tnc_q202_1
  	MOM_do_template tnc_q210
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
 	MOM_do_template tnc_q212
#	set mom_cycle_cam $mom_cycle_cam
  	MOM_do_template tnc_q213
  	MOM_do_template tnc_q205
  	MOM_do_template tnc_q211_1
  	MOM_do_template tnc_q208
	MOM_force once Q256
  	MOM_do_template tnc_q256_1
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_drill_break_chip_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_tap { } {
#=============================================================
	MOM_do_template cycle_17_1
	MOM_do_template cycle_17_2
	MOM_do_template cycle_17_3
	MOM_do_template cycle_17_4
}
#=============================================================
proc  MOM_tap_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

  	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_bore { } {
#=============================================================
 	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to

   	MOM_force once Q200 Q201 Q206 Q203 Q204 Q211 Q208

  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_201
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
 	MOM_do_template tnc_q211_1
   	MOM_do_template tnc_q208
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204_1
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_bore_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_bore_drag { } {
#=============================================================
	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to mom_cycle_orient

   	MOM_force once Q200 Q201 Q206 Q203 Q204 Q211 Q208 Q214

  	set mom_cycle_orient 0
  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_202
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
	MOM_do_template tnc_q211_1
  	MOM_do_template tnc_q208
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
 	MOM_do_template tnc_q214
 	MOM_do_template tnc_q336
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_bore_drag_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_bore_no_drag { } {
#=============================================================
	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to mom_cycle_orient

   	MOM_force once Q200 Q201 Q206 Q203 Q204 Q211 Q208 Q214

    	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_202
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
	MOM_do_template tnc_q211_1
  	MOM_do_template tnc_q208
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
 	MOM_do_template tnc_q214
 	MOM_do_template tnc_q336
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_bore_no_drag_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_bore_manual { } {
#=============================================================
	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to mom_cycle_orient

   	MOM_force once Q200 Q201 Q206 Q203 Q204 Q211 Q208 Q214

  	set mom_cycle_orient 0
  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_202
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
	MOM_do_template tnc_q211_1
  	MOM_do_template tnc_q208
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
 	MOM_do_template tnc_q214
 	MOM_do_template tnc_q336
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_bore_manual_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_bore_dwell { } {
#=============================================================
	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to

   	MOM_force once Q200 Q201 Q206 Q203 Q204 Q211 Q208

  	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_201
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	MOM_do_template tnc_q201
  	MOM_do_template tnc_q206
 	MOM_do_template tnc_q211_1
   	MOM_do_template tnc_q208
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204_1
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_bore_dwell_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_bore_back { } {
#=============================================================
	global dwell_at_top
  	global surface_coordinate
  	global mom_cycle_delay_mode
  	global mom_cycle_delay
  	global mom_cycle_cam
  	global mom_cycle_feed_to mom_cycle_orient
  	global mom_cycle_offset_tool mom_cycle_tool_higth

   	MOM_force once Q200 Q201 Q206 Q203 Q204 Q211 Q208 Q214

  	set mom_cycle_offset_tool 1
   	set mom_cycle_tool_higth 5
    	set surface_coordinate "0.0"
  	set dwell_at_top "0.0"
  	if {$mom_cycle_delay_mode == "OFF"} {
  		set dwell_at_top 0.0
  	} else {
		set 	dwell_at_top $mom_cycle_delay
    	}
  	MOM_do_template cycle_204
  	MOM_suppress always N
  	MOM_do_template tnc_q200
  	set mom_cycle_feed_to [expr abs($mom_cycle_feed_to)]
  	MOM_do_template tnc_q249
  	MOM_do_template tnc_q250
	MOM_do_template tnc_q251
  	MOM_do_template tnc_q252
  	MOM_do_template tnc_q253
	MOM_do_template tnc_q254
  	MOM_do_template tnc_q255
  	MOM_do_template tnc_q203
 	MOM_do_template tnc_q204
 	MOM_do_template tnc_q214
 	MOM_do_template tnc_q336
  	MOM_suppress off    N
}
#=============================================================
proc  MOM_bore_back_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_bore_manual_dwell { } {
#=============================================================
}
#=============================================================
proc  MOM_bore_manual_dwell_move { } {
#=============================================================
	global mom_pos mom_prev_pos mom_cycle_rapid_to mom_cycle_rapid_to_pos

   	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
   	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
  	MOM_do_template cycle_call
}
#=============================================================
proc MOM_sequence_number { } {
#=============================================================
}
#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
}

#=============================================================
proc PB_approach_move { } {
#=============================================================
}
#=============================================================
proc PB_engage_move { } {
#=============================================================
}
#=============================================================
proc PB_first_cut { } {
#=============================================================
}
#=============================================================
proc PB_return_move { } {
#=============================================================
}
#=============================================================
proc MOM_gohome_move { } {
#=============================================================
	global mom_pos
	global mom_prev_pos
	global mom_mcs_goto
	global number_rotate_table
	global part_rotate_table
	set mom_pos(0)	$mom_mcs_goto(0)
	set mom_pos(1)	$mom_mcs_goto(1)
	set mom_pos(2)	$mom_mcs_goto(2)
	set mom_pos(3)	0.0
	if {$mom_pos(2) < $mom_prev_pos(2) } {
   		MOM_do_template rapid_cycle_xy
   		MOM_do_template rapid_cycle_z
   	} else {
   		MOM_do_template rapid_cycle_z
   		MOM_do_template rapid_cycle_xy
   	}
}


#=============================================================
proc  DELAY_TIME_SET { } {
#=============================================================
  	global mom_sys_delay_param mom_delay_value
  	global mom_delay_revs mom_delay_mode delay_time
# post builder provided format for the current mode:
  	if {[info exists mom_sys_delay_param(${mom_delay_mode},FORMAT)] != 0} {
    		MOM_set_address_format dwell $mom_sys_delay_param(${mom_delay_mode},FORMAT)
  	}
  	switch $mom_delay_mode {
    		SECONDS {set delay_time $mom_delay_value}
    			default {set delay_time $mom_delay_revs}
  	}
}

#=============================================================
proc MOM_machine_mode {} {
#=============================================================
	MOM_start_of_group
}
#=============================================================
proc MOM_delay { } {
#=============================================================
  	DELAY_TIME_SET
    	MOM_do_template delay_1
    	MOM_do_template delay_2
}
#=============================================================
proc MOM_opstop { } {
#=============================================================
	MOM_do_template opstop
}
#=============================================================
proc MOM_opskip { } {
#=============================================================
	OPSKIP_SET
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
proc MOM_stop { } {
#=============================================================
	MOM_do_template stop
}

#=============================================================
proc MOM_small_step_contour { } {
#=============================================================
	global mom_small_steps

}

#=============================================================
proc MOM_smooth_tool_path { } {
#=============================================================
	global mom_smooth_path

}
#=============================================================
proc MOM_tolerance_cycle { } {
#=============================================================
	global mom_tolerance_on_off
	global mom_operation_type
	global mom_inside_outside_tolerances
	global tolerances
	global temp

	MOM_force once Tol

  	if {$mom_operation_type == "Variable-axis Surface Contouring"  	||
		$mom_operation_type == "Cavity Milling" 					||
		$mom_operation_type == "Fixed-axis Surface Contouring"  	||
		$mom_operation_type == "Planar Milling"  				||
		$mom_operation_type == "Sequential Mill Main Operation"  	||
		$mom_operation_type == "Zig-Zag Surface" } {
  		set temp [expr $mom_inside_outside_tolerances(0) + $mom_inside_outside_tolerances(1)]
  		set tolerances [expr $temp/2]
  	}

}
#=============================================================
proc MOM_spindle_orient { } {
#=============================================================
	global mom_angle_orient
	MOM_force once Angle
	MOM_do_template spindle_orient_1
	MOM_do_template spindle_orient_2
}

#=============================================================
proc  MOM_divide { } {
#=============================================================
	global mom_divide_by mom_length_of_program mom_live_time
	global mom_retract_to mom_offset_dist mom_retract_point_pos
	global max_length

#	MOM_output_literal "DIVIDE"

	set max_length [expr $mom_length_of_program/1.0]
}

#=============================================================
proc  MOM_before_output { } {
#=============================================================
	global mom_o_buffer
}

#=============================================================
proc  MOM_before_motion { } {
#=============================================================
	global mom_motion_event mom_motion_type mom_o_buffer
	global length accom_length max_length
	global ptp_file_name mom_output_file_directory mom_output_file_basename
	global output_extn i
	global mom_divide_by mom_cutting_time mom_live_time
	global mom_retract_to mom_retract_point_pos mom_offset_dist
	global total_cutting_time accumulated_time accom_length length
	global mom_seqnum header_check_status status_block_create mom_prev_pos mom_pos

	set accom_length $mom_seqnum

	FEEDRATE_SET
	switch $mom_motion_type {
    		ENGAGE {PB_engage_move}
    		APPROACH {PB_approach_move}
    		FIRSTCUT {PB_first_cut}
  	}
  	if {[llength [info commands PB_CMD_before_motion]]} {PB_CMD_before_motion}

	set total_cutting_time [expr $mom_cutting_time - $accumulated_time]

	if {$mom_divide_by == "LENGTH"} {
		if { $accom_length >= $max_length } {
 			if { $mom_motion_type == "STEPOVER" || $mom_motion_type == "RETRACT"} {
				if {$mom_retract_to == "OFFSET"} {
					MOM_do_template go_offset
				} elseif {$mom_retract_to == "POINT"} {
					MOM_force Once X Y Z
					MOM_do_template go_point
				}
				MOM_force Once M
				MOM_end_of_program
  				MOM_close_output_file $ptp_file_name
  				set mom_output_file_basename [expr $mom_output_file_basename+1]
				set ptp_file_name "${mom_output_file_directory}${mom_output_file_basename}${output_extn}"
				if {[file exists $ptp_file_name]} {
      					MOM_remove_file $ptp_file_name
    				}
				MOM_open_output_file $ptp_file_name
				set header_check_status 0
				set status_block_create 0
				MOM_reset_sequence 1 1 1
				MOM_force Once X Y Z M_spindle
				MOM_start_of_group
				MOM_msys

#  				MOM_initial_move
				if {$mom_retract_to == "OFFSET"} {

                 set  mom_prev_pos(2)  [ expr ($mom_prev_pos(2)+$mom_offset_dist)]
#  				MOM_initial_move
					MOM_force Once X Y Z F
 				MOM_initial_move_prev
# вниз по Z
                 set  mom_prev_pos(2)  [ expr ($mom_prev_pos(2)-$mom_offset_dist)]
#                              MOM_force Once M
#                                MOM_coolant_on
	                   MOM_output_literal "M25"
 				MOM_initial_move_prev

				} elseif {$mom_retract_to == "POINT"} {
					MOM_force Once X Y Z
                                     MOM_do_template go_point
 				MOM_initial_move_prev
				}
				set accom_length 0
			}
  		}
	} elseif {$mom_divide_by == "TIME"} {
		if { $total_cutting_time >= $mom_live_time } {
	 		if { $mom_motion_type == "STEPOVER" || $mom_motion_type == "RETRACT" } {
				if {$mom_retract_to == "OFFSET"} {
					MOM_do_template go_offset
				} elseif {$mom_retract_to == "POINT"} {
					MOM_force Once X Y Z
					MOM_do_template go_point
				}
				MOM_force Once M
				MOM_end_of_program
  				MOM_close_output_file $ptp_file_name
  				set mom_output_file_basename [expr $mom_output_file_basename+1]
				set ptp_file_name "${mom_output_file_directory}${mom_output_file_basename}${output_extn}"
				if {[file exists $ptp_file_name]} {
      					MOM_remove_file $ptp_file_name
    				}
				MOM_open_output_file $ptp_file_name
				set header_check_status 0
				set status_block_create 0
				MOM_reset_sequence 1 1 1
				MOM_force Once X Y Z M_spindle
				MOM_start_of_group
				MOM_msys
#  				MOM_initial_move
				if {$mom_retract_to == "OFFSET"} {

                 set  mom_prev_pos(2)  [ expr ($mom_prev_pos(2)+$mom_offset_dist)]
#  				MOM_initial_move
					MOM_force Once X Y Z F
 				MOM_initial_move_prev
# вниз по Z
                 set  mom_prev_pos(2)  [ expr ($mom_prev_pos(2)-$mom_offset_dist)]
 				MOM_initial_move_prev

				} elseif {$mom_retract_to == "POINT"} {
					MOM_force Once X Y Z
                                     MOM_do_template go_point
 				MOM_initial_move_prev
				}
				set total_cutting_time 0
				set accumulated_time $mom_cutting_time
			}
  		}
	}
}
