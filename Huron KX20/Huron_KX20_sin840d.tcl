##############################################################################
# Description
#	Post-Processeur pour Machine Huron KX20 3 Axes
#			SINUMERIK 840 D
#	Client : Cheminee Philippe
#
#
#
# Revisions
#
# Date		Who		Reason
#
# 02-Feb-2004   J. Moreschi	Originale (NX 2.0.0.21)
# 11-Mar-2004	J. Moreschi	Mise en Place Gestion Soufflage
# 05-Mai-2004	J. Moreschi	Revision Interpolation Circulaire
# 16-Sep-2005	J. Moreschi	Revision Arret Precis (G642)
# 28-May-2007	J. Moreschi	Passage en NX5.0.0.25
#				Revision OPEN_files si Fichier dans la Racine du Disque (Supression Double Slash)
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
         set mom_kin_machine_type                       3_axis_mill
         set mom_kin_rapid_feed_rate                    30000.0
         set mom_kin_tool_change_time                   9 ;# Secondes
	 set mom_kin_arc_output_mode			FULL_CIRCLE
	 set mom_kin_helical_arc_output_mode		FULL_CIRCLE
	 set mom_kin_arc_valid_plane			XYZ
	 set mom_kin_max_arc_radius			99999
	 set mom_kin_min_arc_radius			0.02
	 set mom_kin_min_arc_length 			0.001
	 set mom_kin_max_mpm				10000.0
	 set mom_kin_min_mpm				5

         set mom_kin_independent_head                   NONE
#	 set mom_kin_read_ahead_next_motion		TRUE	;# TRUE (on), FALSE (off default)
	 set mom_kin_nurbs_output_type 			SIEMENS_POLY


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

         set mom_sys_coolant_code(ON)               8
         set mom_sys_coolant_code(FLOOD)            8
         set mom_sys_coolant_code(MIST)             81
         set mom_sys_coolant_code(TAP)              8
	 set mom_sys_coolant_code(SOUFFLAGE_OFF)    82
         set mom_sys_coolant_code(OFF)              9


         set mom_sys_clamp_code(ON)                 10
         set mom_sys_clamp_code(OFF)                11
         set mom_sys_clamp_code(AXISON)             10
         set mom_sys_clamp_code(AXISOFF)            11

#********G code declaration

         set mom_sys_rapid_code                     0

         set mom_sys_linear_code                    1

         set mom_sys_circle_code(CLW)               2
         set mom_sys_circle_code(CCLW)              3	

         set mom_sys_delay_code(REVOLUTIONS)        4
         set mom_sys_delay_code(SECONDS)            4

         set mom_sys_cutcom_plane_code(XY)          17
         set mom_sys_cutcom_plane_code(ZX)          18
         set mom_sys_cutcom_plane_code(YZ)          19

         set mom_sys_cutcom_code(OFF)               40
         set mom_sys_cutcom_code(LEFT)              41
         set mom_sys_cutcom_code(RIGHT)             42

         set mom_sys_inch_code                      70
         set mom_sys_metric_code                    71

         set mom_sys_cycle_breakchip_code           "CALL CYCLE83"
         set mom_sys_cycle_bore_no_drag_code        "CALL CYCLE86"

         set mom_sys_cycle_off                      CALL
         set mom_sys_cycle_drill_code               "CALL CYCLE81"
         set mom_sys_cycle_drill_dwell_code         "CALL CYCLE82"
         set mom_sys_cycle_drill_deep_code          "CALL CYCLE83"
         set mom_sys_cycle_tap_code                 "CALL CYCLE84"  ;# Taraudage Rigide
         set mom_sys_cycle_tap_code_option          "CALL CYCLE840" ;# Taraudage avec Porte-Taraud Compensateur
         set mom_sys_cycle_bore_code                "CALL CYCLE85"
         set mom_sys_cycle_bore_drag_code           "CALL CYCLE86"
         set mom_sys_cycle_bore_back_code           none
         set mom_sys_cycle_bore_manual_code         "CALL CYCLE87"
         set mom_sys_cycle_bore_manual_dwell_code   "CALL CYCLE88"
         set mom_sys_cycle_bore_dwell_code          "CALL CYCLE85"
 
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
         set mom_system_tolerance                   0.001 ;# tolerance pour proc EQ_is_...
#

#_______________________________________________________________________________
# User Variable Declaration
#_______________________________________________________________________________

set deg_to_rad [expr asin(1.0) / 90.0]              ;# Convertion Degres en Radians
set rad_to_deg [expr 90.0 / asin(1.0)]              ;# Convertion Radians en Degres

set zero 54
set mom_x_offset 0
set mom_y_offset 0
set mom_z_offset 0

set max_rpm 18000
set min_rpm 100
set spindle_error_flag 0
set mom_spindle_rpm 0
set range 40

set last_tool_number 0
set save_tool_number 0
set tool_change_flag 0
set last_tool_name ""
set head_gohome_flag 0

set xhome 1200
set yhome 1000
set zhome 550

set max_delay 9999
set min_delay 0.01

set seq_adr N

set coarse_fine 642

set partno 1
set partno_flag 0

set setup_flag 0

set tracking_point_tool 0            ;# Bout Outil pour Fraise Boule et Torique par Defaut

set mom_date "[clock format [clock seconds] -format %d-%m-%Y] [clock format [clock seconds] -format %H:%M]"

set prev_pos(0) $xhome ; set prev_pos(1) $yhome ; set prev_pos(2) [expr $zhome-1] 
set prev_pos(3) 0 ; set prev_pos(4) 0 ; set prev_out_angle_pos(0) 0.0 ; set prev_out_angle_pos(1) 0.0


