##############################################################################
# Description
#	Post-Processeur pour Machine Deckel 4 Axes
#			HEIDENHAIN TNC 530 (Langage Exclusivement)
#	Client : JMD
#
#
#
# Revisions
#
#	Date		Who		Reason
#	04-Sep-2005	J. Moreschi	Originale (NX 3.0.2.3)
#	20-Nov-2006	J. Moreschi	Ajout Gestion Sens de Rotation de Broche (RESET_speed_m)
#					Revision Fin de Programme
#					Revision Retour aux Origines
#					Revision Cinematique Machine
#	11-Jan-2007	J. Moreschi	Ajout Block_Form
#	15-Oct-2007	J. Moreschi	Revision Fin de Programme
#	23-Oct-2007	J. Moreschi	Revision Sortie Tilda pour Cycles Fixes de Percage 
#					Proc CYCLE_set et MOM_before_output
#
# $HISTORY$
#
###############################################################################
###############################################################################
# EVENT HANDLER SECTION 
#   This section contains the control section for mill3ax post processor. 
#   This program logic determinies the output to the post processor file.
# 
#   The following procedures are performed in the order the events are
#   generated.
###############################################################################
#______________________________________________________________________________
#The following command invokes the debugging mode.
#______________________________________________________________________________
#	source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_debug.tcl
#	source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl
#******** Setting the debug mode ON/OFF
#	MOM_set_debug_mode ON

#______________________________________________________________________________
#The following command invokes the warning mode and the default settings.
#______________________________________________________________________________
        source "[MOM_ask_env_var UGII_CAM_POST_DIR]ugpost_base.tcl"

#_______________________________________________________________________________
# Set kinematic variables
#_______________________________________________________________________________

         set mom_kin_output_unit                        MM
         set mom_kin_machine_resolution                 0.000001
         set mom_kin_machine_type                       4_axis_table
         set mom_kin_rapid_feed_rate                    22000.0
         set mom_kin_tool_change_time                   5 ;# Secondes
	 set mom_kin_arc_output_mode			FULL_CIRCLE
	 set mom_kin_helical_arc_output_mode		FULL_CIRCLE
	 set mom_kin_arc_valid_plane			XYZ 
	 set mom_kin_max_arc_radius			99999
	 set mom_kin_min_arc_radius			0.02
	 set mom_kin_min_arc_length 			0.001
	 set mom_kin_max_mpm				90000.0
	 set mom_kin_min_mpm				1

         set mom_kin_4th_axis_plane                     YZ  ;# Independent
         set mom_kin_4th_axis_min_incr                  0.001
         set mom_kin_4th_axis_min_limit                 -99999.999
         set mom_kin_4th_axis_max_limit                 99999.999
         set mom_kin_4th_axis_rotation                  standard
         set mom_kin_4th_axis_direction                 MAGNITUDE_DETERMINES_DIRECTION
	 set mom_kin_4th_axis_type			table
         set mom_kin_4th_axis_zero                      0.0
         set mom_kin_4th_axis_center_offset(0)          0.0
         set mom_kin_4th_axis_center_offset(1)          0.0 
         set mom_kin_4th_axis_center_offset(2)          0.0
         set mom_kin_pivot_gauge_offset                 0.0

         set mom_kin_independent_head                   NONE
	 set mom_kin_read_ahead_next_motion		TRUE	;# TRUE (on), FALSE (off default)
	 set mom_kin_nurbs_output_type 			HEIDENHAIN_POLY



#______________________________________________________________________________
#The following file consists of default values set for G & M codes
#______________________________________________________________________________

#********M code declaration

         set mom_sys_program_stop_code              0
         set mom_sys_optional_stop_code             1
         set mom_sys_end_of_program_code            30

         set mom_sys_spindle_direction_code(CLW)    3
         set mom_sys_spindle_direction_code(CCLW)   4
         set mom_sys_spindle_direction_code(OFF)    5
         set mom_sys_spindle_orient    	            19

         set mom_sys_tool_change_code               6

         set mom_sys_coolant_code(MIST)             8
         set mom_sys_coolant_code(FLOOD)            8
         set mom_sys_coolant_code(TAP)              8
         set mom_sys_coolant_code(OFF)              9

         set mom_sys_clamp_code(ON)                 10
         set mom_sys_clamp_code(OFF)                11
         set mom_sys_clamp_code(AXISON)             10
         set mom_sys_clamp_code(AXISOFF)            11

#********G code declaration

         set mom_sys_rapid_code                     0

         set mom_sys_linear_code                    1

         set mom_sys_circle_code(CLW)               2
         set mom_sys_helical_polar_code(CLW)        12
         set h_circle_code(CLW)               	    DR-
         set mom_sys_circle_code(CCLW)              3
         set mom_sys_helical_polar_code(CCLW)       13	
         set h_circle_code(CCLW)               	    DR+

         set mom_sys_delay_code(REVOLUTIONS)        4
         set mom_sys_delay_code(SECONDS)            4

         set mom_sys_cutcom_plane_code(XY)          Z
         set mom_sys_cutcom_plane_code(ZX)          Y
         set mom_sys_cutcom_plane_code(YZ)          X

         set mom_sys_cutcom_code(OFF)               0
         set mom_sys_cutcom_code(LEFT)              L
         set mom_sys_cutcom_code(RIGHT)             R

         set mom_sys_inch_code                      70
         set mom_sys_metric_code                    71

         set mom_sys_cycle_breakchip_code           203
         set mom_sys_cycle_bore_no_drag_code        202

         set mom_sys_cycle_off                     
         set mom_sys_cycle_drill_code               200
         set mom_sys_cycle_drill_dwell_code         200
         set mom_sys_cycle_drill_deep_code          203
         set mom_sys_cycle_tap_code                 207
         set mom_sys_cycle_tap_code_option          206
         set mom_sys_cycle_bore_code                201
         set mom_sys_cycle_bore_dwell_code          201
         set mom_sys_cycle_bore_drag_code           202
         set mom_sys_cycle_bore_back_code           none
         set mom_sys_cycle_bore_manual_code         none
         set mom_sys_cycle_bore_manual_dwell_code   none
         set mom_sys_cycle_drill_text_code          208

 
         set mom_sys_output_code(ABSOLUTE)          90
         set mom_sys_output_code(INCREMENTAL)       91

#_______________________________________________________________________________
# Global Variable Declaration
#_______________________________________________________________________________
         set mom_sys_list_file_columns              132
         set mom_sys_list_file_rows                 50
         set mom_sys_commentary_output              OFF
         set mom_sys_list_output                    OFF
         set mom_sys_group_output                   OFF
         set mom_system_tolerance                   0.001 ;# Tolerance pour proc EQ_is_...

#_______________________________________________________________________________
# User Variable Declaration
#_______________________________________________________________________________

set deg_to_rad [expr asin(1.0) / 90.0]              ;# Convertion Degres en Radians
set rad_to_deg [expr 90.0 / asin(1.0)]              ;# Convertion Radians en Degres

set max_rpm 18000
set min_rpm 20
set spindle_error_flag 0
set mom_spindle_rpm 0

set last_tool_number 0
set save_tool_number 0
set tool_change_flag 0
set last_tool_name ""
set tool_count 0

set xhome 800
set yhome 450
set zhome 450

set first_move_flag 0
set last_cycle_flag 0

set opt_cutcom_code $mom_sys_cutcom_code(OFF)
set opt_cutcom_plane XY

set max_delay 3600
set min_delay 0

set coarse_fine 0

set zero 1

set mom_nurbs_output_flag 0
set nurbs_file_flag 0
set nurbs_file_count 0
set seq_lang ""
set lang h
set flag_lang 0

set 4_axis_flag 0

set flag_partno 0
set flag_block_form 0

set tracking_point_tool 0       ;# Bout Outil pour Fraise Boule et Torique par Defaut

set start_spc_count        0	;# Initialisation Compteur pour Debut Sous Programme
set end_spc_count          0	;# Initialisation Compteur pour Fin Sous Programme
set max_spc_number         99   ;# Nombre Maxi de Sous Programme
set mom_start_spc_array(0) 0    ;# Initialisation Tableau de Variable pour Debut Sous Programme
set mom_end_spc_array(0)   0    ;# Initialisation Tableau de Variable pour Fin Sous Programme
set mom_def_spc_number     0	;# Initialisation Sauvegarde Numero du Sous-Programme
set flag_action_start_spc  0    ;# Initialisation Action Sous-Programme (DEBUT-FIN)
set open_new_spc_file      0    ;# Initialisation pour Nouveau Sous Programme
set call_spc_file          0    ;# Initialisation pour Appel Sous Programme
set recall_spc_new_tool    0    ;# Initialisation pour Rappel Sous Programme avec un Nouvel Outil
set start_end_calls_spc   -1
set check_seq_spc          0    ;# Flag pour Debut de Sequencement du Sous Programme
set sauve_seqnum           0    ;# Pour Sauvegarde Numero de Bloc
set flag_cancel_preset     0
set flag_recall_mess       0    ;# Flag pour Suppression Message en Copie de Sous Programme


set mom_date "[clock format [clock seconds] -format %d-%m-%Y] [clock format [clock seconds] -format %H:%M]"

set prev_pos(0) $xhome ; set prev_pos(1) $yhome ; set prev_pos(2) [expr $zhome-1] 
set prev_pos(3) 0 ; set prev_pos(4) 0 ; set prev_out_angle_pos(0) 0.0 ; set prev_out_angle_pos(1) 0.0

set prev_alt_pos(0) $prev_pos(0); set prev_alt_pos(1) $prev_pos(1) ; set prev_alt_pos(2) $prev_pos(2) 
set prev_alt_pos(3) $prev_pos(3); set prev_alt_pos(4) $prev_pos(4)
set prev_motion_event ""

proc SAVE_prev_pos {{type move}} {
#_______________________________________________________________________________
# Sauve mom_pos dans prev_pos
#_______________________________________________________________________________
	global mom_pos mom_out_angle_pos mom_alt_pos
	global prev_pos prev_alt_pos prev_out_angle_pos
	global mom_cycle_retract_to_pos mom_cycle_rapid_to_pos
	global mom_motion_event prev_motion_event

	if {$type == "move"} {
	for {set i 0} {$i<=4} {incr i 1} {
	set a $mom_pos($i)
	set b $mom_alt_pos($i)
	set prev_pos($i) $a
	set prev_alt_pos($i) $b
	}
	}

	set prev_out_angle_pos(0) $mom_out_angle_pos(0)
	set prev_out_angle_pos(1) $mom_out_angle_pos(1)

	if {$type == "cycle"} {
	for {set i 0} {$i<=2} {incr i 1} {
	set a $mom_cycle_retract_to_pos($i)
	set prev_pos($i) $a
	}
	}
	set prev_motion_event $mom_motion_event

}

proc  MOM_start_of_program {} {
#_______________________________________________________________________________
# This procedure is executed at the very begining of the program.
# It gets called before any command is read from the task file.
#_______________________________________________________________________________
        global mom_part_name 
        global mom_logname mom_date
	global mom_sequence_number mom_sequence_increment mom_sequence_frequency max_sequence
	global lg_message start_message end_message seq_message


#********The following procedure opens the warning and listing files
         OPEN_files
#********The following procedure lists the header information in commentary data
         WARNING_HEADER 

########################
### Sequence setting ###
########################

	set mom_sequence_number 0
	set mom_sequence_increment 1
	set mom_sequence_frequency 1
	set max_sequence 999998
	MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency

########################


################################
### Operator_message setting ###
################################

	set lg_message 		80	;# Longueur Maxi du Message	
	set start_message	";"	;# Debut Message
	set end_message		""	;# Fin Message
	set seq_message		0	;# Numero de Sequence 0 ou 1

################################

	MOM_do_template init CREATE
	MOM_do_template init_smooth CREATE

}

proc MOM_start_of_group {} {
#_______________________________________________________________________________
# This procedure is executed at the start of the group.
#_______________________________________________________________________________
}


proc MOM_end_of_group {} {
#_______________________________________________________________________________
# This procedure is executed at the end of the group.
#_______________________________________________________________________________
}

proc MOM_end_of_program {} {
#_______________________________________________________________________________
# This procedure is executed at the end of the program after all
# the paths are traversed.
#_______________________________________________________________________________
	global opt_spindle_off mom_sys_spindle_direction_code
        global flag_cancel_preset x_preset_value y_preset_value z_preset_value
	global mom_partno mom_output_file_basename name_partno
	global mom_output_file_directory program_file_name partno_file_name
	global mom_out_angle_pos lang

#	CLOSE_nurbs
	MOM_opskip_off
#      	MOM_coolant_off 
#	set opt_spindle_off $mom_sys_spindle_direction_code(OFF)
#	MOM_spindle_off
#	RETURN_move Z
#	RETURN_move XY


       if {[info exist flag_cancel_preset] && [info exist x_preset_value] } {
	if {$flag_cancel_preset == 0} {
         if {$x_preset_value != 0 || $y_preset_value != 0 || $z_preset_value != 0} {
             set x_preset_value 0.0
             set y_preset_value 0.0
             set z_preset_value 0.0
             MOM_do_template preset
             MOM_do_template preset_1
             MOM_do_template preset_2
             MOM_do_template preset_3
            }
           }
          }

	RETURN_move Z

	set mom_out_angle_pos(0) 0.0

	if {[OUTPUT_adr FOUR]} {
	     MOM_do_template rapid_four_$lang
	     MOM_output_literal "CYCL DEF 19.0 PLAN D'USINAGE"
#	     MOM_do_template matrix_off_1
	     MOM_do_template matrix_off_2
	     MOM_output_literal "CYCL DEF 19.0 PLAN D'USINAGE"
	     MOM_output_literal "CYCL DEF 19.1"
	   }


	MOM_output_literal "CALL PGM TNC:\\FIN"
#	MOM_do_template end_of_program
	MOM_do_template end_of_program_0
	MOM_output_text "\03"  ;# ETX

	TOOL_use

#********The following procedure lists the tool list with time in commentary data
         WARNING_TRAILER

#********The following procedure closes the warning and listing files
         CLOSE_files



         set ptp_file_name $mom_output_file_basename.ptp
         MOM_close_output_file $ptp_file_name

         set partno_file_name $name_partno.h                          ;# Extension Specifique pour Machine Deckel
	 set dir_dnc_deckel [MOM_ask_env_var JMD_DNC_DECKEL]          ;# Repertoire DNC

	 if {[file isdirectory $dir_dnc_deckel] == 1} {
              set program_file_name $dir_dnc_deckel/${partno_file_name}
              MOM_output_to_listing_device "     Repertoire DNC Deckel : $program_file_name"
            } else {
              set program_file_name $mom_output_file_directory$partno_file_name
            }

#        set program_file_name $mom_output_file_directory$partno_file_name
         
         catch { file copy -force $mom_output_file_directory$ptp_file_name $program_file_name }

         MOM_close_output_file ${mom_output_file_directory}${mom_output_file_basename}
         catch { file delete -force ${mom_output_file_directory}${mom_output_file_basename} }

}

proc INIT_preset {} {
#_______________________________________________________________________________
# This procedure is used to Initialize Preset to Zero
#_______________________________________________________________________________
	global x_preset_value y_preset_value z_preset_value

       if {[info exist x_preset_value]} {
        if {$x_preset_value != 0 || $y_preset_value != 0 || $z_preset_value != 0} {
#        if {[MOM_ask_address_value preset_x] != 0 || [MOM_ask_address_value preset_y] != 0 || [MOM_ask_address_value preset_z] != 0} {
             set x_preset_value 0.0
             set y_preset_value 0.0
             set z_preset_value 0.0
             MOM_do_template preset
             MOM_do_template preset_1
             MOM_do_template preset_2
             MOM_do_template preset_3
#           }
           }
          }
}


proc  MOM_machine_mode {} {
#_______________________________________________________________________________
# This procedure is executed at the begining program
#_______________________________________________________________________________
}



