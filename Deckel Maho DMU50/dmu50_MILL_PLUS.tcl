##############################################################################
# Описание 
#     Это обработчик событий для станков Deckel Maho серий DMU 50 и 70 eVolution которые имеют 
# кинематическую схему с двумя поворотными столами и оснащенные системой ЧПУ Heidenhain i530
#
# Версии
#
#   	Дата        			Разработчик 		Требования
#	24 августа 2002 	Чиж Олег 			Исходная верия
# $История$
#
#=============================================================
# Следующая команда включает режим отладки постпроцессора.
#=============================================================
# source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_debug.tcl ;source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl ; MOM_set_debug_mode ON

#=============================================================
# Следующая команда задает настройки обработчика событий по умолчанию.
#=============================================================

source "[MOM_ask_env_var UGII_CAM_POST_DIR]ugpost_base.tcl"

#=============================================================
# Установка переменных кинематики UGPost по умолчанию.
#=============================================================

set mom_kin_arc_valid_plane				ANY
set mom_kin_output_unit					MM
set mom_kin_arc_output_mode			QUADRANT
set mom_kin_machine_type				5_axis_dual_table
set mom_kin_4th_axis_plane				YZ
set mom_kin_5th_axis_plane				ZX

set mom_kin_linearization_tol				0.01
set mom_kin_4th_axis_limit_action			"Retract / Re-Engage"
set mom_kin_5th_axis_limit_action			"Retract / Re-Engage"
set mom_kin_max_arc_radius				99999.999
set mom_kin_min_arc_radius				0.01

#=============================================================
# В строках ниже задаются значения для G и M кодов
#=============================================================

set mom_sys_program_stop_code              	0
set mom_sys_optional_stop_code             		1
set mom_sys_spindle_direction_code(CLW)    	3
set mom_sys_spindle_direction_code(CCLW)   4
set mom_sys_spindle_direction_code(OFF)    	5
set mom_sys_tool_change_code               		6
set mom_sys_coolant_code(MIST)             		7
set mom_sys_coolant_code(FLOOD)            	8
set mom_sys_coolant_code(ON)               		8
set mom_sys_coolant_code(TAP)              		8
set mom_sys_coolant_code(OFF)              		9
set mom_sys_clamp_code(ON)                 		10
set mom_sys_clamp_code(OFF)                		11
set mom_sys_clamp_code(AXISON)             	10
set mom_sys_clamp_code(AXISOFF)            	11
set mom_sys_end_of_program_code            	30

set mom_sys_rapid_code                     		0
set mom_sys_linear_code                    			1
set mom_sys_circle_code(CLW)               		2
set mom_sys_circle_code(CCLW)              		3
set mom_sys_delay_code(SECONDS)           	4
set mom_sys_spline_code				6
set mom_sys_mcs_rotation_code              		7
set mom_sys_cutcom_plane_code(XY)          	17
set mom_sys_cutcom_plane_code(ZX)          	18
set mom_sys_cutcom_plane_code(YZ)          	19
set mom_sys_cutcom_code(OFF)               		40
set mom_sys_cutcom_code(LEFT)              	41
set mom_sys_cutcom_code(RIGHT)             	42
set mom_sys_inch_code                      			70
set mom_sys_metric_code                    		71
set mom_sys_cycle_start_code			79
set mom_sys_cycle_off					80
set mom_sys_cycle_drill_code				81
set mom_sys_cycle_drill_dwell_code		81 
set mom_sys_cycle_drill_deep_code		83
set mom_sys_cycle_drill_break_chip_code	83 
set mom_sys_cycle_tap_code				84 
set mom_sys_cycle_bore_code			85 
set mom_sys_cycle_bore_drag_code		86 
set mom_sys_cycle_bore_no_drag_code		86 
set mom_sys_cycle_bore_dwell_code		86 
set mom_sys_cycle_bore_manual_code		86 
set mom_sys_cycle_bore_back_code		86 
set mom_sys_cycle_bore_manual_dwell_code	86
set mom_sys_output_code(ABSOLUTE)          	90
set mom_sys_output_code(INCREMENTAL)	91

set mom_sys_list_output					ON  
set mom_sys_header_output				OFF  
set mom_sys_list_file_rows				40   
set mom_sys_list_file_columns				30   
set mom_sys_warning_output				OFF  
set mom_sys_group_output				OFF  
set mom_sys_list_file_suffix				lpt  
set mom_list_file_suffix					lpt  
set mom_sys_output_file_suffix			PM 
set mom_output_file_suffix				PM

#=============================================================
# Описание глобальных переменных
#=============================================================
set prog_start_flag                        				0
set prog_number                            			12345
set mom_sys_list_file_columns              		132
set mom_sys_list_file_rows                 			50
set header_check_status	            			0
set mom_sys_commentary_output              	OFF
set mom_sys_list_output                    			OFF

set mom_cycle_rapid_to_pos(0)         			0
set mom_cycle_rapid_to_pos(1)        			0
set mom_cycle_rapid_to_pos(2)         			0
set mom_cycle_feed_to_pos(0)          			0
set mom_cycle_feed_to_pos(1)          			0
set mom_cycle_feed_to_pos(2)          			0
set mom_cycle_retract_to_pos(0)       		0
set mom_cycle_retract_to_pos(1)       		0
set mom_cycle_retract_to_pos(2)       		0
set mom_point1_pos(0) 					-100.0
set mom_point1_pos(1) 					-100.0
set mom_point1_pos(2) 					-50.0
set mom_point2_pos(0) 					100.0
set mom_point2_pos(1) 					100.0
set mom_point2_pos(2) 					0.0
set mom_offset_block					10.0
set mom_smooth_path					"OFF"
set mom_tolerance_on_off				"OFF"
set mom_small_steps					"OFF"
set status_block_create					0
set cutcom_on 							0
set mom_kin_nurbs_output_type			HEIDENHAIN_POLY
set mom_number_of_program				12345
set mom_kin_rapid_feed_rate				30000
set tool_change_flag 					0
set mom_prev_pos_z					-9999.999
set mom_cycle_delay					0.1
set first_move_after_MCSROT				0
set MCSROT_flag						0
set is_MCSROT_matrix_set				0
set first_motion_flag						0
set mom_contact_status					UNDEFINED
set max_file_name_length					8
set contact_status						0

#=============================================================
proc MOM_mill_rectangular_pocket {} {
# Эта процедура вызывается при фрезеровании паза с помощью UDE mill_rectangular_pocket.
#=============================================================	
	global mom_start_point_g87_pos mom_f2_dimension_g87 mom_y3_dimension_g87 mom_r_dimension_g87
	global mom_k_dimension_g87 mom_j_direction_g87 mom_i_dimension_g87 mom_b_dimension_g87
	global mom_z_dimension_g87 mom_y_dimension_g87 mom_x_dimension_g87 mom_cycle_feed

	if {$mom_j_direction_g87 == "CLIMB"} {
		set mom_j_direction_g87 1
	} else {
		set mom_j_direction_g87 -1
	}
	MOM_do_template cycle_position
	MOM_do_template cycle_feedrate
	MOM_do_template cycle_g87
}

#=============================================================
proc MOM_mill_circular_pocket {} {
# Эта процедура вызывается при фрезеровании паза с помощью UDE mill_circular_pocket.
#=============================================================	
	global mom_start_point_g89_pos f2_dimension_g89 y3_dimension_g89 r_dimension_g89
	global k_dimension_g89 j_direction_g89 i_dimension_g89 b_dimension_g89
	global z_dimension_g89 cycle_feed

	if {$mom_j_direction_g87 == "CLIMB"} {
		set mom_j_direction_g87 1
	} else {
		set mom_j_direction_g87 -1
	}
	MOM_do_template cycle_position
	MOM_do_template cycle_feedrate
	MOM_do_template cycle_g89
}

#=============================================================
proc MOM_mill_groove {} {
# Эта процедура вызывается при фрезеровании паза с помощью UDE mill_groove.
#=============================================================	
	global mom_start_point_g88_pos f2_dimension_g88 y3_dimension_g88 k_dimension_g88
	global j_direction_g88 i_dimension_g88 b_dimension_g88 z_dimension_g88
	global y_dimension_g88 x_dimension_g88 cycle_feed
	
	if {$mom_j_direction_g87 == "CLIMB"} {
		set mom_j_direction_g87 1
	} else {
		set mom_j_direction_g87 -1
	}
	MOM_do_template cycle_position
	MOM_do_template cycle_feedrate
	MOM_do_template cycle_g88
}