proc SAVE_prev_pos {{type move}} {
#_______________________________________________________________________________
# Sauve mom_pos dans prev_pos
#_______________________________________________________________________________
	global mom_pos mom_out_angle_pos prev_pos prev_out_angle_pos
	global mom_cycle_retract_to_pos

	for {set i 0} {$i<=4} {incr i 1} {
		set a $mom_pos($i)
		set prev_pos($i) $a
	}

	set prev_out_angle_pos(0) $mom_out_angle_pos(0)
	set prev_out_angle_pos(1) [expr abs($mom_out_angle_pos(1))]

	if {$type == "cycle"} {
		for {set i 0} {$i<=2} {incr i 1} {
			set a $mom_cycle_retract_to_pos($i)
			set prev_pos($i) $a
		}
	}

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

	set mom_sequence_number 10
	set mom_sequence_increment 10
	set mom_sequence_frequency 1
	set max_sequence 99999999
	MOM_reset_sequence $mom_sequence_number $mom_sequence_increment $mom_sequence_frequency

########################

################################
### Operator_message setting ###
################################

	set lg_message 		80		;# Longueur Maxi du Message	
	set start_message	"MSG(\042"	;# Debut Message
	set end_message		"\042)"		;# Fin Message
	set seq_message		0		;# Numero de Sequence 0 ou 1

################################

	MOM_do_template init CREATE

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

proc     MOM_end_of_program {} {
#_______________________________________________________________________________
# This procedure is executed at the end of the program after all
# the paths are traversed.
#_______________________________________________________________________________
	global opt_spindle_off mom_sys_spindle_direction_code
	global head_position
        global ptp_file_name mom_output_file_directory mom_output_file_suffix 
        global program_file_name mom_output_file_basename
	global mom_partno_name warning_file_name mom_partno_name_defined

	MOM_opskip_off
	MOM_do_template cycle_off
      	MOM_coolant_off 
	set opt_spindle_off $mom_sys_spindle_direction_code(OFF)

	if {$head_position == "ZM"} {
                   RESET_adr D
		   RETURN_move Z
#		   RETURN_move XY
	} elseif {$head_position == "YM"} {
		   RETURN_move Y
#		   RETURN_move XZ
        } elseif {$head_position == "XM"} {
		   RETURN_move X
#		   RETURN_move YZ
        } else {
		   RETURN_move XYZ
	}


	MOM_spindle_off 

	MOM_do_template end_of_program

	TOOL_use

#********The following procedure lists the tool list with time in commentary data
	WARNING_TRAILER

#********The following procedure closes the warning and listing files
	CLOSE_files

         MOM_close_output_file ${mom_output_file_directory}${mom_output_file_basename}.ptp
#        catch {file delete -force ${mom_output_file_directory}${mom_output_file_basename}.ptp}

#         set ptp_file_name  "${mom_output_file_directory}${mom_output_file_basename}.ptp"  


        if {[info exists mom_partno_name_defined] == 0} {
             set flag_partno_name 0
           }

        if {[info exists mom_partno_name_defined] == 1 && [info exists mom_partno_name] == 1 } {
         if {$mom_partno_name != ""} {
              set flag_partno_name 1
            } else {
              set flag_partno_name 0
            }
           } else { 
              set flag_partno_name 0
           }

        if {$flag_partno_name == 1} {
             set partno_file_name    "${mom_output_file_directory}${mom_partno_name}.MPF"               ;# Extension Specifique Siemens
             set partno_warning_name "${mom_output_file_directory}${mom_partno_name}_warning.out"
             catch {file copy -force $warning_file_name $partno_warning_name}
             MOM_close_output_file $warning_file_name
             catch {file delete -force $warning_file_name}
           } else {
             set partno_file_name    "${mom_output_file_directory}${mom_output_file_basename}.MPF"      ;# Extension Specifique Siemens
             set partno_warning_name "${mom_output_file_directory}${mom_output_file_basename}_warning.out"
           }

	     catch {file copy -force $ptp_file_name $partno_file_name}
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

	set outil ""
	if {$mom_tool_name != ""} {set outil "avec Nom d'outil: $mom_tool_name"}

	set path_warning_flag 0 ; # Gestion proc MOM_path_warning

	puts $warn_file "-------------------------------------------------------------------------"
	puts $warn_file "****** Debut Operation $mom_operation_type : $mom_path_name $outil *****"
	puts $warn_file "-------------------------------------------------------------------------"
}


proc  MOM_end_of_path {} {
#_______________________________________________________________________________
# This procedure is executed at the end of a path.
#_______________________________________________________________________________
        global mom_path_name warn_file
        global head_gohome_flag

	catch {puts $warn_file "****** Fin Operation $mom_path_name ****** "} ;# catch pour MOM_abort
	set head_gohome_flag 1

        MOM_suppress off X Y Z  ;# Si cycle Filetage avec Fraise

}



proc RESTART {{niveau 0}} {
#_______________________________________________________________________________
# Ressortie des adresses et codes
#_______________________________________________________________________________

	if {$niveau == 0 } {  
		RESET_adr zero_g motion_g plane_g mode_g fine_g
		RESET_adr X Y Z S F D F_bore range_m
		MOM_do_template cycle_off CREATE
		MOM_do_template spindle_off CREATE
	} else { 
		# avec STOP et OPSTOP
		RESET_adr zero_g motion_g
		RESET_adr X Y Z S D
		MOM_do_template spindle_off CREATE
		MOM_do_template cycle_off CREATE
	}
        
}

proc RETURN_move {axes} {
#_______________________________________________________________________________
# G53 .......
#_______________________________________________________________________________
         global prev_pos xhome yhome zhome
         global setup_flag
         global mom_param_r0 mom_param_r1 mom_param_r2
         global prev_param_r0 prev_param_r1 prev_param_r2


	switch $axes {
	Z { 					;# Broche Suivant ZM
		if {$prev_pos(2) < $zhome} {
			MOM_do_template cycle_off
		        MOM_coolant_off
                        CHECK_return_param
			MOM_do_template ret_z
			set prev_pos(2) $zhome
		        RESET_adr Z
		}
	}
	XY {
		if {$prev_pos(0) < $xhome || $prev_pos(1) < $yhome } {
			set prev_pos(0) $xhome
			set prev_pos(1) $yhome
			MOM_do_template cycle_off
                        CHECK_return_param
			MOM_do_template ret_xy
			RESET_adr X Y
		}
	}
	Y { 					;# Broche Suivant YM
		if {$prev_pos(2) < $yhome} {
			MOM_do_template cycle_off
		        MOM_coolant_off
                        CHECK_return_param
			MOM_do_template ret_y
			set prev_pos(2) $yhome
			RESET_adr Y
		}
	}
	XZ {
		if {$prev_pos(2) < $zhome || $prev_pos(0) < $xhome } {
			set prev_pos(2) $zhome
			set prev_pos(0) $xhome
			MOM_do_template cycle_off
                        CHECK_return_param
			MOM_do_template ret_xz
			RESET_adr Z X
		}
	}
	X { 					;# Broche Suivant XM
		if {$prev_pos(0) < $xhome} {
			MOM_do_template cycle_off
		        MOM_coolant_off
                        CHECK_return_param
			MOM_do_template ret_x
			set prev_pos(0) $xhome
			RESET_adr X
		}
	}
	YZ {
		if {$prev_pos(2) < $zhome || $prev_pos(1) < $yhome } {
			set prev_pos(2) $zhome
			set prev_pos(1) $yhome
			MOM_do_template cycle_off
                        CHECK_return_param
			MOM_do_template ret_yz
			RESET_adr Y Z
		}
	}
	XYZ {
		if {$prev_pos(2) < $zhome || $prev_pos(1) < $yhome || $prev_pos(0) < $xhome } {
			set prev_pos(2) $zhome
			set prev_pos(1) $yhome
			set prev_pos(0) $xhome
			MOM_do_template cycle_off
                        CHECK_return_param
			MOM_do_template ret_xyz
			RESET_adr X Y Z
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

         if {[info exists mom_pprint_defined]} {
            if {$mom_pprint_defined == 1} {
		MOM_output_text "; $mom_pprint"
            }
         }
}

proc MESSAGE {mess {option 0}} {
#_______________________________________________________________________________
# Ecriture message. 
# Usage MESSAGE $variable option CREATE
#_______________________________________________________________________________
	global lg_message start_message end_message seq_message

	
#	set mess [string toupper $mess]                      ;# Message en Majuscule
	set mess [string range $mess 0 [expr $lg_message-1]] ;# Tronque la Longueur du Message

#	regsub -all { } $mess {-} mess                       ;# Supprime les Espaces

	if {$option != "CREATE"} {
         if {$seq_message == 0} {SEQNO off}
	      MOM_output_literal "$start_message$mess$end_message"
              SEQNO on
	    } else { 
              return "$start_message$mess$end_message"
            }
}


proc MESSAGE_sin {mess {option 0}} {
#_______________________________________________________________________________
# Ecriture message specifique Siemens
# Usage MESSAGE $variable option CREATE
#_______________________________________________________________________________
	global lg_message start_message end_message seq_message

	
#	set mess [string toupper $mess]                      ;# Message en Majuscule
	set mess [string range $mess 0 [expr $lg_message-1]] ;# Tronque la Longueur du Message

	if {$option != "CREATE"} {
         if {$seq_message == 0} {SEQNO off}
          if {$mess != ""} {
	       MOM_output_literal "; $mess"
             }
               SEQNO on
	   } else {
          if {$mess != ""} {
               return "; $mess"
             }
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
	puts $warn_file "#### Avec une ERREUR FATALE le Fichier $ptp_file_name est Effacé ####"; flush $warn_file
	catch {MOM_close_output_file $ptp_file_name}
	catch {MOM_remove_file $ptp_file_name}
	close $warn_file
	MOM_abort " \n\n#### ERREUR FATALE $op : ####\n#### $texte .####\n#### STOP POST-PROCESSING #### \n\n"
	}
	}
        incr warn_count +1
}

proc  MOM_first_tool {} {
#_______________________________________________________________________________
# This procedure is executed for the first operation, with a tool name, in the task.
#_______________________________________________________________________________
	global mom_tool_axis
        global mom_param_r0 mom_param_r1 mom_param_r2
        global prev_param_r0 prev_param_r1 prev_param_r2

	MOM_partno

     if {[info exists mom_param_r0] != 0} {
          MOM_do_template return_param
          set prev_param_r0 $mom_param_r0
          set prev_param_r1 $mom_param_r1
          set prev_param_r2 $mom_param_r2
          set setup_flag 1 
        } else {
#         MOM_output_literal "R0=0 R1=0 R2=0 ;*** G53 X Y Z ***"
          set prev_param_r0 0.0
          set prev_param_r1 0.0
          set prev_param_r2 0.0
          set setup_flag 0
        }

	MOM_output_literal "G54 G40 G90"
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
	global tool_change_flag spindle_error_flag mom_coolant_status mom_coolant_status_mist
	global mom_tool_adjust_register_defined mom_tool_adjust_register
        global mom_tool_length_adjust_register
	global mom_sys_coolant_code


	TOOL_use


# Gestion des changements d'outil (écriture dans MOM_initial_move)
	set tool_change_flag 0

	if {$mom_tool_number == 0} {
		ERROR "Le Numero d'Outil doit etre Initialiser avec la Definition de l'Outil $mom_tool_name" 3
	} elseif {$mom_tool_number != $last_tool_number} {
		set tool_change_flag 1
		set save_tool_number $mom_tool_number
		DEFER {on}
		set spindle_error_flag 0
		set mom_coolant_status OFF
		set mom_coolant_status_mist SOUFFLAGE_OFF

	  if {$mom_tool_length_adjust_register == 0} {
              set mom_tool_adjust_register 1 ;# Defaut ADJUST
             } else {
              set mom_tool_adjust_register $mom_tool_length_adjust_register
             }
	}

## Gestion du Sens de Rotation Broche (CLW,CCLW,OFF) par la Description de l'Outil
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
	SEQNO off
 	MOM_close_output_file   $ptp_file_name
	set defer_count 0     
	}
	off {
	MOM_open_output_file    $ptp_file_name
	SEQNO on
	}
	ignor {
	incr defer_count +1

	if {[string first "/" [string range $mom_o_buffer 0 0]] != -1} {
	regsub  {/} $mom_o_buffer {} mom_o_buffer } ;# supprime OPSKIP
	set defer($defer_count) $mom_o_buffer
	}
	write {
	for {set i 1} {$i <= $defer_count} {incr i 1} {
	if {[string first "(" [string range $defer($i) 0 0]] != -1} { SEQNO off } ;# Supprime Sequence
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

	MOM_length_compensation

}

proc TOOL_change {} {
#_______________________________________________________________________________
# Ecriture Changement d'outil
#_______________________________________________________________________________
	global last_tool_number mom_tool_number
	global last_tool_name mom_tool_name
	global tool_change_flag prev_pos xhome yhome zhome
	global nombre mom_tool_diameter
	global tool_change_type last_tool_change_type
	global seq_adr head_gohome_flag
	global mom_tool_name
	global mom_tool_adjust_register

	if {$tool_change_flag == 1 && $last_tool_number != $mom_tool_number} {
		DEFER {off}
		set tool_change_flag 0
		set head_gohome_flag 0
		MOM_do_template cycle_off
#	        MOM_coolant_off 
		MOM_do_template spindle_off CREATE
		MOM_do_template ret_z

# Changement Outil
	        SEQNO off
		MOM_output_literal "   " ; # Ligne vide
	        SEQNO on
		RESTART

		MOM_do_template tool_change
	        regsub -all {_} $mom_tool_name { } mom_tool_name   ;# Remplace _ par Espace pour Nom Outil
                MOM_do_template tool_chg_cmt                       ;# Commentaires Outil

		MOM_output_literal "M6"

		HEAD_init
		RESET_adr D
		set prev_pos(2) $zhome
		set prev_pos(1) $yhome
	        set prev_pos(0) $xhome

# Debut Commentaire Outil
		set nombre $mom_tool_diameter
#		MESSAGE "Dia Outil=[MOM_do_template format5_3 CREATE]"
# Fin Commentaire Outil
		DEFER {write}
	
		set last_tool_name $mom_tool_name
		set last_tool_number $mom_tool_number
                unset mom_tool_adjust_register                    ;# Pour Changement de Correcteur en Cours de Programme
	}

}

proc  MOM_before_motion {} {
#_______________________________________________________________________________
# This procedure is executed before the motion event is activated.
#_______________________________________________________________________________

	MOM_partno

	SPINDLE_max_min

	FEED_max_min
}



proc  MOM_initial_move {} {
#_______________________________________________________________________________
# This procedure is executed for the initial move of each operation.  It assumes 
# the tool is moving from a safe position at rapid to the start of the operation.
#_______________________________________________________________________________
	global mom_motion_type mom_pos mom_cycle_retract_to_pos
        global mom_next_tool_number

	TOOL_change

        MOM_rapid_move

}


proc  MOM_first_move {} {
#_______________________________________________________________________________
# This procedure is executed before the motion event is activated after STOP, OPSTOP, SET/ADJUST
# et debut d'operation sans changement d'outil
#_______________________________________________________________________________
        global mom_motion_type mom_motion_event
	global mom_tool_adjust_register mom_tool_number
	global mom_tool_adjust_register_defined
        global mom_tool_length_adjust_register

	  if {$mom_tool_length_adjust_register == 0} {
              set mom_tool_adjust_register 1 ;# Defaut ADJUST
             } else {
              set mom_tool_adjust_register $mom_tool_length_adjust_register
             }


	HEAD_init

#	if {$mom_motion_type == "CYCLE"} {
#	MOM_initial_move
#        } else {
	catch {MOM_$mom_motion_event}
#	}

	if {[MOM_ask_address_value D] != $mom_tool_adjust_register} {
	     ERROR "Il faut un Mouvement en RAPID pour Prendre la Correction de Longueur D$mom_tool_adjust_register" 2
	   }

}

proc  MOM_rapid_move {} {
#_______________________________________________________________________________
# This procedure is executed for each rapid move. It gets called after
# the positioning varables, position and tool axis (X,Y,Z,TAX,TAY,TAZ) are loaded.
#_______________________________________________________________________________
	global mom_spindle_rpm min_rpm range
	global mom_pos prev_pos
	global head_position
	global xhome zhome yhome
        global mom_next_tool_number
	global mom_cutcom_plane
	global mom_coolant_mode mom_coolant_status_mist
	global mom_sys_coolant_code

	if {$mom_spindle_rpm == 0} {set mom_spindle_rpm $min_rpm}

        TRANS_axes

	if {$head_position == "ZM"} { 		;# Axe Outil suivant Z
		### Si Z > zhome ###
		if {[EQ_is_ge $mom_pos(2) $zhome]} {
			RETURN_move {Z}
			set $mom_pos(2) $zhome
			MOM_suppress always Z
		}
		###

		MOM_do_template cycle_off

	        if {[EQ_is_gt $mom_pos(2) $prev_pos(2)]} {
			if {[OUTPUT_adr Z]} {MOM_do_template rapid_z}
			if {[OUTPUT_adr X Y]} {MOM_do_template rapid_xy}
                        
		} else {
			if {[OUTPUT_adr X Y]} {MOM_do_template rapid_xy}
                        if {[OUTPUT_adr Z]} {MOM_do_template rapid_z}
		}

		### Si Z < zhome ###
		MOM_suppress off Z
		###

	} elseif { $head_position == "YM"} {     ;# Axe Outil suivant Y
		### Si Y > yhome ###
		if {[EQ_is_ge $mom_pos(1) $yhome]} {
		     RETURN_move {Y}
		     set $mom_pos(1) $yhome
		     MOM_suppress always Y
		}
		###

		MOM_do_template cycle_off
		set mom_cutcom_plane ZX

	        if {[EQ_is_gt $mom_pos(1) $prev_pos(1)]} {
			if {[OUTPUT_adr Y]} {MOM_do_template rapid_y}
			if {[OUTPUT_adr Z X]} {MOM_do_template rapid_xz}
		} else {
			if {[OUTPUT_adr Z X]} {MOM_do_template rapid_xz}
			if {[OUTPUT_adr Y]} {MOM_do_template rapid_y}
		}

		### Si Y < yhome ###
		MOM_suppress off Y
		###


	} elseif { $head_position == "XM"} {     ;# Axe Outil suivant X
		### Si X > xhome ###
		if {[EQ_is_ge $mom_pos(0) $xhome]} {
		     RETURN_move {X}
		     set $mom_pos(0) $xhome
		     MOM_suppress always X
		}
		###

		MOM_do_template cycle_off
		set mom_cutcom_plane YZ

	        if {[EQ_is_gt $mom_pos(0) $prev_pos(0)]} {
			if {[OUTPUT_adr X]} {MOM_do_template rapid_x}
			if {[OUTPUT_adr Y Z]} {MOM_do_template rapid_yz}
		} else {
			if {[OUTPUT_adr Y Z]} {MOM_do_template rapid_yz}
			if {[OUTPUT_adr X]} {MOM_do_template rapid_x}
		}

		### Si X < xhome ###
		MOM_suppress off X
		###

	} else {                              ;# Axe Outil Incline

		MOM_do_template cycle_off
                MOM_do_template rapid_xyz_decompose
        }

	SAVE_prev_pos
}


proc FEED_max_min {} {
#_______________________________________________________________________________
# Gestion des limites sur les avances
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
	global head_position

	MOM_do_template cycle_off

	MOM_do_template spindle_start

	TRANS_axes
	
	if {[OUTPUT_adr X Y Z]} {
         if {$head_position == "XM" || $head_position == "YM" || $head_position == "ZM"} { 
             MOM_do_template linear
         } else {
             MOM_do_template linear_no_comp
         }
        }

	SAVE_prev_pos
}


proc  MOM_circular_move {} {
#_______________________________________________________________________________
# This procedure is executed for each circular move. It gets called after
# the circle data are loaded (end point and center).
#_______________________________________________________________________________
	global mom_pos_arc_axis
	global mom_arc_angle mom_arc_radius

	TRANS_axes

	set mom_pos_arc_axis(0) [format %.7f $mom_pos_arc_axis(0)] ; # à 7 decimales
	set mom_pos_arc_axis(1) [format %.7f $mom_pos_arc_axis(1)] ; # à 7 decimales
	set mom_pos_arc_axis(2) [format %.7f $mom_pos_arc_axis(2)] ; # à 7 decimales

	MOM_do_template cycle_off

	MOM_do_template spindle_start

	if {abs($mom_pos_arc_axis(2)) == 1.0} {
		MOM_suppress always Z K_circle
		HALF_circular_move 0 1 X Y ; # Plan XY
		RESET_adr X Y
	} elseif {abs($mom_pos_arc_axis(1)) == 1.0} {
		MOM_suppress always Y I_circle
		HALF_circular_move 2 0 Z X ; # Plan ZX
		RESET_adr Z X
	} elseif {abs($mom_pos_arc_axis(0)) == 1.0} {
		MOM_suppress always X J_circle
		HALF_circular_move 1 2 Y Z ; # Plan YZ
		RESET_adr Y Z
	}
	
	MOM_do_template circle

	MOM_suppress off X Y Z I J K
	SAVE_prev_pos
}


proc  HALF_circular_move {ax1 ax2 adresse1 adresse2} {
#_______________________________________________________________________________
# Half circular move if angle > 180 degres
# ax1 = Numero du Premier Axe du Plan
# ax2 = Numero du Deuxieme Axe du Plan
#_______________________________________________________________________________
	global mom_arc_angle mom_arc_direction mom_pos_arc_center
	global mom_pos tmp_x tmp_y


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

# Ecriture quart interpolation

	   set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) - $adr3_rot]
	   set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) - $adr4_rot]
	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle
	   set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) + $adr1_rot]
	   set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) + $adr2_rot]
	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle
           set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) + $adr3_rot]
           set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) + $adr4_rot]
	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle
         } else {
	   set mom_pos($ax1) [expr $mom_pos_arc_center($ax1) + $adr1_rot]
	   set mom_pos($ax2) [expr $mom_pos_arc_center($ax2) + $adr2_rot]

# Ecriture Demi Interpolation

	   RESET_adr $adresse1 $adresse2
	   MOM_do_template circle
         }