proc  MOM_start_of_path {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of each path in the task
# It gets called after all the general parameters of the path are loaded
# like the path name and the tool name.
#_______________________________________________________________________________
        global mom_path_name warn_file mom_tool_name mom_operation_type
	global path_warning_flag
	global cycle_helix_dia cycle_helix_lead
	global mom_out_angle_pos

	set outil ""
	if {$mom_tool_name != ""} {set outil "avec Nom d'outil: $mom_tool_name"}

         puts $warn_file "-------------------------------------------------------------------------"
         puts $warn_file "****** Debut Operation $mom_operation_type : $mom_path_name $outil *****"
         puts $warn_file "-------------------------------------------------------------------------"

	set path_warning_flag 0 ; # Gestion proc MOM_path_warning

	CHECK_four_axis

}

proc  MOM_end_of_path {} {
#_______________________________________________________________________________
# This procedure is executed at the end of a path.
#_______________________________________________________________________________
        global mom_path_name warn_file
	global mom_nurbs_output_flag
	global mom_translation_vector
	global mom_transformation_matrix
	global mom_scaling_factor x_preset_value
	global open_new_spc_file flag_cancel_preset

	set mom_nurbs_output_flag 0

	if {[info exist mom_translation_vector] == 1} {
             unset mom_translation_vector
	     unset mom_transformation_matrix
             set flag_cancel_preset 0
           }

	if {[info exist mom_scaling_factor] == 1} {
	     unset mom_scaling_factor
           }

	catch {puts $warn_file "****** Fin Operation $mom_path_name ****** "}

}



proc RESTART {{niveau 0}} {
#_______________________________________________________________________________
# Ressortie des adresses et codes
#_______________________________________________________________________________


	if {$niveau == 0 } {  
	     MOM_do_template init CREATE 
	     RESET_adr X Y S F
	   } else { 
# avec STOP et OPSTOP
	     MOM_do_template init CREATE
	     RESET_adr  X Y
	   }
}

proc RETURN_move {axes} {
#_______________________________________________________________________________
# Gestion Retour aux Origines
#_______________________________________________________________________________
         global prev_pos xhome yhome zhome
	 global lang

#	CLOSE_nurbs

	switch $axes {
	Z {
	if {$prev_pos(2) < $zhome} {
        MOM_coolant_off 
	set prev_pos(2) $zhome
	MOM_do_template ret_z_$lang
	RESET_adr Z
	}
	}
	Y {
	if {$prev_pos(1) < $yhome} {
        MOM_coolant_off 
	set prev_pos(1) $yhome
	MOM_do_template ret_y_$lang
	RESET_adr Y
	}
	}
	XY {
	if {$prev_pos(0) < $xhome || $prev_pos(1) < $yhome } {
	set prev_pos(0) $xhome
	set prev_pos(1) $yhome
	MOM_do_template ret_xy_$lang
	RESET_adr X Y
	}
	}
	}

}

proc  MOM_operator_message {} {
#_______________________________________________________________________________
# This procedure is executed when the Operator Message command is activated.
#_______________________________________________________________________________
	global mom_operator_message

	MOM_partno

	if {$mom_operator_message != "ON" && $mom_operator_message != "OFF"} {
	     MESSAGE $mom_operator_message
	   }
}

proc  MOM_pprint {} {
#_______________________________________________________________________________
# This procedure is executed when the PPrint command is activated.
# Conversion des PPRINT en Operator message
#_______________________________________________________________________________
	global mom_pprint_defined
	global mom_pprint

	MOM_partno

         if {[info exists mom_pprint_defined]} {
          if {$mom_pprint_defined == 1} {
	       MESSAGE $mom_pprint
             }
            }
}

proc MESSAGE {mess {option 0}} {
#_______________________________________________________________________________
# Ecriture message. 
# Usage MESSAGE $variable option CREATE
#_______________________________________________________________________________
	global lg_message start_message end_message seq_message
	global flag_recall_mess

        if {$flag_recall_mess == 1} {return}

	set mess [string toupper $mess]                      ;# Message en Majuscule
	set mess [string range $mess 0 [expr $lg_message-1]] ;# Tronque la Longueur du Message

#       regsub -all { } $mess {-} mess                       ;# Suppression des Espaces

	if {$option != "CREATE"} {
         if {$seq_message == 0} {MOM_set_seq_off}
	      MOM_output_literal "$start_message$mess$end_message"
              MOM_set_seq_on
	   } else { 
              return "$start_message$mess$end_message"
           }
}

proc ERROR {texte {sever 1}} {
#_______________________________________________________________________________
# Ecriture Erreur 
# Usage ERROR $variable sévérité
#_______________________________________________________________________________
	global warn_file warn_count mom_path_name ptp_file_name


	if {$mom_path_name != ""} {set op "(op $mom_path_name)"} else {set op ""}


	switch $sever {
	1 {
	puts $warn_file "#### ATTENTION $op : $texte #### "
	}
	2 {
	puts $warn_file "#### ERREUR $op : $texte #### "
	}
	3 {
	puts $warn_file "#### ERREUR FATALE $op : $texte #### "
	puts $warn_file "#### Avec une ERREUR FATALE le fichier $ptp_file_name est effacé ####";flush $warn_file
#	CLOSE_nurbs
	catch {MOM_close_output_file $ptp_file_name}
	catch {MOM_remove_file $ptp_file_name}
	close $warn_file


        MOM_output_to_listing_device "\n#### ERREUR FATALE $op : ####\n#### $texte .####\n#### STOP POST-PROCESSING #### \n\n"
	MOM_abort
#	MOM_abort " \n\n#### ERREUR FATALE $op : ####\n#### $texte .####\n#### STOP POST-PROCESSING #### \n\n"
	}
	}
        incr warn_count +1
}


proc  MOM_first_tool {} {
#_______________________________________________________________________________
# This procedure is executed for the first operation, with a tool name, in the task.
#_______________________________________________________________________________
	global mom_date

	MOM_partno
	
	MESSAGE "Le $mom_date"

	MOM_tool_change
}

proc  MOM_tool_change {} {
#_______________________________________________________________________________
# This procedure is executed at any time there is a tool name change.
# It gets called after the tool change data is loaded like the tool number 
# and the register numbers.
#_______________________________________________________________________________
        global mom_tool_name last_tool_name
	global mom_tool_number last_tool_number save_tool_number
	global mom_next_tool_status
	global tool_change_flag spindle_error_flag mom_coolant_status
	global mom_cycle_option mom_cycle_orient
	global mom_spindle_rpm sauve_spindle_rpm

	TOOL_use

# Gestion des Changements d'Outil (écriture dans MOM_initial_move)
	set tool_change_flag 0

	if {$mom_tool_number == 0} {
	ERROR "Le Numero d'Outil doit etre initialiser avec la Definition de l'Outil $mom_tool_name" 3
	} elseif {$mom_tool_number != $last_tool_number} {
	set tool_change_flag 1
	set save_tool_number $mom_tool_number
	set spindle_error_flag 0
	set mom_coolant_status OFF
	DEFER {on}
	set mom_cycle_option ""

	if { [info exists mom_cycle_orient] == 1 } {unset mom_cycle_orient} }

	set sauve_spindle_rpm $mom_spindle_rpm

## Gestion du sens de rotation broche (CLW,CCLW,OFF) par la description de l'outil
	global mom_tool_direction ;# 0 = NONE, 1 = CLW, 2 = CCLW
	global mom_spindle_direction
	catch {switch $mom_tool_direction {
	0 {set mom_spindle_direction OFF}
	1 {set mom_spindle_direction CLW}
	2 {set mom_spindle_direction CCLW}
	default {set mom_spindle_direction CLW}
	} }
##

}

proc TOOL_use {} {
#_______________________________________________________________________________
# Liste d'outil par liste tool_use
#_______________________________________________________________________________
	global mom_tool_name mom_tool_number mom_machine_time mom_cutting_time
	global tool_count tool_use
	global save_tool_name save_tool_number save_machine_time save_cutting_time

	if { [info exists tool_count] == 0 } {set tool_count 0} 
	if { [info exists mom_machine_time] == 0 } {set mom_machine_time 0}
	if { [info exists mom_cutting_time] == 0 } {set mom_cutting_time 0}  
	if { [info exists save_machine_time] == 0 } {set save_machine_time 0} 
	if { [info exists save_cutting_time] == 0 } {set save_cutting_time 0} 


	if {$tool_count > 0} {
	lappend tool_use $save_tool_name $save_tool_number 
	lappend tool_use [format %.2f [expr $mom_machine_time-$save_machine_time]] 
	lappend tool_use [format %.2f [expr $mom_cutting_time-$save_cutting_time]]
	}
	set save_tool_name $mom_tool_name
	set save_tool_number $mom_tool_number
	set save_machine_time $mom_machine_time
	set save_cutting_time $mom_cutting_time
	incr tool_count +1
}


proc DEFER {action} {
#_______________________________________________________________________________
# Différer les startup post command apres le changement d'outil reel
#_______________________________________________________________________________
	global mom_definition_file_name
	global defer_count defer mom_o_buffer ptp_file_name
	global lg_message  end_message seq_message

	switch $action {
	on {
	MOM_suppress always seq
 	MOM_close_output_file   $ptp_file_name
	set defer_count 0     
	}
	off {
	MOM_open_output_file    $ptp_file_name
	MOM_suppress off seq
	}
	ignor {
	incr defer_count +1

	if {[string first "/" [string range $mom_o_buffer 0 0]] != -1} {
	regsub  {/} $mom_o_buffer {} mom_o_buffer } ;# supprime OPSKIP
	set defer($defer_count) $mom_o_buffer
	}
	write {
	for {set i 1} {$i <= $defer_count} {incr i 1} {
	if {[string first ";" [string range $defer($i) 0 0]] != -1} { SEQNO off } ;# supprime sequence
	if {[string first "MOM_" [string range $defer($i) 0 3]] != -1} {
	$defer($i) ;# execute procedure
	} else {
	MOM_output_literal "$defer($i)" }
	SEQNO on
	}
	}
	default { ;# enregistre procedure
	incr defer_count +1
	set defer($defer_count) $action
	}
	}
        
}

proc  MOM_msys {} {
#_______________________________________________________________________________
# This procedure is executed for the MSYS command.
#_______________________________________________________________________________

}

proc  MOM_from_move {} {
#_______________________________________________________________________________
# This procedure is executed for the FROM command.
#_______________________________________________________________________________
}


proc  MOM_load_tool {} {
#_______________________________________________________________________________
# This procedure is executed for the LOAD/TOOL command.  All output for the LOAD
# command will take place with the initial move.
#_______________________________________________________________________________
	global mom_tool_number save_tool_number

	set mom_tool_number $save_tool_number ; # Supprime LOAD/TOOL,n

}



proc TOOL_change {} {
#_______________________________________________________________________________
# Ecriture Changement d'Outil
#_______________________________________________________________________________
	global last_tool_number mom_tool_number
	global last_tool_name mom_tool_name
	global tool_change_flag prev_pos yhome zhome
	global nombre mom_tool_diameter mom_tool_corner1_radius
	global tool_change_type last_tool_change_type
	global mom_next_tool_number

	if {$tool_change_flag == 1 && $last_tool_number != $mom_tool_number} {
#	     CLOSE_nurbs
	     DEFER {off}
	     set tool_change_flag 0
	     MOM_set_seq_on
             MOM_coolant_off 
	     MOM_do_template spindle_off CREATE

# Changement d'Outil
	     MOM_set_seq_off
	     MOM_output_literal ";"
             MOM_set_seq_on
	     RESTART

	     MOM_do_template tool_change
	     MOM_do_template tool_preselect
	     set prev_pos(2) $zhome
	     set prev_pos(1) $yhome

# Debut Commentaire Outil


	if {[info exist mom_tool_corner1_radius]} {
	     set nombre $mom_tool_diameter
	 if {$mom_tool_corner1_radius > 0} {
	     MESSAGE "Dia Outil = [MOM_do_template tool_radius CREATE]"
	    } else {
	     MESSAGE "Dia Outil = [MOM_do_template format5_3 CREATE]"
	    }
	   } else {
	     set nombre $mom_tool_diameter
	     MESSAGE "Dia Outil = [MOM_do_template format5_3 CREATE]"
	   }
# Fin Commentaire Outil



	    DEFER {write}
	
	    set last_tool_name $mom_tool_name
	    set last_tool_number $mom_tool_number
          }

            CHECK_tool_spc  ;# Pour Gestion de Rappel d'un Sous Programme Existant avec un Nouvel Outil 

}

proc CHECK_tool_spc {} {
#_______________________________________________________________________________
# Controle de Rappel d'un Sous Programme Existant avec un Outil Different
#_______________________________________________________________________________
	global tool_seq_spc
	global mom_start_spc_array start_spc_count
	global mom_tool_number max_spc_number mom_spc_number
	global recall_spc_new_tool


	if {[info exist mom_spc_number] == 0} {return}

          for {set i 0} {$i <= $max_spc_number} {incr i 1} {
            if {[info exist mom_start_spc_array($i)] != 0} {
             if {$mom_spc_number == $mom_start_spc_array($i)} {
              if {[info exist tool_seq_spc($i)] != 0} {
#	            MOM_output_literal "Outil Actuel   : $mom_tool_number"
#		    MOM_output_literal "Outil Array    : $tool_seq_spc($i)"
#	            MOM_output_literal "Sous Programme : $mom_start_spc_array($i)"
#	            MOM_output_literal "Flag           : $recall_spc_new_tool"
               if {$mom_start_spc_array($i) != $tool_seq_spc($i) && $tool_seq_spc($i) != $mom_tool_number} {
                    set recall_spc_new_tool 1
#		    MOM_output_literal "Rappel du Sous Programme : $mom_start_spc_array($i) Existant avec Nouvel Outil : $mom_tool_number"
                  } else {
                    set recall_spc_new_tool 0
                  } ;# else
                 } ;# if
##	             return
                } ;# if
               } ;# if
	             set tool_seq_spc($start_spc_count) $mom_tool_number    ;# Compteur d'Outil avec Sous Programme
              } ;# for


                 set start_spc_count [expr $start_spc_count + 1]            ;# Compteur Debut de Sous Programme
                 set mom_start_spc_array($start_spc_count) $mom_spc_number  ;# Tableau de Variables de Sous Programmes

}

proc  MOM_before_motion {} {
#_______________________________________________________________________________
# This procedure is executed before the motion event is activated.
#_______________________________________________________________________________

	MOM_partno

	SPINDLE_max_min

	FEED_max_min

	OPEN_nurbs

}



proc  MOM_initial_move {} {
#_______________________________________________________________________________
# This procedure is executed for the initial move of operation if tool change.  
# It assumes the tool is moving from a safe position at rapid to the start of 
# the operation.
#_______________________________________________________________________________

#	CLOSE_nurbs

	TOOL_change

        MOM_rapid_move
}


proc  MOM_first_move {} {
#_______________________________________________________________________________
# This procedure is executed before the motion event is activated.
# En debut d'operation sans changement d'outil
#_______________________________________________________________________________
        global mom_motion_type mom_motion_event

#	CLOSE_nurbs

#	if {$mom_motion_type == "CYCLE"} {
#	     MOM_initial_move
#        } else {
	    catch {MOM_$mom_motion_event}
#	}

}


proc RESET_speed_m {} {
#_______________________________________________________________________________
# This procedure is executed to Reset the Spindle Code Rotation
#_______________________________________________________________________________
	global mom_spindle_rpm sauve_spindle_rpm

	if {$sauve_spindle_rpm != $mom_spindle_rpm} {
	     RESET_adr M_SPEED
             set sauve_spindle_rpm $mom_spindle_rpm
           }

}