#=============================================================
proc MOM_prog_number {} {
# Эта процедура вызывается при задании номера программы в UDE Program number.
#=============================================================	
	global mom_number_of_program
}
#=============================================================
proc MOM_zero_point {} {
# Эта процедура вызывается при задании нулевой точки (G54-G59) в UDE Zero point.
#=============================================================	
	global mom_zero_point_set
}
#=============================================================
proc  MOM_start_of_program {} {
# Эта процедура вызывается в начале каждой программы.
#=============================================================
	global mom_part_name mom_logname mom_date mom_spindle_rpm
	global mom_cutcom_mode mom_cutcom_status mom_output_file_basename 
	global is_from max_file_name_length
# Установка значений переменных в значение UNDEFINED	
	set mom_coolant_status UNDEFINED
	set mom_cutcom_status  UNDEFINED
  	set mom_clamp_status   UNDEFINED
  	set mom_cycle_status   UNDEFINED
  	set mom_spindle_status UNDEFINED
  	set mom_cutcom_plane   UNDEFINED
# Удаление значений переменных    	
	catch {unset mom_cutcom_adjust_register}
	catch {unset mom_tool_adjust_register}
  	catch {unset mom_tool_length_adjust_register}
  	catch {unset mom_length_comp_register}
  	catch {unset mom_flush_register}
  	catch {unset mom_wire_cutcom_adjust_register}

# Загрузка кинематики для 5-осевого станка DMU50-eVolution 
	LOAD_5AXIS_KINEMATICS
# Открытие файлов предупреждений и листинга
	OPEN_files
# Вывод в файл листинга заголовка и комментариев
	LIST_FILE_HEADER 
	set is_from ""
	set mom_spindle_rpm 0.0
# Если длина имени выходного файла превышает значение, заданное переменной <max_file_name_length>
# (по умолчанию 8 символов) вывод программы прерываеся и выводится сообщение об ошибке.
# Это связано с тем, что программа передачи данных на станок PCIN не может читать имена файлов длинее
# 8 символов. Если будет использоватся другая программа, просто измените значение переменной 
# <max_file_name_length>.
#ВРЕМЕННЫЙ КОМЕНТАРИЙ
#	if {[string length $mom_output_file_basename] > $max_file_name_length} {
#		MOM_abort "Длина имени выходного файла должна быть не более 8 символов !!!\nИсправьте имя и повторите вывод."
#	}	
}
#=============================================================
proc MOM_msys {} {
# Эта процедура выводится при обработке события MOM_msys	
#=============================================================	
	global mom_spindle_speed mom_number_of_program tool_change_flag
	global status_block_create mom_group_name header_check_status
	global mom_ug_version mom_machine_name mom_logname mom_date
	global mom_offset_block tolerances 
	global mom_inside_outside_tolerances
	
	if { $header_check_status == 0} {
		MOM_set_seq_off
		MOM_output_literal "%PM$mom_number_of_program"
		MOM_output_literal "N$mom_number_of_program"
		MOM_set_seq_on
		MOM_output_literal "(START PROGRAM: $mom_group_name)"
		set mom_ug_version [string toupper $mom_ug_version]
		MOM_output_literal "(GENERATE BY: $mom_ug_version)"
		set mom_machine_name [string toupper $mom_machine_name]
		MOM_output_literal "(MACHINE: $mom_machine_name)" 
		set mom_date [string toupper $mom_date]
		MOM_output_literal "(DATE: $mom_date)"
		set mom_logname [string toupper $mom_logname]
		MOM_output_literal "(PROGRAMER: $mom_logname)"
		set header_check_status 1
	}
	if {$status_block_create == 0} {
		MOM_block_create
		MOM_do_template windows_definition
		MOM_do_template graphics_definition
		MOM_do_template start_g_function_1
		MOM_do_template start_g_function_2
		MOM_do_template start_g_function_3
		MOM_output_literal "G54"
		MOM_output_literal "G92"
		MOM_output_literal "(SET NULL POINT SHIFT)"
		set tolerances [expr [expr $mom_inside_outside_tolerances(0) + $mom_inside_outside_tolerances(1)]/2]
		MOM_do_template tolerance
		set status_block_create 1
	}
	if {$tool_change_flag == 0} {
		PB_auto_tool_change
		set tool_change_flag 1
	}
}
#=============================================================
proc MOM_operator_message {} {
# Эта процедура выводит сообщение оператору в виде коментария	
#=============================================================	

     global mom_operator_message

     MOM_output_literal "($mom_operator_message)"
}

#=============================================================
proc MOM_end_of_program { } {
# Эта процедура выполняется в конце каждой программы	
#=============================================================
   	global mom_group_name mom_machine_time line1
   	 
	set line1 [format "(MACHINE TIME = %4.2lf)" [expr $mom_machine_time/2.54]]
  	MOM_output_literal "$line1"
    	set mom_group_name [string toupper $mom_group_name]
	MOM_output_literal "(END PROGRAM $mom_group_name)"	
    	MOM_do_template end_of_program
	MOM_output_literal ""
  	LIST_FILE_TRAILER
 
  	CLOSE_files
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
	global nurbs_precision
	
#	MOM_force once motion_g X Y Z K3X K2X K1X K3Y K2Y K1Y K3Z K2Z K1Z

	for {set ii 1} {$ii < [expr $mom_nurbs_point_count-1]} {incr ii} {
		if {$ii == 1} {
			MOM_force once motion_g X Y Z K3X K2X K1X K3Y K2Y K1Y K3Z K2Z K1Z
		} else {
			MOM_suppress Once K3X K2X K3Y K2Y K3Z K2Z
			MOM_force Once K1X K1Y K1Z
		}	
#		set xe $mom_nurbs_points($ii,0) 
#		set ye $mom_nurbs_points($ii,1)
#		set ze $mom_nurbs_points($ii,2)
		set nurbs_precision 1.0
		
#X51=, Y51=, Z51= First spline coefficient
#X52=, Y52=, Z52= Second spline coefficient
#X53=, Y53=, Z53= Third spline coefficient	
#Это массив (n,9).
#(0,0), (0,1), ... (0,8) ..... (n-1,0), (n-1,1) ... (n-1,8)
#k3x, k2x, k1x, k3y, k2y, k1y, k3z, k2z, k1z, .....
#три коэициента, для каждой из осей x, y, z для n управляющих точек
# K3X[$x0] K2X[$x1]	K1X[$x2]
# K3Y[$y0] K2Y[$y1] K1Y[$y2]
# K3Z[$z0] K2Z[$z1] K1Z[$z2]
# K1X=X53=x0 
#K2X=X52=x1 
#K3X=X51=x2

		set x0 [expr $mom_nurbs_coefficients($ii,0)*$nurbs_precision]
		set x1 [expr $mom_nurbs_coefficients($ii,1)*$nurbs_precision]
		set x2 [expr $mom_nurbs_coefficients($ii,2)*$nurbs_precision]
		set y0 [expr $mom_nurbs_coefficients($ii,3)*$nurbs_precision]
		set y1 [expr $mom_nurbs_coefficients($ii,4)*$nurbs_precision]
		set y2 [expr $mom_nurbs_coefficients($ii,5)*$nurbs_precision]
		set z0 [expr $mom_nurbs_coefficients($ii,6)*$nurbs_precision]
		set z1 [expr $mom_nurbs_coefficients($ii,7)*$nurbs_precision]
		set z2 [expr $mom_nurbs_coefficients($ii,8)*$nurbs_precision]
		MOM_do_template spline_move
	}
}
#=============================================================
proc  MOM_start_of_path {} {
# Эта процедура выполняется в начале каждой операции.
#=============================================================
	global mom_path_name
	global mom_tool_name
	global tcl_platform
	global first_linear_move ; set first_linear_move 0
	
	if {$tcl_platform(os) == "HP-UX"} {
		set suffix "sl"
	} elseif {$tcl_platform(os) == "windows" || $tcl_platform(os) == "Windows NT"} {
		set suffix "dll"
	} else {
		set suffix "so"
	}

	set uf_library "ugpadvkins.$suffix"
	set text "[MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]$uf_library"
	
	TOOL_SET MOM_start_of_path

	if { [llength [info commands PB_CMD_kin_start_of_path]] } {
		PB_CMD_kin_start_of_path
	}
	MOM_force Once spindle_m G_cutcom X Y Z R F S Axis_4th Axis_5th 
	MOM_force Once K_cycle Z_cycle motion_g cycle_dwell cycle_step cycle_orient user_add cycle_k1
}
#=============================================================
proc  MOM_end_of_path {} {
# Эта процедура выполняется в конце каждой траектории.
#=============================================================
	global first_motion_flag

	set first_motion_flag 0
	MOM_suppress off I J K
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
}

#=============================================================
proc MOM_end_of_group {} {
# Эта процедура выполняется в конце группы	
#=============================================================
}