# Restore Point Final
	   set mom_pos($ax1) $save1
	   set mom_pos($ax2) $save2

	    }
}


proc  MOM_helix_move {} {
#_______________________________________________________________________________
# This procedure is executed for each Helix machining move.
#_______________________________________________________________________________
	global mom_pos_arc_axis
	global mom_cutcom_plane opt_cutcom_plane mom_sys_cutcom_plane_code
	global mom_arc_angle mom_arc_radius arc_radius
        global head_position nturn

	TRANS_axes

	set mom_pos_arc_axis(0) [format %.7f $mom_pos_arc_axis(0)] ; # à 7 Decimales
	set mom_pos_arc_axis(1) [format %.7f $mom_pos_arc_axis(1)] ; # à 7 Decimales
	set mom_pos_arc_axis(2) [format %.7f $mom_pos_arc_axis(2)] ; # à 7 Decimales

# Complete les variables non initialisées...
	if {[info exists opt_cutcom_plane] == 0} {set opt_cutcom_plane 0}
# Fin initialisation spécifiques

	MOM_do_template spindle_start

#	if {$opt_cutcom_plane == 0} {MOM_force once plane_g}

	if {abs($mom_pos_arc_axis(2)) == 1.0} {
		set mom_cutcom_plane XY
		HELIX_nturn 2
                RESET_adr X Y motion_g
	} elseif {abs($mom_pos_arc_axis(1)) == 1.0} {
		set mom_cutcom_plane ZX
		HELIX_nturn 1
                RESET_adr X Z motion_g
	} elseif {abs($mom_pos_arc_axis(0)) == 1.0} {
		set mom_cutcom_plane YZ
		HELIX_nturn 0
                RESET_adr Y Z motion_g
	}
	
# Gestion des arcs supérieurs à 180 Degres par le signe du rayon
	set arc_radius $mom_arc_radius
	if {[EQ_is_gt $mom_arc_angle 180.0]} {
		set arc_radius [expr $mom_arc_radius * -1]
	}

	set opt_cutcom_plane $mom_sys_cutcom_plane_code($mom_cutcom_plane)

   if {[EQ_is_gt $nturn 0.0]} {
    if {$head_position == "ZM"} {
	 MOM_do_template helix_ZM
       } elseif {$head_position == "YM"} {
         MOM_do_template helix_YM
       } elseif {$head_position == "XM"} {
         MOM_do_template helix_XM
       }
      }

	SAVE_prev_pos
}


proc  HELIX_nturn {ax} {
#_______________________________________________________________________________
# $axe axe de l'interpolation
# Calcul le nombre de tour à effectuer
#_______________________________________________________________________________
	global mom_prev_pos mom_pos mom_helix_pitch nturn

	set delta [expr abs($mom_pos($ax) - $mom_prev_pos($ax))]

       if {[EQ_is_gt abs($mom_helix_pitch) 0.0] && [EQ_is_gt $delta 0.0]} {
	    set nturn [expr $delta / abs($mom_helix_pitch)]
          } else {
            set nturn 0.0
          }
}


proc  MOM_nurbs_move {} {
#_______________________________________________________________________________
# This procedure is executed for each Nurbs machining move.
#_______________________________________________________________________________

	MOM_do_template cycle_off

	ERROR "L'interpolation Spline (Nurbs) n'est pas supportée" 3
}


