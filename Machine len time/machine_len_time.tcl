proc MOM_before_each_add_var {} {}
proc MOM_before_each_event {} {}
MOM_set_debug_mode OFF
set mom_kin_rapid_feed_rate 5000.0

proc MOM_start_of_program {} {
  global accumulated_time
  global oper_rapid_length
  global oper_cut_length
  global oper_rapid_time
  global oper_cut_time
  global total_rapid_length
  global total_cut_length
  global total_rapid_time
  global total_cut_time

  set oper_rapid_length 0.0
  set oper_cut_length 0.0
  set oper_rapid_time 0.0
  set oper_cut_time 0.0
  set accumulated_time 0
  set total_rapid_length 0.0
  set total_cut_length 0.0
  set total_rapid_time 0.0
  set total_cut_time 0.0
  set accumulated_time 0
  MOM_set_seq_off
MOM_output_literal "Operation                          G00 Len    G01 Len   G00 Time   G01 Time     Operation Time"
MOM_output_literal "----------------------------------------------------------------------------------------------"
MOM_output_literal " "


}



proc MOM_before_motion {} {

global mom_pos
global mom_machine_time
global mom_feed_rate
global mom_motion_distance
global mom_event_time
global mom_kin_rapid_feed_rate
global oper_rapid_length
global oper_cut_length
global oper_rapid_time
global oper_cut_time

#MOM_output_literal "mom_pos=$mom_pos(0),$mom_pos(0),$mom_pos(0)"
#MOM_output_literal "mom_feed_rate= $mom_feed_rate"
#MOM_output_literal "mom_motion_distance= $mom_motion_distance"
#MOM_output_literal "mom_event_time=$mom_event_time"

if {$mom_feed_rate == $mom_kin_rapid_feed_rate || $mom_feed_rate <= 0.0} {
  set oper_rapid_length [expr $oper_rapid_length + $mom_motion_distance]
  set oper_rapid_time [expr $oper_rapid_time + $mom_motion_distance/$mom_kin_rapid_feed_rate]
} else {
  set oper_cut_length [expr $oper_cut_length + $mom_motion_distance]
  set oper_cut_time [expr $oper_cut_time + $mom_motion_distance/$mom_feed_rate]

}

}





#____________________ SPECIFICATIONS _________________________________
#
#
# proc MOM_end_of_path {} CALLED AT THE END OF EACH PATH.
#_____________________________________________________________________

proc MOM_end_of_path {} {

global mom_machine_time
global accumulated_time
global mom_operation_name
global oper_rapid_length
global oper_cut_length
global oper_rapid_time
global oper_cut_time
  global total_rapid_length
  global total_cut_length
  global total_rapid_time
  global total_cut_time

set op_time [expr $oper_cut_time + $oper_rapid_time]

MOM_output_literal "[format "%-30s  %10.3f %10.3f %10.2f %10.2f %10.2f" $mom_operation_name $oper_rapid_length $oper_cut_length $oper_rapid_time $oper_cut_time $op_time]"

set accumulated_time $mom_machine_time
set total_cut_length [expr $total_cut_length + $oper_cut_length]
set total_rapid_length [expr $total_rapid_length + $oper_rapid_length]
set total_cut_time [expr $total_cut_time + $oper_cut_time]
set total_rapid_time [expr $total_rapid_time + $oper_rapid_time]

set oper_rapid_length 0.0
set oper_cut_length 0.0
set oper_rapid_time 0.0
set oper_cut_time 0.0

}

#_____________________________________________________________________
#
# proc MOM_end_of_program {} CALLED AT THE END OF EACH PROGRAM.
#_____________________________________________________________________

proc MOM_end_of_program {} {
  global total_rapid_length
  global total_cut_length
  global total_rapid_time
  global total_cut_time

set tot_time [expr $total_cut_time + $total_rapid_time]

global mom_machine_time
MOM_output_literal "---------------------------------------------------------------------------------------------"
MOM_output_literal "[format "%-30s  %10.3f %10.3f %10.2f %10.2f %10.2f" " " $total_rapid_length $total_cut_length $total_rapid_time $total_cut_time $tot_time]"
MOM_output_literal "---------------------------------------------------------------------------------------------"

}
#=============================================================================

proc MOM_catch_warning {} {
}