proc RET_rot {} {
#_______________________________________________________________________________
# Retrait Z si rotation en rapide ou cycle
#_______________________________________________________________________________
	global prev_zm zhome prev_pos

        
	if {[OUTPUT_adr FOUR]} {
		if {[EQ_is_lt $prev_pos(2) $zhome]} {                
		     MOM_suppress always spindle_m
#                    RESET_adr motion_g
                     RETURN_move Z
#                    MOM_do_template ret_z
#                    RESET_adr motion_g
		     MOM_suppress off spindle_m
		   }
	   }
}



proc  MOM_rapid_move {} {
#_______________________________________________________________________________
# This procedure is executed for each rapid move. It gets called after
# the positioning varables, position and tool axis (X,Y,Z,TAX,TAY,TAZ) are loaded.
#_______________________________________________________________________________
	global mom_spindle_rpm min_rpm sauve_spindle_rpm
	global mom_pos prev_pos
	global zhome lang
	global open_new_spc_file
	global call_spc_file
	global mom_spc_number tool_seq_spc mom_tool_number
	global mom_sequence_mode
	global sauve_seqnum mom_seqnum mom_sequence_number check_seq_spc
	global x_preset_value y_preset_value z_preset_value flag_cancel_preset
	global start_spc_seq_number
	global start_end_calls_spc ptp_file_name first_move_spc_flag
	global mom_translation_vector
	global recall_spc_new_tool flag_new_lbl
	global 4_axis_flag
	global mom_out_angle_pos

#	MATRIX

	RET_rot

	if {$mom_spindle_rpm == 0} {set mom_spindle_rpm $min_rpm}

### Si Z < zhome ###
	if {[EQ_is_ge $mom_pos(2) $zhome]} {
	     RETURN_move {Z}
	     set $mom_pos(2) $zhome
	     MOM_suppress always Z
	   }
###

	MOM_zero

	MOM_smooth

	CANCEL_preset ;# Annulation Decalage d'Origine

	RESET_speed_m ;# Gestion Sens de Rotation

	MOM_do_template spindle_start


	if {[OUTPUT_adr FOUR]} {
	     MOM_do_template rapid_four_$lang
	     RESET_adr matrix_four
	}

	if {[OUTPUT_adr matrix_four] && $4_axis_flag ==0} {
	     MOM_do_template matrix_on_1
	     MOM_do_template matrix_on_2
	     RESET_adr matrix_reg matrix_off_four_reg
	}


         if {[EQ_is_gt $mom_pos(2) $prev_pos(2)]} {
            if {[OUTPUT_adr Z]} {MOM_do_template rapid_z_$lang}
            if {[OUTPUT_adr X Y FOUR]} {MOM_do_template rapid_xy_$lang ; MOM_do_template rapid_four_$lang}
         } else {
            if {[OUTPUT_adr X Y FOUR]} {MOM_do_template rapid_xy_$lang ; MOM_do_template rapid_four_$lang}
            if {[OUTPUT_adr Z]} {MOM_do_template rapid_z_$lang}
         }


	SAVE_prev_pos
	set first_move_flag 1

### Si Z < zhome ###
	MOM_suppress off Z
###

# Gestion (Creation) Sous Programmes Machine (Label)
	if {$open_new_spc_file == 1} {
         if {[info exist start_spc_seq_number($mom_spc_number)] == 0} {
	  if {[info exist flag_new_lbl] == 1} {
               MOM_output_literal "FN9:IF+Q0 EQU +0 GOTO LBL [expr $mom_spc_number + 100]"
	       MOM_do_template def_spc
               RESET_adr X Y
#               RESET_adr Z
               catch {unset flag_new_lbl}
             }
            }
           }


# Pour Gestion Rappel Sous Programme Existant avec Changement d'Outil
	if {[info exist start_end_calls_spc]} {
	 if {$start_end_calls_spc != -1} {
	  if {[info exist mom_translation_vector]} {
	       set x_preset_value $mom_translation_vector(0)
	       set y_preset_value $mom_translation_vector(1)
	       set z_preset_value $mom_translation_vector(2)
##	       MOM_do_template preset
             } else {
               INIT_preset                            ;# Remise a 0 Decalage d'origine
             } ;# else
##             MOM_do_template call_spc               ;# Rappel Sous Programme Apres Changement d'Outil

               RESET_adr Z
               MOM_close_output_file $ptp_file_name
               MOM_set_seq_off
            } ;# if
           } ;# if


}


proc CANCEL_preset {} {
#_______________________________________________________________________________
# Gestion Annulation Decalage d'Origine Avant Nouveau Sous Programme ou
# Nouvelle Operation et Apres Rappel de Sous Programme
#_______________________________________________________________________________
	global open_new_spc_file call_spc_file
	global flag_cancel_preset

	if {$open_new_spc_file == 1 && $call_spc_file == 0 || $open_new_spc_file == 0 && $call_spc_file == 1} {
	 if {$flag_cancel_preset == 0} {
              INIT_preset
            } ;# if
	      set flag_cancel_preset 1
           } ;# if
}


proc FEED_max_min {} {
#_______________________________________________________________________________
# Gestion des Limites sur les Avances
#_______________________________________________________________________________
	global mom_programmed_feed_rate  mom_feed_rate mom_cycle_feed_rate
	global mom_kin_max_mpm mom_kin_min_mpm
	global mom_feed_rate_mode mom_feed_rate_per_rev mom_cycle_feed_rate_mode mom_cycle_feed_rate_per_rev
	global mom_spindle_rpm 

	if {$mom_programmed_feed_rate != 0} {
	if {$mom_feed_rate_mode == "MMPR"} {set mom_feed_rate [expr $mom_feed_rate_per_rev * $mom_spindle_rpm]}
	if {$mom_feed_rate > $mom_kin_max_mpm} {set mom_feed_rate $mom_kin_max_mpm}
	if {$mom_feed_rate < $mom_kin_min_mpm} {set mom_feed_rate $mom_kin_min_mpm}
	}
	catch {if {$mom_cycle_feed_rate_mode == "MMPR"} {set mom_cycle_feed_rate [expr $mom_cycle_feed_rate_per_rev * $mom_spindle_rpm]}}
	catch {if {$mom_cycle_feed_rate > $mom_kin_max_mpm} {set mom_cycle_feed_rate $mom_kin_max_mpm}}
	catch {if {$mom_cycle_feed_rate < $mom_kin_min_mpm} {set mom_cycle_feed_rate $mom_kin_min_mpm}}
}


proc  MOM_linear_move {} {
#_______________________________________________________________________________
# This procedure is executed for each linear move. It gets called after
# the positioning varables, position and tool axis (X,Y,Z,TAX,TAY,TAZ) are loaded.
#_______________________________________________________________________________
	global mom_pos prev_pos mom_motion_type lang

#	MATRIX

	MOM_zero

	MOM_smooth

	RESET_speed_m ;# Gestion Sens de Rotation

	MOM_do_template spindle_start

        WRITE_coolant_on

	if {[OUTPUT_adr X Y Z FOUR]} {MOM_do_template linear_$lang}

	SAVE_prev_pos
}

proc  MOM_circular_move {} {
#_______________________________________________________________________________
# This procedure is executed for each circular move. It gets called after
# the circle data are loaded (end point and center).
#_______________________________________________________________________________
	global mom_pos_arc_axis lang


#	MATRIX circular

	set mom_pos_arc_axis(0) [format %.7f $mom_pos_arc_axis(0)] ; # à 7 Decimales
	set mom_pos_arc_axis(1) [format %.7f $mom_pos_arc_axis(1)] ; # à 7 Decimales
	set mom_pos_arc_axis(2) [format %.7f $mom_pos_arc_axis(2)] ; # à 7 Decimales

	MOM_zero

	MOM_smooth

	RESET_speed_m ;# Gestion Sens de Rotation

	MOM_do_template spindle_start

        WRITE_coolant_on

	if {abs($mom_pos_arc_axis(2)) == 1.0} {
	     MOM_suppress always Z 
	     HALF_circular_move 0 1 X Y; # XY
	     RESET_adr X Y
	   } elseif {abs($mom_pos_arc_axis(1)) == 1.0} {
	     MOM_suppress always Y
	     HALF_circular_move 2 0 Z X; # ZX
	     RESET_adr Z X
	   } elseif {abs($mom_pos_arc_axis(0)) == 1.0} {
	     MOM_suppress always X
	     HALF_circular_move 1 2 Y Z; # YZ
	     RESET_adr Y Z
	   }
	

	MOM_do_template circle_$lang

	MOM_suppress off X Y Z

	SAVE_prev_pos
}

proc  HALF_circular_move {ax1 ax2 adresse1 adresse2} {
#_______________________________________________________________________________
# Half circular move if angle > 180 degres
# ax1 = Numero du Premier Axe du Plan
# ax2 = Numero du Deuxieme Axe du Plan
#_______________________________________________________________________________
	global mom_arc_angle mom_arc_direction mom_pos_arc_center
	global mom_pos tmp_x tmp_y lang


	if {[EQ_is_gt $mom_arc_angle 180.0]} {
# Sauve Point Final
	     set save1 $mom_pos($ax1)
	     set save2 $mom_pos($ax2)

# Calcul du Demi et Quart Angle Parcouru
	 if {$mom_arc_direction == "CCLW"} {
	      set demi_angle  [expr $mom_arc_angle / -2.0]
              set quart_angle [expr $mom_arc_angle / -4.0]
	    } else {
	      set demi_angle  [expr $mom_arc_angle / 2.0]
              set quart_angle [expr $mom_arc_angle / 4.0]
	    }

# Calcul Demi et Quart Interpolation
	set a [expr $demi_angle*(asin(1.0) / 90.0)]    ; # Convertion Degres en Radians
        set b [expr $quart_angle*(asin(1.0) / 90.0)]   ; # Convertion Degres en Radians

	set adr1 [expr $mom_pos($ax1) - $mom_pos_arc_center($ax1)]
	set adr2 [expr $mom_pos($ax2) - $mom_pos_arc_center($ax2)]

	set adr1_rot [expr ($adr1*cos($a)) - ($adr2*sin($a))]
	set adr2_rot [expr ($adr2*cos($a)) + ($adr1*sin($a))]
	set adr3_rot [expr ($adr1*cos($b)) - ($adr2*sin($b))]
	set adr4_rot [expr ($adr2*cos($b)) + ($adr1*sin($b))]

      if {[EQ_is_equal $mom_arc_angle 360.0]} {

# Ecriture Quart Interpolation

	   set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) - $adr3_rot]
	   set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) - $adr4_rot]
	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle_$lang
	   set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) + $adr1_rot]
	   set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) + $adr2_rot]
	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle_$lang
           set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) + $adr3_rot]
           set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) + $adr4_rot]
	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle_$lang

         } else {

	   set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) + $adr1_rot]
	   set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) + $adr2_rot]

# Ecriture Demi Interpolation

	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle_$lang

         } ;# else

# Restore Point Final
	   set mom_pos($ax1) $save1
	   set mom_pos($ax2) $save2
	} ;# if
}

proc  MOM_helix_move {} {
#_______________________________________________________________________________
# This procedure is executed for each Helix Machining Move.
#_______________________________________________________________________________
	global mom_pos_arc_axis
	global mom_cutcom_plane opt_cutcom_plane mom_sys_cutcom_plane_code
	global mom_pos_arc_center mom_helix_pitch lang
	global mom_sys_helical_polar_code adr
	global mom_arc_angle mom_arc_direction mom_pos_arc_center mom_pos_arc_axis
	global mom_prev_pos mom_pos
	global mom_cutcom_plane opt_cutcom_plane mom_sys_cutcom_plane_code
        global mom_helix_pitch mom_system_tolerance mom_pos_to_center lang

#	MATRIX circular

	set mom_pos_arc_axis(0) [format %.7f $mom_pos_arc_axis(0)] ; # à 7 Decimales
	set mom_pos_arc_axis(1) [format %.7f $mom_pos_arc_axis(1)] ; # à 7 Decimales
	set mom_pos_arc_axis(2) [format %.7f $mom_pos_arc_axis(2)] ; # à 7 Decimales

	MOM_zero

	MOM_smooth

	RESET_speed_m ;# Gestion Sens de Rotation

	MOM_do_template spindle_start

        WRITE_coolant_on

	if {$lang == "h"} {
             set adr "IPA"
           } else {
             set adr "H"
           }

	if {abs($mom_pos_arc_axis(2)) == 1.0} {
	    HALF_helix_move 0 1 2 X Y Z $adr IZ K              ;# Plan XY
	} elseif {abs($mom_pos_arc_axis(1)) == 1.0} {
	    HALF_helix_move 2 0 1 Z X Y $adr IY J              ;# Plan ZX
	} elseif {abs($mom_pos_arc_axis(0)) == 1.0} {
	    HALF_helix_move 1 2 0 Y Z X $adr IX I              ;# Plan YZ
	}
	

#	MOM_do_template circle


	SAVE_prev_pos
}


proc  HALF_helix_move {ax1 ax2 ax3 adresse1 adresse2 adresse3 adresse4 adresse5 adresse6} {
#_______________________________________________________________________________
# Helical Move pour 360 Degres
# ax1 = Numero du Premier Axe du plan
# ax2 = Numero du Deuxieme Axe du plan
# ax3 = Numero de l'Axe Perpendiculaire au Plan
#_______________________________________________________________________________
	global mom_arc_angle mom_arc_direction mom_pos_arc_center mom_pos_arc_axis
	global mom_prev_pos mom_pos
	global mom_cutcom_plane opt_cutcom_plane mom_sys_cutcom_plane_code
        global mom_helix_pitch mom_system_tolerance mom_pos_to_center lang
	global delta_angle signe mom_sys_helical_polar_code

	set delta_move  [expr abs($mom_pos($ax3) - $mom_prev_pos($ax3))]      ;# Distance Totale Parcourue
	set number_turn [expr abs($delta_move) / abs($mom_helix_pitch)]       ;# Nombre de Tours
	set delta_angle [expr 360.0 * $number_turn]                           ;# Angle Total a Parcourir
	set delta_angle [format %.3f $delta_angle]                            ;# à 3 Decimales

#	MOM_output_literal "Nombre de Tours   : $number_turn"
#	MOM_output_literal "Angle a Parcourir : $delta_angle"

        set int_number_turn [expr int($number_turn)]                          ;# Nombre Entier de Tours
        set dec_number_turn [expr abs($number_turn) - abs($int_number_turn)]  ;# Valeur Decimale Restante

        if {$mom_prev_pos($ax3) > $mom_pos($ax3)} {
             set mom_helix_pitch [expr abs($mom_helix_pitch) * -1.0]          ;# Filetage en Poussant
           } else {
             set mom_helix_pitch [expr abs($mom_helix_pitch) * 1.0]           ;# Filetage en Tirant
           }

# Sauve Point Final
	 set save1 $mom_pos($ax1)
	 set save2 $mom_pos($ax2)
	 set save3 $mom_pos($ax3)

       if {$lang == "i"} {
	if {$mom_arc_direction == "CLW"} {
             set signe -1
           } else {
             set signe 1
           } ;# else
          } ;# if

# Generation Interpolation Helicoidale pour Nombre de Tours Exacts

	if {[EQ_is_ge $number_turn 1.0]} {
#            MOM_suppress always $adresse1 $adresse2 $adresse5 $adresse6
             MOM_suppress always  $adresse3 $adresse5 $adresse6
#	     RESET_adr $adresse3 $adresse4
	     RESET_adr $adresse1 $adresse2
             MOM_do_template center_circle_$lang
#            MOM_suppress off $adresse3 $adresse5
             MOM_suppress always $adresse1 $adresse2
             MOM_suppress off $adresse3
             RESET_adr $adresse4
             MOM_do_template helical_$lang
	     if {$lang == "i"} {MOM_output_literal "G90"}
             MOM_suppress off $adresse1 $adresse2 $adresse6

           } else {

# Generation Interpolation Helicoidale pour Nombre de Cadrans Restants

             set mom_pos($ax1) $save1                                          ;# Restitution Point Final X Y Z
             set mom_pos($ax2) $save2                                          ;# Restitution Point Final Z X Y
             set mom_pos($ax3) $save3  					       ;# Restitution Point Final Y Z X

#            MOM_suppress always $adresse1 $adresse2 $adresse5 $adresse6
             MOM_suppress always  $adresse3 $adresse5 $adresse6
#	     RESET_adr $adresse3 $adresse4
	     RESET_adr $adresse1 $adresse2
             MOM_do_template center_circle_$lang
#            MOM_suppress off $adresse5
             MOM_suppress always $adresse1 $adresse2
             MOM_suppress off $adresse3
             RESET_adr $adresse4
             MOM_do_template helical_$lang
	     if {$lang == "i"} {MOM_output_literal "G90"}
             MOM_suppress off $adresse1 $adresse2 $adresse6

           } ;# else

}