proc MOM_catch_warning {} {
#_______________________________________________________________________________
# This procedure generates the warnings for missing procedures and values
# falling out of MIN/MAX. 
#_______________________________________________________________________________
         global mom_warning_info
         global warn_file list_file warn_count
	 global mom_kin_4th_axis_min_limit
  
## Supprime des warnings
         if { [regexp  "MAXIMUM ARC RADIUS VIOLATED" $mom_warning_info] == 1 } {return}
         if { [regexp  "MINIMUM ARC RADIUS VIOLATED" $mom_warning_info] == 1 } {return}
	 if { [regexp  "secondary rotary position" $mom_warning_info]   == 1 } {return}


## Modif des warnings
	if { [regexp  "output bad tool axis for 4 axis machining" $mom_warning_info] == 1 } {
		ERROR "Orientation Outil dans le plan ZX impossible" 3
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
	     ERROR "Warnings à la génération du trajet d'outil" 1
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
	global seq_adr


# Modification des formats avec flag !....!
	regsub -all {\.!} $mom_o_buffer {!} mom_o_buffer     ;# Nombre Entier Sans Point Decimal
	regsub -all {!} $mom_o_buffer {} mom_o_buffer        ;# Supprime Flag !

	regsub -all {@\.} $mom_o_buffer {@0.} mom_o_buffer   ;# .xxx => 0.xxx
	regsub -all {@-\.} $mom_o_buffer {@-0.} mom_o_buffer ;# -.xxx => -0.xxx
	regsub -all {@} $mom_o_buffer {} mom_o_buffer        ;# Supprime Flag @
#


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
              MOM_set_seq_off
	       set mom_sequence_mode OFF
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


set mom_modes_text [string toupper $mom_modes_text] ;# en majuscule

# "ABSOLUTE", "INCREMENTAL"
            if {$mom_output_mode == "ABSOLUTE"} {
#                set g_output_mode "G90"
#                MOM_incremental OFF X Y Z
            } elseif {$mom_output_mode == "INCREMENTAL"} {
#                set g_output_mode "G91"
#                MOM_incremental ON X Y Z
            }
# "LINEAR", "CIRCULAR"
            if {$mom_arc_mode == "LINEAR"} {
		set mom_kin_arc_output_mode LINEAR
		MOM_reload_kinematics
            } elseif {$mom_arc_mode == "CIRCULAR"} {
		set mom_kin_arc_output_mode QUADRANT
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

	if {[MOM_ask_address_value D] != $mom_tool_adjust_register} {RESET_adr Z}

}


proc  MOM_cutcom_on {} {
#_______________________________________________________________________________
# This procedure is executed when the Cutcom command is activated.
#_______________________________________________________________________________
	global mom_cutcom_mode
	global mom_sys_cutcom_code
	global opt_cutcom_code
	global head_position mom_cutcom_plane

	if {$mom_cutcom_plane == "NONE"} { ; # Plan de Correction
		if {$head_position == "ZM"} {
			   set mom_cutcom_plane XY
		} elseif {$head_position == "YM"} {
			   set mom_cutcom_plane ZX
		} elseif {$head_position == "XM"} {
			   set mom_cutcom_plane YZ
                }
	}

	set opt_cutcom_code $mom_sys_cutcom_code($mom_cutcom_mode)
}


proc  MOM_cutcom_off {} {
#_______________________________________________________________________________
# This procedure is executed when the Cutcom command is deactivated.
#_______________________________________________________________________________
	global mom_sys_cutcom_code
	global opt_cutcom_code

        # MOM_do_template cutcom_off
       set opt_cutcom_code $mom_sys_cutcom_code(OFF)


}


proc SPINDLE_max_min {{proc before_motion}} {
#_______________________________________________________________________________
# 
#_______________________________________________________________________________
         global mom_spindle_rpm max_rpm min_rpm mom_motion_type tool_change_flag

        if {[info exists mom_spindle_rpm] != 0} {
	 if {$proc == "before_motion" && $mom_motion_type != "FROM"} {
	 if {$mom_spindle_rpm == 0 && $tool_change_flag == 1 } {
	 ERROR "Erreur : Usinage Impossible avec Broche Aretée" 3}
	 if {$mom_spindle_rpm < $min_rpm} {set mom_spindle_rpm $min_rpm}
	 if {$mom_spindle_rpm > $max_rpm} {set mom_spindle_rpm $max_rpm}
         }
	 if {$proc != "before_motion"} {
	  if {$mom_spindle_rpm < $min_rpm} {set mom_spindle_rpm $min_rpm}
	  if {$mom_spindle_rpm > $max_rpm} {set mom_spindle_rpm $max_rpm}
	 }
	}
}


proc MOM_vitesse {} {
#_______________________________________________________________________________
# Cette procedure est executee pour changement de vitesse en cours d'usinage .
#_______________________________________________________________________________
      global mom_vitesse_broche mom_spindle_speed_defined mom_spindle_rpm

      set mom_spindle_rpm $mom_vitesse_broche

      SPINDLE_max_min spindle

# EVENT vitesse 
# {
#    UI_LABEL "Vitesse Broche"
#    CATEGORY MILL DRILL LATHE
#    PARAM command_status
#    {
#       TYPE o
#       DEFVAL "Actif"
#       OPTIONS "Actif","Inactif"
#       UI_LABEL "Status"
#    }
#    PARAM spindle_mode
#    {
#       TYPE o
#       DEFVAL "RPM"
#       OPTIONS "RPM","SFM","SMM"
#       UI_LABEL "Mode"
#    }
#    PARAM vitesse_broche
#    {
#       TYPE   d
#       DEFVAL "500.0"
#       TOGGLE On
#       UI_LABEL "Vitesse" 
#    }
#    PARAM spindle_direction
#    {
#       TYPE   o
#       DEFVAL "CLW"
#       OPTIONS "CLW","CCLW","NONE" 
#       UI_LABEL "Direction" 
#   }
# }
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

	MOM_do_template cycle_off


 	if {[hiset mom_command_status]} {} else {
             set mom_command_status ACTIVE}

	if {$mom_command_status == "USER_DEFINED"} {
	set mom_command_status ACTIVE
	set mom_spindle_text [string toupper $mom_spindle_text]  ;# en Majuscule
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
         	MOM_do_template coolant_off}
	}
	

}


proc  MOM_coolant_on {} {
#_______________________________________________________________________________
# This procedure is executed when the Coolant command is activated.
#_______________________________________________________________________________
	global mom_coolant_mode mom_coolant_status mom_coolant_status_mist

#       if {$mom_coolant_mode == ""}  {set mom_coolant_status FLOOD }     ;# Force Arrosage Normal si non Programme

        if {$mom_coolant_mode == "NORMAL SEUL"}     {       ;# Arrosage Normal
	     set mom_coolant_status_mist SOUFFLAGE_OFF
	     set mom_coolant_status FLOOD         
           }

        if {$mom_coolant_mode == "SOUFFLAGE SEUL"}  {       ;# Soufflage
	     set mom_coolant_status OFF
             set mom_coolant_status_mist MIST    
           } 

        if {$mom_coolant_mode == "NORMAL & SOUFFLAGE"}  {   ;# Arrosage Normal & Soufflage
            set mom_coolant_status FLOOD
            set mom_coolant_status_mist MIST
           }

### ude.cdl ###
# EVENT coolant 
# {
#    POST_EVENT "coolant_on"
#    UI_LABEL "Arrosage Marche"
#    CATEGORY MILL DRILL
#    PARAM command_status
#    {
#       TYPE o
#       DEFVAL "Active"
#       OPTIONS "Active","Inactive","User Defined"
#       UI_LABEL "Status"
#    }
#    PARAM coolant_mode
#    {
#       TYPE o
#       DEFVAL  "Normal Seul"
#       OPTIONS "Normal Seul","Soufflage Seul","Normal & Soufflage"
#       UI_LABEL "Type"
#    }
#    PARAM coolant_text
#    {
#       TYPE   s
#       TOGGLE Off
#       UI_LABEL "Text"
#    }
# }
### ude.cdl ###
 
}

proc  MOM_coolant_off {} {
#_______________________________________________________________________________
# This procedure is executed when the Coolant command is deactivated.
#_______________________________________________________________________________
	global mom_sys_coolant_code mom_coolant_status_mist
	global mom_coolant_off_mode

	MOM_partno

	MOM_do_template cycle_off

	if {[info exist mom_coolant_off_mode] != 1} {set mom_coolant_off_mode "TOUT ARRET"}

	if {[MOM_ask_address_value coolant_m] != $mom_sys_coolant_code(OFF)} {
	 if {$mom_coolant_off_mode == "ARRET NORMAL"} {
#	      MOM_output_literal "Arret Normal : $mom_coolant_off_mode"
	      set mom_coolant_status OFF
              MOM_do_template coolant_off	 ;# Pour Arret Arrosage
            }
           }

	if {[MOM_ask_address_value coolant_m] != $mom_sys_coolant_code(OFF) || [MOM_ask_address_value coolant_mist] != $mom_sys_coolant_code(SOUFFLAGE_OFF)} {
	 if {$mom_coolant_off_mode == "TOUT ARRET"} {
#	      MOM_output_literal "Arret Tout : $mom_coolant_off_mode"
	      set mom_coolant_status OFF
	      set mom_coolant_status_mist SOUFFLAGE_OFF
              MOM_do_template coolant_off	 ;# Pour Arret Arrosage
 	      MOM_do_template coolant_off_mist   ;# Pour Arret Soufflage
            }
           }

	if {[MOM_ask_address_value coolant_mist] != $mom_sys_coolant_code(SOUFFLAGE_OFF)} {
         if {$mom_coolant_off_mode == "ARRET SOUFFLAGE"} {
#	      MOM_output_literal "Arret Soufflage : $mom_coolant_off_mode"
              set mom_coolant_status_mist SOUFFLAGE_OFF
 	      MOM_do_template coolant_off_mist    ;# Pour Arret Soufflage
            }
           }

### ude.cdl ###
# EVENT coolant_off
# {
#   POST_EVENT "Coolant"
#   UI_LABEL "Arrosage Arret"
#    CATEGORY MILL DRILL
#    PARAM coolant_off_mode
#    {
#       TYPE o
#       DEFVAL  "Tout Arret"
#       OPTIONS "Tout Arret","Arret Normal","Arret Soufflage"
#       UI_LABEL "Status"
#    }
#    PARAM coolant_text
#    {
#       TYPE   s
#       TOGGLE Off
#       UI_LABEL "Text"
#    }
# }
### ude.cdl ###

}


proc  MOM_opstop {} {
#_______________________________________________________________________________
# This procedure is executed when the Optional Stop command is activated.
#_______________________________________________________________________________
	global mom_opstop_text text mom_opstop_text_defined

	MOM_partno

	MOM_do_template cycle_off

	if {$mom_opstop_text_defined != 0} {
            set text ""
	    MOM_do_template opstop BUFFER
	    MOM_output_literal "[MESSAGE_sin $mom_opstop_text CREATE]"
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

	MOM_do_template cycle_off

	if {$mom_stop_text_defined != 0} {
            set text ""
            MOM_do_template stop BUFFER
            MOM_output_literal "[MESSAGE_sin $mom_stop_text CREATE]"
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

	MOM_do_template cycle_off

 	if {$mom_delay_mode == "REVOLUTIONS"} {
	     set mom_delay_value [expr $mom_delay_revs * $mom_spindle_rpm]
	   }

	if {$mom_delay_value > $max_delay} {set mom_delay_value $max_delay}
	if {$mom_delay_value < $min_delay} {set mom_delay_value $min_delay}

	MOM_do_template cycle_off
        MOM_do_template delay
}


proc MOM_insert {} {
#_______________________________________________________________________________
# This procedure is executed when the Insert command is activated.
#_______________________________________________________________________________
	global mom_Instruction

	MOM_partno

	MOM_do_template cycle_off

	MOM_output_literal "[string toupper $mom_Instruction]"

}


proc  MOM_auxfun {} {
#_______________________________________________________________________________
# This procedure is executed when the Auxiliary command is activated.
#_______________________________________________________________________________

	MOM_partno

	MOM_do_template cycle_off

        MOM_do_template auxiliary

}


proc  MOM_prefun {} {
#_______________________________________________________________________________
# This procedure is executed when the Preparatory function command is activated.
#_______________________________________________________________________________

	MOM_partno

	MOM_do_template cycle_off

        MOM_do_template preparatory
}


proc  MOM_tool_preselect {} {
#_______________________________________________________________________________
# This procedure is executed when the Tool Preselect command is activated.
#_______________________________________________________________________________
}


proc MOM_setup {} {
#_______________________________________________________________________________________________
# Cette procedure est executee avec la Fonction Setup (Changement Position Retour aux Origines).
#_______________________________________________________________________________________________
        global mom_param_r0 mom_param_r1 mom_param_r2
        global prev_param_r0 prev_param_r1 prev_param_r2
        global setup_flag

        set setup_flag 1

### ude.cdl ###
# EVENT setup
# {
#    UI_LABEL "Pos. Setup"
#
#    PARAM param_r0
#    {
#       TYPE   d
#       DEFVAL "0.0000"
#       UI_LABEL "PARAMETRE R0 (X)"
#    }
#    PARAM param_r1
#    {
#       TYPE   d
#       DEFVAL "0.0000"
#       UI_LABEL "PARAMETRE R1 (Y)"
#    }
#    PARAM param_r2
#    {
#       TYPE   d
#       DEFVAL "0.0000"
#       UI_LABEL "PARAMETRE R2 (Z)"
#    }
# }
### ude.cdl ###

}


proc MOM_origin {} {
#_______________________________________________________________________________
# This procedure is executed when the Origin command is activated.
#_______________________________________________________________________________
	global mom_origin_register mom_origin_text
	global mom_x_offset mom_y_offset mom_z_offset
	global x_offset y_offset z_offset
	global nombre mom_origin_point
	

	if {$mom_origin_register < 1 } {
             set mom_origin_register 1
           } elseif {$mom_origin_register > 4 } {
             set mom_origin_register 4
           }

        set origin [expr $mom_origin_register + 53]

# Initialisation l'Origine
	set O_register	[format "%u" $origin]
	set N_register	[format "%u" $mom_origin_register]

        set mom_x_offset $mom_origin_point(0)
	set mom_y_offset $mom_origin_point(1)
	set mom_z_offset $mom_origin_point(2)

	set nombre $mom_x_offset
	set X_offset	[MOM_do_template format5_3 CREATE]
	set nombre $mom_y_offset
	set Y_offset	[MOM_do_template format5_3 CREATE]
	set nombre $mom_z_offset
	set Z_offset	[MOM_do_template format5_3 CREATE]

	if {[info exists mom_origin_text] == 0} {set mom_origin_text ""}

	MOM_set_seq_off
	MOM_output_literal "  "
	MOM_output_literal "	; ORIGINE G$O_register $mom_origin_text"
	MOM_set_seq_on
	MOM_output_literal "	\$p_uIfr\[$N_register,x,tr\]=$X_offset"
	MOM_output_literal "	\$p_uIfr\[$N_register,y,tr\]=$Y_offset"
	MOM_output_literal "	\$p_uIfr\[$N_register,z,tr\]=$Z_offset"
	MOM_output_literal "	stopre"

# Sauvegarde des Decalages de l'Origine
	set x_offset($mom_origin_register) $mom_x_offset
	set y_offset($mom_origin_register) $mom_y_offset
	set z_offset($mom_origin_register) $mom_z_offset

### ude_huron_kx20.cdl ###
# EVENT origin
# {
#    UI_LABEL "Origin"
#
#    PARAM origin_register
#    {
#       TYPE   i
#       DEFVAL "1"
#       UI_LABEL "Register"
#    }
#    PARAM origin_text
#    {
#      TYPE   s
#       TOGGLE Off
#       UI_LABEL "Text"
#    }
#    PARAM origin_point 
#    {
#       TYPE p
#       UI_LABEL "Selectionner Element pour Definition d'Origine"
#    }
# }
### ude_huron_kx20.cdl ###

}


proc MOM_zero {} {
#_______________________________________________________________________________
# This procedure is executed when the Zero command is activated.
#_______________________________________________________________________________
	global zero mom_zero_register
	global mom_x_offset mom_y_offset mom_z_offset
	global x_offset y_offset z_offset

	set save $zero

# Origines de 1 a 4 (G54 a G57)
	if {$mom_zero_register < 1 } {
             set mom_zero_register 1
           } elseif {$mom_zero_register > 4 } {
             set mom_zero_register 4
           }

	set zero [expr $mom_zero_register + 53]

	if {$zero != $save} {RESET_adr X Y Z}
	
# Active les Offsets Correspondants à l'Origine Active
	if {[info exists x_offset($mom_zero_register)] == 0} {
             ERROR "L'Origine $mom_zero_register non Définie" 3
           }

	set mom_x_offset $x_offset($mom_zero_register)
	set mom_y_offset $y_offset($mom_zero_register)
	set mom_z_offset $z_offset($mom_zero_register)

### ude_huron_kx20.cdl ###
# EVENT zero
#  {
#     UI_LABEL "Rappel Origine"
#     CATEGORY MILL DRILL
#     PARAM command_status
#     {
#        TYPE o
#        DEFVAL "Active"
#        OPTIONS "Active","Inactive","User Defined"
#        UI_LABEL "Status"
#     }
#     PARAM zero_register
#     {
#        TYPE   i
#        DEFVAL "1"
#        UI_LABEL "Registre"
#     }
#  }
### ude_huron_kx20.cdl ###

}

proc MOM_tracking_tool {} {
#_______________________________________________________________________________
# This procedure is executed for Tracking Point for a Ball Tool .
#_______________________________________________________________________________
	global mom_tracking_point_text tracking_point_tool
	global x_offset_tool_corner_radius
	global y_offset_tool_corner_radius
	global z_offset_tool_corner_radius

	if {$mom_tracking_point_text ==  "CENTRE BOULE"} {
#	     MOM_output_literal "Centre Boule"
	     set tracking_point_tool 1
           } else {
#            MOM_output_literal "Bout Outil"
	     set tracking_point_tool 0
           }

### ude_huron_kx20.cdl ###
# EVENT tracking_tool
# {
#    UI_LABEL "Point Piloté"
#
#    PARAM tracking_point_text
#    {
#       TYPE   o
#       DEFVAL   "Centre Outil"
#       OPTIONS  "Centre Outil","Bout Outil"
#       UI_LABEL "Point Piloté"
#   }
# }
### ude_huron_kx20.cdl ###
}



proc TRANS_axes {} {
#_______________________________________________________________________________
# Calcul Centre Outil et Bout d'Outil pour Fraise Boule et Fraise Torique
#_______________________________________________________________________________
	global x_offset_tool_corner_radius 
	global y_offset_tool_corner_radius 
	global z_offset_tool_corner_radius
	global tracking_point_tool
	global mom_tool_axis
	global mom_tool_type
	global mom_tool_number mom_tool_name mom_tool_diameter 
	global mom_tool_lower_corner_radius mom_tool_corner1_radius
	global mom_tool_taper_angle mom_tool_tip_angle
	global mom_pos


	if {$mom_tool_type == "Milling Tool-5 Parameters" && $mom_tool_taper_angle == 0 && $mom_tool_tip_angle == 0 || 
            $mom_tool_type == "Milling Tool-7 Parameters" && $mom_tool_taper_angle == 0 && $mom_tool_tip_angle == 0} {      
         if {$tracking_point_tool == 1} {

# 	      MOM_output_literal "Avant Transformation : Position_X = $mom_pos(0)  Position_Y = $mom_pos(1)  Position_Z = $mom_pos(2)"

	      set mom_pos(0) [expr ($mom_pos(0) + ($mom_tool_corner1_radius * $mom_tool_axis(0)))]
	      set mom_pos(1) [expr ($mom_pos(1) + ($mom_tool_corner1_radius * $mom_tool_axis(1)))]
	      set mom_pos(2) [expr ($mom_pos(2) + ($mom_tool_corner1_radius * $mom_tool_axis(2)))]

#	      MOM_output_literal "Apres Transformation : Position_X = $mom_pos(0)  Position_Y = $mom_pos(1)  Position_Z = $mom_pos(2)"

            } else {
	      MOM_reload_variable -a mom_pos
	      MOM_reload_variable -a mom_prev_pos
            }
           }
}

proc  MOM_text {} {
#_______________________________________________________________________________
# This procedure is executed when the Text command is activated.
#_______________________________________________________________________________
	global mom_user_defined_text mom_record_fields mom_record_text
	global zero mom_Instruction partno
	global coarse_fine
        global mom_cutcom_mode mom_sys_cutcom_code mom_command_status mom_cutcom_status opt_cutcom_code
	global head_position mom_sys_cutcom_plane_code


        set check_cdc_helix [string tolower [string range $mom_user_defined_text 0 [expr [string first "/" $mom_user_defined_text] -1]]]
#       MOM_output_literal $check_cdc_helix

         if {$check_cdc_helix == "cutcom"} {
#            MOM_output_literal "Correction Rayon Helicoidal : $check_cdc_helix"
             set side_cdc [string tolower [string range $mom_user_defined_text 0 [expr [string first "," $mom_user_defined_text] -1]]]

          if {$side_cdc == "cutcom/left"} {
              set mom_cutcom_mode LEFT
              set opt_cutcom_code $mom_sys_cutcom_code($mom_cutcom_mode)
#             MOM_output_literal "Activer Correction a Gauche : $side_cdc"
             }
           if {$side_cdc == "cutcom/right"} {
               set mom_cutcom_mode RIGHT
               set opt_cutcom_code $mom_sys_cutcom_code($mom_cutcom_mode)
#              MOM_output_literal "Activer Correction a Droite : $side_cdc"
              }
            if {$side_cdc == ""} {
                set mom_cutcom_mode OFF
                set opt_cutcom_code $mom_sys_cutcom_code($mom_cutcom_mode)
#               MOM_output_literal "Desactiver Correction de Rayon : $side_cdc"
               }        
             }


   if {[string first "$$" [string range $mom_record_fields(0) 0 1]] == -1} {
	switch $mom_record_fields(0) {
	"INSERT" {
	set mom_Instruction "$mom_record_text"
	MOM_insert
	}
	"COARSE" {
	set coarse_fine 642
	}
	"FINE" {
	set coarse_fine 60
	}
	"WARNING" {
	}
	default {
	ERROR "$mom_record_fields(0) n'est pas supportée en User Defined Command" 2
	}
	}
   }
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
}


proc  MOM_lintol {} {
#_______________________________________________________________________________
# This procedure is executed for the LINTOL command (user defined).
#_______________________________________________________________________________
}


proc  MOM_tlset {} {
#_______________________________________________________________________________
# This procedure is executed for the TLSET command (user defined).
#_______________________________________________________________________________
}

proc MOM_set_csys {} {
#_______________________________________________________________________________
# This procedure is executed for CSYS change .
#_______________________________________________________________________________
}

proc MOM_first_turret {} {
#_______________________________________________________________________________
# This procedure is executed for the First Turret Change (Preloaded Tool) .
#_______________________________________________________________________________
}

proc  MOM_gohome_move {} {
#_______________________________________________________________________________
# This procedure is executed for the GOHOME command.
#_______________________________________________________________________________
	global mom_motion_type ; # GOHOME => GOHOME_DEFAULT, GOHOME/x,y,z => GOHOME
	global head_position

	MOM_partno

	if {$mom_motion_type != "GOHOME_DEFAULT" } {
		MOM_rapid_move
	} elseif {$head_position == "ZM"} {
		RETURN_move Z
		RETURN_move XY
	} elseif {$head_position == "YM"} {
		RETURN_move Y
		RETURN_move XZ
	} elseif {$head_position == "XM"} {
		RETURN_move X
		RETURN_move YZ
	} elseif {$head_position == "INCLINE"} {
		RETURN_move XYZ
        }

}


proc  CYCLE_set {template} {
#_______________________________________________________________________________
# This procedure is executed at the cycle motion.
#_______________________________________________________________________________
        global mom_cycle_retract_mode prev_pos mom_cycle_retract_to_pos mom_cycle_rapid_to_pos
	global mom_pos mom_system_tolerance
	global mom_cycle_delay
	global head_position mom_tool_axis

	RETRACT_TO_pos

#        if {[OUTPUT_adr FOUR]} {MOM_do_template rapid_xy}

# Position Avant cycle 
	set mom_pos(2) $mom_cycle_rapid_to_pos(2)
	set save $mom_system_tolerance
	set mom_system_tolerance 0.1

	if {$head_position == "ZM"} {
         if {[EQ_is_equal $mom_tool_axis(2) 1.0]  && [EQ_is_gt $mom_pos(2) $prev_pos(2)] || \
             [EQ_is_equal $mom_tool_axis(2) -1.0] && [EQ_is_lt $mom_pos(2) $prev_pos(2)]} {
	      MOM_do_template cycle_off
	      MOM_do_template cycle_plane_change_ZM
         }
	}


	if {$head_position == "YM"} { 
         if {[EQ_is_equal $mom_tool_axis(1) 1.0]  && [EQ_is_gt $mom_pos(1) $prev_pos(1)] || \
             [EQ_is_equal $mom_tool_axis(1) -1.0] && [EQ_is_lt $mom_pos(1) $prev_pos(1)]} {
	      MOM_do_template cycle_off
	      MOM_do_template cycle_plane_change_YM
         }
	}


	if {$head_position == "XM"} {
         if {[EQ_is_equal $mom_tool_axis(0) 1.0]  && [EQ_is_gt $mom_pos(0) $prev_pos(0)] || \
             [EQ_is_equal $mom_tool_axis(0) -1.0] && [EQ_is_lt $mom_pos(0) $prev_pos(0)]} {
	      MOM_do_template cycle_off
	      MOM_do_template cycle_plane_change_XM
         }
	}

	set mom_system_tolerance $save

# Ressortie des Adresses du Cycle
	if {[set a [MOM_do_template ${template}_$head_position CREATE]] != ""} {
              MOM_do_template cycle_init CREATE
           }

# Supprime Temporisation Nulle
	if {$mom_cycle_delay == 0} {MOM_suppress always DTB}

}


proc CYCLE_move { } {
#_______________________________________________________________________________
# This procedure is executed at the cycle motion.
#_______________________________________________________________________________
	global mom_cycle_retract_to_pos
	global head_position


	if {$head_position == "ZM"} {
		if {[OUTPUT_adr X Y] == 0} {RESET_adr X}
		MOM_do_template cycle_xy
		MOM_suppress off DTB
		UPDATE_adr Z $mom_cycle_retract_to_pos(2)

	} elseif {$head_position == "YM"} {
		if {[OUTPUT_adr X Z] == 0} {RESET_adr X}
		MOM_do_template cycle_xz
		MOM_suppress off DTB
		UPDATE_adr Y $mom_cycle_retract_to_pos(1)

	} elseif {$head_position == "XM"} {
		if {[OUTPUT_adr Y Z] == 0} {RESET_adr Y}
		MOM_do_template cycle_yz
		MOM_suppress off DTB
		UPDATE_adr X $mom_cycle_retract_to_pos(0)
        }

	SAVE_prev_pos cycle
}



proc  CYCLE_dwell_set {} {
#_______________________________________________________________________________
# This procedure is executed at the cycle definition.
#_______________________________________________________________________________
	global mom_cycle_delay_mode ;# SECONDS, REVOLUTIONS, OFF ,ON
	global mom_cycle_delay mom_cycle_delay_revs mom_spindle_rpm
	global max_delay min_delay 

	if {$mom_cycle_delay_mode == "ON"} {ERROR "DWELL On avec CYCLE/... non Supporter" 3}

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


proc MOM_angle_tap {} {
#___________________________________________________________________________________
# Cette Procedure permet l'Orientation Angulaire du Taraud pour Cycle de Taraudage
#___________________________________________________________________________________
     global mom_cycle_angle_tap

	if { [info exists mom_cycle_angle_tap] == 0 } {set mom_cycle_angle_tap 0} 

	set mom_cycle_angle_tap [expr fmod($mom_cycle_angle_tap,360)]

### ude_huron_kx20.cdl ###
# EVENT angle_tap
# {
#    UI_LABEL "Angle Taraud"
#
#    PARAM cycle_angle_tap
#    {
#       TYPE   d
#       DEFVAL "0.0000"
#       UI_LABEL "Angle"
#    }
# }
### ude_huron_kx20.cdl ###

}

proc MOM_lift_off {} {
#___________________________________________________________________________________
# Cette Procedure permet le Decalage Outil pour Cycle Alesage Indexe
#___________________________________________________________________________________
     global mom_cycle_lift_off_bore_nodrag

    if { [info exists mom_cycle_lift_off_bore_nodrag] == 0 } {set mom_cycle_lift_off_bore_nodrag 0.2}

### ude_huron_kx20.cdl ###
# EVENT lift_off
# {
#    UI_LABEL "Degagement Alesage Indexe"
#
#    PARAM cycle_lift_off_bore_nodrag
#    {
#       TYPE   d
#       DEFVAL "0.2000"
#       UI_LABEL "Valeur"
#    }
# }
### ude_huron_kx20.cdl ###

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
		set mom_cycle_retract_mode NONE
		return
	}

	if {$mom_clearance_plane_usage != 1} {
		ERROR "Avec RTRCTO,AUTO le Clearance Plan doit etre utiliser at START and END. Commande ignoree" 2
		set mom_cycle_retract_mode NONE
		return
	}
	
# calcul de (XI+YJ+ZK), (xI+yJ+zK), (Ii+Jj+Kk)
set calcul_1 [expr ($mom_clearance_plane_point(0)*$mom_clearance_plane_normal(0))+($mom_clearance_plane_point(1)*$mom_clearance_plane_normal(1))+($mom_clearance_plane_point(2)*$mom_clearance_plane_normal(2))]
set calcul_2 [expr ($mom_mcs_goto(0)*$mom_clearance_plane_normal(0))+($mom_mcs_goto(1)*$mom_clearance_plane_normal(1))+($mom_mcs_goto(2)*$mom_clearance_plane_normal(2))]
set calcul_3 [expr ($mom_clearance_plane_normal(0)*$mom_tool_axis(0))+($mom_clearance_plane_normal(1)*$mom_tool_axis(1))+($mom_clearance_plane_normal(2)*$mom_tool_axis(2))]

	if {[EQ_is_zero $calcul_3]} {
		ERROR "RTRCTO,AUTO ne peut etre calculer : orientation outil parallele au Clearance Plan. Commande ignoree" 2
		set mom_cycle_retract_mode NONE
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
		set mom_cycle_retract_mode NONE
	}

#MOM_output_literal "R=$mom_cycle_rapid_to R2=$mom_cycle_retract_to"
#MOM_output_literal "Xpos=$mom_pos(0) Ypos=$mom_pos(1) Zpos=$mom_pos(2)"
#MOM_output_literal "XR=$mom_cycle_rapid_to_pos(0) YR=$mom_cycle_rapid_to_pos(1) ZR=$mom_cycle_rapid_to_pos(2)"
#MOM_output_literal "XR2=$mom_cycle_retract_to_pos(0) YR2=$mom_cycle_retract_to_pos(1) ZR2=$mom_cycle_retract_to_pos(2)"

}


proc  MOM_cycle_plane_change {} {
#_______________________________________________________________________________
# This procedure is executed at the end of cycle motion when there is a cycle 
# move occuring at a higher level than the previous position.
#_______________________________________________________________________________
	global prev_pos mom_cycle_retract_to_pos

}

proc  MOM_cycle_off {} {
#_______________________________________________________________________________
# This procedure is executed at the end of cycle motion.
#_______________________________________________________________________________

	RESET_adr motion_g

}



proc  MOM_drill {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

}

proc  MOM_drill_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a drill cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_drill_code
	global head_position

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_drill
	     MOM_do_template cycle_drill_$head_position
	     CYCLE_move
           } else {
             EMULE_cycle 0 0 0 0 0 0
           }
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
	global mom_sys_cycle_drill_dwell_code
	global head_position

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_drill_dwell
       	     MOM_do_template cycle_drill_dwell_$head_position
	     CYCLE_move
           } else {
             EMULE_cycle 0 0 0 0 0 0
           }
}