#=============================================================
proc MOM_tool_change { } {
# Эта процедура выполняется при смене инструмента	
#=============================================================
	global mom_tool_change_type mom_manual_tool_change tool_change_flag
	
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
	set tool_change_flag 1
}

#=============================================================
proc PB_auto_tool_change { } {
# Эта процедура выполняется если задана автоматическая смена инструмента.
#=============================================================
	global mom_tool_number mom_next_tool_number mom_spindle_speed
	global mom_tool_name mom_tool_diameter mom_tool_corner1_radius
	global mom_operation_name mom_operation_type mom_contact_status
	
	if {$mom_tool_number == 0} {
		MOM_abort "Номер инструмента не должен быть равен 0 в операции $mom_operation_name"	
	}
	MOM_output_literal "G39 R=E1" 
   	MOM_do_template auto_tool_change
	set line [format "(TOOL: %s D=%.2f R=%.2f)" $mom_tool_name $mom_tool_diameter $mom_tool_corner1_radius]
   	MOM_output_literal "$line"
   	if {$mom_spindle_speed == 0.0} {
		MOM_abort "Скорость шпинделя не должна быть равна 0 в операции $mom_operation_name"
	}	
   	MOM_do_template spindle_start
	if {$mom_tool_number != $mom_next_tool_number} {
		if {$mom_next_tool_number != 0} {	
			MOM_do_template tool_preselect
		}
	}
	if {$mom_operation_type == "Variable-axis Surface Contouring"  	||
		$mom_operation_type == "Sequential Mill Main Operation"  	|| 
		$mom_operation_type == "Zig-Zag Surface" } {
   			MOM_output_literal "M22"
   			MOM_output_literal "M10"
	}
}
#=============================================================
proc PB_manual_tool_change { } {
# Эта процедура выполняется если задана ручная смена инструмента.		
#=============================================================
	MOM_force Once T M
   	MOM_do_template manual_tool_change
}

#=============================================================
proc  MOM_initial_move {} {
# Эта процедура выполняется при первом перемещении в каждой программе.
#=============================================================

	global first_motion_flag mom_cycle_status mom_motion_type mom_sys_rapid_code
	global leader_4th leader_5th mom_contact_status
	global mom_prev_pos_z mom_pos_z
	
	set leader_4th "C90="
	set leader_5th "B90="
	MOM_force Once  motion_g G X Y Z M Axis_4th Axis_5th T

	if {$mom_motion_type == "RAPID" || $mom_motion_type == "CYCLE"} {
		if {$mom_contact_status == "ON"} {
			MOM_force Once X Y Z I J K
			MOM_do_template rapid_xyz_3d
		} else {	
			if {$mom_cycle_status == "ON"} {
				MOM_do_template rapid_cycle_xy
				MOM_do_template rapid_cycle_z
			} else {
				MOM_do_template rapid_xy
				MOM_do_template rapid_z
			}
		}	
	} else {
		if {$mom_contact_status == "ON"} {
			MOM_force Once X Y Z I J K
			MOM_do_template rapid_xyz_3d
		} else {	
			MOM_linear_move
		}
	}
	set first_motion_flag 1
	set mom_prev_pos_z $mom_pos_z
	MOM_incremental ON Axis_4th Axis_5th
	set leader_4th "C91="
	set leader_5th "B91="
}
#=============================================================
proc PROGRAM_START {} {
# Эта процедура выполняется при задании User Define Command 
# "PARTNO" 	
#=============================================================	
	global prog_start_flag
	global prog_number

	if {$prog_start_flag == 0} {
		MOM_suppress always N
		MOM_output_literal "%PM$prog_number"
		MOM_output_literal "N$prog_number"
		MOM_suppress off N
		set prog_start_flag 1
	}
}

#=============================================================
proc MOM_block_create { } {
# Эта процедура создает команды G98 и G99 которые задают 
# зону визуализации и заготовку для визуализации программы на системе ЧПУ
#=============================================================	
	global mom_point1_pos mom_point2_pos
	global status_block_create mom_offset_block
	
	MOM_force once X Y Z
	set mom_point1_pos(0) [expr $mom_point1_pos(0)-$mom_offset_block]
	set mom_point1_pos(1) [expr $mom_point1_pos(1)-$mom_offset_block]
	set mom_point1_pos(2) [expr $mom_point1_pos(2)-$mom_offset_block]
	set mom_point2_pos(0) [expr $mom_point2_pos(0)+$mom_offset_block]
	set mom_point2_pos(1) [expr $mom_point2_pos(1)+$mom_offset_block]
}

#=============================================================
proc MOM_first_move { } {
# Эта процедура выполняется при первом перемещении в операции.
#=============================================================
  global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  global mom_kin_max_fpm mom_motion_event
   COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET
   catch {MOM_$mom_motion_event}
}

#=============================================================
proc MOM_from_move { } {
# Эта процедура выполняется при обработке точки FROM, если она задана.
#=============================================================
  	COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET ;  MODES_SET
}

#=============================================================
proc MOM_gohome_move {} {
# Эта процедура выполняется при обработке точки GOHOME, если она задана.
#=============================================================	
	global mom_pos mom_prev_pos
	global mom_pos_z mom_prev_pos_z 

	MOM_force Once X Y Z Axis_4th Axis_5th motion_g
	MOM_output_literal "G92 C3=1"
	if {$mom_pos_z < $mom_prev_pos_z } {
   		MOM_do_template gohome_xy
   		MOM_do_template gohome_z
   	} else {
   		MOM_do_template gohome_z
   		MOM_do_template gohome_xy
   	}
}

#=============================================================
proc MOM_linear_move { } {
# Эта процедура выполняется при обработке линейного перемещения.
#=============================================================
	global mom_pos mom_feed_rate mom_kin_rapid_feed_rate
	global first_linear_move  str1 cutcom_on feed_mode
	global mom_cycle_status mom_pos mom_cycle_rapid_to
	global mom_prev_pos_z mom_pos_z mom_contact_status
	global contact_status mom_tool_diameter mom_tool_corner1_radius
	
# Следующие строки выводят команду коррекции радиуса инструмента в 3Д. Эта опция 
# работать только в версии Unigraphics NX-2 
	if {$mom_contact_status == "ON" && $contact_status == "0"} {
		set str2 [format "G141 R%.3f R1=%.3f L2=0" [expr $mom_tool_diameter/2] $mom_tool_corner1_radius]
		MOM_output_literal "$str2"
		MOM_output_literal "; WARNING: USE THE TOOL OF GREATER DIAMETER MAY GOUGED OF THE PART !!!"
		set contact_status 1
	}
	if {$mom_cycle_status == "ON"} {
		MOM_do_template linear_cycle_xy
		MOM_do_template linear_cycle_z
	} else {
		if {$cutcom_on == 1} {
			set str1 [format "G43 X%.3f Y%.3f" $mom_pos(0) $mom_pos(1)]
   			MOM_output_literal "$str1"
   			set cutcom_on 0
   			MOM_do_template cutcom_on
		}
		if {$mom_contact_status == "ON"} {
			MOM_force Once X Y Z I J K
			MOM_do_template linear_3d
		} else {
			MOM_do_template linear
		}
   	}
   	set mom_prev_pos_z $mom_pos_z
}

#=============================================================
proc MOM_circular_move { } {
# Эта процедура выполняется при обработке кругового перемещения.
#=============================================================
	global mom_arc_angle mom_arc_axis cutcom_on str1 mom_pos
	global mom_pos_z mom_prev_pos_z
	
	CIRCLE_SET
	
	if {$mom_arc_axis(2) == "1" || $mom_arc_axis(2) == "-1"} {
		MOM_force once I J
		MOM_suppress once K
	} elseif {$mom_arc_axis(1) == "1" || $mom_arc_axis(1) == "-1"} {
		 MOM_force once I K
		 MOM_suppress once J
	} elseif {$mom_arc_axis(0) == "1" || $mom_arc_axis(0) == "-1"} {
		 MOM_force once J K 
		 MOM_suppress once I
	}
   	if {$mom_arc_axis(2) == "1" || $mom_arc_axis(2) == "-1"} {
		 MOM_force once X Y
		MOM_suppress once Z
	} elseif {$mom_arc_axis(1) == "1" || $mom_arc_axis(1) == "-1"} {
		 MOM_force once X Z		 
		 MOM_suppress once Y
	} elseif {$mom_arc_axis(0) == "1" || $mom_arc_axis(0) == "-1"} {
		 MOM_force once Y Z
		 MOM_suppress once X
	}

	if {$mom_arc_angle >= 360.000} {
		MOM_suppress Once X Y Z	
	}
	if {$cutcom_on == 1} {
		set str1 [format "G43 X%.3f Y%.3f" $mom_pos(0) $mom_pos(1)]
   		MOM_output_literal "$str1"
   		set cutcom_on 0
   		MOM_do_template cutcom_on
	}
	MOM_do_template circular_move
	set mom_prev_pos_z $mom_pos_z
}