proc  MOM_nurbs_move {} {
#_______________________________________________________________________________
# This procedure is executed for each Nurbs machining move.
#_______________________________________________________________________________
	 global mom_nurbs_output_flag
         global mom_nurbs_point_count
         global mom_nurbs_points ; #(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),....
         global mom_nurbs_coefficients ; # only for POLY -> (n,0),(n,1)...(n,8) ->
                                         # k3x,k2x,k1x,k3y,k2y,k1y,k3z,k2z,k1z
         global nurbs_point_x k3x k2x k1x e3x e2x e1x
         global nurbs_point_y k3y k2y k1y e3y e2y e1y
         global nurbs_point_z k3z k2z k1z e3z e2z e1z
	 global mom_feed_rate f1 f2

# Le force always des ADDRESS à une petite faiblesse

	MOM_force always PX COX1 COX2 COX3 
	MOM_force always PY COY1 COY2 COY3
	MOM_force always PZ COZ1 COZ2 COZ3


         for {set ii 0} {$ii < $mom_nurbs_point_count} {incr ii} {

              set nurbs_point_x		$mom_nurbs_points($ii,0)
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,0) k3x e3x
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,1) k2x e2x
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,2) k1x e1x
	      if {[expr $k3x+$k2x+$k1x] == 0.0} {MOM_suppress always PX COX1 COX2 COX3}


              set nurbs_point_y		$mom_nurbs_points($ii,1)
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,3) k3y e3y
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,4) k2y e2y
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,5) k1y e1y
	      set f1 $mom_feed_rate
	      if {[expr $k3y+$k2y+$k1y] == 0.0} {MOM_suppress always PY COY1 COY2 COY3}

              set nurbs_point_z		$mom_nurbs_points($ii,2)
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,6) k3z e3z
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,7) k2z e2z
	      EXPOSANT_nurbs $mom_nurbs_coefficients($ii,8) k1z e1z
	      set f2 $mom_feed_rate

	      if {[expr $k3z+$k2z+$k1z] == 0.0} {
  		   MOM_suppress always PZ COZ1 COZ2 COZ3
		   unset f2
		 } else { unset f1}


              MOM_do_template Nurbs_point
              MOM_do_template Nurbs_coeff_x
              MOM_do_template Nurbs_coeff_y
              MOM_do_template Nurbs_coeff_z
	      MOM_suppress off PX COX1 COX2 COX3
	      MOM_suppress off PY COY1 COY2 COY3
	      MOM_suppress off PZ COZ1 COZ2 COZ3
  }
}

proc EXPOSANT_nurbs {var coef ex} {
#_______________________________________________________________________________
# This procedure control the Exposant of the Nurbs
#_______________________________________________________________________________
	global k3x k2x k1x e3x e2x e1x
	global k3y k2y k1y e3y e2y e1y
	global k3z k2z k1z e3z e2z e1z

	set c [format %.8f $var]

	if {[expr abs($c)] > 9.99999999} {
	     set c [format %1.8E $var]
	     set list [split $c E]
	     set $coef [lindex $list 0]
	     set $ex [lindex $list 1]
	   } else {
	     set $coef $c
	     set $ex 0
	   }
}
 
proc MOM_catch_warning {} {
#_______________________________________________________________________________
# This procedure generates the warnings for missing procedures and values
# falling out of MIN/MAX. 
#_______________________________________________________________________________
         global mom_warning_info
         global warn_file list_file warn_count
	 global mom_kin_4th_axis_max_limit
  
## Supprime des warnings
         if { [regexp  "MAXIMUM ARC RADIUS VIOLATED" $mom_warning_info] == 1 } {return}
         if { [regexp  "MINIMUM ARC RADIUS VIOLATED" $mom_warning_info] == 1 } {return}
	 if { [regexp  "secondary rotary position" $mom_warning_info] == 1 } {return}


## Modif des warnings
         if { [regexp  "unable to determine valid rotary" $mom_warning_info] == 1 } {
	       ERROR "Limite course de l'axe B$mom_kin_4th_axis_max_limit dépassée" 3
	    }

         if { [regexp  "output bad tool axis for 4 axis machining" $mom_warning_info] == 1 } {
	       ERROR "Orientation Axe Outil Impossible" 3
	    }

         if {[info exists warn_file] == 1 && [info exists mom_warning_info] == 1 } {
              puts $warn_file "$mom_warning_info " ; flush $warn_file ; incr warn_count +1
            }
}


proc MOM_path_warning {} {
#______________________________________________________________________
#
# proc MOM_path_warning {} is triggered when there are tool path 
# warnings.
#______________________________________________________________________
	global mom_path_warning path_warning_flag

	if {$path_warning_flag == 0} {
	     ERROR "Avertissements durant la Génération du Trajet d'Outil" 1
	     set path_warning_flag 1
	   }
}


proc MOM_gouge_marker {} {
#______________________________________________________________________
#
# proc MOM_gouge_marker {} is triggered when gouging is taking place in
# the tool path.
#______________________________________________________________________

#	MOM_output_literal "\$\$ WARNING!! - Tool is Gouging here!!"

}


proc  MOM_before_output {} {
#_______________________________________________________________________________
# This procedure is executed just before a line is about to be output
# to the file. It loads the line into a variable MOM_o_buffer and then calls
# this procedure. When it returns from this procedure, the variable MOM_o_buffer
# is read and written to the file.
#_______________________________________________________________________________
	global tool_change_flag mom_o_buffer
	global mom_seqnum mom_sequence_number mom_sequence_increment mom_sequence_frequency max_sequence
	global last_cycle_flag flag_output_cycle


# Modification des Formats avec Flag !....!
	regsub -all {\.!}   $mom_o_buffer {!} mom_o_buffer      ;# Nombre Entier sans Point Decimal
	regsub -all {!0!}   $mom_o_buffer {+0} mom_o_buffer     ;# + avec Zero
	regsub -all {!\+\.} $mom_o_buffer {!+0.} mom_o_buffer   ;# +.xxx => +0.xxx
	regsub -all {!-\.}  $mom_o_buffer {!-0.} mom_o_buffer   ;# -.xxx => -0.xxx
	regsub -all {!}     $mom_o_buffer {} mom_o_buffer       ;# Supprime Flag !

	regsub -all {@\.}   $mom_o_buffer {@0.} mom_o_buffer    ;# .xxx => 0.xxx
	regsub -all {@-\.}  $mom_o_buffer {@-0.} mom_o_buffer   ;# -.xxx => -0.xxx
	regsub -all {@}     $mom_o_buffer {} mom_o_buffer       ;# Supprime Flag @


# Suppression du Tilda si Changement Paramètre Q avant Mouvement
	if { $last_cycle_flag == 1 && $flag_output_cycle == 1} {
	     regsub -all {~} $mom_o_buffer {} mom_o_buffer
	     set last_cycle_flag 0
	   } 

# Suppression des Tildas si Non Presence du Cycle Fixe
	if {[info exist flag_output_cycle]} { 
	 if {$flag_output_cycle == 0} {
	     regsub -all {~} $mom_o_buffer {} mom_o_buffer
            }
           }

	if {$tool_change_flag == 1} { 
	     DEFER {ignor} 
	   }

# Reset sequence
	if {[info exists mom_seqnum] == 1 && [info exists max_sequence] == 1} {
	 if {$mom_seqnum > $max_sequence} {
	      MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
	    }
	   }
}



proc  MOM_sequence_number {} {
#_______________________________________________________________________________
# This procedure is executed for the Sequence Number command.
#_______________________________________________________________________________
         global mom_sequence_mode mom_command_status
         global mom_sequence_number
         global mom_sequence_increment
         global mom_sequence_frequency
         global mom_sequence_text


         if {$mom_command_status == "ACTIVE" } {
            if {$mom_sequence_mode == "OFF"} {
#               MOM_set_seq_off
#	        set mom_sequence_mode OFF
            } elseif {$mom_sequence_mode == "ON"} {
               MOM_set_seq_on
	       set mom_sequence_mode ON
            } elseif {$mom_sequence_mode == "AUTO"} {
               MOM_set_seq_on
	       set mom_sequence_mode ON
            } else {
               MOM_set_seq_on
               MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
	       set mom_sequence_mode ON
            }
         }
}

proc SEQNO {{on_off on}} {
#_______________________________________________________________________________
# Sequence number On Off
#_______________________________________________________________________________
         global mom_sequence_mode

	if {$on_off == "off"} {MOM_suppress always seq}
	if {$on_off == "no"} {MOM_suppress always seq}
	if {$on_off == "on" && $mom_sequence_mode == "ON"} {MOM_suppress off seq}

}