proc  MOM_drill_counter_sink {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

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

	if {$mom_cycle_step1 == 0} {
	     ERROR "Avec CYCLE/DEEP STEP 1 est Obligatoire" 2
	   }

}

proc  MOM_drill_deep_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a  deep cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_drill_deep_code
	global head_position

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_drill_deep
       	     MOM_do_template cycle_drill_deep_$head_position
	     CYCLE_move
           } else {
             EMULE_cycle 0 0 1 0 0 0
           }
}

proc  MOM_drill_break_chip {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a brkchp cycle.
#_______________________________________________________________________________
	global mom_cycle_step1 mom_cycle_step2 mom_cycle_step3


	CYCLE_dwell_set

	set mom_cycle_step1 [expr abs($mom_cycle_step1)]

	if {$mom_cycle_step1 == 0} {
	    ERROR "Avec CYCLE/BRKCHP STEP 1 est Obligatoire" 2
	   }

}

proc  MOM_drill_break_chip_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a  brkchp cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_breakchip_code 
	global head_position

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_breakchip
       	     MOM_do_template cycle_breakchip_$head_position
	     CYCLE_move
           } else {
             EMULE_cycle 0 0 0 1 0 0
           }
}

proc  MOM_tap {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a tap cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_tap_code mom_spindle_direction sdr
	global mom_cycle_option tap_type
	global mom_cycle_feed_rate_per_rev tap_signed_feed
        global mom_cycle_angle_tap

	CYCLE_dwell_set

	set tap_type 1
	if {[info exists mom_cycle_option] == 0} {set mom_cycle_option "Off"}
        if {[info exists mom_cycle_angle_tap] == 0 } {set mom_cycle_angle_tap 0} 
	if {$mom_cycle_option == "OPTION"} {set tap_type 2}

	set tap_signed_feed $mom_cycle_feed_rate_per_rev

	if {$mom_spindle_direction == "CCLW"} { 
	     set tap_signed_feed [expr $mom_cycle_feed_rate_per_rev * -1]
	     set sdr 3
	   } else {
	     set sdr 4
	   }

}

