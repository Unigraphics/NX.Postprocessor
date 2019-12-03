#set mom_lock_axis 			"YAXIS"
#set mom_lock_axis_plane			"XYPLAN"
#set mom_sys_lock_status 		"ON"
#Additional M-functions
#set mom_sys_C_spindle_code(OFF) "05"
set mom_sys_C_axis_connecting_code 		"110"
set mom_sys_C_axis_disconnecting_code 		"109"
set mom_kin_C_axis_direction_code(CLW) 		"15"
set mom_kin_C_axis_direction_code(CCLW) 	"16"
set mom_sys_C_axis_no_clamp_code 		"141"
set mom_sys_C_axis_unclamp_code 	"146"
set mom_sys_C_axis_clamp_code 		"147"
set mom_sys_Y_axis_clamp_code 		"176"
set mom_sys_Y_axis_unclamp_code 	"177"
set mom_sys_tool_compensation_recalc	"52"


#Additional G-functions
  set mom_sys_cutcom_plane_code(XY)             "17" 
  set mom_sys_cutcom_plane_code(ZX)             "18" 
  set mom_sys_cutcom_plane_code(YZ)             "19"
   set mom_sys_arc_plane_code(XY)             "17" 
   set mom_sys_arc_plane_code(ZX)             "18" 
   set mom_sys_arc_plane_code(YZ)             "19" 

  set mom_sys_y2c_linear_code                       "101"  
  set mom_sys_y2c_circle_code(CLW)                  "102"  
  set mom_sys_y2c_circle_code(CCLW)                 "103"  
set mom_sys_Y_axis_disconnecting_code 		"136"
set mom_sys_Y2C_transformation_code	 	"137"
set mom_sys_Y_axis_connecting_code 		"138"
set mom_kin_slant_zero_code(ON)			"174"
set mom_kin_slant_zero_code(OFF)		"175"
set mom_kin_slant_angle_code(ON)		"127"
set mom_kin_slant_angle_code(OFF)		"126"

set mom_sys_postname(MILL)      "Macturn30"
set mom_sys_postname(TURN)      "Macturn30_lathe"

set mom_kin_C_axis_direction "CLW"
set thread_cycle "FALSE"

set mom_turret_index_mode "HORIZONTAL"
set mode(HORIZONTAL) "01"
set mode(VERTICAL)  "02"
set mom_sys_pot_number(TURN) 	"01"
set mom_sys_pot_number(MILL) 	"03"
set mom_sys_pot_number(01-FIXED) $mom_sys_pot_number(TURN)
set mom_sys_pot_number(03-SPINDLE) $mom_sys_pot_number(MILL)
set mom_pot_num "DEFAULT"
set MT_code_previous "0"
set mom_sys_helix_pitch_type	"rise_revolution"

set mom_spindle_maximum_rpm_turn	 "4500"
set mom_sys_spindle_max_rpm_code_turn 	 "50"
set mom_sys_coolant_code_off(TAP)	 "174"
set mom_sys_coolant_code_off(MIST)	 "154"
set mom_sys_coolant_code_off(ON)	 "9"
set mom_sys_coolant_code_off(FLOOD)	 $mom_sys_coolant_code_off(ON)
set mom_y2c_transformation		 "FALSE"
set y2c(FALSE) "0"
set y2c(TRUE) "100"
set mom_sys_spindle_range_code(1)	"41"
set mom_sys_spindle_range_code(2)	"42"
set mom_arc_output(CENTER) "0" 
set mom_arc_output(RADIUS) [expr $mom_arc_output(CENTER) - 1]; if {$mom_arc_output(RADIUS) == -1} {set mom_arc_output(RADIUS) 1}
set cir_axis(XY) 		"2"
set cir_axis(YZ) 		"0"
set cir_axis(ZX) 		"1"