proc  MOM_set_modes {} {
#_______________________________________________________________________________
# This procedure is executed for the Set Mode command.
#_______________________________________________________________________________
         global mom_output_mode
         global mom_arc_mode mom_kin_arc_output_mode
         global mom_feed_rate_output_mode
         global mom_parallel_to_axis
         global mom_machine_mode
         global mom_modes_text mom_command_status
         global g_output_mode
	 global mom_kin_4th_axis_plane mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit
	 global spindle_axis last_spindle_axis prev_out_angle_pos first_move_flag

         set mom_modes_text [string toupper $mom_modes_text] ;# en majuscule

# "ABSOLUTE", "INCREMENTAL"
            if {$mom_output_mode == "ABSOLUTE"} {
#                set g_output_mode "G90"
#                MOM_incremental OFF X Y Z
            } elseif {$mom_output_mode == "INCREMENTAL"} {
#               set g_output_mode "G91"
#               MOM_incremental ON X Y Z
            }
# "LINEAR", "CIRCULAR"
            if {$mom_arc_mode == "LINEAR"} {
		set mom_kin_arc_output_mode LINEAR
		MOM_reload_kinematics
            } elseif {$mom_arc_mode == "CIRCULAR"} {
		set mom_kin_arc_output_mode FULL_CIRCLE
		MOM_reload_kinematics
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

proc  MOM_length_compensation {} {
#_______________________________________________________________________________
# This procedure is executed when the Tool Length Compensation command is activated.
#_______________________________________________________________________________
	global mom_tool_adjust_register mom_length_comp_register

	set mom_tool_adjust_register $mom_length_comp_register

}


proc  MOM_cutcom_on {} {
#_______________________________________________________________________________
# This procedure is executed when the Cutcom command is activated.
#_______________________________________________________________________________
	global mom_command_status ; # ACTIVE
	global  mom_cutcom_status ; # SAME,ON
	global mom_cutcom_mode	  ; # LEFT,RIGHT
	global mom_sys_cutcom_code mom_sys_cutcom_plane_code
	global opt_cutcom_code opt_cutcom_plane
	global mom_cutcom_plane
	global mom_kin_arc_valid_plane


	set opt_cutcom_code $mom_sys_cutcom_code($mom_cutcom_mode)

}

proc  MOM_cutcom_off {} {
#_______________________________________________________________________________
# This procedure is executed when the Cutcom command is deactivated.
#_______________________________________________________________________________
	global mom_sys_cutcom_code mom_kin_arc_valid_plane
	global opt_cutcom_code


       set opt_cutcom_code $mom_sys_cutcom_code(OFF)
#      MOM_do_template cutcom_off


}

proc SPINDLE_max_min {{proc before_motion}} {
#_______________________________________________________________________________
# 
#_______________________________________________________________________________
         global mom_spindle_rpm max_rpm min_rpm mom_motion_type tool_change_flag

        if {[info exists mom_spindle_rpm] != 0} {
	 if {$proc == "before_motion" && $mom_motion_type != "FROM"} {
	 if {$mom_spindle_rpm == 0 && $tool_change_flag == 1 } {
	 ERROR "Vitesse de Broche à 0 après un Changement d'Outil. Vitesse Minimum Assurée" 2}
	 if {$mom_spindle_rpm < $min_rpm} {set mom_spindle_rpm $min_rpm}
	 if {$mom_spindle_rpm > $max_rpm} {set mom_spindle_rpm $max_rpm}
         }
	 if {$proc != "before_motion"} {
	  if {$mom_spindle_rpm < $min_rpm} {set mom_spindle_rpm $min_rpm}
	  if {$mom_spindle_rpm > $max_rpm} {set mom_spindle_rpm $max_rpm}
	 }
	}
}

proc  MOM_spindle_rpm {} {
#_______________________________________________________________________________
# This procedure is executed when the Spindle command (RPM) is activated.
#_______________________________________________________________________________
	global mom_spindle_rpm 


	SPINDLE_max_min spindle

}

proc  MOM_spindle_css {} {
#_______________________________________________________________________________
# This procedure is executed when the Spindle command (SFM SMM) is activated.
#_______________________________________________________________________________

	MOM_spindle_rpm

}

proc  MOM_spindle_off {} {
#_______________________________________________________________________________
# This procedure is executed when the Spindle command is deactivated.
#_______________________________________________________________________________
	global mom_command_status mom_spindle_text
	global mom_sys_spindle_direction_code


	MOM_partno

#	CLOSE_nurbs

 	if {[hiset mom_command_status]} {} else {
             set mom_command_status ACTIVE}

	if {$mom_command_status == "USER_DEFINED"} {
	set mom_command_status ACTIVE
	set mom_spindle_text [string toupper $mom_spindle_text]  ;# en majuscule
	set list [split $mom_spindle_text ,]
	set first [lindex $list 0]
		switch $first {
		ORIENT {
	#	MOM_force once spindle_m
	#	MOM_do_template spindle_orient
	#	MOM_do_template spindle_off CREATE
		}
		default { 
		ERROR "SPINDL/$first n'est pas supporté par la commande Spindle Off User Defined" 2
		}
		}
	} else { 
		if {[MOM_ask_address_value spindle_m] != $mom_sys_spindle_direction_code(OFF)} {
         	     MOM_do_template coolant_off
                   }
	}
	

}

proc  MOM_coolant_on {} {
#_______________________________________________________________________________
# This procedure is executed when the Coolant command is activated.
#_______________________________________________________________________________
	global mom_coolant_status mom_coolant_mode

        if {$mom_coolant_mode == ""}      {set mom_coolant_status FLOOD }  ;# Force Arrosage Normal
        if {$mom_coolant_mode == "FLOOD"} {set mom_coolant_status FLOOD }  ;# Arrosage Normal
        if {$mom_coolant_mode == "TAP"}   {set mom_coolant_status FLOOD }  ;# Arrosage Normal
        if {$mom_coolant_mode == "MIST"}  {set mom_coolant_status FLOOD }  ;# Arrosage Normal

#	set mom_coolant_status FLOOD

}

proc WRITE_coolant_on {} {
#_______________________________________________________________________________
# This procedure is used to output when the Coolant Code.
#_______________________________________________________________________________
	global mom_coolant_status mom_sys_coolant_code

            set mom_coolant_status "FLOOD"  ;# Force Arrosage Normal si non Programme

	if {$mom_coolant_status == "FLOOD" && [MOM_ask_address_value coolant_m] != $mom_sys_coolant_code(FLOOD)} {
	     MOM_do_template coolant_on
	   }
}

proc  MOM_coolant_off {} {
#_______________________________________________________________________________
# This procedure is executed when the Coolant command is deactivated.
#_______________________________________________________________________________
	global mom_sys_coolant_code

	MOM_partno

	if {[MOM_ask_address_value coolant_m] != $mom_sys_coolant_code(OFF)} {
#	     CLOSE_nurbs
             MOM_do_template coolant_off
	   }
}

proc  MOM_opstop {} {
#_______________________________________________________________________________
# This procedure is executed when the Optional Stop command is activated.
#_______________________________________________________________________________
	global mom_opstop_text text mom_opstop_text_defined

	MOM_partno

#	CLOSE_nurbs

	if {$mom_opstop_text_defined != 0} {
             set text ""
	     MOM_do_template opstop BUFFER
	     MOM_output_literal "[MESSAGE $mom_opstop_text CREATE]"
	   } else {
             set text ""
	     MOM_do_template opstop
	   }
	     RESTART -1
}

proc  MOM_stop {} {
#_______________________________________________________________________________
# This procedure is executed when the Program Stop command is activated.
#_______________________________________________________________________________
	global mom_stop_text text mom_stop_text_defined

	MOM_partno

#	CLOSE_nurbs

	if {$mom_stop_text_defined != 0} {
             set text ""
	     MOM_do_template stop BUFFER
	     MOM_output_literal "[MESSAGE $mom_stop_text CREATE]"
	   } else {
             set text ""
	     MOM_do_template stop
	   }
	     RESTART -1
}

proc  MOM_opskip_on {} {
#_______________________________________________________________________________
# This procedure is executed when the Optional skip command is activated.
#_______________________________________________________________________________
	global tool_change_flag

	if {$tool_change_flag == 1} { 
	     DEFER {MOM_opskip_on} 
	   } else {
             MOM_set_line_leader always "/"
           }
}

proc  MOM_opskip_off {} {
#_______________________________________________________________________________
# This procedure is executed when the Optional skip command is activated.
#_______________________________________________________________________________
	global tool_change_flag

	if {$tool_change_flag == 1} { 
	     DEFER {MOM_opskip_off} 
	   } else {
             MOM_set_line_leader off "/"
           }
}

proc  MOM_delay {} {
#_______________________________________________________________________________
# This procedure is executed when the Delay command is activated.
#_______________________________________________________________________________
	global mom_delay_mode ;# SECONDS, REVOLUTIONS
	global mom_delay_value mom_delay_revs 
	global max_delay min_delay

	MOM_partno

#	CLOSE_nurbs

 	if {$mom_delay_mode == "REVOLUTIONS"} {
	     set mom_delay_value [expr $mom_delay_revs * $mom_spindle_rpm]
	   }

	if {$mom_delay_value > $max_delay} {set mom_delay_value $max_delay}
	if {$mom_delay_value < $min_delay} {set mom_delay_value $min_delay}

        MOM_do_template delay_1

        MOM_do_template delay_2

}

proc MOM_insert {} {
#_______________________________________________________________________________
# This procedure is executed when the Insert command is activated.
#_______________________________________________________________________________
	global mom_Instruction

	MOM_partno

	MOM_output_literal "[string toupper $mom_Instruction]"
}


proc  MOM_auxfun {} {
#_______________________________________________________________________________
# This procedure is executed when the Auxiliary command is activated.
#_______________________________________________________________________________

	MOM_partno

        MOM_do_template auxiliary
}

proc  MOM_prefun {} {
#_______________________________________________________________________________
# This procedure is executed when the Preparatory function command is activated.
#_______________________________________________________________________________

	MOM_partno

#       MOM_do_template preparatory
}


proc  MOM_tool_preselect {} {
#_______________________________________________________________________________
# This procedure is executed when the Tool Preselect command is activated.
#_______________________________________________________________________________
}


proc MOM_zero {} {
#_______________________________________________________________________________
# This procedure is executed when the Zero command is activated.
#_______________________________________________________________________________
	global zero mom_zero_register

	if {[info exist mom_zero_register] == 0} {return}

	catch [
	set save $zero
	set zero $mom_zero_register

	if {$zero < 1} {set zero 1}

	if {$zero > 30} {set zero 30}

	 MOM_do_template Zero_nb_1
         MOM_do_template Zero_nb_2


	if {$zero != $save} {
#	     CLOSE_nurbs
	     RESET_adr X Y Z
           }

            unset mom_zero_register
	]

### ude_deckel.cdl ###
#
#  EVENT zero
#  {
#     UI_LABEL "Point Zero"
#     CATEGORY MILL DRILL
#     PARAM zero_register
#     {
#        TYPE   i
#        DEFVAL "1"
#        UI_LABEL "Numero Origine"
#     }
#  }
#
### ude_deckel.cdl ###


}

proc  MOM_text {} {
#_______________________________________________________________________________
# This procedure is executed when the Text command is activated.
#_______________________________________________________________________________
	global mom_user_defined_text mom_record_fields mom_record_text

   if {[string first "$$" [string range $mom_record_fields(0) 0 1]] == -1} {
	switch $mom_record_fields(0) {
	"INSERT" {
	set mom_Instruction "$mom_record_text"
	MOM_insert
	}
	default {
	ERROR "$mom_record_fields(0) n'est pas supportée en User Defined Command" 2
	}
	}
   }
}

proc MOM_partno {} {
#_______________________________________________________________________________
# Numero de Programme .
#_______________________________________________________________________________
	global flag_partno
	global mom_output_file_basename name_partno

	if {$flag_partno == 1} {return}

	MOM_block_form

        set flag_partno 1
}

proc MOM_block_form {} {
#_______________________________________________________________________________
# This procedure is executed for the Block_Form command.
#_______________________________________________________________________________
	global mom_block_form_x_mini mom_block_form_x_maxi
	global mom_block_form_y_mini mom_block_form_y_maxi
	global mom_block_form_z_mini mom_block_form_z_maxi
	global flag_block_form
	global xhome yhome zhome
	global name_partno mom_output_file_basename

	if {$flag_block_form == 1} {return}

	regsub -all { } ${mom_output_file_basename} {} mom_output_file_basename ;# Supprime les Espaces

	set name_partno [string toupper ${mom_output_file_basename}]

	if {[string length ${mom_output_file_basename}] > 13} {
	     ERROR "Le Nom du Programme : ${mom_output_file_basename} doit etre < a 14 Caracteres" 2
	   }

	set name_partno [string range $name_partno 0 12]     ;# Tronque Le Nom du Programme a 13 Caracteres
	set mom_output_file_basename [string range $mom_output_file_basename 0 12]

	if {[info exist mom_block_form_x_mini] == 0} {
	     set mom_block_form_x_mini [expr $xhome*-1]
	     set mom_block_form_x_maxi [expr $xhome]
	     set mom_block_form_y_mini [expr $yhome*-1]
	     set mom_block_form_y_maxi [expr $yhome]
	     set mom_block_form_z_mini [expr $zhome*-1]
	     set mom_block_form_z_maxi [expr $zhome]
	  }

	SEQNO off
	MOM_do_template start_prog_0
	SEQNO on
	MOM_do_template start_prog_1
	MOM_do_template start_prog_2

	set flag_block_form 1

### ude_deckel.cdl ###
#
# EVENT block_form
# {
#   UI_LABEL "Block Form"
#   CATEGORY MILL DRILL
#
#   PARAM block_form_x_mini
#   {
#      TYPE   d
#      DEFVAL "0.000"
#      UI_LABEL "X Mini"
#   }
#   PARAM block_form_x_maxi
#   {
#      TYPE   d
#      DEFVAL "0.000"
#      UI_LABEL "X Maxi"
#   }
#
#   PARAM block_form_y_mini
#   {
#      TYPE   d
#      DEFVAL "0.000"
#      UI_LABEL "Y Mini"
#   }
#   PARAM block_form_y_maxi
#   {
#      TYPE   d
#      DEFVAL "0.000"
#      UI_LABEL "Y Maxi"
#   }
#
#   PARAM block_form_z_mini
#   {
#      TYPE   d
#      DEFVAL "0.000"
#      UI_LABEL "Z Mini"
#   }
#   PARAM block_form_z_maxi
#   {
#      TYPE   d
#      DEFVAL "0.000"
#      UI_LABEL "Z Maxi"
#   }
# }
#
### ude_deckel.cdl ###
}


proc MOM_prec_motion {} {
#_______________________________________________________________________________
# Gestion Arret Precis
#_______________________________________________________________________________
	global mom_prec_motion_text coarse_fine

	if {$mom_prec_motion_text == "NORMAL"} {
	     set coarse_fine 90
           } else {
	     set coarse_fine 0
           }

### ude_deckel.cdl ###
#
# EVENT prec_motion
# {
#    UI_LABEL "Arret Precis"
#
#    PARAM prec_motion_text
#    {
#       TYPE   o
#       DEFVAL   "Normal"
#       OPTIONS  "Normal","Fin"
#       UI_LABEL "Type Arrêt Precis"
#   }
# }
#
### ude_deckel.cdl ###

}

proc  MOM_origin {} {
#_______________________________________________________________________________
# This procedure is executed for the ORIGIN command.
#_______________________________________________________________________________
}


proc ATAN {v1 v2} {
#_______________________________________________________________________________
# Calcul Angle Sens Trigonometrique
#_______________________________________________________________________________
	global rad_to_deg

	set x $v2
	set y $v1

	if {[EQ_is_zero $x] && [EQ_is_zero $y]} {
             set angle 0.0
             return $angle
           }

  	set angle [expr atan2($y,$x) * $rad_to_deg]

	if {[EQ_is_lt $angle 0.0]} {
             set angle [expr $angle + 360.0]
           }
  
	return $angle
}

proc MOM_spc {} {
#_______________________________________________________________________________
# This procedure is executed for Stored Programm Cycle command (user defined).
#_______________________________________________________________________________
	global mom_spc_number
	global mom_action_spc
	global start_spc_count
	global end_spc_count
	global max_spc_number
	global mom_start_spc_array
	global mom_end_spc_array
	global flag_action_start_spc
	global mom_def_spc_number
	global open_new_spc_file
	global call_spc_file
	global x_preset_value y_preset_value z_preset_value
	global ptp_file_name
	global mom_translation_vector mom_scaling_factor mom_transformation_matrix
	global mom_operation_type mom_seqnum mom_sequence_number sauve_seqnum check_seq_spc
	global mom_sequence_mode
	global angle flag_cancel_preset
	global start_end_calls_spc
	global mom_csys_matrix
	global start_spc_seq_number
	global mom_tool_number tool_seq_spc
	global recall_spc_new_tool first_move_flag flag_new_lbl
	global flag_recall_mess
	global mom_motion_output_type


        if {$mom_sequence_mode == "OFF"} {return}

        if {[info exist mom_spc_number] == 0} {return}

	if {$mom_operation_type == "Point to Point"} {return}

	if {[info exist mom_scaling_factor] == 1} {
	 if {$mom_scaling_factor != 1.0} {return}
           }

	if {$mom_motion_output_type == "2"} {return}  ;# Pas de Gestion de Sous Programme avec Nurbs

	if {[info exist mom_transformation_matrix] == 1} {
	     set angle_rot_xy [ATAN $mom_transformation_matrix(0) $mom_transformation_matrix(1)]
#            MOM_output_literal "Angle Rotation XY : $angle_rot_xy"
	 if {$angle_rot_xy != 90.0} {
              return  ;# Pas de Gestion de Sous Programme avec Rotation
            } ;# if
           } ;# if

	if {$flag_action_start_spc != 0 && $mom_action_spc == "DEBUT"} {
             ERROR "Fin du Sous Programme Manquant" 3
           }


# Gestion Debut de Rappel et Debut de Definition de Sous-Programme (Label)

	if {$mom_action_spc == "DEBUT"} {
             set flag_action_start_spc 1
             set mom_def_spc_number $mom_spc_number
         if {$mom_spc_number <= $max_spc_number && $mom_spc_number > 0} {
          for {set i 0} {$i <= $max_spc_number} {incr i 1} {
            if {[info exist mom_start_spc_array($i)] != 0} {
             if {$mom_spc_number == $mom_start_spc_array($i)} {

#                 MOM_output_literal "DEBUT de Rappel du Sous Programme : $mom_start_spc_array($i) Existant"

		  set open_new_spc_file  0
		  set call_spc_file      1
	          set flag_recall_mess   1

		if {[info exist mom_translation_vector]} {
		      set x_preset_value $mom_translation_vector(0)
		      set y_preset_value $mom_translation_vector(1)
		      set z_preset_value $mom_translation_vector(2)
##		      MOM_do_template preset
                      set flag_cancel_preset 0
                    } else {
                      INIT_preset             ;# Remise a 0 Decalage d'Origine
                      set flag_cancel_preset 1
                    } ;# else

		     set start_end_calls_spc 0
#	             set recall_spc_new_tool  0

                     MOM_close_output_file $ptp_file_name
                     MOM_set_seq_off
	             return
                } ;# if
               } ;# if
              } ;# for

                 set start_spc_count [expr $start_spc_count + 1]            ;# Compteur Debut de Sous Programme
                 set mom_start_spc_array($start_spc_count) $mom_spc_number  ;# Tableau de Variables de Sous Programmes

		 set open_new_spc_file    1
	         set call_spc_file        0
		 set start_end_calls_spc -1
                 set recall_spc_new_tool  0
                 set flag_new_lbl         1
	         set flag_recall_mess     0

#                MOM_output_literal "DEBUT de Definition du Sous Programme : $mom_spc_number"

            } else {
              ERROR "Le Nombre de Definition de Sous Programme doit etre Compris entre 1 et $max_spc_number" 3
            } ;# else
           } ;# if



# Gestion Fin de Rappel et Fin de Definition de Sous-Programme (Label)

	if {$mom_action_spc == "FIN"} {
         if {$flag_action_start_spc == 1} {
              set flag_action_start_spc 0
          if {$mom_def_spc_number == $mom_spc_number} {
           for {set i 0} {$i <= $max_spc_number} {incr i 1} {
            if {[info exist mom_end_spc_array($i)] != 0} {
             if {$mom_spc_number == $mom_end_spc_array($i)} {

		  set open_new_spc_file    0
		  set call_spc_file        1
                  set recall_spc_new_tool  0
		  set start_end_calls_spc -1

                  MOM_open_output_file $ptp_file_name
                  MOM_set_seq_on

		  if {$recall_spc_new_tool == 0 } {
                   if {[MOM_ask_address_value preset_x] != 0 || [MOM_ask_address_value preset_y] != 0 || [MOM_ask_address_value preset_z] != 0 || \
                        $x_preset_value != 0 || $y_preset_value != 0 || $z_preset_value != 0 } {
                        MOM_do_template preset
                        MOM_do_template preset_1
                        MOM_do_template preset_2
                        MOM_do_template preset_3
                       }
		        MOM_do_template call_spc
                     }


#                 MOM_output_literal "Fin de Rappel du Sous Programme : $mom_end_spc_array($i) Existant"

##		  if {[info exist mom_translation_vector] == 0} {
##                     INIT_preset               ;# Remise a 0 Decalage d'origine
##	               set flag_cancel_preset 1  ;# Pour Initialisation Decalage Origines
##                     } 
                  return
                } ;# if
               } ;# if
              } ;# for

                 set end_spc_count [expr $end_spc_count + 1]                ;# Compteur Fin de Sous Programme
                 set mom_end_spc_array($end_spc_count) $mom_spc_number      ;# Tableau de Variables

		 MOM_output_literal "LBL 0"
	         MOM_output_literal "LBL [expr $mom_spc_number + 100]"
		 MOM_do_template call_spc

		 set open_new_spc_file    1
	         set call_spc_file        0
                 set recall_spc_new_tool  0
		 set start_end_calls_spc -1

#                MOM_output_literal "FIN de Definition du Sous Programme : $mom_spc_number"

		 set x_preset_value 0.0
		 set y_preset_value 0.0
		 set z_preset_value 0.0

	         set flag_cancel_preset 0      ;# Pour Initialisation Decalage Origines
#		 MOM_do_template preset

             } else {
               ERROR "La Fin du Sous Programme $mom_spc_number ne Correspond pas avec le Debut du Sous Programme $mom_def_spc_number" 3
             } ;# else
            } else {
              ERROR "Le Sous Programme $mom_spc_number doit etre Initialiser avec la Fonction DEBUT " 3
            } ;# else
           } ;# if


}


proc  MOM_translate {} {
#_______________________________________________________________________________
# This procedure is executed for the TRANS command (user defined).
#_______________________________________________________________________________
}

proc  MOM_rotate {} {
#_______________________________________________________________________________
# This procedure is executed for the Rotate command.
#_______________________________________________________________________________
	global mom_rotate_axis_type mom_rotation_mode mom_rotation_angle

}

proc  MOM_lintol {} {
#_______________________________________________________________________________
# This procedure is executed for the LINTOL command (user defined).
#_______________________________________________________________________________
}


proc MOM_set_csys {} {
#_______________________________________________________________________________
# This procedure is executed for CSYS change .
#_______________________________________________________________________________
}


proc  MOM_tlset {} {
#_______________________________________________________________________________
# This procedure is executed for the TLSET command (user defined).
#_______________________________________________________________________________
}

proc MOM_first_turret {} {
#_______________________________________________________________________________
# This procedure is executed for the Turret command.
#_______________________________________________________________________________
}

proc  MOM_gohome_move {} {
#_______________________________________________________________________________
# This procedure is executed for the GOHOME command.
#_______________________________________________________________________________
	global mom_motion_type ; # GOHOME => GOHOME_DEFAULT, GOHOME/x,y,z => GOHOME

	MOM_partno

	if {$mom_motion_type != "GOHOME_DEFAULT" } {
#	     CLOSE_nurbs
	     MOM_rapid_move
	   } else { 
	     RETURN_move Z
	     RETURN_move XY
	   }
}

proc  CYCLE_set {gcode} {
#_______________________________________________________________________________
# This procedure is executed at the cycle motion.
#_______________________________________________________________________________
	upvar $gcode adr

        global mom_cycle_retract_mode prev_pos mom_cycle_retract_to_pos mom_cycle_rapid_to_pos
	global mom_cycle_retract_mode mom_cycle_retract_to mom_pos flag_output_cycle

#	CLOSE_nurbs

	RETRACT_TO_pos

#	MATRIX cycle

# Ressortie des Adresses du Cycle

	if {[MOM_ask_address_value cycle_g] != $adr} {
  	     MOM_do_template init_cycle CREATE
	     set flag_output_cycle 1	;# Pour Presence Tilda sur Cycle Fixe de Percage
	   } else {
	     set flag_output_cycle 0	;# Pour Suppression Tilda sur Cycle Fixe de Percage
           }

	MOM_zero

	CYCLE_plane_change

	RESET_speed_m ;# Gestion Sens de Rotation

	MOM_do_template spindle_start

	SAVE_prev_pos cycle
}


proc  CYCLE_dwell_set {} {
#_______________________________________________________________________________
# This procedure is executed at the cycle definition.
#_______________________________________________________________________________
	global mom_cycle_delay_mode ;# SECONDS, REVOLUTIONS, OFF ,ON
	global mom_cycle_delay mom_cycle_delay_revs mom_spindle_rpm
	global max_delay min_delay 

        if {$mom_cycle_delay_mode == "ON"} {ERROR "DWELL On avec CYCLE/... non supporter" 3}

	if {$mom_cycle_delay_mode == "OFF"} {
	     set mom_cycle_delay 0
	     return
	   }

	if {$mom_cycle_delay_mode == "REVOLUTIONS"} {
	     catch {set mom_cycle_delay [expr $mom_cycle_delay_revs * (60 / $mom_spindle_rpm)]}
	   }

	if {$mom_cycle_delay > $max_delay} {set mom_cycle_delay $max_delay}
	if {$mom_cycle_delay < $min_delay} {set mom_cycle_delay $min_delay}

}


proc RETRACT_TO_pos { } {
#_______________________________________________________________________________
# RECALCUL de mom_cycle_retract_to_pos et mom_cycle_retract_to si RTRCTO,AUTO
# Calcul du point d'intersection entre CLEARANCE PLANE et POINT de Percage
# Position CLEARANCE PLANE (MCS) = X Y Z I J K
# Position POINT (MCS) = x y z i j k
# X intersection = ((((XI+YJ+ZK)-(xI+yJ+zK))/(Ii+Jj+Kk))*i)+x
# Y intersection = ((((XI+YJ+ZK)-(xI+yJ+zK))/(Ii+Jj+Kk))*j)+y
# Z intersection = ((((XI+YJ+ZK)-(xI+yJ+zK))/(Ii+Jj+Kk))*k)+z
#_______________________________________________________________________________
	global mom_clearance_plane_point mom_clearance_plane_normal
	global mom_mcs_goto mom_tool_axis mom_pos
	global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_rapid_to mom_cycle_feed_to
	global x_ret_mcs y_ret_mcs z_ret_mcs
	global mom_cycle_retract_to_pos mom_cycle_retract_to
	global mom_cycle_retract_mode
	global mom_clearance_plane_status 
	global mom_clearance_plane_usage ;# 1 = START and END, 2 = START only, 3 = END only

	if {$mom_cycle_retract_mode != "AUTO"} {return}

	if {$mom_clearance_plane_status != 1} {
	ERROR "Avec RTRCTO,AUTO un Clearance Plan est obligatoire. Commande ignoree" 2
	return
	}

	if {$mom_clearance_plane_usage != 1} {
	ERROR "Avec RTRCTO,AUTO le Clearance Plan doit etre utiliser at START and END. Commande ignoree" 2
	return
	}
	
# calcul de (XI+YJ+ZK), (xI+yJ+zK), (Ii+Jj+Kk)
set calcul_1 [expr ($mom_clearance_plane_point(0)*$mom_clearance_plane_normal(0))+($mom_clearance_plane_point(1)*$mom_clearance_plane_normal(1))+($mom_clearance_plane_point(2)*$mom_clearance_plane_normal(2))]
set calcul_2 [expr ($mom_mcs_goto(0)*$mom_clearance_plane_normal(0))+($mom_mcs_goto(1)*$mom_clearance_plane_normal(1))+($mom_mcs_goto(2)*$mom_clearance_plane_normal(2))]
set calcul_3 [expr ($mom_clearance_plane_normal(0)*$mom_tool_axis(0))+($mom_clearance_plane_normal(1)*$mom_tool_axis(1))+($mom_clearance_plane_normal(2)*$mom_tool_axis(2))]

	if {[EQ_is_zero $calcul_3]} {
	ERROR "RTRCTO,AUTO ne peut etre calculer : orientation outil parallele au Clearance Plan. Commande ignoree" 2
	return
	}

# X Y Z intersection
	set x_ret_mcs [expr ((($calcul_1-$calcul_2)/$calcul_3)*$mom_tool_axis(0))+$mom_mcs_goto(0)]
	set y_ret_mcs [expr ((($calcul_1-$calcul_2)/$calcul_3)*$mom_tool_axis(1))+$mom_mcs_goto(1)]
	set z_ret_mcs [expr ((($calcul_1-$calcul_2)/$calcul_3)*$mom_tool_axis(2))+$mom_mcs_goto(2)]

# Calcul de mom_cycle_retract_to
	catch {set signe [expr ($x_ret_mcs - $mom_mcs_goto(0)) / $mom_tool_axis(0)] ;# signe sur Xmcs}
	catch {set signe [expr ($y_ret_mcs - $mom_mcs_goto(1)) / $mom_tool_axis(1)] ;# signe sur Ymcs}
	catch {set signe [expr ($z_ret_mcs - $mom_mcs_goto(2)) / $mom_tool_axis(2)] ;# signe sur Zmcs}
	if {$signe > 0} {set signe 1} else {set signe -1}

set mom_cycle_retract_to [expr sqrt(pow($x_ret_mcs - $mom_mcs_goto(0),2) + pow($y_ret_mcs - $mom_mcs_goto(1),2) + pow($z_ret_mcs - $mom_mcs_goto(2),2)) * $signe]


# Calcul Vecteur Outil Machine
	set dist [expr abs($mom_cycle_feed_to) + $mom_cycle_rapid_to]
	if {$dist != 0} {
	set im [expr ($mom_cycle_rapid_to_pos(0) - $mom_cycle_feed_to_pos(0)) / $dist]
	set jm [expr ($mom_cycle_rapid_to_pos(1) - $mom_cycle_feed_to_pos(1)) / $dist]
	set km [expr ($mom_cycle_rapid_to_pos(2) - $mom_cycle_feed_to_pos(2)) / $dist]
#MOM_output_literal "Vecteur Outil Machine $dist $im $jm $km"
# Calcul mom_cycle_retract_to_pos
	set mom_cycle_retract_to_pos(0) [expr $mom_pos(0) + ($mom_cycle_retract_to * $im)]
	set mom_cycle_retract_to_pos(1) [expr $mom_pos(1) + ($mom_cycle_retract_to * $jm)]
	set mom_cycle_retract_to_pos(2) [expr $mom_pos(2) + ($mom_cycle_retract_to * $km)]
	} else {
	ERROR "La distance entre RAPTO et FEDTO = zero => RTRCTO,AUTO ne peut etre calculer. Commande ignorée" 2
	set mom_cycle_retract_to_pos(0) $mom_cycle_rapid_to_pos(0)
	set mom_cycle_retract_to_pos(1) $mom_cycle_rapid_to_pos(1)
	set mom_cycle_retract_to_pos(2) $mom_cycle_rapid_to_pos(2)
	set mom_cycle_retract_to $mom_cycle_rapid_to
	}

#MOM_output_literal "R=$mom_cycle_rapid_to R2=$mom_cycle_retract_to"
#MOM_output_literal "Xpos=$mom_pos(0) Ypos=$mom_pos(1) Zpos=$mom_pos(2)"
#MOM_output_literal "XR=$mom_cycle_rapid_to_pos(0) YR=$mom_cycle_rapid_to_pos(1) ZR=$mom_cycle_rapid_to_pos(2)"
#MOM_output_literal "XR2=$mom_cycle_retract_to_pos(0) YR2=$mom_cycle_retract_to_pos(1) ZR2=$mom_cycle_retract_to_pos(2)"

}


proc CYCLE_call {} {
#_______________________________________________________________________________
# This procedure is executed at the cycle motion.
#_______________________________________________________________________________


	WRITE_coolant_on

	if {[OUTPUT_adr X Y]} {MOM_do_template cycle_call_pos} else {MOM_do_template cycle_call}
}

proc  MOM_cycle_plane_change {} {
#_______________________________________________________________________________
# This procedure is executed at the end of cycle motion when there is a cycle 
# move occuring at a higher level than the previous position.
#_______________________________________________________________________________
	global prev_pos mom_cycle_retract_to_pos mom_cycle_rapid_to_pos


}


proc  CYCLE_plane_change {} {
#_______________________________________________________________________________
# This procedure is executed at the end of cycle motion when there is a cycle 
# move occuring at a higher level than the previous position.
#_______________________________________________________________________________
	global prev_pos mom_cycle_retract_to_pos mom_cycle_rapid_to_pos


	if {[EQ_is_gt $mom_cycle_rapid_to_pos(2) $prev_pos(2)]} {
             MOM_do_template cycle_plane_change
	     set prev_pos(2) $mom_cycle_rapid_to_pos(2)
	   }
}

proc  MOM_cycle_off {} {
#_______________________________________________________________________________
# This procedure is executed at the end of cycle motion.
#_______________________________________________________________________________
	global mom_cycle_retract_mode

}



proc  MOM_drill {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill cycle.
#_______________________________________________________________________________
}

proc  MOM_drill_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a drill cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_drill_code zhome
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate zhome
	global mom_pos mom_cycle_retract_to
	global last_cycle_param last_cycle_flag mom_cycle_delay

	CYCLE_set mom_sys_cycle_drill_code

	MOM_do_template cycle_drill_1

	SEQNO off

	set last_cycle_param 0

	if {[MOM_ask_address_value c_rap]   != $mom_cycle_rapid_to   } {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth] != $mom_cycle_feed_to    } {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]	    != $mom_cycle_feed_rate  } {set last_cycle_param 4}
	if {[MOM_ask_address_value c_step]  != $zhome		     } {set last_cycle_param 5}
	if {[MOM_ask_address_value c_t]	    != 0		     } {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]	    != $mom_pos(2)           } {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]   != $mom_cycle_retract_to } {set last_cycle_param 8}
	if {[MOM_ask_address_value c_dwell] != 0                     } {set last_cycle_param 9}

	set last_cycle_flag 0

	for {set i 2} {$i<=9} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
	      MOM_do_template cycle_drill_$i
	    } ;# for

	SEQNO on

	CYCLE_call
}