proc  MOM_tap_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a tap cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_tap_code tap_type
	global head_position

        if {$head_position != "INCLINE"} {
	 if {$tap_type == 1} {MOM_suppress always S}
	     MOM_suppress always F
	     CYCLE_set cycle_tap_$tap_type
             MOM_do_template cycle_tap_${tap_type}_$head_position
	     CYCLE_move
	     MOM_suppress off S F
          } else { 
             EMULE_cycle 0 1 0 0 0 0
          }
}

proc  MOM_bore {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

}

proc  MOM_bore_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a bore cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_code
	global head_position

        if {$head_position != "INCLINE"} {
	     MOM_suppress always F
	     CYCLE_set cycle_bore
#	     MOM_do_template bore_feed
	     MOM_do_template cycle_bore_$head_position
	     CYCLE_move
	     MOM_suppress off F
          } else {
             EMULE_cycle 0 0 0 0 0 0
          }

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

	MOM_bore_move
}

proc  MOM_bore_drag {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore drag cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_drag_code
	global mom_cycle_delay

	CYCLE_dwell_set

	if {$mom_cycle_delay == 0} {
		set mom_sys_cycle_bore_drag_code "CALL CYCLE86"
	} else {
		set mom_sys_cycle_bore_drag_code "CALL CYCLE88"
	}

}

proc  MOM_bore_drag_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a bore_drag cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_drag_code
	global head_position

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_bore_drag
	     MOM_do_template spindle_start
             MOM_do_template cycle_bore_drag_$head_position
	     CYCLE_move
           } else { 
             EMULE_cycle 1 0 0 0 0 0
           }

}

proc  MOM_bore_no_drag {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore nodrag cycle.
#_______________________________________________________________________________
	global mom_cycle_orient
	global deg_to_rad rpa rpo
        global mom_cycle_lift_off_bore_nodrag

	CYCLE_dwell_set

	if { [info exists mom_cycle_orient] == 0 } {set mom_cycle_orient 0}
        if { [info exists mom_cycle_lift_off_bore_nodrag] == 0 } {set mom_cycle_lift_off_bore_nodrag 0.2}  

	set mom_cycle_orient [expr fmod($mom_cycle_orient,360)]
	if {[EQ_is_lt $mom_cycle_orient 0]} {set mom_cycle_orient [expr $mom_cycle_orient + 360]}

	set a [expr $mom_cycle_orient * $deg_to_rad] ;# Angle en Radians

	set rpa [expr -0.2 * cos($a)]
	set rpo [expr -0.2 * sin($a)]
}

proc  MOM_bore_no_drag_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a bore nodrag cycle.
#_______________________________________________________________________________
	global mom_sys_cycle_bore_no_drag_code
	global head_position
        global mom_cycle_lift_off_bore_nodrag

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_bore_no_drag
       	     MOM_do_template cycle_bore_no_drag_$head_position
	     CYCLE_move
           } else { 
             EMULE_cycle 0 0 0 0 1 0
           }
}

proc  MOM_bore_back {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore back cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

	ERROR "CYCLE/BORE,BACK non supporté" 2

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

	CYCLE_dwell_set

}

proc  MOM_bore_manual_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a manual bore cycle.
#_______________________________________________________________________________
	global head_position

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_bore_manual
	     MOM_do_template spindle_start
             MOM_do_template cycle_bore_manual_$head_position
	     CYCLE_move
           } else {
             EMULE_cycle 0 0 0 0 0 1
           }

}

proc  MOM_bore_manual_dwell {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a bore manual dwell bore cycle.
#_______________________________________________________________________________

	CYCLE_dwell_set

}

proc  MOM_bore_manual_dwell_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a manual dwell borecycle.
#_______________________________________________________________________________
	global head_position

        if {$head_position != "INCLINE"} {
	     CYCLE_set cycle_bore_man_d
	     MOM_do_template spindle_start
             MOM_do_template cycle_bore_man_d_$head_position
	     CYCLE_move
           } else {
             EMULE_cycle 0 0 0 0 0 1
           }
}



proc MOM_cycle_thread_mill {} {
#_______________________________________________________________________________
# Cette Procedure est executee durant le filetage avec Fraise
#_______________________________________________________________________________
     global mom_cycle_external_diameter mom_cycle_internal_diameter
     global mom_cycle_thread_lead
     global mom_cycle_thread_direction
     global mom_cycle_type_of_thread
     global typth_value
     global cdir_value


      if {$mom_cycle_type_of_thread == "INTERIEUR"} {
          set typth_value 0
         } else {
          set typth_value 1
         }

      if {$mom_cycle_thread_direction == "CLW"} {
          set cdir_value 2
         } else {
          set cdir_value 3
         }


### ude_huron_kx20.cdl ###
# EVENT cycle_thread_mill
# {
#    UI_LABEL "Filetage Fraise"
#
#    PARAM cycle_external_diameter
#    {
#       TYPE   d
#       DEFVAL "27"
#       UI_LABEL "Diametre Nominal"
#    }
#    PARAM cycle_internal_diameter
#    {
#       TYPE d
#       DEFVAL "24.797"
#       UI_LABEL "Diametre Fond de Filet"
#    }
#    PARAM cycle_thread_lead
#    {
#       TYPE d
#       DEFVAL "2"
#       UI_LABEL "Pas du Filet"
#    }
#    PARAM cycle_thread_direction
#    {
#       TYPE   o
#       DEFVAL   "CLW"
#       OPTIONS  "CLW","CCLW"
#       UI_LABEL "Direction Usinage"
#    }
#    PARAM cycle_type_of_thread
#    {
#       TYPE   o
#       DEFVAL   "Interieur"
#       OPTIONS  "Interieur","Exterieur"
#       UI_LABEL "Type de Filet"
#    }
# }
### ude_huron_kx20.cdl ###
}