##=============================================================
#=============================================================
proc MOM_before_motion { } {
#=============================================================
  global mom_motion_event mom_motion_type
  global TL_code

    FEEDRATE_SET
    
    switch $mom_motion_type {
      ENGAGE   {PB_engage_move}
      APPROACH {PB_approach_move}
      FIRSTCUT {PB_first_cut}
      RETURN   {PB_return_move}
    }

    if [llength [info commands PB_CMD_kin_before_motion] ] { PB_CMD_kin_before_motion }
    if [llength [info commands PB_CMD_before_motion] ]     { PB_CMD_before_motion }
}
#=============================================================
proc PB_CMD_before_motion { } {
#=============================================================
global TL_code mom_tool_number 
global mom_tool_cutcom_register 	mom_tool_adjust_register 	mom_cutcom_adjust_register
global mom_length_correct 		mom_cutcom_correct
global mom_slant_angle 			mom_out_angle_pos 		mom_pos mom_prev_pos
global none_Z


set tool_cutcom 0
set tool_adjust 0

set tool_cutcom $mom_tool_cutcom_register
#if {[info exists mom_cutcom_adjust_register]} {set tool_cutcom $mom_cutcom_adjust_register}
if {[info exists mom_tool_adjust_register]} {set tool_adjust $mom_tool_adjust_register}
if {[EQ_is_zero $tool_cutcom]} {set tool_cutcom $tool_adjust}

catch {set tool_cutcom $mom_cutcom_correct}
catch {set tool_adjust $mom_length_correct}

set t1 ""
 if {![EQ_is_zero $tool_cutcom]} { set t1 [format "%02g" $tool_cutcom] }
             
set t2 [format "%02g" $mom_tool_number]
set t3 [format "%02g" $tool_adjust]
set TL_code $t1$t2$t3

if {[info exists mom_slant_angle]} {
	MOM_suppress once fourth_axis fifth_axis M
	}
if { [EQ_is_equal $mom_pos(2) $mom_prev_pos(2)] } {set none_Z "FALSE"} else {set none_Z "TRUE"}
   global mom_y2c_transformation
   if {$mom_y2c_transformation} { 
   MOM_suppress once fourth_axis G_compensation G_mode} else {set none_Z "FALSE"}

#global clamp_rotary_fifth_status
#if {[info exists clamp_rotary_fifth_status] && $clamp_rotary_fifth_status == "CLAMPED"} {MOM_suppress once fifth_axis M}
 
}


#=============================================================
proc PB_CMD_tool_code { } {
#=============================================================
global MT_code		MT_code_previous	 mom_tool_number 	mom_pot_num
global mom_sys_pot_number
global mom_machine_mode

set mom_sys_pot_number(DEFAULT) $mom_sys_pot_number($mom_machine_mode)

set tool $mom_tool_number
set pot $mom_sys_pot_number($mom_pot_num)
set mom_pot_num "DEFAULT"

set tool [format "%02g" $tool]
set MT_code $tool$pot
if {$MT_code_previous != $MT_code} {MOM_force once M}
set MT_code_previous $MT_code

}

#=============================================================
proc PB_CMD_tool_code_next { } {
#=============================================================
global MT_code_next	mom_next_tool_number 	mom_pot_preselect_number
global mom_sys_pot_number
global mom_machine_mode

set mom_sys_pot_number(DEFAULT) $mom_sys_pot_number($mom_machine_mode)

set tool $mom_next_tool_number
set pot $mom_sys_pot_number($mom_pot_preselect_number)
set mom_pot_preselect_number "DEFAULT"

set tool [format "%02g" $tool]
set MT_code_next $tool$pot

}

#=============================================================
proc PB_CMD_kin_end_of_path { } {
#=============================================================
  # Record tool time for this operation.
   if [llength [info commands PB_CMD_set_oper_tool_time] ] {
      PB_CMD_set_oper_tool_time
   }
   global mom_cutcom_correct mom_length_correct
   catch {unset mom_cutcom_correct}
   catch {unset mom_length_correct}

      
   MOM_do_template end_of_path

   MOM_coolant_off
   MOM_force once G_motion
   MOM_do_template return_home
   global mom_coolant_code_off
   catch {unset mom_coolant_code_off}
   catch {unset mom_pot_preselect_number}
}

#=============================================================
proc MOM_coolant_on { } {
#=============================================================
 global mom_coolant_status mom_sys_coolant_code_off mom_coolant_code_off
   COOLANT_SET
   MOM_do_template coolant_on
   set mom_coolant_code_off($mom_coolant_status) $mom_sys_coolant_code_off($mom_coolant_status)
}

#=============================================================
proc MOM_coolant_off { } {
#=============================================================
   COOLANT_SET
   MOM_do_template coolant_off
#   MOM_do_template coolant_tap_off
#   MOM_do_template coolant_mist_off
}

#=============================================================
proc MOM_helix_move { } {
#============================================================
  global mom_pos_arc_plane
  global mom_sys_cir_vector
  global mom_sys_helix_pitch_type
  global mom_helix_pitch
  global mom_pos mom_prev_pos mom_pos_arc_center
  global PI
  
  global mom_arc_center cir_axis
  PB_ROTARY_SIGN_SET

  set cir_index $cir_axis($mom_pos_arc_plane)
  switch $mom_sys_helix_pitch_type {
    none { }
    rise_revolution { set pitch $mom_helix_pitch }
    rise_radian { set pitch [expr $mom_helix_pitch / ($PI * 2.0)]}
    other {
#	Place your custom helix pitch code here
      }
      default { set mom_sys_helix_pitch_type "none" }
   }
          
  MOM_do_template circle_plane
  if {$mom_sys_helix_pitch_type != "none"} {
  	VMOV 3 mom_prev_pos start_arc
  	VMOV 3 mom_pos save_pos
  	set length [expr $mom_pos($cir_index) - $mom_prev_pos($cir_index)]
  	if {$length < 0} {set pitch [expr - $pitch]}
  	set n [expr int($length / $pitch * 2)];# количество полных полуоборотов спирали
	for {set i 1 } {$i <= abs($n)} {incr i } {
	   VEC3_sub  mom_arc_center start_arc end_arc
	   set end_arc($cir_index) [expr $start_arc($cir_index) + $pitch / 2]
	   # вывод полувитка
	   VMOV 3 end_arc mom_pos
	   MOM_force once X Y Z
	   MOM_do_template circular_move_arc
	   VMOV 3 end_arc start_arc; # новое начало витка
	}
	VMOV 3  save_pos mom_pos
	if {![EQ_is_equal $start_arc($cir_index) $mom_pos($cir_index)]} {
           MOM_force once X Y Z
           MOM_do_template circular_move_arc
        }
  }

} ;# MOM_helix_move


