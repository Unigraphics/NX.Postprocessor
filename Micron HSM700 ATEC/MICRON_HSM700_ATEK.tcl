######################## TCL FILE ##############################
# Description												#
# Postprocessor for machine: MICRON HSM 700					#
# 3 axis  High speed cutting Machine Tool							#
# CNC control system: ATEK HS PLUS							#
# Software version: 5.0										#
#														#
# Revisions												#
#														#
#   Date            		Who        		Reason						#
#  28-Aug-2001		Oleg Chizh 	First Release					#
#														#
# $HISTORY$												#
#														#
###############################################################

set 		cam_post_dir [MOM_ask_env_var UGII_CAM_POST_DIR]
set 		cam_debug_dir [MOM_ask_env_var UGII_CAM_DEBUG_DIR]
source 	${cam_post_dir}ugpost_base.tcl
 
proc 		MOM_before_each_add_var {} {}
proc 		MOM_before_each_event {} {}
 
# source ${cam_debug_dir}mom_review.tcl ;  MOM_set_debug_mode ON

########## SYSTEM VARIABLE DECLARATIONS ##############
set mom_sys_rapid_code					"0"  
set mom_sys_linear_code					"1"  
set mom_sys_circle_code(CLW)			"2"  
set mom_sys_circle_code(CCLW)			"3"  
set mom_sys_delay_code(SECONDS)		"4"  
set mom_sys_delay_code(REVOLUTIONS)	"4"  
set mom_sys_cutcom_plane_code(XY)             	"17" 
set mom_sys_cutcom_plane_code(ZX)             	"18" 
set mom_sys_cutcom_plane_code(YZ)             	"19" 
set mom_sys_cutcom_code(OFF)                  	"40" 
set mom_sys_cutcom_code(LEFT)                 	"41" 
set mom_sys_cutcom_code(RIGHT)                	"42" 
set mom_sys_adjust_code                       		"43" 
set mom_sys_adjust_code_minus                 	"44" 
set mom_sys_adjust_cancel_code                	"49" 
set mom_sys_unit_code(IN)                     		"70" 
set mom_sys_unit_code(MM)                     		"71" 
set mom_sys_cycle_breakchip_code              	"82" 
set mom_sys_cycle_bore_no_drag_code           	"87" 
set mom_sys_cycle_off                         			"80" 
set mom_sys_cycle_drill_code				"81" 
set mom_sys_cycle_drill_deep_code		"83" 
set mom_sys_cycle_drill_dwell_code		"81" 
set mom_sys_cycle_tap_code				"84" 
set mom_sys_cycle_bore_code			"85" 
set mom_sys_cycle_bore_drag_code		"86" 
set mom_sys_cycle_bore_back_code		"87" 
set mom_sys_cycle_bore_manual_code		"87" 
set mom_sys_cycle_bore_dwell_code		"87" 
set mom_sys_output_code(ABSOLUTE)		"90" 
set mom_sys_output_code(INCREMENTAL)	"91" 
set mom_sys_cycle_ret_code(AUTO)		"98" 
set mom_sys_cycle_ret_code(MANUAL)		"99" 
set mom_sys_reset_code					"92" 
set mom_sys_feed_rate_mode_code(MMPM)	"94" 
set mom_sys_feed_rate_mode_code(MMPR)	"95" 
set mom_sys_feed_rate_mode_code(FRN)	"93" 
set mom_sys_spindle_mode_code(SFM)		"96" 
set mom_sys_spindle_mode_code(RPM)		"97" 
set mom_sys_return_code				"28" 
set mom_sys_program_stop_code			"0"  
set mom_sys_optional_stop_code			"1"  
set mom_sys_end_of_program_code		"2"  
set mom_sys_spindle_direction_code(CLW)      "3"  
set mom_sys_spindle_direction_code(CCLW)	"4"  
set mom_sys_spindle_direction_code(OFF)	"5"  
set mom_sys_tool_change_code                  	"6"  
set mom_sys_coolant_code(MIST)                	"50"  
set mom_sys_coolant_code(ON)                  	"50"  
set mom_sys_coolant_code(FLOOD)               	"50"  
set mom_sys_coolant_code(TAP)                 	"50"  
set mom_sys_coolant_code(OFF)                 	"9"  
set mom_sys_rewind_code                       		"30" 
set mom_sys_spindle_ranges                    		"0"  
set mom_sys_rewind_stop_code                  	"#"  
set mom_sys_home_pos(0)                       		"0"  
set mom_sys_home_pos(1)                       		"0"  
set mom_sys_home_pos(2)                       		"0"  
set mom_sys_zero                              			"0"  
set mom_sys_opskip_block_leader               	"/"  
set mom_sys_seqnum_start                      		"10" 
set mom_sys_seqnum_incr                       		"10" 
set mom_sys_seqnum_freq                       		"1"  
set mom_sys_leader(N)					"N"  
set mom_sys_feed_param(MMPM,format)		"Feed_MMPM"
set mom_sys_feed_param(FRN,format)		"Feed_INV"
set mom_sys_control_out					"("  
set mom_sys_control_in					")"  