proc  set_CYCLE90 {template} {
#_______________________________________________________________________________
# This procedure is executed at the cycle motion.
#_______________________________________________________________________________
        global mom_cycle_retract_mode prev_pos mom_cycle_retract_to_pos mom_cycle_rapid_to_pos
	global mom_pos mom_system_tolerance
	global mom_cycle_delay
	global head_position

	RETRACT_TO_pos

#        if {[OUTPUT_adr FOUR]} {MOM_do_template rapid_xy}

# Ressortie des adresses du cycle
	if {[set a [MOM_do_template ${template}_$head_position CREATE]] != ""} {MOM_do_template cycle90_init CREATE}

}


proc MOM_drill_text {} {
#_______________________________________________________________________________
# This procedure is executed at the begining of a drill text cycle.
#_______________________________________________________________________________

      global mom_cycle_text mom_cycle_text_defined

}

proc  MOM_drill_text_move {} {
#_______________________________________________________________________________
# This procedure is executed for the goto of a drill text cycle.
#_______________________________________________________________________________

	global head_position
        global mom_cycle_external_diameter mom_cycle_internal_diameter
        global mom_cycle_thread_lead
        global mom_cycle_thread_direction
        global mom_cycle_type_of_thread
        global typth_value
        global cdir_value
	global head_position


     if {[EQ_is_le $mom_cycle_thread_lead 0.0]} {
          ERROR "Le Pas du Filet doit etre Superieur a 0" 3
        } else {
      if {[EQ_is_ge $mom_cycle_internal_diameter $mom_cycle_external_diameter]} {
          ERROR "Le Diametre de FOND de Filet ne peut pas etre Plus Grand que le Diametre de SOMMET de Filet" 3
         } else {

       if {$head_position == "ZM"} {
            MOM_suppress always X Y
          } elseif {$head_position == "YM"} {
            MOM_suppress always X Z
          } elseif {$head_position == "XM"} {
            MOM_suppress always Y Z 
          }   
           set_CYCLE90 cycle_thread_mill
           MOM_do_template spindle_start
           MOM_do_template cycle_thread_mill_$head_position
         }
        }
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

# Supprime le disque si D:fichier.ptp dans mom_output_file_basename
# et l'ajoute dans mom_output_file_directory

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


# Supression Double Slash si Fichier dans la Racine du Disque (Probleme NX5)

   if {[string range $mom_output_file_directory 0 [expr [string first "\\\\" $mom_output_file_directory]-0] ] != "" } {
        regsub  {\\} ${mom_output_file_directory} {} mom_output_file_directory
      }

        set ptp_file_name     "${mom_output_file_directory}${mom_output_file_basename}${output_extn}" 
#       set ptp_file_name     "${mom_output_file_directory}${mom_output_file_basename}.MPF"           ;# Extension Specifique Siemens
        set warning_file_name "${mom_output_file_directory}${mom_output_file_basename}_warning.out"

	catch {MOM_close_output_file $ptp_file_name}

	MOM_remove_file $ptp_file_name

	MOM_open_output_file $ptp_file_name

	catch {MOM_remove_file $warning_file_name}
	set warn_file [open "$warning_file_name" w ] ; set warn_count 0
  
}

proc  WARNING_HEADER {} {
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
         global warn_file
         global warning_file_name
         global warn_count

           catch {close $warn_file ; unset warn_file}
           if { $warn_count > 0 } {
              MOM_output_to_listing_device\
                  "***********************************************************"
              MOM_output_to_listing_device\
                  "  $warn_count Erreurs/Warnings dans le fichier $warning_file_name "
              MOM_output_to_listing_device\
                  "***********************************************************"
              }
         
}

################################################################################


proc  OUTPUT_adr {p0 {p1 ""} {p2 ""} {p3 ""} {p4 ""} {p5 ""} {p6 ""} {p7 ""} {p8 ""} {p9 ""} {p10 ""}} {
#_______________________________________________________________________________
# Test si sortie adresses . Choix X Y Z FOUR FIVE etc ....
#_______________________________________________________________________________
  
	foreach adr [list $p0 $p1 $p2 $p3 $p4 $p5 $p6 $p7 $p8 $p9 $p10] {
	 if {$adr != ""} {
	  if {[MOM_do_template output_adr_$adr CREATE] != ""} {
	  MOM_force once $adr
	  return 1
	  }
	 }
	} 
	return 0
}