#=============================================================================
proc PB_CMD_init_oper_tool_time {} {
#=============================================================================
#  This command will be executed automatically in the "Start of Path" marker
#  to reset the machining time for the operation.
#
#
   global mom_machine_time
   global mom_sys_prev_machine_time

   set mom_sys_prev_machine_time $mom_machine_time
}


#=============================================================================
proc PB_CMD_set_oper_tool_time {} {
#=============================================================================
#  This command will be executed automatically in the "End of Path" marker
#  to set the machining time accumulated on the tool used in the operation.
#
#
   global mom_machine_time
   global mom_tool_name mom_operation_name mom_sys_tool_time
   global mom_sys_prev_machine_time

   if { ![info exists mom_sys_prev_machine_time] } {
      set mom_sys_prev_machine_time 0
   }

   set curr_machine_time [expr $mom_machine_time - $mom_sys_prev_machine_time]
   set mom_sys_prev_machine_time $mom_machine_time

   set mom_sys_tool_time($mom_tool_name,$mom_operation_name) $curr_machine_time
   lappend mom_sys_tool_time($mom_tool_name,oper_list) $mom_operation_name
#-----
   MOM_output_literal "(Operation Machine Time $curr_machine_time)"   
   
}

#=============================================================
proc MOM_circular_template { } {
#=============================================================
   global mom_y2c_transformation mom_pos mom_prev_pos mom_arc_center mom_arc_angle
   global mom_arc_output
   
   if {$mom_arc_output(RADIUS) || $mom_y2c_transformation} {
      #MOM_suppress once fifth_axis
      if {$mom_arc_angle > 180 } {;#

   	    VMOV 3 mom_pos save_pos
   	    VEC3_sub  mom_arc_center mom_pos intermediate_pos
   	    VMOV 3 intermediate_pos mom_pos
   	    MOM_do_template circular_move_arc
   	    
   	    CIRCLE_SET
   	    VMOV 3  save_pos mom_pos
      } 
      MOM_do_template circular_move_arc
   } else { 
   MOM_do_template circular_move}	
}

#=============================================================
proc CIRCLE_SET { } {
#=============================================================
  global mom_pos_arc_plane mom_arc_output
  #global mom_helix_pitch cir_axis mom_pos mom_prev_pos
  #set mom_helix_pitch [expr abs($mom_pos($cir_axis($mom_pos_arc_plane)) - $mom_prev_pos($cir_axis($mom_pos_arc_plane)))]
  #if {![EQ_is_zero $mom_helix_pitch]} { MOM_helix_move } else {
  #  set mom_helix_pitch 0
    switch $mom_pos_arc_plane {
      XY { MOM_suppress once Z ; MOM_force once X Y;
         if {$mom_arc_output(CENTER)} {MOM_suppress once K ; MOM_force once I J} }
      YZ { MOM_suppress once X ; MOM_force once Z Y;
         if {$mom_arc_output(CENTER)} {MOM_suppress once I ; MOM_force once K J} }
      ZX { MOM_suppress once Y ; MOM_force once Z X;
         if {$mom_arc_output(CENTER)} {MOM_suppress once J ; MOM_force once K I} }
    }
  #}  
} 

#------UDE-----------
#=============================================================
proc MOM_turret_index { } {
#=============================================================
global mom_turret_index_mode mom_pot_num
#global mom_turret_angle 
}

#=============================================================
proc MOM_correct_tool_compensation { } {
#=============================================================
global mom_length_correct
global mom_cutcom_correct
}

#=============================================================
proc MOM_slant_mode { } {
#=============================================================
global mom_slant_angle
}

#=============================================================
proc MOM_y2c_transformation { } {
#=============================================================
global mom_y2c_transformation
set mom_y2c_transformation "TRUE"
}

#=============================================================
proc MOM_tool_preselect { } {
#=============================================================
#global mom_tool_preselect_number 
global mom_pot_preselect_number
}