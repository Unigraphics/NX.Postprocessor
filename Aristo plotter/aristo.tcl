##############################################################################
#
# Programado by:  Javi Garcia    18-08-2003
# Machine: ARISTO        NC: ARISTO
#
# Revisions
# 18-Ago-2003 # Javi Garcia # Initial
# 15-Mar-2005 # Javi Garcia # Updated to NX3
#
##############################################################################

#source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl; MOM_set_debug_mode ON


set mom_kin_machine_resolution             .001


#   G codes

set mom_sys_rapid_code                     0
set mom_sys_linear_code                    1
set mom_sys_circle_code_CLW                2
set mom_sys_circle_code_CCLW               3

set mom_sys_pen_up_code                    0
set mom_sys_pen_down_code                  1



proc  MOM_start_of_program {} {
   MOM_output_literal "%"
   MOM_output_literal "D23I1"
   MOM_output_literal "G90,G0"
}

proc  MOM_end_of_program {} {

   global mom_output_file_full_name
   global mom_output_file_directory
   global mom_group_name

   MOM_do_template P_up
   MOM_output_literal "M2"

# Cierra el fichero y lo renombra

   set nombre [string range $mom_group_name 1 8]
   set nombre [format "%04d" $nombre]
   set extension ".nc"

   MOM_close_output_file $mom_output_file_full_name
   set new_file $mom_output_file_directory$nombre$extension
   file rename -force $mom_output_file_full_name  $new_file
}


proc  MOM_initial_move {} {
   MOM_do_template P_up
   MOM_do_template Linear
}

proc  MOM_first_move {} {
   global mom_pos mom_prev_pos

   if {$mom_prev_pos(0) != $mom_pos(0)} {
      MOM_do_template P_up
      MOM_do_template Linear
   } else {
      if  {$mom_prev_pos(1) != $mom_pos(1)} {
         MOM_do_template P_up
         MOM_do_template Linear
      }
   }
}

proc MOM_rapid_move {} {
   global mom_pos mom_prev_pos

   if {$mom_prev_pos(0) != $mom_pos(0)} {
      MOM_do_template P_up
      MOM_do_template Linear
   } else {
      if  {$mom_prev_pos(1) != $mom_pos(1)} {
         MOM_do_template P_up
         MOM_do_template Linear
      }
   }
}

proc MOM_linear_move {} {
   global mom_pos mom_prev_pos

   if {$mom_prev_pos(0) != $mom_pos(0)} {
      MOM_do_template P_down
      MOM_do_template Linear
   } else {
      if  {$mom_prev_pos(1) != $mom_pos(1)} {
         MOM_do_template P_down
         MOM_do_template Linear
      }
   }
}

proc MOM_circular_move {} {

   global mom_arc_direction
   global mom_arc_angle
   global mom_arc_radius

   MOM_do_template P_down

   if {$mom_arc_angle*$mom_arc_radius*3.14/180. < 0.01 } {
      MOM_do_template Linear
   } else {
      if { $mom_arc_direction == "CLW" } { MOM_do_template Circle_CLW}
      if { $mom_arc_direction == "CCLW" } { MOM_do_template Circle_CCLW}
   }
}


proc MOM_first_tool {} { }
proc MOM_tool_change {} { }
proc MOM_spindle_rpm {} { }
proc MOM_start_of_group {} { }
proc MOM_end_of_group {} { }
proc MOM_start_of_path {} { }
proc MOM_end_of_path {} { }
proc MOM_machine_mode {} { }
proc MOM_msys {} { }
proc MOM_set_csys {} { }
proc MOM_before_motion {} { }



proc MOM_catch_warning { } {

  global mom_warning_info

  MOM_output_to_listing_device " * ERROR *"
  MOM_output_to_listing_device "$mom_warning_info"
}

