##############################################################################

# Created by:  Javi Garcia           11-Mar-2002
# Machine: HWACHEON HI-ECO15A        NC: FANUC 0T
#
# Revision history
# 21-Mar-2002 # Javi Garcia # Initial version
#
###############################################################################

# DEBUGGER

#  source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_debug.tcl
#  source [MOM_ask_env_var UGII_CAM_DEBUG_DIR]mom_review.tcl ; MOM_set_debug_mode ON 

set toolsaved                          0

source [MOM_ask_env_var local_ugpost]\\hwacheon_lathe.tcl

proc MOM_machine_mode {} {

  global mom_machine_mode
  global mom_prev_machine_mode
  global mom_load_event_handler 

  if {$mom_machine_mode == "MILL"} {

    RESET_MILL_VARS

    set mom_load_event_handler   [MOM_ask_env_var local_ugpost]\\hwacheon_mill.tcl
    MOM_load_definition_file     [MOM_ask_env_var local_ugpost]\\hwacheon_mill.def

    MOM_suppress off Y

  } elseif {$mom_machine_mode == "TURN"} {
 
    if {$mom_prev_machine_mode == "MILL"} {
      MOM_suppress always Y
      MOM_output_literal "M05"
      MOM_output_literal "M29"
    }

    set mom_load_event_handler   [MOM_ask_env_var local_ugpost]\\hwacheon_lathe.tcl
    set turn_post                [MOM_ask_env_var local_ugpost]\\hwacheon_lathe.tcl
    MOM_load_definition_file     [MOM_ask_env_var local_ugpost]\\hwacheon_lathe.def

  } else {
    MOM_output_to_listing_device "ERROR: Operacion $mom_machine_mode"
  }
}

proc RESET_MILL_VARS {} {

  global mom_prev_pos
  global mom_pos
  global mom_alt_pos
  global mom_prev_alt_pos
  global mom_out_angle_pos

  set mom_pos(3) 0.0
  set mom_pos(4) 0.0
  set mom_prev_pos(3) 0.0
  set mom_prev_pos(4) 0.0
  set mom_alt_pos(3) 0.0
  set mom_alt_pos(4) 0.0
  set mom_prev_alt_pos(3) 0.0
  set mom_prev_alt_pos(4) 0.0
  set mom_out_angle_pos(0) 0.0
  set mom_out_angle_pos(0) 0.0

  MOM_reload_variable -a mom_out_angle_pos
  MOM_reload_variable -a mom_pos
  MOM_reload_variable -a mom_prev_pos
  MOM_reload_variable -a mom_alt_pos
  MOM_reload_variable -a mom_prev_alt_pos

}