#=============================================================
proc MOM_rapid_move { } {
# Эта процедура отрабатывает ускоренное перемещение	
#=============================================================
	global mom_prev_pos_z mom_pos_z
	
	MOM_do_template rapid_xyz
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc  MOM_before_output {} {
# Эта процедура выполняется непосредственно перед выводом строки
# программы в выходной файл. Она загружает строку в переменную  and then calls
# mom_o_buffer. После выхода из этой процедуры переменая mom_o_buffer
# читается и записывается в выходной файл.
#=============================================================
# Следующая процедура выводит предупреждения в файл листинга.
         LIST_FILE
}

#=============================================================
proc MOM_cycle_plane_change { } {
# Эта процедура вызывается при смене проскости выполнения цикла.	
#=============================================================
	global cycle_init_flag

	set cycle_init_flag TRUE
}
#=============================================================
proc SET_CYCLE_FEED_RATE { } {
# Эта процедура задает подачу в цикле.
#=============================================================
	global first_cycle_move feed mom_cycle_feed_rate_mode mom_cycle_feed_rate
	global mom_cycle_feed_rate_per_rev mom_cycle_feed_rate
	
	if {$mom_cycle_feed_rate_mode == "MMPM"} {
		set feed $mom_cycle_feed_rate
	} elseif {$mom_cycle_feed_rate_mode == "MMPR"} {
		set feed $mom_cycle_feed_rate_per_rev
	}
}
#=============================================================
proc MOM_drill { } {
# Эта процедура вызывается при обработке цикла сверления.
#=============================================================
	global first_cycle_move 
	
	SET_CYCLE_FEED_RATE
	MOM_do_template cycle_drill
	set  first_cycle_move 1
}

#=============================================================
proc  MOM_drill_move { } {
# Эта процедура вызывается при обработке перемещения в цикле сверления.	
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}

#=============================================================
proc MOM_drill_dwell { } {
# Эта процедура вызывается при обработке цикла сверления с задержкой.
#=============================================================
	global first_cycle_move 
	
	SET_CYCLE_FEED_RATE
	MOM_do_template cycle_drill_dwell
	set  first_cycle_move 1
}
#=============================================================
proc MOM_drill_dwell_move { } {
# Эта процедура вызывается при обработке перемещения в цикле сверления с задержкой.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_drill_deep { } {
# Эта процедура вызывается при обработке цикла глубокого сверления.
#=============================================================
	global first_cycle_move 
	
	SET_CYCLE_FEED_RATE
	MOM_do_template cycle_drill_deep
	set  first_cycle_move 1
}
#=============================================================
proc  MOM_drill_deep_move { } {
# Эта процедура вызывается при обработке перемещения в цикле глубокого сверления.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_drill_break_chip { } {
# Эта процедура вызывается при обработке цикла сверления с ломкой стружки.
#=============================================================
	global first_cycle_move 
	
	SET_CYCLE_FEED_RATE
	MOM_do_template cycle_drill_deep
	set  first_cycle_move 1
}
#=============================================================
proc  MOM_drill_break_chip_move { } {
# Эта процедура вызывается при обработке перемещения в цикле сверления с ломкой стружки.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_tap { } {
# Эта процедура вызывается при обработке цикла нарезания резьбы.
#=============================================================
	global first_cycle_move mom_cycle_feed_rate_mode
	
	SET_CYCLE_FEED_RATE
	if {$mom_cycle_feed_rate_mode == "MMPM"} {
		MOM_abort "Для цикла нарезания резьбы (G84) подача должна задаватся в мм на оборот !!!"	
	}	
	MOM_suppress Once F
	MOM_do_template cycle_tap
	set  first_cycle_move 1
}
#=============================================================
proc  MOM_tap_move { } {
# Эта процедура вызывается при обработке перемещения в цикле нарезания резьбы.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_bore { } {
# Эта процедура вызывается при обработке цикла развертки.
#=============================================================
	global first_cycle_move 
	
	SET_CYCLE_FEED_RATE
	MOM_do_template cycle_bore
	set  first_cycle_move 1
}
#=============================================================
proc  MOM_bore_move { } {
# Эта процедура вызывается при обработке перемещения в цикле развертки.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_bore_drag { } {
# Эта процедура вызывается при обработке цикла расточки.
#=============================================================
	global first_cycle_move 
	
	SET_CYCLE_FEED_RATE
	MOM_do_template cycle_bore_drag
	set  first_cycle_move 1
}
#=============================================================
proc  MOM_bore_drag_move { } {
# Эта процедура вызывается при обработке перемещения в цикле расточки.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_bore_no_drag { } {
# Эта процедура вызывается при обработке цикла расточки с ориентацией шпинделя.
#=============================================================
	MOM_abort "Тип цикла Standart Bore - Manual не поддерживается этой системой ЧПУ !!!"
}
#=============================================================
proc  MOM_bore_no_drag_move { } {
# Эта процедура вызывается при обработке перемещения в цикле расточки с ориентацией шпинделя.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_bore_manual { } {
# Эта процедура вызывается при обработке цикла расточки с ручным выводом.
#=============================================================
	MOM_abort "Тип цикла Standart Bore - Manual не поддерживается этой системой ЧПУ !!!"
}
#=============================================================
proc  MOM_bore_manual_move { } {
# Эта процедура вызывается при обработке перемещения в цикле расточки с ручным выводом.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_bore_dwell { } {
# Эта процедура вызывается при обработке цикла расточки с задержкой.	
#=============================================================
	global first_cycle_move 
	
	SET_CYCLE_FEED_RATE
	MOM_do_template cycle_bore_dwell
	set  first_cycle_move 1
}
#=============================================================
proc  MOM_bore_dwell_move { } {
# Эта процедура вызывается при обработке перемещения в цикле расточки с задержкой.	
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z
	
	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_bore_back { } {
# Эта процедура вызывается при обработке цикла обратной расточки.	
#=============================================================
	MOM_abort "Тип цикла Standart Bore - Back не поддерживается этой системой ЧПУ !!!"
}
#=============================================================
proc  MOM_bore_back_move { } {
# Эта процедура вызывается при обработке перемещения в цикле обратной расточки.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z
	
	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc MOM_bore_manual_dwell { } {
# Эта процедура вызывается при обработке цикла расточки с ручным выводом и задержкой.
#=============================================================
	MOM_abort "Тип цикла Standart Bore - Manual Dwell не поддерживается этой системой ЧПУ"
}
#=============================================================
proc  MOM_bore_manual_dwell_move { } {
# Эта процедура вызывается при обработке перемещения в цикле расточки с ручным выводом и задержкой.
#=============================================================
	global first_cycle_move
	global mom_prev_pos_z mom_pos_z

	MOM_force Once motion_g
	if {$first_cycle_move == 0} {
		MOM_do_template cycle_parameters
	}	
	MOM_force Once X Y Z 
	MOM_do_template post_startblk
	MOM_force Once motion_g
	set first_cycle_move 0
	set mom_prev_pos_z $mom_pos_z
}
#=============================================================
proc  MOM_drill_counter_sink {} {
# Эта процедура выполняется в начале цикла Standart Drill - Counter Sink.
#=============================================================
	MOM_drill
}
#=============================================================
proc  MOM_drill_counter_sink_move {} {
# Эта процедура выполняется при перемещениях в цикле Standart Drill - Counter Sink.
#=============================================================
	MOM_drill_move
}
#=============================================================
proc  MOM_drill_csink_dwell {} {
# Эта процедура выполняется в начале цикла Standart Drill - Counter Sink Dwell.
#=============================================================
	MOM_drill_dwell
}
#=============================================================
proc  MOM_drill_csink_dwell_move {} {
# Эта процедура выполняется при перемещениях в цикле Standart Drill - Counter Sink.
#=============================================================
	MOM_drill_dwell_move
}
#=============================================================
proc  MOM_load_tool {} {
# Эта процедура выполняется при вызове команды LOAD/TOOL.  Все 
# необходимые процедуры вывода вызываются в команде MOM_msys.
#=============================================================
}
#=============================================================
proc  MOM_sequence_number {} {
# Эта процедура вызывается для команды Sequence Number.
#=============================================================
	global mom_sequence_mode
	global mom_sequence_number
	global mom_sequence_increment
	global mom_sequence_frequency
	global mom_sequence_text
	if {[isset mom_sequence_mode] == "y"} {
		if {$mom_sequence_mode == "OFF"} {
			MOM_set_seq_off
		} elseif {$mom_sequence_mode == "ON"} {
			MOM_set_seq_on
		} elseif {$mom_sequence_mode == "AUTO"} {
			MOM_output_literal "SEQNO/AUTO "
		} else {
			MOM_output_literal "error: mom_sequence_mode unknown"
		}
	} else {
		MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
	}
}
#=============================================================
proc  MOM_set_modes {} {
# Эта процедура выполняется при вызове команды Set Mode.
#=============================================================
	global mom_output_mode
	global mom_arc_mode
	global mom_feed_rate_output_mode
	global mom_parallel_to_axis
	global mom_machine_mode
	global mom_modes_text
	global g_output_mode

# "ABSOLUTE", "INCREMENTAL"
	if {$mom_output_mode == "ABSOLUTE"} {
		set g_output_mode "G90"
		MOM_incremental OFF X Y Z Axis_4th Axis_5th
	} elseif {$mom_output_mode == "INCREMENTAL"} {
		set g_output_mode "G91"
		MOM_incremental ON X Y Z Axis_4th Axis_5th
	}
# "LINEAR", "CIRCULAR"
	if {$mom_arc_mode == "LINEAR"} {
	} elseif {$mom_arc_mode == "CIRCULAR"} {
	}
# "OFF", "IPM", "IPR", "MMPM", "MMPR", "INVERSE"
	if {$mom_feed_rate_output_mode == "FPM"} {
	} elseif {$mom_feed_rate_output_mode == "FPR"} {
	} elseif {$mom_feed_rate_output_mode == "INVERSE"} {
	} elseif {$mom_feed_rate_output_mode == "OFF"} {
	}
# "ZAXIS", "WAXIS", "UAXIS"
	if {$mom_parallel_to_axis == "ZAXIS"} {
	} elseif {$mom_parallel_to_axis == "WAXIS"} {
	} elseif {$mom_parallel_to_axis == "UAXIS"} {
	}
# "MILL", "TURN", "PUNCH", "LASER", "TORCH", "WIRE"
	if {$mom_machine_mode == "MILL"} {
	} elseif {$mom_machine_mode == "TURN"} {
	} elseif {$mom_machine_mode == "PUNCH"} {
	} elseif {$mom_machine_mode == "LASER"} {
	} elseif {$mom_machine_mode == "TORCH"} {
	} elseif {$mom_machine_mode == "WIRE"} {
	}
}
#=============================================================
proc MOM_cutcom_on { } {
# Эта процедура вызывается при обработке команды CUTCOM/ON	
#=============================================================
	global cutcom_on
	
	CUTCOM_SET
	MOM_force Once G_cutcom
	set cutcom_on 1
}
#=============================================================
proc MOM_cutcom_off { } {
# Эта процедура вызывается при обработке команды CUTCOM/OFF	
#=============================================================
   CUTCOM_SET
   MOM_do_template cutcom_off
}
#=============================================================
proc MOM_spindle_rpm { } {
# Эта процедура вызывается при обработке команды SPLIND/RPM
#=============================================================
	SPINDLE_SET
}
#=============================================================
proc  MOM_spindle_off {} {
# Эта процедура вызывается при обработке команды SPLIND/OFF.
#=============================================================
         MOM_do_template spindle_off
}
#=============================================================
proc  MOM_coolant_on {} {
# Эта процедура вызывается при обработке команды COOLANT/ON.
#=============================================================
	global mom_coolant_text
	
	COOLANT_SET
	MOM_do_template coolant_on
}
#=============================================================
proc  MOM_coolant_off {} {
# Эта процедура вызывается при обработке команды COOLANT/OFF.
#=============================================================
	MOM_do_template coolant_off
}
#=============================================================
proc  MOM_opstop {} {
# Эта процедура вызывается при обработке команды OPTIONAL STOP.
#=============================================================
	MOM_do_template opstop
}
#=============================================================
proc  MOM_stop {} {
# Эта процедура вызывается при обработке команды PROGRAM STOP.
#=============================================================
	MOM_do_template stop
}
#=============================================================
proc  MOM_opskip_on {} {
# Эта процедура вызывается при обработке команды OPTIONAL SKIP/ON.
#=============================================================
	MOM_set_line_leader always "/"
}
#=============================================================
proc  MOM_opskip_off {} {
# Эта процедура вызывается при обработке команды OPTIONAL SKIP/OFF.
#=============================================================
	MOM_set_line_leader off "/"
}
#=============================================================
proc  MOM_delay {} {
# Эта процедура вызывается при обработке команды DELAY.
#=============================================================
	MOM_do_template delay
}
#=============================================================
proc  MOM_auxfun {} {
# Эта процедура вызывается при обработке команды AUXILIARY FUNCTION.
#=============================================================
	MOM_do_template auxiliary
}
#=============================================================
proc  MOM_prefun {} {
# Эта процедура вызывается при обработке команды PREPARATORY FUNCTION.
#=============================================================
	MOM_do_template preparatory
}
#=============================================================
proc  MOM_length_compensation {} {
# Эта процедура вызывается при обработке команды TOOL LENGTH COMPENSATION.
#=============================================================
}

#=============================================================
proc  MOM_text {} {
# Эта процедура вызывается при обработке команды TEXT.
#=============================================================
	global mom_user_defined_text
	global mom_record_fields
	global mom_record_text
	global MCSROT_mode
	global MCSROT_flag
	global is_MCSROT_matrix_set
	global first_move_after_MCSROT
	global prog_number

	switch $mom_record_fields(0) {
	"INSERT"
	{
#		MOM_output_literal $mom_record_text
	}
	"ZERO"
	{
		MOM_output_literal ";"
	}
	"MCSROT"
	{
		set MCSROT_mode $mom_record_fields(1)
		if {$mom_record_fields(1) == "OFF"} {
			set MCSROT_flag 0
			set is_MCSROT_matrix_set 0
			set first_move_after_MCSROT 0
			MOM_suppress off K
			MOM_do_template cancel_rotate_mcs
		} else {
			set MCSROT_flag 1
		}
	}
	"PARTNO"
	{
		set mom_record_text [string trim $mom_record_text " "]
		set temp [split $mom_record_text " "]
		set prog_number [lindex $temp 0]
		PROGRAM_START
	}
	default
	{	}
#		{ MOM_output_literal "$mom_user_defined_text" }
	}
}
#=============================================================
proc MOM_before_motion {} {
# Эта процедура выполняется перед каждым событием перемещения.
#=============================================================
	global mom_mcs_goto mom_tool_axis mom_alt_pos mom_pos
	global mom_out_angle_pos mom_motion_type mom_current_motion
#	global mom_pos_a1 mom_alt_pos_a1 mom_motion_event
	global mom_contact_status
  
	FEEDRATE_SET
	SET_MCS_MATRIX
	
	if {$mom_current_motion == "circular_move"} {
		CONVERT_ARC_DATA
	}
	if {$mom_motion_type != "CYCLE"} {
		CONVERT_POINT mom_mcs_goto \
			mom_tool_axis \
			mom_pos \
			mom_alt_pos \
			mom_out_angle_pos
	} else {
		CONVERT_CYCLES_DATA
	}
}
#=============================================================
proc MOM_origin {} {
# Эта процедура выполняется при обработке команды ORIGIN. 
#=============================================================
	global mom_origin
	global mom_origin_x mom_origin_y mom_origin_z

	set mom_origin_x $mom_origin(0)
	set mom_origin_y $mom_origin(1)
	set mom_origin_z $mom_origin(2)
}
#=============================================================
proc SET_ROTARY_ANGLE {v1} {
# Эта процедура задает углы поворота оси С.
#=============================================================	
	global prev_c_value
	global prev_theta_value

	set angle $v1
	set diff [expr $angle - $prev_theta_value]
 
	if {[EQ_is_zero $diff]} {
		set direction 0
	} elseif {abs($diff) < 180} {
		if {$angle > $prev_theta_value} {
			set direction -1
		} else {
			set direction 1
		}
	} else {  
		if {$angle > $prev_theta_value} {
			set direction 1
		} else {
			set direction -1
		}
	}

	if {$direction == 1} {
		if {$angle >= $prev_c_value} {
			while {$angle > $prev_c_value} {
				set angle [expr $angle - 360]
			}
		} else {
			while {$angle < $prev_c_value} {
				set angle [expr $angle + 360]
			}
			set angle [expr $angle - 360.0]
		}
	} elseif {$direction == -1} {
		if {$angle <= $prev_c_value} {
				while {$angle < $prev_c_value} {
				set angle [expr $angle + 360]
			}
		} else {
			while {$angle > $prev_c_value} {
				set angle [expr $angle - 360]
			}
			set angle [expr $angle + 360.0]
		}
	} else {
		set angle $prev_c_value
	}
	return $angle
}

#=============================================================
proc SET_MCS_MATRIX {} {
# Эта процедура задает матрицу вращения стола.
#=============================================================
	global mom_operation_type
	global mom_motion_type
	global mom_tool_axis
	global mom_prev_tool_axis
	global is_MCSROT_matrix_set
	global MCSROT_flag
	global trans_axis 
	global trans_angle
	global first_motion_flag
	global first_move_after_MCSROT

# Check if the MCSROT is programmed, return if not
	if {$MCSROT_flag == 0} { return }
# Check if the initial_move or first_move have been triggered, if not return
	if {$first_motion_flag == 0} { return }
# Check if the operation type is compatible for MCS rotation
	if {$mom_operation_type == "VAR_CONTOUR"} {
		MOM_output_to_listing_device \
		"ERROR: ***** INVALID OPERATION TYPE FOR MCS ROTATION *****"
		MOM_output_to_listing_device \
		"OPERATION - $mom_path_name"
		MOM_output_to_listing_device \
		"MESSAGE: Variable Axis Contouring type of operations are invalid"
		MOM_output_to_listing_device \
		"         when in Coordinate System Rotation mode"
		return
	}
# Check if the rotation matrix has been set up, if yes do not do anything.
	if {$is_MCSROT_matrix_set == 0} {
		SET_MCS_ROTATION_ANGLES
		set deg2rad [expr asin(1.0)/90.0]
		MOM_rotate_mach_csys $trans_axis(0) $trans_angle(0) \
		$trans_axis(1) $trans_angle(1) \
		$trans_axis(2) $trans_angle(2)]
		set first_move_after_MCSROT 1
		MOM_suppress always K
		set is_MCSROT_matrix_set 1
		OUTPUT_MCS_ROTATION
	}
}

#=============================================================
proc LOAD_5AXIS_KINEMATICS {} {
# Описание кинематики для станка DECKEL MAHO DMU50eV	
#=============================================================
	global mom_kin_x_axis_limit
	global mom_kin_y_axis_limit
	global mom_kin_z_axis_limit
	global mom_kin_machine_resolution
	global mom_kin_machine_type
	global mom_kin_4th_axis_plane
	global mom_kin_4th_axis_vector
	global mom_kin_4th_axis_angles
	global mom_kin_4th_axis_min_incr 
	global mom_kin_4th_axis_min_limit 
	global mom_kin_4th_axis_max_limit 
	global mom_kin_4th_axis_direction 
	global mom_kin_4th_axis_rotation 
	global mom_kin_4th_axis_zero 
	global mom_kin_4th_axis_center_offset 
	global mom_kin_pivot_gauge_offset 
	global mom_kin_gauge_to_pivot
	global mom_kin_5th_axis_plane 
	global mom_kin_5th_axis_vector 
	global mom_kin_5th_axis_angles 
	global mom_kin_5th_axis_min_incr 
	global mom_kin_5th_axis_min_limit 
	global mom_kin_5th_axis_max_limit 
	global mom_kin_5th_axis_direction 
	global mom_kin_5th_axis_rotation 
	global mom_kin_5th_axis_inclination_to_4th 
	global mom_kin_5th_axis_zero 
	global mom_kin_5th_axis_center_offset
	global mom_kin_linearization_tol 
	global mom_kin_linearization_flag 
	global mom_kin_independent_head 
	global mom_kin_nurbs_output_type 
	global mom_kin_output_unit 
	global mom_kin_4th_axis_center_offset_x
	global mom_kin_4th_axis_center_offset_y
	global mom_kin_4th_axis_center_offset_z
	global mom_kin_4th_axis_angles_a1
	global mom_kin_4th_axis_angles_a2
	global mom_kin_4th_axis_vector_i
	global mom_kin_4th_axis_vector_j
	global mom_kin_4th_axis_vector_k
	global mom_kin_track_center_of_ball
	global mom_kin_read_ahead_next_motion
 	global leader_4th leader_5th
	global tcl_platform

  	if {$tcl_platform(os) == "HP-UX"} {
		set plat "hpp"
		set suffix "sl"
	} elseif {$tcl_platform(os) == "windows" || \
		$tcl_platform(os) == "Windows NT"} {
		set plat "wnt"
		set suffix "dll"
	} else {
		set plat "sun"
		set suffix "so"
	}
	set uf_library "ugpadvkins.$suffix"

	set mom_kin_read_ahead_next_motion	TRUE
	set mom_kin_machine_resolution		0.001
	set mom_kin_machine_type			5_axis_dual_table
	set mom_kin_track_center_of_ball		FALSE
	set mom_kin_4th_axis_plane			NONE
	set mom_kin_4th_axis_vector(0)		0.000
	set mom_kin_4th_axis_vector(1)		0.000
	set mom_kin_4th_axis_vector(2)		1.000
	set mom_kin_4th_axis_min_incr		0.001
	set mom_kin_4th_axis_min_limit		0.000
	set mom_kin_4th_axis_max_limit		360.000
	set mom_kin_4th_axis_direction		MAGNITUDE_DETERMINES_DIRECTION
	set mom_kin_4th_axis_rotation			standard
	set mom_kin_4th_axis_zero			0
	set mom_kin_4th_axis_center_offset(0)	0.0
	set mom_kin_4th_axis_center_offset(1)	0.0
	set mom_kin_4th_axis_center_offset(2)	0.0
	set mom_kin_pivot_gauge_offset		0.0
	set mom_kin_gauge_to_pivot(0)		0.0
	set mom_kin_gauge_to_pivot(1)		0.0
	set mom_kin_gauge_to_pivot(2)		0.0
	
	set mom_kin_5th_axis_plane			NONE
	set mom_kin_5th_axis_vector(0)		0.0000
	set mom_kin_5th_axis_vector(1)		1.0000
	set mom_kin_5th_axis_vector(2)		-1.0000
	set mom_kin_5th_axis_min_incr		0.001
	set mom_kin_5th_axis_min_limit		0.000
	set mom_kin_5th_axis_max_limit		180.000
	set mom_kin_5th_axis_direction		MAGNITUDE_DETERMINES_DIRECTION
	set mom_kin_5th_axis_rotation			standard
	set mom_kin_5th_axis_inclination_to_4th	45.000
	set mom_kin_5th_axis_zero			0
# Эти переменные задают смещение осей поворота
# Они берутся из паспорта станка !!!
# Переменные для станка установленного на САЛЮТЕ 
	set mom_kin_5th_axis_center_offset(0)	0.0
	set mom_kin_5th_axis_center_offset(1)	310.128
	set mom_kin_5th_axis_center_offset(2)	-155.064
# Переменные для станка установленного на КНААПО №1
#	set mom_kin_5th_axis_center_offset(1)	309.950
#	set mom_kin_5th_axis_center_offset(2)	-154.975

	set mom_kin_linearization_tol			0.01
	set mom_kin_linearization_flag			TRUE
	set mom_kin_independent_head		NONE
	set mom_kin_nurbs_output_type		HEIDENHAIN_POLY
#	set mom_kin_nurbs_output_type		BSPLINE
#ВРЕМЕННЫЙ КОД	
#	set leader_4th 						"C"
#	set leader_5th 						"B"
#ВРЕМЕННЫЙ КОД	
	global mom_kin_5th_axis_center_offset_x
	global mom_kin_5th_axis_center_offset_y
	global mom_kin_5th_axis_center_offset_z
	global mom_kin_5th_axis_angles_a1
	global mom_kin_5th_axis_angles_a2
	global mom_kin_5th_axis_vector_i
	global mom_kin_5th_axis_vector_j
	global mom_kin_5th_axis_vector_k
	global mom_kin_gauge_to_pivot_x
	global mom_kin_gauge_to_pivot_y
	global mom_kin_gauge_to_pivot_z
	global mom_kin_4th_axis_limit_action
	global mom_kin_5th_axis_limit_action
  
	set mom_kin_4th_axis_limit_action		"Retract / Re-Engage"
	set mom_kin_5th_axis_limit_action		"Retract / Re-Engage"
  	set mom_kin_4th_axis_center_offset_x $mom_kin_4th_axis_center_offset(0)
	set mom_kin_4th_axis_center_offset_y $mom_kin_4th_axis_center_offset(1) 
	set mom_kin_4th_axis_center_offset_z $mom_kin_4th_axis_center_offset(2)
	set mom_kin_5th_axis_center_offset_x $mom_kin_5th_axis_center_offset(0)
	set mom_kin_5th_axis_center_offset_y $mom_kin_5th_axis_center_offset(1) 
	set mom_kin_5th_axis_center_offset_z $mom_kin_5th_axis_center_offset(2)
	set mom_kin_4th_axis_vector_i $mom_kin_4th_axis_vector(0)
	set mom_kin_4th_axis_vector_j $mom_kin_4th_axis_vector(1)
	set mom_kin_4th_axis_vector_k $mom_kin_4th_axis_vector(2)
	set mom_kin_5th_axis_vector_i $mom_kin_5th_axis_vector(0)
	set mom_kin_5th_axis_vector_j $mom_kin_5th_axis_vector(1)
	set mom_kin_5th_axis_vector_k $mom_kin_5th_axis_vector(2)

	switch $mom_kin_4th_axis_plane {
		"XY" -
		"YX"
		{
			set mom_kin_4th_axis_vector_i		0.0
			set mom_kin_4th_axis_vector_j		0.0
			set mom_kin_4th_axis_vector_k		1.0
         		}
    		"YZ" -
    		"ZY"
         		{
			set mom_kin_4th_axis_vector_i		1.0
			set mom_kin_4th_axis_vector_j		0.0
			set mom_kin_4th_axis_vector_k		0.0
		}
		"ZX" -
		"XZ"
		{
			set mom_kin_4th_axis_vector_i		0.0
			set mom_kin_4th_axis_vector_j		1.0
			set mom_kin_4th_axis_vector_k		0.0
		}
		default
		{
			if {[info exists mom_kin_4th_axis_vector]} {
				set mom_kin_4th_axis_vector_i $mom_kin_4th_axis_vector(0)
				set mom_kin_4th_axis_vector_j $mom_kin_4th_axis_vector(1)
				set mom_kin_4th_axis_vector_k $mom_kin_4th_axis_vector(2)
			} elseif {[info exists mom_kin_4th_axis_angles]} {
				set mom_kin_4th_axis_angles_a1 $mom_kin_4th_axis_angles(0)
				set mom_kin_4th_axis_angles_a2 $mom_kin_4th_axis_angles(1)
			} else {
				set mom_kin_4th_axis_vector_i		0.0
				set mom_kin_4th_axis_vector_j		0.0
				set mom_kin_4th_axis_vector_k		0.0
				set mom_kin_4th_axis_angles_a1		0.0
				set mom_kin_4th_axis_angles_a2		0.0
               			MOM_output_to_listing_device \
                   				"ERROR: Machine's 4th axis Kinematics are INCONSISTANT"
           		}
		}
	}

	switch $mom_kin_5th_axis_plane {
		"XY" -
		"YX"
		{
			set mom_kin_5th_axis_vector_i		0.0
			set mom_kin_5th_axis_vector_j		0.0
			set mom_kin_5th_axis_vector_k		1.0
		}
    		"YZ" -
    		"ZY"
		{
			set mom_kin_5th_axis_vector_i		1.0
			set mom_kin_5th_axis_vector_j		0.0
			set mom_kin_5th_axis_vector_k		0.0
		}
		"ZX" -
		"XZ"
		{
			set mom_kin_5th_axis_vector_i		0.0
			set mom_kin_5th_axis_vector_j		1.0
			set mom_kin_5th_axis_vector_k		0.0
		}
		default
		{
			if {[info exists mom_kin_5th_axis_vector]} {
				set mom_kin_5th_axis_vector_i $mom_kin_5th_axis_vector(0)
				set mom_kin_5th_axis_vector_j $mom_kin_5th_axis_vector(1)
				set mom_kin_5th_axis_vector_k $mom_kin_5th_axis_vector(2)
			} elseif {[info exists mom_kin_5th_axis_angles]} {
				set mom_kin_5th_axis_angles_a1 $mom_kin_5th_axis_angles(0)
				set mom_kin_5th_axis_angles_a2 $mom_kin_5th_axis_angles(1)
			} else {
				set mom_kin_5th_axis_vector_i		0.0
				set mom_kin_5th_axis_vector_j		0.0
				set mom_kin_5th_axis_vector_k		0.0
				set mom_kin_5th_axis_angles_a1		0.0
				set mom_kin_5th_axis_angles_a2		0.0
				MOM_output_to_listing_device \
					"ERROR: Machine's 5th axis Kinematics are INCONSISTANT"
			}
		}
	}
	MOM_run_user_function [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]$uf_library ufusr
	MOM_load_kinematics
}
#=============================================================
proc CONVERT_POINT  {
		mcs_goto \
		tool_axis \
		pos \
		alt_pos \
		out_angle_pos \
		} \
{
# Эта процедура преобразует координаты  с учетом поворота стола.
#=============================================================
	upvar $mcs_goto mom_mcs_goto
	upvar $tool_axis mom_tool_axis
	upvar $pos mom_pos
	upvar $alt_pos mom_alt_pos
	upvar $out_angle_pos mom_out_angle_pos

	global mom_pos_x mom_pos_y mom_pos_z
	global mom_pos_a1 mom_pos_a2 prev_mom_pos_z
	global mom_mcs_goto_x mom_mcs_goto_y mom_mcs_goto_z
	global mom_tool_axis_i mom_tool_axis_j mom_tool_axis_k
	global mom_alt_pos_x mom_alt_pos_y mom_alt_pos_z
	global mom_alt_pos_a1 mom_alt_pos_a2
	global mom_kin_5th_axis_min_limit
	global mom_kin_5th_axis_max_limit
	global first_move_after_MCSROT MCSROT_flag
    	global c_value theta_value prev_c_value
	global prev_theta_value mom_alt_pos mom_pos
	global mom_rotary_delta_4th mom_rotary_delta_5th

	set mom_mcs_goto_x $mom_mcs_goto(0)
	set mom_mcs_goto_y $mom_mcs_goto(1)
	set mom_mcs_goto_z $mom_mcs_goto(2)

	set mom_tool_axis_i $mom_tool_axis(0)
	set mom_tool_axis_j $mom_tool_axis(1)
	set mom_tool_axis_k $mom_tool_axis(2)
	
# Start backup code
	set mom_pos(3) [format %.7f $mom_pos(3)]
	if {$mom_pos(3) == 45.0000000} {
		set mom_tool_axis_i  [expr $mom_tool_axis_i+0.000001]
	}
# End backup code
	if {$first_move_after_MCSROT == 1 && $MCSROT_flag == 1} {
		MOM_map_to_rotated_csys
	} else {
		MOM_convert_point
	}
	while {$mom_pos_a1 < 0.0} {set mom_pos_a1 [expr $mom_pos_a1+360.0]}
	while {$mom_pos_a1 >= 360.0} {set mom_pos_a1 [expr $mom_pos_a1-360.0]}
	while {$mom_pos_a2 < 0.0} {set mom_pos_a2 [expr $mom_pos_a2+360.0]}
	while {$mom_pos_a2 >= 360.0} {set mom_pos_a2 [expr $mom_pos_a2-360.0]}
	while {$mom_alt_pos_a1 < 0.0} {set mom_alt_pos_a1 [expr $mom_alt_pos_a1+360.0]}
	while {$mom_alt_pos_a1 >= 360.0} {set mom_alt_pos_a1 [expr $mom_alt_pos_a1-360.0]}
	while {$mom_alt_pos_a2 < 0.0} {set mom_alt_pos_a2 [expr $mom_alt_pos_a2+360.0]}
	while {$mom_alt_pos_a2 >= 360.0} {set mom_alt_pos_a2 [expr $mom_alt_pos_a2-360.0]}

	set rot_5th_axis [format "%-.7f" $mom_pos_a2]

	if {[EQ_is_lt $rot_5th_axis $mom_kin_5th_axis_min_limit] || \
		[EQ_is_gt $rot_5th_axis $mom_kin_5th_axis_max_limit] } {

		set mom_pos(0) $mom_alt_pos_x
		set mom_pos(1) $mom_alt_pos_y
		set mom_pos(2) $mom_alt_pos_z
		set mom_pos(3) $mom_alt_pos_a1
		set mom_pos(4) $mom_alt_pos_a2
		set mom_alt_pos(0) $mom_pos_x
		set mom_alt_pos(1) $mom_pos_y
		set mom_alt_pos(2) $mom_pos_z
		set mom_alt_pos(3) $mom_pos_a1
		set mom_alt_pos(4) $mom_pos_a2
		set theta_value $mom_alt_pos_a1
		
		if {[info exist prev_theta_value]} {
			set c_value [SET_ROTARY_ANGLE $theta_value]
		} else {
			set c_value $theta_value
		}
		
		set mom_out_angle_pos(0) $c_value
		set mom_out_angle_pos(1) $mom_alt_pos_a2
		set prev_theta_value $theta_value 
		set prev_c_value $c_value
	} else {
		set mom_pos(0) $mom_pos_x
		set mom_pos(1) $mom_pos_y
		set mom_pos(2) $mom_pos_z
		set mom_pos(3) $mom_pos_a1
		set mom_pos(4) $mom_pos_a2
		set mom_alt_pos(0) $mom_alt_pos_x
		set mom_alt_pos(1) $mom_alt_pos_y
		set mom_alt_pos(2) $mom_alt_pos_z
		set mom_alt_pos(3) $mom_alt_pos_a1
		set mom_alt_pos(4) $mom_alt_pos_a2
		set theta_value $mom_pos_a1
		if {[info exist prev_theta_value]} {
			set c_value [SET_ROTARY_ANGLE $theta_value]
		} else {
			set c_value $theta_value
		}
		set mom_out_angle_pos(0) $c_value
		set mom_out_angle_pos(1) $mom_pos_a2
		set prev_theta_value $theta_value
		set prev_c_value $c_value
	}
}
#=============================================================
proc CONVERT_CYCLES_DATA {} {
# Эта процедура преобразует координаты в циклах.
#=============================================================
	global mom_mcs_goto
	global mom_tool_axis
	global mom_out_angle_pos
	global mom_cycle_rapid_to
	global mom_cycle_retract_to
	global mom_cycle_feed_to
	global mom_pos
	global mom_cycle_rapid_to_pos
	global mom_cycle_retract_to_pos
	global mom_cycle_feed_to_pos

	set dummy_alt_pos(0) 0.0
	set dummy_alt_pos(1) 0.0
	set dummy_alt_pos(2) 0.0
	set dummy_alt_pos(3) 0.0
	set dummy_alt_pos(4) 0.0

	CONVERT_POINT mom_mcs_goto \
		mom_tool_axis \
		mom_pos \
		mom_alt_pos \
		mom_out_angle_pos

	set retract_to_point(0) [expr $mom_mcs_goto(0) + \
		$mom_cycle_retract_to * $mom_tool_axis(0)]
	set retract_to_point(1) [expr $mom_mcs_goto(1) + \
		$mom_cycle_retract_to * $mom_tool_axis(1)]
	set retract_to_point(2) [expr $mom_mcs_goto(2) + \
		$mom_cycle_retract_to * $mom_tool_axis(2)]
  
	CONVERT_POINT retract_to_point \
		mom_tool_axis \
		mom_cycle_retract_to_pos \
		dummy_alt_pos \
		mom_out_angle_pos

	set rapid_to_point(0) [expr $mom_mcs_goto(0) + \
		$mom_cycle_rapid_to * $mom_tool_axis(0)]
	set rapid_to_point(1) [expr $mom_mcs_goto(1) + \
		$mom_cycle_rapid_to * $mom_tool_axis(1)]
	set rapid_to_point(2) [expr $mom_mcs_goto(2) + \
		$mom_cycle_rapid_to * $mom_tool_axis(2)]

	CONVERT_POINT rapid_to_point \
		mom_tool_axis \
		mom_cycle_rapid_to_pos \
		dummy_alt_pos \
		mom_out_angle_pos
 
	set feed_to_point(0) [expr $mom_mcs_goto(0) + \
		$mom_cycle_feed_to * $mom_tool_axis(0)]
	set feed_to_point(1) [expr $mom_mcs_goto(1) + \
		$mom_cycle_feed_to * $mom_tool_axis(1)]
	set feed_to_point(2) [expr $mom_mcs_goto(2) + \
		$mom_cycle_feed_to * $mom_tool_axis(2)]
	
	CONVERT_POINT feed_to_point \
		mom_tool_axis \
		mom_cycle_feed_to_pos \
		dummy_alt_pos \
		mom_out_angle_pos
}
#=============================================================
proc CONVERT_ARC_DATA {} {
# Эта процедура преобразует координаты дуг окружностей.
#=============================================================
	global mom_arc_center
	global mom_prev_mcs_goto
	global mom_tool_axis
	global mom_pos_arc_center
	global mom_prev_pos
	global mom_prev_alt_pos

	set dummy_out_angle_pos(0) 0.0
	set dummy_out_angle_pos(1) 0.0
	set dummy_alt_pos(0) 0.0
	set dummy_alt_pos(1) 0.0
	set dummy_alt_pos(2) 0.0
	set dummy_alt_pos(3) 0.0
	set dummy_alt_pos(4) 0.0

	CONVERT_POINT mom_arc_center \
		mom_tool_axis \
		mom_pos_arc_center \
		dummy_alt_pos \
		dummy_out_angle_pos
	
	CONVERT_POINT mom_prev_mcs_goto \
		mom_tool_axis \
		mom_prev_pos \
		mom_prev_alt_pos \
		dummy_out_angle_pos
}
#=============================================================
proc SET_MCS_ROTATION_ANGLES {} {
# Эта процедура задает вращение системы координат станка.
#=============================================================
	global mom_record_fields mom_field_count mom_tool_axis
	global mom_origin mom_translate
	global mom_translate_x mom_translate_y mom_translate_z
	global mom_origin_x mom_origin_y mom_origin_z
	global MCSROT_flag first_move_after_MCSROT
	global trans_axis trans_angle MCSROT_mode

	set MCSROT_flag 1

	switch $MCSROT_mode {
	"AUTO"
	{
		set I $mom_tool_axis(0)
		set J $mom_tool_axis(1)
		set K $mom_tool_axis(2)
		set rad2deg [expr 90.0/asin(1.0)]
		set reslt_JK [expr sqrt(pow($J,2)+pow($K,2))]
		set trans_axis(0) "AAXIS"
		set trans_axis(1) "BAXIS"
		set trans_axis(2) "0"
		set trans_angle(0) [expr -1.0*atan2($J,$K)*$rad2deg]
		set trans_angle(1) [expr atan2($I,$reslt_JK)*$rad2deg]
		set trans_angle(2) 0.0
	}
	default
	{ 
		if {$mom_field_count > 7 || \
		$mom_field_count == 1 || \
		[expr fmod($mom_field_count,2)] == 0.0 } {
		MOM_output_to_listing_device \
		"ERROR: Invalid number of arguments for MCSROT"
		MOM_output_to_listing_device \
		"ACTION: Aborting Coordinate System Rotation"
		set MCSROT_flag 0
		return
		}
		set j 0
		for {set i 1} {$i < 7} {incr i 2} {
		if {[info exists mom_record_fields($i)]} {
			set trans_axis($j) $mom_record_fields($i)
		} else { set trans_axis($j) 0 }
 			set k [expr $i+1]
			if {[info exists mom_record_fields($k)]} {
				set trans_angle($j) $mom_record_fields($k)
			} else { set trans_angle($j) 0 }
				incr j
			}
		}
	}
  	if {[info exists mom_origin]} {
      		set mom_origin_x $mom_origin(0)
      		set mom_origin_y $mom_origin(1)
      		set mom_origin_z $mom_origin(2)
  	}

  	if {[info exists mom_translate]} {
      		set mom_translate_x $mom_translate(0)
      		set mom_translate_y $mom_translate(1)
      		set mom_translate_z $mom_translate(2)
  	}
}
#=============================================================
proc CHECK_PLANE_CHANGE {} {
# Эта процедура проверяет смену проскости обработки.
#=============================================================
	global mom_motion_type mom_mcs_goto mom_tool_axis 
	global mom_pos mom_alt_pos mom_out_angle_pos MCSROT_mode 
	global MCSROT_flag is_MCSROT_matrix_set

	if {$mom_motion_type == "CYCLE" && $MCSROT_mode == "AUTO"} {
		if {[CHECK_TOOL_AXIS]} {
			MOM_do_template cancel_rotate_mcs
			set MCSROT_flag 0
			CONVERT_CYCLES_DATA
			MOM_do_template rapid_xyz
			set MCSROT_flag 1
			set is_MCSROT_matrix_set 0
		}
	}
}
#=============================================================
proc CHECK_TOOL_AXIS {} {
# Эта процедура проверяет ориентацию оси инструмента.
#=============================================================
	global mom_tool_axis mom_prev_tool_axis

	set I [format "%-.7f" $mom_tool_axis(0)]
	set prev_I [format "%-.7f" $mom_prev_tool_axis(0)]
	set J [format "%-.7f" $mom_tool_axis(1)]
	set prev_J [format "%-.7f" $mom_prev_tool_axis(1)]
	set K [format "%-.7f" $mom_tool_axis(2)]
	set prev_K [format "%-.7f" $mom_prev_tool_axis(2)]

	if {$I == $prev_I && $J == $prev_J && $K == $prev_K} {
		return 0
	} else {
		return 1
	}
}
#=============================================================
proc MOM_machine_mode {} {
# Эта процедура устанавливае режим работы станка.
#=============================================================
	MOM_start_of_group
}
#=============================================================
proc MOM_spindle_orient { } {
# Эта процедура вызывает команду ориентации шпинделя.
#=============================================================	
	global mom_angle_orient
	MOM_force once Angle
	MOM_do_template spindle_orient
}	

proc MOM_insert { } {
#	MOM_output_literal "HELLO"
}	