proc  RESET_adr {p0 {p1 ""} {p2 ""} {p3 ""} {p4 ""} {p5 ""} {p6 ""} {p7 ""} {p8 ""} {p9 ""} {p10 ""}} {
#_______________________________________________________________________________
# Reset sortie adresses . Choix X Y Z FOUR FIVE etc ....
#_______________________________________________________________________________
  
	foreach adr [list $p0 $p1 $p2 $p3 $p4 $p5 $p6 $p7 $p8 $p9 $p10] {
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


proc  ECHO {p0 {p1 ""} {p2 ""} {p3 ""} {p4 ""} {p5 ""} {p6 ""} {p7 ""} {p8 ""} {p9 ""} {p10 ""}} {
#_______________________________________________________________________________
# Output to listing_device variables or strings (11 maxi)
# ex : ECHO "proc MOM_start_of_program" mom_kin_output_unit 
#_______________________________________________________________________________

	foreach var_name [list $p0 $p1 $p2 $p3 $p4 $p5 $p6 $p7 $p8 $p9 $p10] {
	 if {$var_name != ""} {
	  if [catch { upvar #0 $var_name var ; MOM_output_text " Echo var: $var_name = $var"}] {
	  MOM_output_text "Echo: $var_name"}
	  }
	 }
}
################################################################################
###############################################################################
#
# DESCRIPTION
#
#   Procs used to detect equality between scalars of real data type.
#
#  global mom_system_tolerance
#  EQ_is_equal(s, t)  (abs(s-t) <= mom_system_tolerance) Return true if scalars are equal
#  EQ_is_ge(s, t)     (s > t - mom_system_tolerance)     Return true if s is greater than
#                                            or equal to t
#  EQ_is_gt(s, t)     (s > t + mom_system_tolerance)     Return true if s is greater than t
#  EQ_is_le(s, t)     (s < t + mom_system_tolerance)     Return true if s is less than or
#                                            equal to t
#  EQ_is_lt(s, t)     (s < t - mom_system_tolerance)     Return true if s is less than t
#  EQ_is_zero(s)      (abs(s) < mom_system_tolerance)    Return true if scalar is zero
################################################################################
proc  EQ_is_equal {s t} {
         global mom_system_tolerance

         if { abs([expr ($s - $t)]) <= $mom_system_tolerance } { return 1 } else { return 0 }
}
proc  EQ_is_ge {s t} {
         global mom_system_tolerance

         if { $s > [expr ($t - $mom_system_tolerance)] } { return 1 } else { return 0 }
}
proc  EQ_is_gt {s t} {
         global mom_system_tolerance

         if { $s > [expr ($t + $mom_system_tolerance)] } { return 1 } else { return 0 }
}
proc  EQ_is_le {s t} {
         global mom_system_tolerance

         if { $s < [expr ($t + $mom_system_tolerance)] } { return 1 } else { return 0 }
}
proc  EQ_is_lt {s t} {
         global mom_system_tolerance

         if { $s < [expr ($t - $mom_system_tolerance)] } { return 1 } else { return 0 }
}
proc  EQ_is_zero {s} {
         global mom_system_tolerance

         if { abs($s) <= $mom_system_tolerance } { return 1 } else { return 0 }
}


proc MOM_partno {} {
#_______________________________________________________________________________
# Numero ou Nom de programme.
#_______________________________________________________________________________
	global mom_partno_name_defined mom_partno_name
	global partno_flag mom_output_file_basename text
	global mom_logname mom_date

	if {$partno_flag == 1} {return}

        if {[info exists mom_partno_name_defined] == 0} {
	     set text $mom_output_file_basename
           }

        if {[info exists mom_partno_name_defined] == 1 && [info exists mom_partno_name] == 1 } {
         if {$mom_partno_name != ""} {
             set text $mom_partno_name
            } else {
             set text $mom_output_file_basename
            }
           } else { 
             set text $mom_output_file_basename
           }

	set text [string toupper $text]  ;# Nom Programme en Majuscule
        set text %_N_${text}_MPF         ;# Entete et Fin de Texte Specifique

	if {[string length $text] > 30} {set text [string range $text 0 22]}

	MOM_set_seq_off
#	MOM_output_literal "$text"
	MESSAGE " AUTEUR: $mom_logname le $mom_date "
#	MESSAGE ""
	MOM_set_seq_on
	set partno_flag 1

# ude_huron_kx20.cdl
# EVENT partno
# {
#    UI_LABEL "Nom Programme"
# 
#    PARAM partno_name
#    {
#       TYPE   s
#       TOGGLE On
#       UI_LABEL "Nom du Programme"
#    }
# }
# ude_huron_kx20.cdl

}


proc HEAD_init {} {
#_______________________________________________________________________________
# Gestion Tete Inclinee
#_______________________________________________________________________________
	global mom_tool_axis head_position
	global mom_cutcom_plane head_gohome_flag


	   if {[EQ_is_equal abs($mom_tool_axis(2)) 1.0]} {        ;# Broche ZM
	        set head_position "ZM"
	        KIN_choice ZM
#	        MOM_output_literal ";*** Broche Suivant Z ***"
	        RESTART

	   } elseif {[EQ_is_equal abs($mom_tool_axis(1)) 1.0] } { ;# Broche YM
		      ERROR "Orientation Outil Suivant Y Impossible" 3
#	              set head_position "YM"
#		      KIN_choice YM
#		      MOM_output_literal ";*** Broche Suivant Y ***"
#		      RESTART

	   } elseif {[EQ_is_equal abs($mom_tool_axis(0)) 1.0] } { ;# Broche XM
		      ERROR "Orientation Outil Suivant X Impossible" 3
#	              set head_position "XM"
#		      KIN_choice XM
#		      MOM_output_literal ";*** Broche Suivant X ***"
#		      RESTART

	   } else {
		      ERROR "Orientation Outil Impossible" 3
#	              set head_position "INCLINE"
#		      KIN_choice ZM_INC
	   }
}


proc KIN_choice {{type ZM}} {
#_______________________________________________________________________________
# Choix Cinematique Machine
#_______________________________________________________________________________
	global mom_cutcom_plane
        global mom_kin_arc_output_mode
        global mom_pos_arc_plane
        global mom_kin_arc_valid_plane
        global mom_sys_cutcom_code


  if {$type == "XM"} {
# Broche Suivant X
       set mom_kin_arc_output_mode      FULL_CIRCLE
       set mom_kin_arc_valid_plane      ANY
       set mom_cutcom_plane             YZ
       set mom_sys_cutcom_code(OFF)     40
       set mom_sys_cutcom_code(LEFT)    41
       set mom_sys_cutcom_code(RIGHT)   42
     }

  if {$type == "YM"} {
# Broche Suivant Y
       set mom_kin_arc_output_mode      FULL_CIRCLE
       set mom_kin_arc_valid_plane      ANY
       set mom_cutcom_plane             ZX
       set mom_sys_cutcom_code(OFF)     40
       set mom_sys_cutcom_code(LEFT)    41
       set mom_sys_cutcom_code(RIGHT)   42
     }

  if {$type == "ZM"} {
# Broche Suivant Z
       set mom_kin_arc_output_mode      FULL_CIRCLE
       set mom_kin_arc_valid_plane      ANY
       set mom_cutcom_plane             XY
       set mom_sys_cutcom_code(OFF)     40
       set mom_sys_cutcom_code(LEFT)    41
       set mom_sys_cutcom_code(RIGHT)   42
     }

  if {$type == "ZM_INC"} {
# Broche Inclinee
       set mom_kin_arc_output_mode      LINEAR
       set mom_pos_arc_plane            NONE
       set mom_kin_arc_valid_plane      XYZ
       set mom_sys_cutcom_code(LEFT)    ""
       set mom_sys_cutcom_code(RIGHT)   ""
     }

	MOM_reload_kinematics
}


proc HEAD_gohome {} {
#_______________________________________________________________________________
# Degagement Outil avant Changement Position Tete (sans changement d'Outil)
#_______________________________________________________________________________
	global head_position


	if {$head_position == "ZM"} {
		RETURN_move Z
		RETURN_move XY
	} elseif {$head_position == "YM"} {
		RETURN_move Y
		RETURN_move XZ
	} elseif {$head_position == "XM"} {
		RETURN_move X
		RETURN_move YZ
	}

}


proc CHECK_return_param {} {
#____________________________________________
# Gestion Parametres de Retour aux Origines .
#____________________________________________

        global setup_flag
        global mom_param_r0 mom_param_r1 mom_param_r2
        global prev_param_r0 prev_param_r1 prev_param_r2


       if {$setup_flag == 1 } {
        if {$prev_param_r0 != $mom_param_r0 || $prev_param_r1 != $mom_param_r1 || $prev_param_r2 != $mom_param_r2} {
            MOM_do_template return_param
            set setup_flag 0
           }
          }
}


proc EMULE_cycle {stops flt deep brkcp spinp manual} {
#_______________________________________________________________________________
# Cycles en decomposes pour Tete Inclinee .
#
# stops    : Pour Cycle Alesage avec Arret Broche avec ou sans Tempo
# flt      : Pour Cycle de Taraudage a Gauche et a Droite
# deep(0)  : Pour Cycle de Percage Simple avec ou sans Tempo
# deep(1)  : Pour Cycle de Percage avec Debourrage avec ou sans Tempo
# brkcp    : Pour Cycle de Percage avec Brise Copeaux avec ou sans Tempo
# spinp    : Pour Cycle Alesage avec Indexation de la Broche avec ou sans Tempo 
# manual   : Pour Cycle Alesage avec Retrait Manuel de l'Outil avec ou sans Tempo
#_______________________________________________________________________________


	global mom_pos prev_pos
	global mom_cycle_rapid_to_pos mom_cycle_feed_to_pos mom_cycle_rapid_to mom_cycle_feed_to
	global mom_cycle_retract_to_pos mom_cycle_retract_to
	global mom_feed_rate mom_cycle_feed_rate
	global mom_cycle_delay mom_delay_value
        global mom_sys_spindle_direction_code
        global mom_spindle_direction
        global mom_cycle_step1
        global mom_tool_axis mom_prev_tool_axis
        global mom_cycle_clearance_plane

	set mom_feed_rate $mom_cycle_feed_rate
	set mom_delay_value $mom_cycle_delay
 
	set mom_pos(0) $mom_cycle_rapid_to_pos(0)
	set mom_pos(1) $mom_cycle_rapid_to_pos(1)
	set mom_pos(2) $mom_cycle_rapid_to_pos(2)

	MOM_rapid_move

#       MOM_do_template spindle_start

	set mom_pos(0) $mom_cycle_feed_to_pos(0)
	set mom_pos(1) $mom_cycle_feed_to_pos(1)
	set mom_pos(2) $mom_cycle_feed_to_pos(2)

      if {$deep == 0 && $brkcp == 0} {
	   MOM_linear_move
       if {$mom_cycle_delay > 0} {MOM_do_template delay}
	if {$stops == 1} {
             MOM_do_template spindle_off
             MOM_suppress always spindle_m
           }
	if {$spinp == 1} {
#            MOM_do_template spindle_off
             MOM_suppress always spindle_m
             MOM_do_template spindle_orient
           }
	if {$manual == 1} {
#            MOM_do_template spindle_off
             MOM_suppress always spindle_m
             MOM_do_template stop
           }
        if {$flt == 1 && $mom_spindle_direction == "CLW"} {
             MOM_do_template spindle_off
             set mom_sys_spindle_direction_code(CLW) 4
             RESET_adr S
             MOM_do_template spindle_start
#            set mom_sys_spindle_direction_code(CLW) 3
           }
        if {$flt == 1 && $mom_spindle_direction == "CCLW"} {
             MOM_do_template spindle_off
             set mom_sys_spindle_direction_code(CCLW) 3
             RESET_adr S
             MOM_do_template spindle_start
#            set mom_sys_spindle_direction_code(CCLW) 4
           }
         }


	set mom_pos(0) $mom_cycle_rapid_to_pos(0)
	set mom_pos(1) $mom_cycle_rapid_to_pos(1)
	set mom_pos(2) $mom_cycle_rapid_to_pos(2)

        if {$deep == 1 || $brkcp == 1} {
             set prof_trou [expr sqrt(pow($mom_cycle_feed_to_pos(0) - $mom_pos(0),2) + pow($mom_cycle_feed_to_pos(1) - $mom_pos(1),2) + pow($mom_cycle_feed_to_pos(2) - $mom_pos(2),2))]

        if {[EQ_is_equal $prof_trou 0.0]} {
             ERROR "La Profondeur du Trou a Percer est Nulle" 3
           }

         if {[EQ_is_gt $mom_cycle_step1 0.0]} {
              set nombre_passe [expr ($prof_trou / $mom_cycle_step1)]
              set integer      [expr int($prof_trou / $mom_cycle_step1)]
            } else {
              set nombre_passe 1
              set integer 1
            }

         if {[EQ_is_gt $integer 1.0]} {
              set nombre_passe [expr round($nombre_passe)]  ;# Arrondissement Superieur pour Nombre de Passes
            } else {
              set nombre_passe [expr ceil($nombre_passe)]   ;# Arrondissement Inferieur pour Nombre de Passes
            }

	     set axe_trou(0) [expr ($mom_cycle_rapid_to_pos(0) - $mom_cycle_feed_to_pos(0)) / ($prof_trou)]  ;# Vecteur Outil suivant X
	     set axe_trou(1) [expr ($mom_cycle_rapid_to_pos(1) - $mom_cycle_feed_to_pos(1)) / ($prof_trou)]  ;# Vecteur Outil suivant Y
	     set axe_trou(2) [expr ($mom_cycle_rapid_to_pos(2) - $mom_cycle_feed_to_pos(2)) / ($prof_trou)]  ;# Vecteur Outil suivant Z

             set prof_passe(0) [expr ($prof_trou / $nombre_passe) * ($axe_trou(0))] ;# Calcul Nouvelle Profondeur de Passe sur X
             set prof_passe(1) [expr ($prof_trou / $nombre_passe) * ($axe_trou(1))] ;# Calcul Nouvelle Profondeur de Passe sur Y
             set prof_passe(2) [expr ($prof_trou / $nombre_passe) * ($axe_trou(2))] ;# Calcul Nouvelle Profondeur de Passe sur Z

           if {$deep == 1 || $brkcp == 1} {
                set clearance(0) [expr ($mom_cycle_clearance_plane * $axe_trou(0))] ;# Garde de Retrait pour Profondeur de Passe sur X
                set clearance(1) [expr ($mom_cycle_clearance_plane * $axe_trou(1))] ;# Garde de Retrait pour Profondeur de Passe sur Y
                set clearance(2) [expr ($mom_cycle_clearance_plane * $axe_trou(2))] ;# Garde de Retrait pour Profondeur de Passe sur Z
              }

           for {set i 1} {$i<=$nombre_passe} {incr i 1} {
                set mom_pos(0) [expr ($mom_cycle_rapid_to_pos(0) - ($prof_passe(0)*($i)))] 
                set mom_pos(1) [expr ($mom_cycle_rapid_to_pos(1) - ($prof_passe(1)*($i)))] 
                set mom_pos(2) [expr ($mom_cycle_rapid_to_pos(2) - ($prof_passe(2)*($i)))]

                MOM_linear_move                              ;# Prise de Passe

           if {$mom_cycle_delay > 0} {MOM_do_template delay}

            if {$deep == 1} {                                ;# Percage avec Debourrage
             if {$i != $nombre_passe} {
                 set mom_pos(0) $mom_cycle_rapid_to_pos(0)
                 set mom_pos(1) $mom_cycle_rapid_to_pos(1)
                 set mom_pos(2) $mom_cycle_rapid_to_pos(2)
                 MOM_rapid_move                              ;# Degagement Outil
                 set mom_pos(0) [expr (($mom_cycle_rapid_to_pos(0) + $clearance(0)) - ($prof_passe(0)*($i)))] 
                 set mom_pos(1) [expr (($mom_cycle_rapid_to_pos(1) + $clearance(1)) - ($prof_passe(1)*($i)))] 
                 set mom_pos(2) [expr (($mom_cycle_rapid_to_pos(2) + $clearance(2)) - ($prof_passe(2)*($i)))]
                 MOM_rapid_move                              ;# Engagement Outil
                } ;# if
               } ;# if

            if {$brkcp == 1} {                               ;# Percage avec Brise Copeaux
             if {$i == 1} {
                  set mom_pos(0) [expr ($mom_pos(0) + ($prof_passe(0)))] ;# Degagement Prof de Passe + Garde sur X pour Brise Copeaux (1ere Passe)
                  set mom_pos(1) [expr ($mom_pos(1) + ($prof_passe(1)))] ;# Degagement Prof de Passe + Garde sur Y pour Brise Copeaux (1ere Passe)
                  set mom_pos(2) [expr ($mom_pos(2) + ($prof_passe(2)))] ;# Degagement Prof de Passe + Garde sur Z pour Brise Copeaux (1ere Passe)
                  MOM_rapid_move
                } elseif {$i != $nombre_passe} {
                  set mom_pos(0) [expr ($mom_pos(0) + ($prof_passe(0) + $clearance(0)))] ;# Degagement Prof de Passe + Garde sur X pour Brise Copeaux
                  set mom_pos(1) [expr ($mom_pos(1) + ($prof_passe(1) + $clearance(1)))] ;# Degagement Prof de Passe + Garde sur Y pour Brise Copeaux
                  set mom_pos(2) [expr ($mom_pos(2) + ($prof_passe(2) + $clearance(2)))] ;# Degagement Prof de Passe + Garde sur Z pour Brise Copeaux
                  MOM_rapid_move
                } ;# if
               } ;# if
              } ;# for
           } ;# if
      

        if {$manual == 0} {                                   ;# Degagement Outil (sauf pour Alesage avec Retrait Manuel)
	     set mom_pos(0) $mom_cycle_retract_to_pos(0)
	     set mom_pos(1) $mom_cycle_retract_to_pos(1)
	     set mom_pos(2) $mom_cycle_retract_to_pos(2)
	     MOM_rapid_move
           }

        if {$flt == 1 && $mom_spindle_direction == "CLW"} {   ;# Taraudage a Droite
             MOM_do_template spindle_off
             set mom_sys_spindle_direction_code(CLW) 3
             RESET_adr S M
             MOM_do_template spindle_start
           }

        if {$flt == 1 && $mom_spindle_direction == "CCLW"} {  ;# Taraudage a Gauche
             MOM_do_template spindle_off
             set mom_sys_spindle_direction_code(CCLW) 4
             RESET_adr S M
             MOM_do_template spindle_start
           }

        if {$stops == 1} {                                    ;# Alesage avec Arret Broche
	     MOM_suppress off spindle_m
             RESET_adr S M
             MOM_do_template spindle_start
           }

        if {$spinp == 1} {                                    ;# Alesage Indexe
	     MOM_suppress off spindle_m
             RESET_adr S M
             MOM_do_template spindle_start
           }

        if {$manual == 1} {                                   ;# Alesage avec Retrait Manuel
	     MOM_suppress off spindle_m
             RESET_adr S M
             MOM_do_template spindle_start
           }
}