####### KINEMATIC VARIABLE DECLARATIONS ##############
set mom_kin_arc_output_mode			"FULL_CIRCLE"
set mom_kin_arc_valid_planes				"XYZ"
set mom_kin_clamp_time					"2.0"
set mom_kin_flush_time					"2.0"
set mom_kin_linearization_flag				"1"  
set mom_kin_linearization_tol				"0.001"
set mom_kin_machine_resolution			"0.001"
set mom_kin_machine_type				"3_axis_mill"
set mom_kin_max_arc_radius				"99999.999"
set mom_kin_min_arc_radius                    		"0.001"
set mom_kin_max_fpm                           		"30000"
set mom_kin_max_frn                           			"99999.999"
set mom_kin_min_fpm					"1"  
set mom_kin_min_frn					"0.001"
set mom_kin_output_unit					"MM" 
set mom_kin_pivot_gauge_offset			"0.0"
set mom_kin_post_data_unit				"MM" 
set mom_kin_rapid_feed_rate				"40000"
set mom_kin_tool_change_time			"8.0"
set mom_kin_x_axis_limit					"800"
set mom_kin_y_axis_limit					"800"
set mom_kin_z_axis_limit					"600"

####  Listing File variables 
set mom_sys_list_output                       		"ON" 
set mom_sys_header_output                     		"OFF"
set mom_sys_list_file_rows                    		"40" 
set mom_sys_list_file_columns                 		"30" 
set mom_sys_warning_output                    		"OFF"
set mom_sys_group_output                      		"OFF"
set mom_sys_list_file_suffix                  		"lpt"
set mom_sys_output_file_suffix                		"iso"
set mom_sys_commentary_output                 	"ON" 
set mom_sys_commentary_list                   		"x y z feed speed"

#### User define variables
set pb_start_of_program_flag 				0
set mom_pos(0)						"9999999"
set mom_pos(1)						"9999999"
set mom_pos(2)						"9999999"
set cutcom_on_flag						"0"
set mom_group_name					"UNDEFINE"

############## EVENT HANDLING SECTION ################

#=============================================================
proc MOM_text { } {
#=============================================================
	global mom_record_text
#	MOM_output_literal "$mom_record_text"
}