proc  MOM_drill_dwell {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill dwell cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set
}

proc  MOM_drill_dwell_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a drill dwell cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_drill_dwell_code zhome
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate zhome
	global mom_pos mom_cycle_retract_to
	global last_cycle_param last_cycle_flag mom_cycle_delay

	CYCLE_set mom_sys_cycle_drill_dwell_code

	MOM_do_template cycle_drill_dwell_1

	SEQNO off

	set last_cycle_param 0

	if {[MOM_ask_address_value c_rap]   != $mom_cycle_rapid_to   } {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth] != $mom_cycle_feed_to    } {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]	    != $mom_cycle_feed_rate  } {set last_cycle_param 4}
	if {[MOM_ask_address_value c_step]  != $zhome		     } {set last_cycle_param 5}
	if {[MOM_ask_address_value c_t]	    != 0		     } {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]	    != $mom_pos(2)	     } {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]   != $mom_cycle_retract_to } {set last_cycle_param 8}
	if {[MOM_ask_address_value c_dwell] != $mom_cycle_delay      } {set last_cycle_param 9}

	set last_cycle_flag 0

	for {set i 2} {$i<=9} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
	      MOM_do_template cycle_drill_dwell_$i
	    } ;# for

	SEQNO on

	CYCLE_call
}

proc  MOM_drill_counter_sink {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill cycle.
#_______________________________________________________________________________
}

proc  MOM_drill_counter_sink_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a drill cycle.
#_______________________________________________________________________________
	 MOM_drill_move
}

proc  MOM_drill_csink_dwell {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill dwell cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

}

proc  MOM_drill_csink_dwell_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a drill dwell cycle.
#_______________________________________________________________________________
       	 MOM_drill_dwell_move
}

proc  MOM_drill_deep {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a deep cycle.
#_______________________________________________________________________________
	global mom_cycle_step1 mom_cycle_step2 mom_cycle_step3

	CYCLE_dwell_set

	set mom_cycle_step1 [expr abs($mom_cycle_step1)]

	set mom_cycle_step2 [expr abs($mom_cycle_step2)]

	set mom_cycle_step3 [expr abs($mom_cycle_step3)]

	if {$mom_cycle_step3 == 0} {set mom_cycle_step3 0.1}

	if {[EQ_is_ge $mom_cycle_step2 $mom_cycle_step1]} {set mom_cycle_step2 0.0}

	if {$mom_cycle_step2 == 0} {set mom_cycle_step3 0.0}

	if {$mom_cycle_step1 == 0} {
	     ERROR "Avec CYCLE/DEEP STEP 1 est Obligatoire" 2
	   }
}

proc  MOM_drill_deep_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a  deep cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_drill_deep_code
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate mom_cycle_step1
	global mom_pos mom_cycle_retract_to mom_cycle_step2 mom_cycle_step3
	global mom_cycle_delay
	global last_cycle_param last_cycle_flag

	CYCLE_set mom_sys_cycle_drill_deep_code

	MOM_do_template cycle_drill_deep_1

	SEQNO off

	set last_cycle_param 0
 
	if {[MOM_ask_address_value c_rap]	    != $mom_cycle_rapid_to   } {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth]	    != $mom_cycle_feed_to    } {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]		    != $mom_cycle_feed_rate  } {set last_cycle_param 4}
	if {[MOM_ask_address_value c_step]	    != $mom_cycle_step1	     } {set last_cycle_param 5}
	if {[MOM_ask_address_value c_t]		    != 0		     } {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]		    != $mom_pos(2)	     } {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]	    != $mom_cycle_retract_to } {set last_cycle_param 8}
	if {[MOM_ask_address_value c_increase]	    != $mom_cycle_step2	     } {set last_cycle_param 9}
	if {[MOM_ask_address_value c_breakchip]	    != 0		     } {set last_cycle_param 10}
	if {[MOM_ask_address_value c_depth_min]	    != $mom_cycle_step3	     } {set last_cycle_param 11}
	if {[MOM_ask_address_value c_dwell]	    != $mom_cycle_delay	     } {set last_cycle_param 12}
	if {[MOM_ask_address_value c_f_ret]	    != 5000		     } {set last_cycle_param 13}
	if {[MOM_ask_address_value c_breakchip_ret] != 0		     } {set last_cycle_param 14}

	set last_cycle_flag 0

	for {set i 2} {$i<=14} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
	      MOM_do_template cycle_drill_deep_$i
	    } ;# for

	SEQNO on

	CYCLE_call

}

proc  MOM_drill_break_chip {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a brkchp cycle.
#_______________________________________________________________________________
	global mom_cycle_step1 mom_cycle_feed_to breakchip_number

	CYCLE_dwell_set

	set mom_cycle_step1 [expr abs($mom_cycle_step1)]

	if {$mom_cycle_step1 == 0} {
	     ERROR "Avec CYCLE/BREAKCHIP STEP 1 est Obligatoire" 2
	     set breakchip_number 0
	     return
	   }

	set breakchip_number [expr round(abs($mom_cycle_feed_to)/$mom_cycle_step1)]

}

proc  MOM_drill_break_chip_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a  brkchp cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_breakchip_code
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate mom_cycle_step1
	global mom_pos mom_cycle_retract_to breakchip_number
	global mom_cycle_delay
	global last_cycle_param last_cycle_flag 

	CYCLE_set mom_sys_cycle_breakchip_code
 
	MOM_do_template cycle_breakchip_1

	SEQNO off

	set last_cycle_param 0

	if {[MOM_ask_address_value c_rap]		!= $mom_cycle_rapid_to	} {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth]		!= $mom_cycle_feed_to	} {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]			!= $mom_cycle_feed_rate	} {set last_cycle_param 4}
	if {[MOM_ask_address_value c_step]		!= $mom_cycle_step1	} {set last_cycle_param 5}
	if {[MOM_ask_address_value c_t]			!= 0			} {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]			!= $mom_pos(2)		} {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]		!= $mom_cycle_retract_to} {set last_cycle_param 8}
	if {[MOM_ask_address_value c_increase]		!= 0			} {set last_cycle_param 9}
	if {[MOM_ask_address_value c_breakchip]		!= $breakchip_number	} {set last_cycle_param 10}
	if {[MOM_ask_address_value c_depth_min]		!= 0			} {set last_cycle_param 11}
	if {[MOM_ask_address_value c_dwell]		!= $mom_cycle_delay	} {set last_cycle_param 12}
	if {[MOM_ask_address_value c_f_ret]		!= 5000			} {set last_cycle_param 13}
	if {[MOM_ask_address_value c_breakchip_ret]	!= 0.5			} {set last_cycle_param 14}

	set last_cycle_flag 0

	for {set i 2} {$i<=14} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
             MOM_do_template cycle_breakchip_$i
	    } ;# for

	SEQNO on

	CYCLE_call
}

proc  MOM_tap {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a tap cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

}

proc  MOM_tap_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a tap cycle.
#_______________________________________________________________________________
	global mom_cycle_option
	global mom_sys_cycle_tap_code mom_sys_cycle_tap_code_option
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate
	global mom_cycle_delay mom_pos mom_cycle_retract_to
	global last_cycle_param last_cycle_flag

	set flag_option 0

	catch {if {$mom_cycle_option == "OPTION"} {set flag_option 1}}

	if {$flag_option == 1} {

# Taraudage avec Mandrin de Compensation CYCLE DEF 206
	     CYCLE_set mom_sys_cycle_tap_code_option
	     MOM_do_template cycle_tap_option_1
	     SEQNO off

	     set last_cycle_param 0

	     if {[MOM_ask_address_value c_rap]	  != $mom_cycle_rapid_to}   {set last_cycle_param 2}
	     if {[MOM_ask_address_value c_depth]  != $mom_cycle_feed_to	}   {set last_cycle_param 3}
	     if {[MOM_ask_address_value c_f]	  != $mom_cycle_feed_rate}  {set last_cycle_param 4}
	     if {[MOM_ask_address_value c_dwell]  != $mom_cycle_delay}      {set last_cycle_param 5}
	     if {[MOM_ask_address_value c_z]	  != $mom_pos(2)}           {set last_cycle_param 6}
	     if {[MOM_ask_address_value c_ret]    != $mom_cycle_retract_to} {set last_cycle_param 7}

	     set last_cycle_flag 0

	 for {set i 2} {$i<=7} {incr i 1} {
	  if {$i == $last_cycle_param} {
               set last_cycle_flag 1
             } ;# if
	       MOM_do_template cycle_tap_option_$i
	     } ;# for

	       SEQNO on
	       CYCLE_call

	    } else {

# Taraudage Rigide CYCLE DEF 207
	     CYCLE_set mom_sys_cycle_tap_code 
	     MOM_do_template cycle_tap_1
	     SEQNO off

	     set last_cycle_param 0

	     if {[MOM_ask_address_value c_rap]	 != $mom_cycle_rapid_to	}  {set last_cycle_param 2}
	     if {[MOM_ask_address_value c_depth] != $mom_cycle_feed_to	}  {set last_cycle_param 3}
	     if {[MOM_ask_address_value c_lead]	 != $mom_cycle_feed_rate}  {set last_cycle_param 4}
	     if {[MOM_ask_address_value c_z]	 != $mom_pos(2)}           {set last_cycle_param 5}
	     if {[MOM_ask_address_value c_ret]	 != $mom_cycle_retract_to} {set last_cycle_param 6}
	     set last_cycle_flag 0

	 for {set i 2} {$i<=6} {incr i 1} {
	  if {$i == $last_cycle_param} {
               set last_cycle_flag 1
             } ;# if
	       MOM_do_template cycle_tap_$i
	     } ;# for

	       SEQNO on
	       CYCLE_call
	       MOM_do_template spindle_off CREATE
	     } ;# else
}

proc  MOM_bore {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore cycle.
#_______________________________________________________________________________
}

proc  MOM_bore_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a bore cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_code
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate
	global mom_pos mom_cycle_retract_to
	global last_cycle_param last_cycle_flag

	CYCLE_set mom_sys_cycle_bore_code

	MOM_do_template cycle_bore_1

	SEQNO off

	set last_cycle_param 0

	if {[MOM_ask_address_value c_rap]   != $mom_cycle_rapid_to  } {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth] != $mom_cycle_feed_to   } {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]	    != $mom_cycle_feed_rate } {set last_cycle_param 4}
	if {[MOM_ask_address_value c_dwell] != 0		    } {set last_cycle_param 5}
	if {[MOM_ask_address_value c_f_ret] != 0		    } {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]	    != $mom_pos(2)	    } {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]   != $mom_cycle_retract_to} {set last_cycle_param 8}

	set last_cycle_flag 0

	for {set i 2} {$i<=8} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
	      MOM_do_template cycle_bore_$i
	    } ;# for

	SEQNO on

	CYCLE_call
}

proc  MOM_bore_dwell {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

}

proc  MOM_bore_dwell_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a bore dwell cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_dwell_code
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate
	global mom_cycle_delay mom_pos mom_cycle_retract_to
	global last_cycle_param last_cycle_flag

	CYCLE_set mom_sys_cycle_bore_dwell_code

        MOM_do_template cycle_bore_dwell_1

	SEQNO off

	set last_cycle_param 0

	if {[MOM_ask_address_value c_rap]   != $mom_cycle_rapid_to  } {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth] != $mom_cycle_feed_to   } {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]	    != $mom_cycle_feed_rate } {set last_cycle_param 4}
	if {[MOM_ask_address_value c_dwell] != $mom_cycle_delay	    } {set last_cycle_param 5}
	if {[MOM_ask_address_value c_f_ret] != 0		    } {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]	    != $mom_pos(2)	    } {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]   != $mom_cycle_retract_to} {set last_cycle_param 8}

	set last_cycle_flag 0

	for {set i 2} {$i<=8} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
	      MOM_do_template cycle_bore_dwell_$i
	    }

	SEQNO on

	CYCLE_call
}

proc  MOM_bore_drag {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore drag cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

}

proc  MOM_bore_drag_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a bore_drag cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_drag_code
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate
	global mom_cycle_delay mom_pos mom_cycle_retract_to
	global last_cycle_param last_cycle_flag

	CYCLE_set mom_sys_cycle_bore_drag_code

	MOM_do_template cycle_bore_drag_1

	SEQNO off

	set last_cycle_param 0

	if {[MOM_ask_address_value c_rap]	    != $mom_cycle_rapid_to  } {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth]	    != $mom_cycle_feed_to   } {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]		    != $mom_cycle_feed_rate } {set last_cycle_param 4}
	if {[MOM_ask_address_value c_dwell]	    != $mom_cycle_delay	    } {set last_cycle_param 5}
	if {[MOM_ask_address_value c_f_ret]	    != 0		    } {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]		    != $mom_pos(2)	    } {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]	    != $mom_cycle_retract_to} {set last_cycle_param 8}
	if {[MOM_ask_address_value c_no_drag_axis]  != 0		    } {set last_cycle_param 9}
	if {[MOM_ask_address_value c_no_drag_angle] != 0		    } {set last_cycle_param 10}

	set last_cycle_flag 0

	for {set i 2} {$i<=10} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
	      MOM_do_template cycle_bore_drag_$i
	    } ;# for

	SEQNO on

	CYCLE_call
	
}

proc  MOM_bore_no_drag {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore nodrag cycle.
#_______________________________________________________________________________
	global mom_cycle_orient
	global no_drag_axis no_drag_angle

	CYCLE_dwell_set

	if { [info exists mom_cycle_orient] == 0 } {set mom_cycle_orient 0} 

	set mom_cycle_orient [expr fmod($mom_cycle_orient,360)]
	if {[EQ_is_lt $mom_cycle_orient 0.0]} {set mom_cycle_orient [expr $mom_cycle_orient + 360]}

	set no_drag_axis 0	;# DEFAUT
	set no_drag_angle 0	;# DEFAUT

	if {[EQ_is_equal $mom_cycle_orient 0.0]} {
	     set no_drag_axis 1
	     set no_drag_angle 0
	   }

	if {[EQ_is_equal $mom_cycle_orient 90.0]} {
	     set no_drag_axis 2
	     set no_drag_angle 90
	   }

	if {[EQ_is_equal $mom_cycle_orient 180.0]} {
	     set no_drag_axis 3
	     set no_drag_angle 180
	   }

	if {[EQ_is_equal $mom_cycle_orient 270.0]} {
	     set no_drag_axis 4
	     set no_drag_angle 270
	   }
}

proc  MOM_bore_no_drag_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a bore nodrag cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_no_drag_code
	global mom_cycle_rapid_to mom_cycle_feed_to mom_cycle_feed_rate
	global mom_cycle_delay mom_pos mom_cycle_retract_to
	global last_cycle_param last_cycle_flag

	CYCLE_set mom_sys_cycle_bore_no_drag_code

	MOM_do_template cycle_bore_no_drag_1

	SEQNO off

	set last_cycle_param 0

	if {[MOM_ask_address_value c_rap]	    != $mom_cycle_rapid_to  } {set last_cycle_param 2}
	if {[MOM_ask_address_value c_depth]	    != $mom_cycle_feed_to   } {set last_cycle_param 3}
	if {[MOM_ask_address_value c_f]		    != $mom_cycle_feed_rate } {set last_cycle_param 4}
	if {[MOM_ask_address_value c_dwell]	    != $mom_cycle_delay	    } {set last_cycle_param 5}
	if {[MOM_ask_address_value c_f_ret]	    != 0		    } {set last_cycle_param 6}
	if {[MOM_ask_address_value c_z]		    != $mom_pos(2)	    } {set last_cycle_param 7}
	if {[MOM_ask_address_value c_ret]	    != $mom_cycle_retract_to} {set last_cycle_param 8}
	if {[MOM_ask_address_value c_no_drag_axis]  != 0		    } {set last_cycle_param 9}
	if {[MOM_ask_address_value c_no_drag_angle] != 0		    } {set last_cycle_param 10}

	set last_cycle_flag 0

	for {set i 2} {$i<=10} {incr i 1} {
	 if {$i == $last_cycle_param} {
              set last_cycle_flag 1
            } ;# if
	      MOM_do_template cycle_bore_no_drag_$i
	    }

	SEQNO on

	CYCLE_call

}

proc  MOM_bore_back {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore back cycle.
#_______________________________________________________________________________
	ERROR "CYCLE/BORE,BACK non Supporté sur TNC426" 3
}

proc  MOM_bore_back_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a back bore cycle.
#_______________________________________________________________________________

}

proc  MOM_bore_manual {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore manual cycle.
#_______________________________________________________________________________
	ERROR "CYCLE/BORE,MANUAL non Supporté sur TNC426" 3
}

proc  MOM_bore_manual_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a manual bore cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_manual_code

}

proc  MOM_bore_manual_dwell {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore manual dwell bore cycle.
#_______________________________________________________________________________
	MOM_bore_manual
}

proc  MOM_bore_manual_dwell_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a manual dwell borecycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_manual_dwell_code

}

proc MOM_drill_text {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill_text cycle.
#_______________________________________________________________________________

}

proc MOM_drill_text_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a drill_text cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_drill_text_code

}


proc  OPEN_files {} {
#_______________________________________________________________________________
# The following procedures are executed to get the warning output.
# The warning data is stored in the file ptp_name_warning.out.
#_______________________________________________________________________________
	global mom_output_file_directory mom_output_file_basename mom_output_file_suffix
	global output_extn
	global ptp_file_name warning_file_name
	global warn_file
	global warn_count
	global tcl_platform ;# tcl_platform(platform) = unix or windows
	global platform os

	set platform $tcl_platform(platform) 	; # unix or windows
	set os $tcl_platform(os)		; # operating system


 if {$platform == "windows"} {

# Supprime le Disque si D:fichier.ptp dans mom_output_file_basename
# et l'Ajoute dans mom_output_file_directory

#       regsub -all { } ${mom_output_file_basename} {} mom_output_file_basename ;# supprime les spaces 

	if {[string index ${mom_output_file_basename} 1] == ":"} {
	     regexp {([^:]*):} ${mom_output_file_basename} match disque
	     set mom_output_file_directory ${match}
	     regsub  {^[A-Za-z]:} ${mom_output_file_basename} {} mom_output_file_basename
	   }
    }

    set output_extn ".ptp"

    if {[info exists mom_output_file_suffix]} {
     if {[string length $mom_output_file_suffix] > 0} {
          set output_extn ".${mom_output_file_suffix}"
        }
       }

    
        set ptp_file_name "${mom_output_file_directory}${mom_output_file_basename}${output_extn}"   
        set warning_file_name "${mom_output_file_directory}${mom_output_file_basename}_warning.out"

	catch {MOM_close_output_file $ptp_file_name}
	catch {MOM_remove_file $ptp_file_name}
	MOM_open_output_file $ptp_file_name

	catch {MOM_remove_file $warning_file_name}
	set warn_file [open "$warning_file_name" w ] ; set warn_count 0

}