#=============================================================
proc MOM_circular_move { } {
#=============================================================
	CIRCLE_SET
	MOM_do_template spindle_rpm
  	MOM_do_template circular_move_1
}
#=============================================================
proc MOM_linear_move { } {
#=============================================================
  	global mom_feed_rate mom_feed_rate_per_rev mom_kin_max_fpm first_linear_move
	global mom_programmed_feed_rate cutcom_on_flag
	
  	if { [EQ_is_ge $mom_programmed_feed_rate $mom_kin_max_fpm] } {
  		MOM_do_template spindle_rpm
     		MOM_rapid_move ; return
  	}
  	if { $cutcom_on_flag == 1 } {
  		MOM_do_template spindle_rpm
  		MOM_do_template linear_move_1
  		set cutcom_on_flag "0"
  	} else {
  		MOM_do_template spindle_rpm
  		MOM_do_template linear_move_1
  	}	
}
#=============================================================
proc MOM_cutcom_on { } {
#=============================================================
	global mom_pos cutcom_on_flag

	CUTCOM_SET

#  	MOM_force Once X Y
#  	MOM_suppress once G_cutcom G_motion M_spindle M_coolant F
  	set cutcom_on 1
  	MOM_do_template cutcom_on BUFFER  
}
#=============================================================
proc MOM_cutcom_off { } {
#=============================================================
  	CUTCOM_SET
  	MOM_do_template cutcom_off BUFFER
}
#=============================================================
proc MOM_rapid_move { } {
#=============================================================
  	global rapid_spindle_inhibit rapid_traverse_inhibit
  	global spindle_first is_from mom_prev_pos mom_pos
  	global mom_cycle_spindle_axis traverse_axis1 traverse_axis2
  	
  	set aa(0) X ; set aa(1) Y ; set aa(2) Z
  	RAPID_SET
  	set spindle_block rapid_spindle
  	set traverse_block rapid_traverse
  	if {$spindle_first == "TRUE"} {
    		if {$rapid_spindle_inhibit == "FALSE"} {
       			MOM_suppress once $aa($traverse_axis1) $aa($traverse_axis2)
       			MOM_do_template spindle_rpm
			MOM_do_template $spindle_block $is_from
       			MOM_suppress off $aa($traverse_axis1) $aa($traverse_axis2)
    		}
    		if {$rapid_traverse_inhibit == "FALSE"} {
       			MOM_suppress once $aa($mom_cycle_spindle_axis)
       			MOM_do_template spindle_rpm
			MOM_do_template $traverse_block $is_from
       			MOM_suppress off $aa($mom_cycle_spindle_axis)
    		}
  	} elseif {$spindle_first == "FALSE"} {
    		if {$rapid_traverse_inhibit == "FALSE"} {
       			MOM_suppress once $aa($mom_cycle_spindle_axis)
       			MOM_do_template spindle_rpm
       			MOM_do_template $traverse_block $is_from
       			MOM_suppress off $aa($mom_cycle_spindle_axis)
    		}
    		if {$rapid_spindle_inhibit == "FALSE"} {
       			MOM_suppress once $aa($traverse_axis1) $aa($traverse_axis2)
       			MOM_do_template spindle_rpm
       			MOM_do_template $spindle_block $is_from
       			MOM_suppress off $aa($traverse_axis1) $aa($traverse_axis2)
    		}
  	} else {
  		MOM_do_template spindle_rpm
      		MOM_do_template $traverse_block $is_from
  	}
}
#=============================================================
proc MOM_start_of_program { } {
#=============================================================
	global mom_logname mom_date is_from
	global mom_coolant_status mom_cutcom_status
	global mom_clamp_status mom_cycle_status
	global mom_spindle_status mom_cutcom_plane
	global mom_cutcom_adjust_register mom_tool_adjust_register
	global mom_tool_length_adjust_register mom_length_comp_register
	global mom_flush_register mom_wire_cutcom_adjust_register

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
 
	set is_from ""
 	
 	OPEN_files ; 			#open warning and listing files
	LIST_FILE_HEADER ; 	#list header in commentary listing
}
#=============================================================
proc MOM_start_of_group {} {
#=============================================================
	global mom_sys_group_output mom_group_name group_level ptp_file_name
	global mom_sys_seqnum_start mom_sys_seqnum_freq mom_sys_seqnum_incr
	global mom_sys_ptp_output pb_start_of_program_flag
 
	if {[regexp NC_PROGRAM $mom_group_name] == 1} {
		set group_level 0
		return
	}
 	if {[hiset mom_sys_group_output]} { 
		if {$mom_sys_group_output == "OFF"} {
			set group_level 0 
			return
		}
	}
	if {[hiset group_level]} {
		incr group_level
	} else {
		set group_level 1
	}
    	if {$group_level > 1} {
    		return
    	}
     	SEQNO_RESET ;		#<4133654>
    	MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
     	if {[info exists ptp_file_name]} {
      		MOM_close_output_file $ptp_file_name 
      		MOM_start_of_program
      		if {$mom_sys_ptp_output == "ON"} {
      			MOM_open_output_file $ptp_file_name 
      		}
    	} else {
      		MOM_start_of_program
    	}
 	PB_start_of_program 
 	set pb_start_of_program_flag 1
 	set mom_group_name $mom_group_name
}
#=============================================================
proc PB_start_of_program { } {
#=============================================================
	global mom_date mom_part_name
	global out_str1 out_str2
	global mom_tool_number  mom_tool_diameter
	global mom_operation_type mom_path_name
	global mom_machine_name
	
	MOM_force once S M_spindle G_cutcom G
	MOM_force once G_plane G_mode G_motion 
	set mom_date [string toupper $mom_date ] 	
	MOM_output_literal "(DATE: $mom_date)"
	MOM_output_literal "(MACHINE: MICRON HSM 700 ATEC)"
	MOM_output_literal "(POSTPROCESSOR: $mom_machine_name)"
	set mom_part_name [string toupper $mom_part_name ]
	MOM_output_literal "(PART: $mom_part_name)"
	set out_str1 "TEXT 1(\" "
	set out_str2 "C-MILL TECHNOLOGIE AG \")"
	MOM_do_template start_block1
	set out_str1 "TEXT 2(\" "
	set mom_operation_type [string toupper $mom_operation_type ]
	set path_name [string trimleft  $mom_path_name _]
	set out_str2 "$mom_path_name $mom_operation_type \")"
	MOM_do_template start_block1
	MOM_output_literal "(PROJECT: AVTOVAZ)"
	MOM_do_template tool_description
}
#=============================================================
proc  DELAY_TIME_SET { } {
#=============================================================
	global mom_sys_delay_param mom_delay_value
	global mom_delay_revs mom_delay_mode delay_time
 
    	if {[info exists mom_sys_delay_param(${mom_delay_mode},format)] != 0} {
      		MOM_set_address_format dwell $mom_sys_delay_param(${mom_delay_mode},format)
    	}
 	switch $mom_delay_mode {
      		SECONDS {set delay_time $mom_delay_value}
      		default {set delay_time $mom_delay_revs}
    	}
}
#=============================================================
proc  MOM_before_motion { } {
#=============================================================
	FEEDRATE_SET
}
#=============================================================
proc MOM_machine_mode {} {
#=============================================================
	global pb_start_of_program_flag
 
	if {$pb_start_of_program_flag == 0} {
		PB_start_of_program
		set pb_start_of_program_flag 1
	}
}
#=============================================================
proc MOM_start_of_path { } {
#=============================================================
	global first_linear_move
	global mom_operation_name 
	global pb_start_of_program_flag
	global ptp_file_name mom_output_file_directory output_extn
	global mom_group_name
	
	set first_linear_move 0
	set pb_start_of_program_flag 0
	set output_extn ".iso"
	
  	TOOL_SET MOM_start_of_path
  	if { $mom_group_name != "UNDEFINE" } {
  		MOM_close_output_file $ptp_file_name
		set ptp_file_name "${mom_output_file_directory}${mom_operation_name}${output_extn}"
		if {[file exists $ptp_file_name]} {
      			MOM_remove_file $ptp_file_name
    		}
		MOM_open_output_file $ptp_file_name
		MOM_force once T
		MOM_reset_sequence 1 1 1
		MOM_machine_mode
	} 
	MOM_force once X Y Z F
}
#=============================================================
proc MOM_from_move { } {
#=============================================================
  	global mom_feed_rate mom_feed_rate_per_rev  mom_motion_type mom_kin_max_fpm
  	global mom_pos mom_from_pos
  	COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET ;  MODES_SET
  	MOM_do_template from
}
#=============================================================
proc MOM_first_tool { } {
#=============================================================
  	global mom_tool_change_type mom_manual_tool_change
  	global mom_sys_leader
    
    	if {[info exists mom_tool_change_type]} {
    			switch $mom_tool_change_type {
         				MANUAL {  MOM_do_template stop }
         				AUTO {   	MOM_force Once T M
  						MOM_do_template tool_change_1
  						MOM_do_template absolute_mode
 				}
    			}
  	} elseif {
  		[info exists mom_manual_tool_change]} {
    			if {$mom_manual_tool_change == "TRUE"} {
     				MOM_do_template stop
    			}
  	}
  	MOM_force once S M_spindle
}
#=============================================================
proc MOM_initial_move { } {
#=============================================================
  	global mom_feed_rate mom_feed_rate_per_rev mom_motion_type
  	global mom_kin_max_fpm mom_motion_event mom_pos mom_prev_pos
  
  	COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET ; MODES_SET
 
  	global mom_programmed_feed_rate mom_pos mom_prev_pos
  	
  	MOM_do_template first_move
  	MOM_add_to_line_buffer END " M50"
  	if { [EQ_is_ge $mom_feed_rate $mom_kin_max_fpm] &&  \
       	      [EQ_is_equal $mom_programmed_feed_rate 0] } {
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
  	  
  	COOLANT_SET ; CUTCOM_SET ; SPINDLE_SET ; RAPID_SET ; MODES_SET
  	
  	catch {MOM_$mom_motion_event}
}
#=============================================================
proc MOM_gohome_move { } {
#=============================================================
	MOM_rapid_move
}
#=============================================================
proc MOM_end_of_path { } {
#=============================================================
	global pb_start_of_program_flag

	MOM_end_of_program
}
#=============================================================
proc MOM_end_of_program { } {
#=============================================================
	global mom_output_file_directory mom_output_file_basename
	global output_file_iso mom_sys_output_file_suffix output_file_ptp output_extn
	MOM_do_template end_of_program 
 
#**** The following procedure lists the tool  list with time in commentary data
	LIST_FILE_TRAILER
#**** The following procedure closes the warning and listing files
	CLOSE_files
}
#=============================================================
proc MOM_tool_change { } {
#=============================================================
	global mom_tool_change_type mom_manual_tool_change
	global mom_sys_leader 
	
	if {[info exists mom_tool_change_type]} {
    		switch $mom_tool_change_type {
         			MANUAL { MOM_do_template stop }
         			AUTO { 	MOM_force Once T M
  					MOM_do_template tool_change_1
  					MOM_do_template absolute_mode
 		 	}
    		}
  	} elseif {[info exists mom_manual_tool_change]} {
    		if {$mom_manual_tool_change == "TRUE"} {
  			MOM_do_template stop
    		}
  	}
  	MOM_force once S M_spindle X Y Z F
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
  	MOM_force Once S M_spindle
  	MOM_do_template spindle_rpm
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
proc MOM_delay { } {
#=============================================================
	DELAY_TIME_SET
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
  
  	MOM_do_template load_tool
  	MOM_do_template absolute_mode
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
  	MOM_do_template tool_preselect
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
proc  MOM_drill_move { } {
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
proc  MOM_drill_dwell_move { } {
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
proc  MOM_drill_deep_move { } {
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
proc  MOM_drill_break_chip_move { } {
#=============================================================
  	global cycle_init_flag 
  	MOM_do_template cycle_breakchip
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
proc  MOM_tap_move { } {
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
proc  MOM_bore_move { } {
#=============================================================
  	global cycle_init_flag 
  	MOM_do_template cycle_bore
  	set cycle_init_flag FALSE
}
#=============================================================
proc MOM_bore_drag { } {
#=============================================================
  	global cycle_name
  	global cycle_init_flag
  	set cycle_init_flag TRUE
  	set cycle_name BORE_DRAG
  	CYCLE_SET
}
#=============================================================
proc  MOM_bore_drag_move { } {
#=============================================================
  	global cycle_init_flag 
  	MOM_do_template cycle_bore_drag
  	set cycle_init_flag FALSE
}
#=============================================================
proc MOM_bore_no_drag { } {
#=============================================================
  	global cycle_name
  	global cycle_init_flag
  	set cycle_init_flag TRUE
  	set cycle_name BORE_NO_DRAG
	CYCLE_SET
}
#=============================================================
proc  MOM_bore_no_drag_move { } {
#=============================================================
  	global cycle_init_flag 
  	MOM_do_template cycle_bore_no_drag
  	set cycle_init_flag FALSE
}
#=============================================================
proc MOM_bore_manual { } {
#=============================================================
  	global cycle_name
  	global cycle_init_flag
  	set cycle_init_flag TRUE
  	set cycle_name BORE_MANUAL
  	CYCLE_SET
}
#=============================================================
proc  MOM_bore_manual_move { } {
#=============================================================
  	global cycle_init_flag 
 	MOM_do_template cycle_bore_manual
  	set cycle_init_flag FALSE
}
#=============================================================
proc MOM_bore_dwell { } {
#=============================================================
  	global cycle_name
  	global cycle_init_flag
  	set cycle_init_flag TRUE
  	set cycle_name BORE_DWELL
  	CYCLE_SET
}
#=============================================================
proc  MOM_bore_dwell_move { } {
#=============================================================
  	global cycle_init_flag 
  	MOM_do_template cycle_bore_dwell
  	set cycle_init_flag FALSE
}
#=============================================================
proc MOM_bore_back { } {
#=============================================================
  	global cycle_name
  	global cycle_init_flag
  	set cycle_init_flag TRUE
  	set cycle_name BORE_BACK
  	CYCLE_SET
}
#=============================================================
proc  MOM_bore_back_move { } {
#=============================================================
  	global cycle_init_flag 
  	MOM_do_template cycle_bore_back
  	set cycle_init_flag FALSE
}
#=============================================================
proc MOM_bore_manual_dwell { } {
#=============================================================
  	global cycle_name
  	global cycle_init_flag
  	set cycle_init_flag TRUE
  	set cycle_name BORE_MANUAL_DWELL
  	CYCLE_SET
}
#=============================================================
proc  MOM_bore_manual_dwell_move { } {
#=============================================================
  	global cycle_init_flag 
  	MOM_do_template cycle_bore_m_dwell
  	set cycle_init_flag FALSE
}