proc  WARNING_HEADER {} {
#_______________________________________________________________________________
# The following procedures are executed to get the Header in the Warning File
#_______________________________________________________________________________
         global warn_file
         global mom_ug_version
         global mom_logname
         global mom_date
         global mom_event_handler_file_name
         global mom_definition_file_name
         global mom_part_name
         global ptp_file_name
         global warning_file_name
         global mom_output_file_basename
         global mom_output_file_suffix
         global warn_count
	 global mom_machine_time mom_cutting_time mom_machine_name

	 set mom_machine_time 0
	 set mom_cutting_time 0
         set warn_count 0
 
         puts $warn_file  "\n\n\n"                   

         puts $warn_file  "     UG_POST   NUMERO      VERSION  : $mom_ug_version"            
         puts $warn_file  "     UG_POST   EXECUTER    PAR      : $mom_logname" 
         puts $warn_file  "     UG_POST   EXECUTION   DATE     : $mom_date" 
         puts $warn_file  "     UG_POST   FICHIER     PART     : $mom_part_name"
         puts $warn_file  "     UG_POST   FICHIER     MACHINE  : $ptp_file_name"                      
         puts $warn_file  "     UG_POST   NOM         MACHINE  : $mom_machine_name"                      
         puts $warn_file  "     UG_POST   FICHIER     TCL      : $mom_event_handler_file_name"            
         puts $warn_file  "     UG_POST   FICHIER     DEF      : $mom_definition_file_name"            

         puts $warn_file  "\n\n\n\n\n\n\n"
}

proc  WARNING_TRAILER {} {
#_______________________________________________________________________________
# The following procedures are executed to get the Trailer in the Warning File
#_______________________________________________________________________________
         global warn_file ptp_file_name
         global warn_count
         global mom_machine_time mom_cutting_time
         global mom_tool_use tool_use
         global mom_tool_count tool_count

# Message
         MOM_output_to_listing_device\
         "***********************************************************"
         MOM_output_to_listing_device\
         "    Post-processing du fichier $ptp_file_name terminé"
         MOM_output_to_listing_device\
         "    UG_POST TEMPS MACHINE  : [ format  "%.2f" $mom_machine_time] minutes" 
         MOM_output_to_listing_device\
         "    UG_POST TEMPS DE COUPE  : [ format  "%.2f" $mom_cutting_time] minutes" 
         MOM_output_to_listing_device\
         "***********************************************************"

         puts $warn_file  "\n\n\n\n\n\n\n"     
         puts $warn_file  "****************************************************************************"    
         puts $warn_file  "    UG_POST TEMPS MACHINE           : [ format  "%.2f" $mom_machine_time] minutes" 
         puts $warn_file  "    UG_POST TEMPS DE COUPE          : [ format  "%.2f" $mom_cutting_time] minutes" 
         puts $warn_file  "    NOMBRE D' ERREURS/WARNINGS      : $warn_count"
         puts $warn_file  "****************************************************************************"
	 puts $warn_file  " " 
	if { [info exists tool_count] == 0 } {return}         
         puts $warn_file  "****************************************************************************"
         puts $warn_file  "|                       LISTE DES OUTILS                                   |"
         puts $warn_file  "****************************************************************************"
	catch [\
              puts $warn_file\
"|[format "%40s" "MOM DE L'OUTIL   "]|[format "%-7s" " NUMERO"]|[format "%-13s" "TEMPS MACHINE"]|[format "%-11s" "TEMPS COUPE"]|"
  	foreach {v1 v2 v3 v4} $tool_use {
              puts $warn_file\
 	"|[format "%40s" $v1]|[format "%7s" $v2]|[format "%13s" $v3]|[format "%11s" $v4]|"
         }]
         puts $warn_file  "****************************************************************************"
}



proc  CLOSE_files {} {
#_______________________________________________________________________________
# The following procedures are executed to close the Warning File
#_______________________________________________________________________________
         global warn_file
         global warning_file_name
         global warn_count

           catch {close $warn_file ; unset warn_file}
           if { $warn_count > 0 } {
              MOM_output_to_listing_device\
                  "***********************************************************"
              MOM_output_to_listing_device\
                  "  $warn_count Erreurs/Avertissements dans le Fichier $warning_file_name "
              MOM_output_to_listing_device\
                  "***********************************************************"
              }
         
}

###################################################################################################################


proc  EQ_is_equal {s t {tol 0}} {
#_______________________________________________________________________________
#   Procs used to detect equality between scalars of real data type.
#   Return true if scalars are equal
#_______________________________________________________________________________
         global mom_system_tolerance

	 if {$tol == 0} {set tol $mom_system_tolerance} ;# Tolerance Default

         if { abs([expr ($s - $t)]) <= abs($tol) } { return 1 } else { return 0 }
}

proc  EQ_is_ge {s t {tol 0}} {
#_______________________________________________________________________________
#   Procs used to detect equality between scalars of real data type.
#   Return true if s is greater than or equal to t 
#_______________________________________________________________________________
         global mom_system_tolerance

	 if {$tol == 0} {set tol $mom_system_tolerance} ;# Tolerance Default

         if { $s > [expr ($t - abs($tol))] } { return 1 } else { return 0 }
}

proc  EQ_is_gt {s t {tol 0}} {
#_______________________________________________________________________________
#   Procs used to detect equality between scalars of real data type.
#   Return true if s is greater than t
#_______________________________________________________________________________
         global mom_system_tolerance

	 if {$tol == 0} {set tol $mom_system_tolerance} ;# Tolerance Default

         if { $s > [expr ($t + abs($tol))] } { return 1 } else { return 0 }
}

proc  EQ_is_le {s t {tol 0}} {
#_______________________________________________________________________________
#   Procs used to detect equality between scalars of real data type.
#   Return true if s is less than or equal to t
#_______________________________________________________________________________
         global mom_system_tolerance

	 if {$tol == 0} {set tol $mom_system_tolerance} ;# Tolerance Default

         if { $s < [expr ($t + abs($tol))] } { return 1 } else { return 0 }
}

proc  EQ_is_lt {s t {tol 0}} {
#_______________________________________________________________________________
#   Procs used to detect equality between scalars of real data type.
#   Return true if s is less than t
#_______________________________________________________________________________
         global mom_system_tolerance

	 if {$tol == 0} {set tol $mom_system_tolerance} ;# Tolerance Default

         if { $s < [expr ($t - abs($tol))] } { return 1 } else { return 0 }
}

proc  EQ_is_zero {s {tol 0}} {
#_______________________________________________________________________________
#   Procs used to detect equality between scalars of real data type.
#   Return true if scalar is zero
#_______________________________________________________________________________
         global mom_system_tolerance

	 if {$tol == 0} {set tol $mom_system_tolerance} ;# Tolerance Default

         if { abs($s) <= abs($tol) } { return 1 } else { return 0 }
}



proc  OUTPUT_adr {args} {
#_______________________________________________________________________________
# Test si sortie adresses . Choix X Y Z FOUR FIVE etc ....
#_______________________________________________________________________________
  
	foreach adr $args {
	 if {$adr != ""} {
	  if {[MOM_do_template output_adr_$adr CREATE] != ""} {
	  MOM_force once $adr
	  return 1
	  }
	 }
	} 
	return 0
}



proc  RESET_adr {args} {
#_______________________________________________________________________________
# Reset sortie adresses . Choix X Y Z FOUR FIVE etc ....
#_______________________________________________________________________________
  
	foreach adr $args {
	 if {$adr != ""} {
	  MOM_do_template reset_adr_$adr CREATE
	 }
	} 
}


proc  UPDATE_adr {adr val} {
#_______________________________________________________________________________
# Mise à jour adresses . Choix X Y Z FOUR FIVE etc ....
#_______________________________________________________________________________
	global adr_val
	set adr_val $val

	MOM_do_template update_adr_$adr CREATE
}





proc  ECHO {args} {
#_______________________________________________________________________________
# Output variables global or variables local or strings
# ex : ECHO "proc MOM_start_of_program" mom_kin_output_unit 
#_______________________________________________________________________________

	foreach var_name $args {
	 if {$var_name != ""} {
	  if [catch { upvar #0 $var_name var ; MOM_output_text "Echo =>  var glob: $var_name = $var"}] {
	  if [catch { upvar #1 $var_name var ; MOM_output_text "Echo =>  var loc : $var_name = $var"}] {
	  MOM_output_text "Echo =>  $var_name"}
	   }
	  }
	 }
}


###################################################################################################################

proc OPEN_nurbs {} {
#_______________________________________________________________________________
# Ouverture nouveau fichier ptp en langage Heidenhain
#_______________________________________________________________________________
	global mom_nurbs_output_flag
	global nurbs_file_flag nurbs_file_count
	global mom_output_file_directory mom_output_file_basename
	global nurbs_file_name ptp_file_name nurbs_partno
	global mom_nxt_motion_event mom_motion_event
	global mom_sequence_number mom_sequence_increment mom_sequence_frequency max_sequence
	global save_seqnum mom_seqnum
	global seq_lang lang

	if {$mom_nurbs_output_flag == 0} {return}

	if {$nurbs_file_flag == 1} {return}

	if {$mom_nxt_motion_event== "nurbs_move" || $mom_motion_event== "nurbs_move"} {

        set nurbs_file_name ${mom_output_file_directory}$mom_output_file_basename-[format %02d $nurbs_file_count].h

	MOM_output_literal "% [string toupper $mom_output_file_basename-[format %02d $nurbs_file_count].h] ; APPEL PGM SPLINE"
	MOM_close_output_file $ptp_file_name

	catch {file delete -force $nurbs_file_name }

	if {$nurbs_file_count > 99} {ERROR "Le nombre d'operation UG en Nurbs excede 99" 2}

	MOM_open_output_file $nurbs_file_name

	set save_seqnum $mom_seqnum
	set seq_lang ""
	set lang h
	MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency
	set nurbs_partno [string toupper $mom_output_file_basename-[format %02d $nurbs_file_count]]
	MOM_do_template start_prog_h

	set nurbs_file_flag 1

	incr nurbs_file_count 1

	}


}



proc CLOSE_nurbs {} {
#_______________________________________________________________________________
# Fermeture fichier ptp en langage Heidenhain
#_______________________________________________________________________________
	global mom_nurbs_output_flag
	global nurbs_file_flag nurbs_file_count
	global mom_output_file_directory mom_output_file_basename
	global nurbs_file_name ptp_file_name 
	global mom_nxt_motion_event
	global mom_sequence_number mom_sequence_increment mom_sequence_frequency max_sequence
	global save_seqnum mom_seqnum
	global seq_lang lang

        if {$nurbs_file_flag == 0} {return}

	MOM_do_template end_of_program_h
	MOM_close_output_file $nurbs_file_name
	MOM_open_output_file $ptp_file_name
	set seq_lang "N"
	set lang i
	set nurbs_file_flag 0
	MOM_reset_sequence $save_seqnum  $mom_sequence_increment $mom_sequence_frequency


}



proc MOM_smooth {} {
#_______________________________________________________________________________
# CYCL DEF 32.1 Txxx ou CYCL DEF 32.1
#______________________________________________________________________________
	global mom_smooth_tol mom_smooth_command_status

	if {[info exist mom_smooth_tol] == 0} {return}
             
	set mom_smooth_tol [expr abs($mom_smooth_tol)]

	if {[EQ_is_zero $mom_smooth_tol] || $mom_smooth_command_status == "INACTIF"} {
	 if {[MOM_ask_address_value smooth_reg] != 0} {
	      MOM_do_template Smooth_tol_1 
              MOM_do_template Smooth_off 
              MOM_do_template init_smooth CREATE
	      unset mom_smooth_tol
	    } ;# if
	      return
	   } ;# if

	if {$mom_smooth_command_status == "ACTIF"} {
	 if {[OUTPUT_adr smooth_reg]} {
              MOM_do_template Smooth_tol_1 
              MOM_do_template Smooth_tol_2
            } ;# if
           } ;# if

### ude_deckel.cdl ###
#
# EVENT smooth
# {
#     UI_LABEL "Tolerance UGV"
#     CATEGORY MILL
#     PARAM smooth_command_status
#     {
#       TYPE o
#       DEFVAL "Actif"
#       OPTIONS "Actif","Inactif"
#       UI_LABEL "Mode"
#     }
#
#     PARAM smooth_tol
#     {
#        TYPE   d
#        DEFVAL ".05"
#        UI_LABEL "Tolerance"
#     }
# }
#
### ude_deckel.cdl ###

}

proc WRITE_cycle {template} {
#_______________________________________________________________________________
# Ecriture cycle G.. Q.. et
# Modification de Q..=valeur sans le G du cycle par D00 Q.. P01 valeur
#_______________________________________________________________________________



	set line [MOM_do_template $template CREATE]

	if {[regexp {G} $line]} {
	MOM_output_literal "$line"
	return
	}

	set list [split $line]

	foreach {qq} $list {
		regsub -all {Q} $qq {D00 Q} qq
		regsub -all {=} $qq { P01 } qq
		MOM_output_literal "$qq"
	}
}


proc MATRIX {{type linear}} {
#_______________________________________________________________________________
# Matrice de rotation  XZROT=A (sens de rotation standard pour A)
#_______________________________________________________________________________
	global mom_out_angle_pos deg_to_rad 4_axis_flag
	global mom_pos  mom_pos_arc_center mom_pos_arc_axis
	global mom_cycle_feed_to_pos mom_cycle_rapid_to_pos mom_cycle_retract_to_pos
	global xm ym zm

	set ym $mom_pos(1)
	set zm $mom_pos(2)

	if {$4_axis_flag == 1} { return }

	if {$type == "linear" || $type == "circular"} {
	     ROT_yz mom_pos(1) mom_pos(2)
	   }

	if {$type == "circular"} {
	     ROT_yz mom_pos_arc_center(1)  mom_pos_arc_center(2)
	     ROT_yz mom_pos_arc_axis(1) mom_pos_arc_axis(2)
	   }

	if {$type == "cycle"} {
	     ROT_yz mom_cycle_feed_to_pos(1)  mom_cycle_feed_to_pos(2)
	     ROT_yz mom_cycle_rapid_to_pos(1) mom_cycle_rapid_to_pos(2)
             set ym $mom_cycle_retract_to_pos(1)
	     set zm $mom_cycle_retract_to_pos(2)
	     ROT_yz mom_cycle_retract_to_pos(1) mom_cycle_retract_to_pos(2)
	   }
}


proc ROT_yz {pos_y pos_z} {
#_______________________________________________________________________________
# Matrice de rotation  YZROT=A (sens de rotation standard pour A)
#_______________________________________________________________________________
	global mom_out_angle_pos deg_to_rad
	global mom_pos  mom_pos_arc_center mom_pos_arc_axis mom_nxt_pos_arc_axis prev_pos
	global mom_cycle_feed_to_pos mom_cycle_rapid_to_pos mom_cycle_retract_to_pos mom_cycle_clearance_pos

        set a [expr $mom_out_angle_pos(0) * $deg_to_rad * 1.0]

#MOM_output_literal "ANGLE Degres : $mom_out_angle_pos(0) Radian : $a"

	upvar #0 $pos_y y 
	upvar #0 $pos_z z 

#MOM_output_literal "Avant Rotation :  $pos_y = $y  $pos_z = $z"

	set y_rot [expr ($y * cos($a)) + ($z * sin($a))]
	set z_rot [expr ($z * cos($a)) - ($y * sin($a))]

	set $pos_y $y_rot
	set $pos_z $z_rot

#MOM_output_literal "Apres Rotation :  $pos_y = $y_rot  $pos_z = $z_rot"
}



proc CHECK_four_axis {} {
#_______________________________________________________________________________
# Controle flag 4 Axes Continus
#_______________________________________________________________________________
	global mom_operation_type
	global 4_axis_flag 


         if { [regexp  "Sequential Mill" $mom_operation_type] == 1 \
	    ||[regexp  "Variable-axis"   $mom_operation_type] == 1 } {
		set 4_axis_flag 1
	} else {
		set 4_axis_flag 0
	}

}
