######################## Virtual NC Controller #########################
#
#  Created by kleber.ronconi  @  Thu Mar 11 12:46:37 2004 E. South America Daylight Time
#  with Post Builder version  3.1.0.
#
########################################################################


##############################################################################
# Description
#   This file contains base event handlers for IS&V Virtual NC Controller.
#
#
# Revisions
# ---------
# Date     Who     Reason
# 08May03  genLin  Inception
# 03Oct02  gsl     Identify other codes after G_motion code to allow
#                  redefining the motion type. (VNC_sim_nc_block)
#
#                  Parse NC code even when the address leader is a blank.
#
###############################################################################


if { ![info exists sim_mtd_initialized] } {
   set sim_mtd_initialized 0
}

#++++++++++++++++++++++++++++++++++++
# Define the base elements only once!
#++++++++++++++++++++++++++++++++++++
if { $sim_mtd_initialized == 0 } {


#
# Simulation include files
#
source "[MOM_ask_env_var UGII_CAM_POST_DIR]sim_high_level_sv_commands.tcl"


#
# Define some global parameters
#
set sim_prev_tool_name "undefined"
set sim_prev_zcs "undefined"
set sim_feedrate_mode  "RAPID"

  

if [llength [info commands "MOM_before_output_save"]] {
   rename MOM_before_output_save ""
}

if [llength [info commands "MOM_before_output"]] {
   rename MOM_before_output MOM_before_output_save
} else {
   proc MOM_before_output_save {} {}
}


#=============================================================
proc MOM_before_output {} {
#=============================================================
  global mom_sim_csys_set
  global mom_sim_buffer
  global mom_sim_message


  # Execute original code
   MOM_before_output_save


   global mom_o_buffer
   global mom_sim_o_buffer

  #<07-25-03 gsl> Simulate a block after it's outputted.
   global mom_sim_prev_o_buffer

   if [info exists mom_sim_prev_o_buffer] {
      set mom_sim_o_buffer $mom_sim_prev_o_buffer
   } else {
      set mom_sim_o_buffer ""
   }


  #<gsl> mom_o_buffer will not exist in the standalone simulation.
   set mom_sim_prev_o_buffer $mom_o_buffer


  # Buffer outputs for simulation, when MSYS is not yet set.
   lappend mom_sim_buffer $mom_sim_o_buffer

   if $mom_sim_csys_set {

      if { ![info exists mom_sim_buffer] } {

         set mom_sim_message "> $mom_sim_o_buffer"
         PB_CMD_vnc__send_message
         VNC_sim_nc_block $mom_sim_o_buffer

      } else {

         foreach mom_sim_o_buffer $mom_sim_buffer {
           set mom_sim_message "> $mom_sim_o_buffer"
           PB_CMD_vnc__send_message
           VNC_sim_nc_block $mom_sim_o_buffer
         }
         unset mom_sim_buffer
      }

   } else {
PB_sim_debug_msg "  buffered block:$mom_sim_o_buffer"
   }
}


#=============================================================
proc PB_sim_debug_msg { args } {
#=============================================================
return
  global mom_sim_isv_debug

   if { ![info exists mom_sim_isv_debug] } {
      set mom_sim_isv_debug [open "D:\\IS_V\\isv_debug.log" w]
   }

   set proc_name [lindex [info level -1] 0]

  #<06-26-03 gsl>
  if 0 {
   set proc_name ""
   set level [info level]
   for {set i 1} {$i < $level} {incr i} {
      set proc_name "$proc_name\[ [lindex [info level $i] 0] \]"
   }
  }

   if [llength $args] {
      puts $mom_sim_isv_debug "\[$proc_name\] >[join $args]<"
   } else {
      puts $mom_sim_isv_debug "\[$proc_name\]"
   }

   flush $mom_sim_isv_debug
}


#=============================================================
proc VNC_sim_nc_block { block_buffer } {
#=============================================================
  global mom_sim_control_out mom_sim_control_in
  global mom_sim_word_separator mom_sim_word_separator_len
  global mom_sim_end_of_block mom_sim_end_of_block_len
  global mom_sim_address
  global mom_sim_pos mom_sim_prev_pos
  global mom_sim_nc_register
  global mom_sim_tool_junction
  global mom_sim_message


   if { ![info exists block_buffer] } {
return
   }


  # Strip off leading & trailing blanks.
   set o_buff [string trim $block_buffer]
   set blk_len [string length $o_buff]


  # Strip off end-of-block, if any.
   if { $mom_sim_end_of_block_len > 0 } {
      set end_idx [expr $blk_len - $mom_sim_end_of_block_len]
      set o_buff [string range $o_buff 0 $end_idx]
   }


  # Pre-screen buffer
   if [string match "" [string trim $o_buff]] {
return
   }


  # Identify & strip off sequence number word (may contain decimal pt).
   set pat "^$mom_sim_address(N,leader)\[0-9\]*\[\.\]?\[0-9\]*"

   set cmd [concat regexp -indices \{$pat\} \$o_buff match]

   if { [eval $cmd] == 1 } {

     # Seqno word exists, find next word
      if { [lindex $match 0] == 0 } {

         if { $mom_sim_word_separator_len > 0 } {

           # Word separator in use,
            set next_idx [expr [lindex $match 1] + $mom_sim_word_separator_len + 1]

         } else {

           # No word separator,
            set next_idx [expr [lindex $match 1] + 1]
         }

        # Rest of the buffer
         set o_buff [string range $o_buff $next_idx end]
      }
   }


  # Pre-screen buffer
   set o_buff [string trim $o_buff]
   if [string match "" $o_buff] {
return
   }


#<07-31-03 gsl>
  # Identify controller variables
  # *** Assuming the definition of a variable is in its own line.
   global mom_sim_control_var_leader

   if { ![string match "" $mom_sim_control_var_leader] } {

      set pat "^$mom_sim_control_var_leader\[0-9\]*\[\=\]?\[0-9\]*\[\.,\]?\[0-9\]*"

      set cmd [concat regexp -indices \{$pat\} \$o_buff match]

      if { [eval $cmd] == 1 } {

        # Split it by = sign
         set word_list [split $o_buff =]

        # Save it to register
         set var [lindex $word_list 0]
         set val [lindex $word_list 1]
         set mom_sim_nc_register($var) $val
return
      }
   }


  #******************************************************
  # Identify operator messages by control out/in strings
  #******************************************************
   if { [string first "$mom_sim_control_out" $o_buff] == 0 && \
        [string last "$mom_sim_control_in" $o_buff] > 0 } {


     # Strip off control characters
      set out_len [string length $mom_sim_control_out]
      set in_len  [string length $mom_sim_control_in]
      set o_buff [string range $o_buff $out_len end]
      set o_buff [string range $o_buff 0 [expr [string length $o_buff] - $in_len - 1]]
      set o_buff [string trim $o_buff]


     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     # Extract special instructions passed via operator messages
     # These instructions are generated as needed @ ugpost runtime.
     #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      set idx [string first "==" $o_buff]

      if { $idx > 0 } {

         set key [string range $o_buff 0 [expr $idx - 1]]
         set word [string range $o_buff [expr $idx + 2] end]
         set word [string trim $word \"]

         VNC_set_param_per_msg $key $word
      }

  #*********************
  # Parse regular block
  #*********************
   } else {

     #------------------------------
     # Determine input mode G90/G91
     #------------------------------
      VNC_parse_nc_code $o_buff $mom_sim_address(G_mode,leader) PB_CMD_vnc__G_mode_code

     #--------------------
     # Parse misc G codes
     #--------------------
      set mom_sim_nc_register(RETURN_HOME) 0
      set mom_sim_nc_register(FROM_HOME)   0
      set mom_sim_nc_register(SET_LOCAL)   0
      set mom_sim_nc_register(MCS_MOVE)    0
      set mom_sim_nc_register(RESET_WCS)   0

      VNC_parse_nc_code $o_buff $mom_sim_address(G,leader) PB_CMD_vnc__G_misc_code

     #-------------------
     # Parse plane codes
     #-------------------
      VNC_parse_nc_code $o_buff $mom_sim_address(G_plane,leader) PB_CMD_vnc__G_plane_code

     #----------------------------------
     # Parse tool length adjust G codes
     #----------------------------------
      VNC_parse_nc_code $o_buff $mom_sim_address(G_adjust,leader) PB_CMD_vnc__G_adjust_code


     #*************************************************
     # When X, Y, Z, A or B changes... Simulate motion.
     #*************************************************
     # Save away previous pos
      for {set i 0} {$i < 8} {incr i} {
         set mom_sim_prev_pos($i) $mom_sim_pos($i)
      }

      set simulate_block [VNC_parse_motion_word $o_buff]


     # Other cases, such as G92, G28, G54 (G) & G40/41/42/ (G_cutcom), G43/44/49 (G_adjust),
     # may also induce motions. Their behaviors along with Dxx & Hxx will need to be defined.

######
# G53
######
     # Restore WCS offsets after a MCS move
      if { $mom_sim_nc_register(MCS_MOVE) && \
           [string match "ABS" $mom_sim_nc_register(INPUT)] } {

        # Restore WCS offset
         set mom_sim_nc_register(WORK_OFFSET) [list]
         global mom_sim_wcs_offsets
         foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
            lappend mom_sim_nc_register(WORK_OFFSET) $coord
         }
      }

######
# G52
######
     # Change local offsets
      if $mom_sim_nc_register(SET_LOCAL) {

#<08-11-03 gsl>
if 0 {
         set mom_sim_nc_register(LOCAL_OFFSET) [list]
         for {set i 0} {$i < 5} {incr i} {
            lappend mom_sim_nc_register(LOCAL_OFFSET) $mom_sim_pos($i)
         }
}
         global mom_sim_offset_pt

         for {set i 0} {$i < 5} {incr i} {
            if [info exists mom_sim_offset_pt($i)] {
               set mom_sim_nc_register(LOCAL_OFFSET) \
                   [lreplace $mom_sim_nc_register(LOCAL_OFFSET) $i $i $mom_sim_offset_pt($i)]
            }
         }

        # Disable further simulation
         set simulate_block 0
      }

#<08-08-03 gsl>
######
# G92
######
     # Reset all wcs offsets
      if $mom_sim_nc_register(RESET_WCS) {

#<08-11-03 gsl>
if 0 {
         set mom_sim_nc_register(LOCAL_OFFSET) [list]
         set i 0
         foreach coord $mom_sim_nc_register(WORK_OFFSET) {
            lappend mom_sim_nc_register(LOCAL_OFFSET) [expr $mom_sim_pos($i) - $coord]
            incr i
         }
}
set mom_sim_message " Local Offset before : $mom_sim_nc_register(LOCAL_OFFSET)"
PB_CMD_vnc__send_message

         global mom_sim_offset_pt

if [info exists mom_sim_offset_pt] {
set mom_sim_message "   offset pt : [array get mom_sim_offset_pt]"
PB_CMD_vnc__send_message
}
         for {set i 0} {$i < 5} {incr i} {
            if [info exists mom_sim_offset_pt($i)] {
               set coord [lindex $mom_sim_nc_register(WORK_OFFSET) $i]
               set offset [expr $mom_sim_offset_pt($i) - $coord]
               set mom_sim_nc_register(LOCAL_OFFSET) \
                   [lreplace $mom_sim_nc_register(LOCAL_OFFSET) $i $i $offset]
            }
         }
set mom_sim_message " Local Offset after : $mom_sim_nc_register(LOCAL_OFFSET)"
PB_CMD_vnc__send_message

        # Disable further simulation
         set simulate_block 0
      }

######
# G28
######
     # Perform the Return Home command (G28).
      if $mom_sim_nc_register(RETURN_HOME) {

         PB_CMD_vnc__return_home

        # Disable further simulation
         set simulate_block 0
      }

######
# G29
######
     # Perform the From Home command (G29).
      if $mom_sim_nc_register(FROM_HOME) {

         PB_CMD_vnc__from_home

        # Disable further simulation
         set simulate_block 0
      }


     #-------------------
     # Parse misc M code
     #-------------------
      VNC_parse_nc_code $o_buff $mom_sim_address(M,leader) PB_CMD_vnc__M_misc_code


     #<06-27-03 gsl>
     # Motion code may exist in a block without axial components, such as G80.
     # *** Do not execute this call prior to VNC_parse_motion_word due to condition <A1>.

     # Find motion G code
      VNC_parse_nc_code $o_buff $mom_sim_address(G_motion,leader) PB_CMD_vnc__G_motion_code


     #<07-01-03 gsl> Force simulation of cycle motions
      if [string match "CYCLE_*" $mom_sim_nc_register(MOTION)] {
         set simulate_block 1
      }


#<10-03-03 gsl> Identify other codes after G_motion code to allow redefining the motion type.
     ######################################################
     # Simulate other devices, if any.
     #
     # Some device will perform its own movement
     # by using current mom_sim_pos. Further simulation
     # is disabled per value set in mom_sim_simulate_block.
     ######################################################
     global mom_sim_other_nc_codes
     global mom_sim_simulate_block

      set mom_sim_simulate_block $simulate_block

      if [llength [info commands "PB_CMD_vnc__sim_other_devices"]] {
         set cb_cmd "PB_CMD_vnc__sim_other_devices"
      } elseif [llength [info commands "PB_CMD_vnc____sim_other_devices"]] {
         set cb_cmd "PB_CMD_vnc____sim_other_devices"
      } else {
         set cb_cmd ""
      }

      foreach code $mom_sim_other_nc_codes {
         VNC_parse_nc_code $block_buffer $code $cb_cmd
      }

      if { $mom_sim_simulate_block == 0 } {
         set simulate_block 0
      }


     #--------------------
     # Execute simulation
     #--------------------
      if { $simulate_block } {

        if 0 {
        # Find motion G code then simulate the move.
         VNC_parse_nc_code $o_buff $mom_sim_address(G_motion,leader) PB_CMD_vnc__G_motion_code
        }

         PB_CMD_vnc__sim_motion

      } else {
        # We may want to record the blocks not simulated.
      }


     #--------------------------------
     # Parse program rewind stop code
     #--------------------------------
      global mom_sim_prog_rewind_stop_code
      if [info exists mom_sim_prog_rewind_stop_code] {
         VNC_parse_nc_code $o_buff $mom_sim_prog_rewind_stop_code VNC_rewind_stop_program
      }
   }

#??? SIM_step
}


#=============================================================
proc PB_VNC_init_sim_vars {} {
#=============================================================
  global mom_sim_nc_register


  # Initialize leader for controller variables.
  # Users can overwrite it in PB_CMD_vnc____set_nc_definitions.
   global mom_sim_control_var_leader
   set mom_sim_control_var_leader    ""


   PB_CMD_vnc__init_sim_vars


  #--------------------------------------------
  # Initialize spindle junction if not yet set.
  #--------------------------------------------
   global mom_sim_current_junction
   if { ![info exists mom_sim_current_junction] } {
      VNC_set_ref_jct ""
   }

  #------------------------------------------------------------
  # Initialize buffer to simulate a block after it's outputted.
  #------------------------------------------------------------
   global mom_sim_prev_o_buffer
   if [info exists mom_sim_prev_o_buffer] {
      unset mom_sim_prev_o_buffer
   }

  #------------------------------------------------------------
  # Set default N/C output unit.  This value will be used
  # when no output unit function is specified in the N/C code.
  # It's also used as the intial mode when controller is reset.
  #------------------------------------------------------------
   global mom_sim_output_unit
   set mom_sim_nc_register(UNIT)           $mom_sim_output_unit
   set mom_sim_nc_register(DEF_UNIT)       $mom_sim_nc_register(UNIT)

  #-----------------------------------
  # Set the machine tool driver units.
  #-----------------------------------
   if { $mom_sim_nc_register(UNIT) == "MM" } {
      SIM_set_mtd_units "MM" 
   } else {
      SIM_set_mtd_units "INCH" 
   }

  #-----------------------------------------
  # Initialize Intermediate Reference Point.
  #-----------------------------------------
   if [info exists mom_sim_nc_register(REF_INT_PT_X)] {
      unset mom_sim_nc_register(REF_INT_PT_X)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_Y)] {
      unset mom_sim_nc_register(REF_INT_PT_Y)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_Z)] {
      unset mom_sim_nc_register(REF_INT_PT_Z)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_4)] {
      unset mom_sim_nc_register(REF_INT_PT_4)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_5)] {
      unset mom_sim_nc_register(REF_INT_PT_5)
   }


#<08-12-03 gsl> Moved from PB_VNC_csys.

  # Set Reference Point to the home position specified in the post in axis coordinates.
   global mom_sim_home_pos

   if { ![info exists mom_sim_nc_register(REF_PT)] } {

      lappend mom_sim_nc_register(REF_PT) $mom_sim_home_pos(0) \
                                          $mom_sim_home_pos(1) \
                                          $mom_sim_home_pos(2) \
                                          0.0 0.0
   }
}

#=============================================================
proc VNC_reset_controller {} {
#=============================================================
   PB_CMD_vnc__reset_controller
}


#=============================================================
# Called by the Post to pass tool name.
#
proc PB_VNC_pass_tool_param {} {
#=============================================================
   PB_CMD_vnc__pass_tool_param
}


#=============================================================
# Called by the Post to pass head change data.
#
proc PB_VNC_pass_head_param {} {
#=============================================================
   PB_CMD_vnc__pass_head_param
}


#=============================================================
proc VNC_set_param_per_msg { key word } {
#=============================================================
  global mom_sim_msg_key mom_sim_msg_word

PB_sim_debug_msg "    key:$key  word:$word"

   set mom_sim_msg_key  $key
   set mom_sim_msg_word $word

   PB_CMD_vnc__set_param_per_msg
}


#=============================================================
# Create a temporary junction for subsequent moves, incase
# a tool is not set properly.
#
proc VNC_create_tmp_jct {} {
#=============================================================
  global mom_sim_tool_junction mom_sim_current_junction
  global mom_sim_curr_jct_matrix mom_sim_curr_jct_origin
  global mom_sim_tool_loaded


   if { ![string match "$mom_sim_tool_junction" "$mom_sim_current_junction"] } {

     #<07-22-03 gsl> Somehow junctions can not be deleted!?
      global mom_sim_result
      global mom_sim_tmp_tool_jct_index

      SIM_ask_is_junction_exist __SIM_TMP_TOOL_JCT
      if { $mom_sim_result == 0 } {
         set mom_sim_tmp_tool_jct_index 0
         set tmp_tool_jct "__SIM_TMP_TOOL_JCT"
      } else {
         incr mom_sim_tmp_tool_jct_index
         set tmp_tool_jct "__SIM_TMP_TOOL_JCT_$mom_sim_tmp_tool_jct_index"
      }

      eval SIM_create_junction $tmp_tool_jct $mom_sim_tool_loaded \
                               $mom_sim_curr_jct_origin $mom_sim_curr_jct_matrix

      SIM_set_current_ref_junction $tmp_tool_jct

      set mom_sim_tool_junction $tmp_tool_jct
      set mom_sim_current_junction $mom_sim_tool_junction
   }
}


#=============================================================
proc VNC_parse_motion_word { o_buff } {
#=============================================================
  global mom_sim_address mom_sim_pos mom_sim_prev_pos
  global mom_sim_nc_register

 #<06-20-03 gsl> Added use of following vars
  global mom_sim_x_double mom_sim_i_double
  global mom_sim_x_factor mom_sim_z_factor

  #<07-25-03 gsl>
  global mom_sim_incr_linear_addrs


#<08-11-03 gsl> added use of K_cycle and n1, n2 & n3.
   set addr_list {X Y Z fourth_axis fifth_axis I J K R K_cycle}

   set n1 [llength $addr_list]
   set n2 [expr $n1 + 1]
   set n3 [expr $n2 + 1]


#<08-11-03 gsl>
  # Initialize offset position when needed.
   global mom_sim_offset_pt
   if { $mom_sim_nc_register(SET_LOCAL) || \
        $mom_sim_nc_register(RESET_WCS) } {

      if [info exists mom_sim_offset_pt] {
         unset mom_sim_offset_pt
      }
   }

   set handle_incr_register 0
   if [info exists mom_sim_incr_linear_addrs] {
      if { [llength $mom_sim_incr_linear_addrs] > 0 } {
         set handle_incr_register 1
         set addr_list [concat $addr_list $mom_sim_incr_linear_addrs]
       }
   }


   set simulate_block 0


  #<06-20-03 gsl> Fetch position from machine-tool.
   global mom_sim_pos_zcs


  #<08-06-03 gsl> Do NOT fetch position from machine-tool.
   set mom_sim_pos_zcs(0) $mom_sim_pos(0)
   set mom_sim_pos_zcs(1) $mom_sim_pos(1)
   set mom_sim_pos_zcs(2) $mom_sim_pos(2)


#<07-31-03 gsl> Added controller variable leader.
   global mom_sim_control_var_leader

   set i 0

   foreach addr $addr_list {

      if [info exists mom_sim_address($addr,leader)] {

#<07-31-03 gsl> Added controller variable leader.
        # Match the pattern of { "address leader" & "- or +" & "numerals" & ". or ," & "numerals" }
#         set pat "$mom_sim_address($addr,leader)\[-\+\]?\[0-9\]*\[\.,\]?\[0-9\]*"

         if [string match "" $mom_sim_control_var_leader] {
            set pat "$mom_sim_address($addr,leader)\[-\+\]?\[0-9\]*\[\.,\]?\[0-9\]*"
         } else {
            set pat "$mom_sim_address($addr,leader)\[-\+\]?$mom_sim_control_var_leader?\[0-9\]*\[\.,\]?\[0-9\]*"
         }

         set cmd [concat regexp -indices \{$pat\} \$o_buff match]

        # Pattern matched.
         if { [eval $cmd] == 1 } {

           # Convert cooked data back to raw data.
            set idx [expr [lindex $match 0] + [string length $mom_sim_address($addr,leader)]]
            set val [string range $o_buff $idx [lindex $match 1]]

           # Remove blanks
            set val [string trim $val]

           # Strip off +/- sign and retain negativity info.
            set val_is_negative 0
            if [string match "-*" $val] {
               set val [string trimleft $val -]
               set val_is_negative 1
            } elseif [string match "+*" $val] {
               set val [string trimleft $val +]
            }


#<07-31-03 gsl>
           # Handle controller variables
            if { ![string match "" $mom_sim_control_var_leader] && \
                  [string match "$mom_sim_control_var_leader*" $val] } {
               set val [string trimright $val .]
               set val $mom_sim_nc_register($val)
            }


           # Decimal point found. Remove zeros.
            if [string match "*.*" $val] {

               set val [string trim $val 0]
               if [string match "." $val] {
                  set val 0.0
               }
 
           # No decimal point. Reconstruct raw data per format.
            } elseif { ![string match "*.*" $val] } {

               global mom_sim_format
               set fmt $mom_sim_address($addr,format)

               if { $mom_sim_format($fmt,lead_zero) == 0  && \
                    $mom_sim_format($fmt,trail_zero) == 0 } {

                 # Unrecognized data. Don't know what to do with it.

               } else {

                 # A number with leading 0 may get treated as an octal number!!!
                  set tmp_val [string trimleft $val 0]

                  if [string match "" $tmp_val] {

                    # Everything got trimmed off...
                     set val 0.0

                  } else {

                     if { $mom_sim_format($fmt,trail_zero) == 1 } {

                        set n_frac $mom_sim_format($fmt,fraction)

                     } elseif { $mom_sim_format($fmt,lead_zero) == 1 } {

                        set frac [string range $val $mom_sim_format($fmt,integer) end]
                        set n_frac [string length $frac]
                     }

                     set val [expr $tmp_val / pow(10,$n_frac)]
                  }
               }
            }

           # Put back negativity
            if $val_is_negative {
               set val [expr -1 * $val]
            }

           #<07-23-03 gsl> Apply other factors to the values
            switch $addr {
               X {
                  set val [expr $val / $mom_sim_x_double * $mom_sim_x_factor]
               }
               I {
                  set val [expr $val / $mom_sim_i_double]
               }
               Z {
                  set val [expr $val * $mom_sim_z_factor]
               }
            }


           # Save value to register
            set mom_sim_nc_register($addr) $val


            if { $addr == "I" ||  $addr == "J" || $addr == "K" || $addr == "R" } {

               set mom_sim_pos($i) $val

              # Simulate motion for any encounter of circular record.
               set simulate_block 1

            } else {

              #<07-25-03 gsl> Handle incremental linear registers
               if $handle_incr_register {

                  if { [lsearch $mom_sim_incr_linear_addrs "$addr"] >= 0 } {

                     if { ![string match "" $val] && [expr {$val != 0.0}] } {

                        set simulate_block 1

#<08-08-03 gsl>
                        if $mom_sim_nc_register(RESET_WCS) {
                           set val [expr -1 * $val]
                        }

#<10-02-03 gsl> Make use of n1, n2 & n3.
                       if 0 {
                        switch $i {
                           9 {
                              set mom_sim_pos(0) [expr $mom_sim_pos_zcs(0) + $val]
                           }
                           10 {
                              set mom_sim_pos(1) [expr $mom_sim_pos_zcs(1) + $val]
                           }
                           11 {
                              set mom_sim_pos(2) [expr $mom_sim_pos_zcs(2) + $val]
                           }
                        }
                       }
                        if [expr $i == $n1] {
                           set mom_sim_pos(0) [expr $mom_sim_pos_zcs(0) + $val]
                        }
                        if [expr $i == $n2] {
                           set mom_sim_pos(1) [expr $mom_sim_pos_zcs(1) + $val]
                        }
                        if [expr $i == $n3] {
                           set mom_sim_pos(2) [expr $mom_sim_pos_zcs(2) + $val]
                        }
                     }
                  }
               }

               if { $i < 9 } {
                 # Incremental or absolute input mode
                  if [string match "INC" $mom_sim_nc_register(INPUT)] {
#<08-08-03 gsl>
                     if $mom_sim_nc_register(RESET_WCS) {
                        set val [expr -1 * $val]
                     }

                    #<06-20-03 gsl>
                     if { $i < 3 } {
                        set mom_sim_pos($i) [expr $mom_sim_pos_zcs($i) + $val]
                     } else {
                        set mom_sim_pos($i) [expr $mom_sim_pos($i) + $val]
                     }
                  } else {
                     set offset [expr [lindex $mom_sim_nc_register(LOCAL_OFFSET) $i] + \
                                      [lindex $mom_sim_nc_register(WORK_OFFSET) $i] ]

                     set mom_sim_pos($i) [expr $offset + $val]
                  }


                 # Simulate motion for any changes
                  if [expr {$mom_sim_pos($i) != $mom_sim_prev_pos($i)}] {
                     set simulate_block 1
                  }
               }

#<08-11-03 gsl>
              # Update offset point when needed.
               if { $mom_sim_nc_register(SET_LOCAL) || \
                    $mom_sim_nc_register(RESET_WCS) } {

                  switch $i {
                     "0" {
                        set mom_sim_offset_pt(0)  $mom_sim_pos(0)
                     }
                     "1" {
                        set mom_sim_offset_pt(1)  $mom_sim_pos(1)
                     }
                     "2" {
                        set mom_sim_offset_pt(2)  $mom_sim_pos(2)
                     }
                     "3" {
                        set mom_sim_offset_pt(3)  $mom_sim_pos(3)
                     }
                     "4" {
                        set mom_sim_offset_pt(4)  $mom_sim_pos(4)
                     }
                  }

#<10-02-03 gsl>
                  if [expr $i == $n1] {
                     set mom_sim_offset_pt(0)  $mom_sim_pos(0)
                  }
                  if [expr $i == $n2] {
                     set mom_sim_offset_pt(1)  $mom_sim_pos(1)
                  }
                  if [expr $i == $n3] {
                     set mom_sim_offset_pt(2)  $mom_sim_pos(2)
                  }
               }

              # Update intermediate ref pt when needed (existent or specified)(G28).
               if { $mom_sim_nc_register(RETURN_HOME) || \
                    $mom_sim_nc_register(FROM_HOME) } {

                  switch $i {
                     "0" {
                        set mom_sim_nc_register(REF_INT_PT_X) $mom_sim_pos(0)
                     }
                     "1" {
                        set mom_sim_nc_register(REF_INT_PT_Y) $mom_sim_pos(1)
                     }
                     "2" {
                        set mom_sim_nc_register(REF_INT_PT_Z) $mom_sim_pos(2)
                     }
                     "3" {
                        set mom_sim_nc_register(REF_INT_PT_4) $mom_sim_pos(3)
                     }
                     "4" {
                        set mom_sim_nc_register(REF_INT_PT_5) $mom_sim_pos(4)
                     }
                  }
#<10-02-03 gsl>
                  if [expr $i == $n1] {
                     set mom_sim_nc_register(REF_INT_PT_X) $mom_sim_pos(0)
                  }
                  if [expr $i == $n2] {
                     set mom_sim_nc_register(REF_INT_PT_Y) $mom_sim_pos(1)
                  }
                  if [expr $i == $n3] {
                     set mom_sim_nc_register(REF_INT_PT_Z) $mom_sim_pos(2)
                  }
               }
            }

         } else {
#<A1>
           #<06-27-03 gsl>
           # Set XYZ component of current pos from machine,
           # if not specified in the block.
            if { $i < 3 } {
               if { ![string match "CYCLE_*" $mom_sim_nc_register(MOTION)] || \
                     [string match "CYCLE_OFF" $mom_sim_nc_register(MOTION)] } {
                  set mom_sim_pos($i) $mom_sim_pos_zcs($i)
               }
            }
         }
      }
      incr i
   }

return $simulate_block
}


#=============================================================
proc VNC_parse_nc_code { o_buff addr_leader args } {
#=============================================================
  global mom_sim_word_separator_len
  global mom_sim_nc_address
  global mom_sim_nc_code


   set mom_sim_nc_address "$addr_leader"
   set mom_sim_nc_code ""


   set separator_len $mom_sim_word_separator_len

   set status 0


#<10-03-03 gsl>
  #*****************************************************************
  # If the address leader is blank, execute the callback right away.
  #*****************************************************************
   set addr_leader [string trim $addr_leader]
   if { ![string length $addr_leader] } {

      if { [llength $args] > 0 } {
         set exec_cb [string trim [lindex $args 0]]
      } else {
         set exec_cb ""
      }

      set mom_sim_nc_code "$o_buff"

      if { ![string match "" $exec_cb] } {
         if [llength [info commands "$exec_cb"]] {
            eval "$exec_cb"
         }
      }

return $status
   }


  #---------------------------------------------------------------------------
  # Do a simple pre-screening match to determine the need for further parsing.
  #---------------------------------------------------------------------------
   if { ![string match "*$addr_leader*" $o_buff] } {
return $status
   }


  # Match the pattern of { "address leader" & "numerals" & "." & "numerals" }
#<10-03-03 gsl> Enhanced patter
#   set pat "$addr_leader\[0-9\]*\.?\[0-9\]*"
   set pat "$addr_leader\[-\+\]?\[0-9\]*\[\.,\]?\[0-9\]*"

   set local_buff $o_buff

   set code_found 1


   while { $code_found } {

      set cmd [concat regexp -indices \{$pat\} \$local_buff match]

     # Pattern found
      if { [eval $cmd] == 1 } {

         set status 1

         set idx [expr [lindex $match 0] + [string length $addr_leader]]
         set val [string range $local_buff $idx [lindex $match 1]]


        # Execute simulation
         set mom_sim_nc_code [string trim $val]

         if { [llength $args] > 0 } {
            set exec_cb [string trim [lindex $args 0]]
         } else {
            set exec_cb ""
         }

         if { ![string match "" $exec_cb] } {
            if [llength [info commands "$exec_cb"]] {
               eval "$exec_cb"
            }
         } else {
           #<07-18-03 gsl> No callback supplied indicating that this call was made
           #               to simply identify the existence of certain address.
           #               Return the status of true right away.
return $status
         }


        # Strip off the 1st match from the buffer, then search again.
         set idx [expr [lindex $match 1] + $separator_len]
         set local_buff [string range $local_buff $idx end]

        # Pre-screen new buffer
         if { ![string match "*$addr_leader*" $local_buff] } {
            set code_found 0
         }

      } else {
        # No more match, bail.
         set code_found 0
      }
   }

return $status
}


#=============================================================
# Called when IS&V module starts.
#
proc MOM_SIM_initialize_mtd {} {
#=============================================================
  global sim_mtd_initialized


  # Initializing MTD and setting controller mode.
  #
   SIM_mtd_init NC_CONTROLLER_MTD_EVENT_HANDLER

  # Flag to check whether the post is running in simulation
  # or for NC files creation.
  #
   set sim_mtd_initialized 1
}


#=============================================================
# Called when IS&V module ends.
#
proc MOM_SIM_exit_mtd { } {
#=============================================================
# This procedure exits the machine tool driver. this procedure 
# is called when the machine tool simulation ends.
#_______________________________________________________________________________
#
  # invoke S&V command to exit machine tool driver. 
   SIM_mtd_reset 

  # end debugging
  # SIM_dbg_end 
}


#=============================================================
# This proc is executed @ MOM_start_of_program.
#
proc PB_VNC_start_of_program { } {
#=============================================================
  # Set the callback function to compute duration
  #
   SIM_set_duration_callback_fct "VNC_CalculateDurationTime"

   SIM_start_of_simulation
}


#=============================================================
proc PB_VNC_end_of_path { } {
#=============================================================
  global mom_sim_prev_o_buffer


  # Simulate the last block in the path
  # This is due to that the simulation is one block behind the N/C output.
  # See MOM_before_output.
   MOM_before_output

  # Clear buffer
   if [info exists mom_sim_prev_o_buffer] {
      unset mom_sim_prev_o_buffer
   }
}


#=============================================================
proc PB_VNC_end_of_program { } {
#=============================================================
  global mom_sim_isv_debug


  # Simulate the last block in the program
  # See reason in PB_VNC_end_of_path.
   MOM_before_output

  # Close debug message file.
   if [info exists mom_sim_isv_debug] {
      close $mom_sim_isv_debug
      unset mom_sim_isv_debug
   }

   SIM_end_of_simulation
}


#=============================================================
# Create and set the current ZCS junction.
# This function is called when the MOM_set_csys is triggered.
#
proc PB_VNC_csys {} {
#=============================================================
  global mom_sim_zcs_base
  global mom_csys_matrix 
  global mom_sim_result 
  global mom_sim_csys_set


  # Handle condition when called by MOM_msys.
   if $mom_sim_csys_set {
return
   }


   PB_CMD_vnc__pass_csys_data


   global mom_sim_csys_matrix

   for {set i 0} {$i < 12} {incr i}  {
      set mom_sim_csys_matrix($i) $mom_csys_matrix($i)
   }

   PB_CMD_vnc__set_kinematics

   set mom_sim_csys_set 1
}


#=============================================================
proc PB_VNC_set_kinematics {} {
#=============================================================
  global mom_sim_zcs_base
  global mom_sim_csys_matrix


  # Convert part/simulation units to MTD units
  #
   lappend  origin [ SIM_convert_sim_to_mtd_units $mom_sim_csys_matrix(9)  ]
   lappend  origin [ SIM_convert_sim_to_mtd_units $mom_sim_csys_matrix(10) ]
   lappend  origin [ SIM_convert_sim_to_mtd_units $mom_sim_csys_matrix(11) ]

  # Convert matrix vector to list
   for {set i 0} {$i < 9} {incr i}  {
      lappend mtx $mom_sim_csys_matrix($i)
   }

  # Check if ZCS junction already created. if yes, return its name. if not create new one
  # and return its name. This optimization is needed because this event is invoked
  # before each operation is exceuted.
  #
  # ZCS base should have been specified when machine-tool axes are mapped.
  #
   set zcs_name [ SIM_create_zcs_junction CURRENT_ZCS_JCT "$mom_sim_zcs_base" $origin  $mtx ]
 
   SIM_update_current_zcs $zcs_name


#<09-30-03 gsl> We actually parse matrix definition from the operator messages.
#               This flag is set in PB_CMD_vnc__set_param_per_msg.
#  global mom_sim_csys_set
#   set mom_sim_csys_set 1


   global mom_sim_advanced_kinematic_jct

   set reload_kinematics 0

   if [info exists mom_sim_advanced_kinematic_jct] {

      VNC_reload_kinematics

   } else {
      global mom_sim_reverse_4th_table mom_sim_reverse_5th_table

      if { [info exists mom_sim_reverse_4th_table] && $mom_sim_reverse_4th_table } {
         global mom_kin_4th_axis_type mom_kin_4th_axis_rotation
         global mom_kin_4th_axis_min_limit mom_kin_4th_axis_max_limit

         if { [info exists mom_kin_4th_axis_type]  &&  \
              [string toupper $mom_kin_4th_axis_type] == "TABLE" } {

            if { $mom_kin_4th_axis_rotation == "standard" } {
               set mom_kin_4th_axis_rotation "reverse"
            } else {
               set mom_kin_4th_axis_rotation "standard"
               set tmp $mom_kin_4th_axis_min_limit
               set mom_kin_4th_axis_min_limit [expr -1 * $mom_kin_4th_axis_max_limit]
               set mom_kin_4th_axis_max_limit [expr -1 * $tmp]
            }
            set reload_kinematics 1
         }
      }

      if { [info exists mom_sim_reverse_4th_table] && $mom_sim_reverse_4th_table } {
         global mom_kin_5th_axis_type mom_kin_5th_axis_rotation
         global mom_kin_5th_axis_min_limit mom_kin_5th_axis_max_limit

         if { [info exists mom_kin_5th_axis_type]  &&  \
              [string toupper $mom_kin_5th_axis_type] == "TABLE" } {

            if { $mom_kin_5th_axis_rotation == "standard" } {
               set mom_kin_5th_axis_rotation "reverse"
            } else {
               set mom_kin_5th_axis_rotation "standard"
               set tmp $mom_kin_5th_axis_min_limit
               set mom_kin_5th_axis_min_limit [expr -1 * $mom_kin_5th_axis_max_limit]
               set mom_kin_5th_axis_max_limit [expr -1 * $tmp]
            }
            set reload_kinematics 1
         }
      }
   }

   if $reload_kinematics {
      MOM_reload_kinematics
   }
}


#=============================================================
proc VNC_restore_pos_no_sim {} {
#=============================================================
   global mom_sim_pos mom_sim_prev_pos mom_sim_simulate_block

   for {set i 0} {$i < 8} {incr i} {
      set mom_sim_pos($i) $mom_sim_prev_pos($i)
   }

   set mom_sim_simulate_block 0
}


#=============================================================
proc PB_VNC_send_message { message } {
#=============================================================
   SIM_feedback_message "MTD" "$message"
}


#<09-30-03 gsl> This is defined here for legacy VNC.
#               It is also defined in vnc_common.tcl.
#=============================================================
proc PB_CMD_vnc__send_message {} {
#=============================================================
   global mom_sim_message

   PB_VNC_send_message "$mom_sim_message"
}


#=============================================================
# return the duration time in seconds to pass the delta length
# in current feedrate
# linear_or_angular is either "LINEAR" or "ANGULAR" which
# defines whether delta is linear(in current units) or angular
# displacement in degrees.
#
proc VNC_CalculateDurationTime { linear_or_angular delta } {
#=============================================================
  global mom_feed_rate_mode
  global mom_feed_rate
  global sim_feedrate_mode
  global mom_sim_nc_register


  # for now we don't compute durations for angular motions
   if { $linear_or_angular == "ANGULAR" } { return 0 }

   if { $sim_feedrate_mode == "RAPID" } {

     # for now just set an arbitrary RAPID feedrate. this has to match
     # the controller specifications
     # 10 meters per minute as rapid speed

      set feed 10000 
   } else {
      if {$mom_feed_rate_mode != "MMPM" } {
         set feed [expr {$mom_feed_rate * 25.4}]
      } else {
         set feed $mom_feed_rate
      }
   }

   set length [expr {abs($delta)}]

   if [string match "MM" $mom_sim_nc_register(UNIT)] {
      set length [expr {$length * 25.4}]
   }

        
   if {[expr {abs($feed)}] < 0.00001 || $length < 0.00001 } {
      set time 0
   } else {
      set time [expr {($length / $feed) * 60.0}]
   }

return $time
}


#===============================================================================
# This function returns the feedrate units as expected by S&V commands
proc VNC_ask_feedrate_mode { } {
#===============================================================================
#<<< We don't want to get this var from UG/Post."
  global mom_feed_rate_mode

   if {[hiset mom_feed_rate_mode]} {
      switch $mom_feed_rate_mode {
         IPM     { set feed_units "INCH_PER_MIN" }
         MMPM    { set feed_units "MM_PER_MIN"}
         IPR     { set feed_units "INCH_PER_REV" }
         MMPR    { set feed_units "MM_PER_REV" }
         FRN     { set feed_units "MM_PER_100REV" }
         default { set feed_units "UNKNOWN FEEDRATE UNITS" }
      }
   } else {
      set feed_units "UNKNOWN FEEDRATE UNITS" 
   }

return $feed_units 
}


#===============================================================================
# This function returns the speed units as expected by S&V commands
proc VNC_ask_speed_mode { } {
#===============================================================================
#<<< We don't want to get this var from UG/Post."
  global mom_spindle_mode

   if {[hiset mom_spindle_mode]} {
      switch $mom_spindle_mode {
         RPM     { set speed_units "REV_PER_MIN" }
#        SFM     {}
#        SMM     {}
         default { set speed_units "UNKNOWN SPEED UNITS" }
      }
   } else {
      set speed_units "UNKNOWN SPEED UNITS" 
   }

return $speed_units
}


#===============================================================================
proc VNC_set_feedrate_mode { cutting_mode } {
#===============================================================================
#<<< We don't want to get this var from UG/Post."
  global mom_feed_rate
  global sim_feedrate_mode

   SIM_set_cutting_mode $cutting_mode

   set sim_feedrate_mode $cutting_mode

   if { $cutting_mode == "RAPID" } {
     # we need here the actual rapid speed. meanwhile we use what we have
      SIM_set_feed $mom_feed_rate [VNC_ask_feedrate_mode]
   } else {
      SIM_set_feed $mom_feed_rate [VNC_ask_feedrate_mode]
   }
}


#===============================================================================
proc VNC_unmount_tool { tool_ug_name } {
#===============================================================================
  global sim_prev_tool_name  
  global mom_sim_result sim_tool_change_pos
    
   if { $tool_ug_name  != "undefined" } { 
      SIM_ask_kim_comp_name_by_id "TOOL" $tool_ug_name
      set t_name $mom_sim_result
         
      SIM_unmount_tool "2.0" $t_name  
      SIM_update

      set sim_prev_tool_name "undefined"
   }
}


#===============================================================================
proc VNC_tool_change {} {
#===============================================================================
   PB_CMD_vnc__tool_change
}


#=============================================================
proc VNC_rewind_stop_program {} {
#=============================================================
   PB_CMD_vnc__rewind_stop_program
}


#=============================================================
proc VNC_rapid_move {} {
#=============================================================
   PB_CMD_vnc__rapid_move
}


#=============================================================
proc VNC_linear_move {} {
#=============================================================
   PB_CMD_vnc__linear_move
}


#=============================================================
proc VNC_circular_move { direction args } {
#=============================================================
  global mom_sim_circular_dir mom_sim_circular_plane

   if {$direction == "CLW"} {
      set mom_sim_circular_dir -1.0
   } else {
      set mom_sim_circular_dir 1.0
   }

   if [llength $args] {
     set mom_sim_circular_plane [lindex $args 0]
   } else {
     set mom_sim_circular_plane "XY"
   }

   PB_CMD_vnc__circular_move
}


#=============================================================
proc VNC_cycle_move {} {
#=============================================================
  global mom_sim_nc_register

   if [string match "CYCLE_OFF" $mom_sim_nc_register(MOTION)] {

      set mom_sim_nc_register(MOTION) RAPID

   } elseif [string match "CYCLE_START" $mom_sim_nc_register(MOTION)] {

      PB_CMD_vnc__cycle_move

   } elseif [string match "CYCLE_*" $mom_sim_nc_register(MOTION)] {

      PB_CMD_vnc__cycle_set
   }
}


#=============================================================
proc VNC_set_ref_jct { sim_tool_name } {
#=============================================================
  global mom_sim_spindle_jct


   set sim_tool_name [string trim $sim_tool_name]

   if { $sim_tool_name != "" && $sim_tool_name != "undefined" } \
   {
      set ref_jct $sim_tool_name@SIM_TOOL_TIP
   } else { 
      set ref_jct "$mom_sim_spindle_jct"
   } 

   SIM_set_current_ref_junction $ref_jct  

   global mom_sim_current_junction
   set mom_sim_current_junction $ref_jct
}


#=============================================================
proc VNC_coolant_on { } {
#=============================================================
  global sim_coolant_status  

   set sim_coolant_status "ON"

   SIM_set_coolant "ON"
}


#=============================================================
proc VNC_coolant_off { } {
#=============================================================
  global sim_coolant_status 

   set sim_coolant_status "OFF"
   SIM_set_coolant "OFF"
}


#=============================================================
proc VNC_concat_coord_list { args } {
#=============================================================
  global mom_sim_nc_axes

   set args [join $args]
   set coord [list]
   foreach { axis val } $args {
      if { [lsearch $mom_sim_nc_axes $axis] >= 0 } {
         if { ![string match "" $val] } {
            lappend coord $axis $val
         }
      }
   }

return $coord
}


#=============================================================
proc VNC_move_linear_zcs { mode args } {
#=============================================================
   if { $mode != "CURRENT" } {
      VNC_set_feedrate_mode $mode
   }

   set coord [VNC_concat_coord_list $args]


  #<gsl> Negate 4th & 5th coord values, if axis is a rotary table.
   global mom_sim_reverse_4th_table
   global mom_sim_reverse_5th_table
   global mom_sim_lg_axis
 
   if { [info exists mom_sim_reverse_4th_table]  && \
         $mom_sim_reverse_4th_table == 1 } {

      global mom_kin_4th_axis_type
      global mom_kin_4th_axis_rotation

      if { [info exists mom_kin_4th_axis_type]  &&  [string toupper $mom_kin_4th_axis_type] == "TABLE" } {
         if { $mom_kin_4th_axis_rotation == "standard" } {
            set 4th [lsearch $coord $mom_sim_lg_axis(4)]
            if { $4th >= 0 } {
               set 4th [expr $4th + 1]
               set 4th_val [lindex $coord $4th]
               set coord [lreplace $coord $4th $4th [expr -1 * $4th_val]]
            }
         }
      }
   }

   if { [info exists mom_sim_reverse_5th_table]  && \
         $mom_sim_reverse_5th_table == 1 } {

      global mom_kin_5th_axis_type
      global mom_kin_5th_axis_rotation

      if { [info exists mom_kin_5th_axis_type]  &&  [string toupper $mom_kin_5th_axis_type] == "TABLE" } {
         if { $mom_kin_5th_axis_rotation == "standard" } {
            set 5th [lsearch $coord $mom_sim_lg_axis(5)]
            if { $5th >= 0 } {
               set 5th [expr $5th + 1]
               set 5th_val [lindex $coord $5th]
               set coord [lreplace $coord $5th $5th [expr -1 * $5th_val]]
            }
         }
      }
   }


   eval SIM_move_linear_zcs $coord
}


#=============================================================
proc VNC_set_post_kinematics { zcs_jct X_axis Y_axis Z_axis \
                               {4th_axis ""} {5th_axis ""} \
                               {pivot_jct ""} {gauge_jct ""} } {
#=============================================================
   SIM_set_post_kinematics $zcs_jct $X_axis $Y_axis $Z_axis  $4th_axis $5th_axis $pivot_jct $gauge_jct
}


#=============================================================
proc VNC_machine_tool_model_exists { } {
#=============================================================
  global sim_mtd_initialized

  # this function should realy check for whether a machine tool
  # model exist or not. for now, we check if simulation has 
  # been initialized properly
  
return $sim_mtd_initialized  
}


#-------------------------------------------------------------
# This function updates the post kinematics variables
# according to the machine tool kinematics model.
#=============================================================
proc VNC_reload_kinematics {} {
#=============================================================
  global mom_sim_mt_axis
  global sim_prev_zcs
  global mom_sim_num_machine_axes mom_sim_advanced_kinematic_jct


  # Define the reference junction for defining the 4th and 5th
  # axis post kinematics data

   set current_zcs "$mom_sim_advanced_kinematic_jct"


  # Set kinematics based on the machine tool kinematics model
  # current_zcs represents the MCS used with this machine

   if { [VNC_machine_tool_model_exists]  &&  $sim_prev_zcs != $current_zcs } {

      if { $mom_sim_num_machine_axes == 4 } {

         VNC_set_post_kinematics $current_zcs $mom_sim_mt_axis(X) \
                                              $mom_sim_mt_axis(Y) \
                                              $mom_sim_mt_axis(Z) \
                                              $mom_sim_mt_axis(4)
      } elseif { $mom_sim_num_machine_axes == 5 } {

         VNC_set_post_kinematics $current_zcs $mom_sim_mt_axis(X) \
                                              $mom_sim_mt_axis(Y) \
                                              $mom_sim_mt_axis(Z) \
                                              $mom_sim_mt_axis(4) \
                                              $mom_sim_mt_axis(5)
      }

      set sim_prev_zcs $current_zcs
   }

#>>>>> Advanced kinematics
#   set uf_library "ugpadvkins.dll"
#   MOM_run_user_function [MOM_ask_env_var UGII_CAM_AUXILIARY_DIR]$uf_library ufusr

   MOM_reload_kinematics
}


} ;# mom_mtd_initialized

#=============================================================
proc VNC_set_nc_definitions {} {
#=============================================================
  global mom_sim_control_out mom_sim_control_in
  global mom_sim_word_separator mom_sim_word_separator_len
  global mom_sim_end_of_block mom_sim_end_of_block_len
  global mom_sim_home_pos
  global mom_sim_address
  global mom_sim_format
  global mom_sim_wcs_offsets
  global mom_sim_nc_register
  global mom_sim_nc_func
  global mom_sim_circular_vector
  global mom_sim_arc_output_mode
  global mom_sim_machine_type
  global mom_sim_num_machine_axes
  global mom_sim_advanced_kinematic_jct
  global mom_sim_reverse_4th_table mom_sim_reverse_5th_table
  global mom_sim_cycle_mode
  global mom_sim_x_double mom_sim_i_double
  global mom_sim_x_factor mom_sim_z_factor
  global mom_sim_output_unit

   set mom_sim_control_out                            "; "
   set mom_sim_control_in                             ""

   set mom_sim_word_separator                         " "
   set mom_sim_word_separator_len                     "1"

   set mom_sim_end_of_block                           ""
   set mom_sim_end_of_block_len                       "0"

   set mom_sim_home_pos(0)                            "0"
   set mom_sim_home_pos(1)                            "0"
   set mom_sim_home_pos(2)                            "0"

   set mom_sim_circular_vector                        "Vector - Absolute Arc Center"
   set mom_sim_arc_output_mode                        "FULL_CIRCLE"
   set mom_sim_output_unit                            "MM"
   set mom_sim_machine_type                           "4_axis_table"
   set mom_sim_num_machine_axes                       "4"

   if [info exists mom_sim_advanced_kinematic_jct] {
      unset mom_sim_advanced_kinematic_jct
   }

   set mom_sim_reverse_4th_table                      "0"
   set mom_sim_reverse_5th_table                      "0"

   set mom_sim_cycle_feed_to_addr                     "Y"
   set mom_sim_cycle_mode(feed_to)                    "Position"
   set mom_sim_cycle_mode(rapid_to)                   "None"
   set mom_sim_cycle_mode(retract_to)                 "None"
   set mom_sim_cycle_mode(start_block)                "0"

   set mom_sim_x_double                               "1"
   set mom_sim_i_double                               "1"
   set mom_sim_x_factor                               "1"
   set mom_sim_z_factor                               "1"

   set mom_sim_address(Text,leader)                   ""
   set mom_sim_address(Text,leader_len)               "0"
   set mom_sim_address(Text,trailer)                  ""
   set mom_sim_address(Text,trailer_len)              "0"
   set mom_sim_address(Text,modal)                    "1"
   set mom_sim_address(Text,format)                   "String"

   set mom_sim_address(cycle_feedrate,leader)         "Q206="
   set mom_sim_address(cycle_feedrate,leader_len)     "5"
   set mom_sim_address(cycle_feedrate,trailer)        ""
   set mom_sim_address(cycle_feedrate,trailer_len)    "0"
   set mom_sim_address(cycle_feedrate,modal)          "1"
   set mom_sim_address(cycle_feedrate,format)         "Feed_IPM"

   set mom_sim_address(I,leader)                      "X"
   set mom_sim_address(I,leader_len)                  "1"
   set mom_sim_address(I,trailer)                     ""
   set mom_sim_address(I,trailer_len)                 "0"
   set mom_sim_address(I,modal)                       "1"
   set mom_sim_address(I,format)                      "Coordinate"

   set mom_sim_address(G_plane,leader)                "G"
   set mom_sim_address(G_plane,leader_len)            "1"
   set mom_sim_address(G_plane,trailer)               ""
   set mom_sim_address(G_plane,trailer_len)           "0"
   set mom_sim_address(G_plane,modal)                 "1"
   set mom_sim_address(G_plane,format)                "Digit_2"

   set mom_sim_nc_func(PLANE_XY)                      "17"
   set mom_sim_nc_func(PLANE_ZX)                      "18"
   set mom_sim_nc_func(PLANE_YZ)                      "19"

   set mom_sim_address(G_adjust,leader)               "G"
   set mom_sim_address(G_adjust,leader_len)           "1"
   set mom_sim_address(G_adjust,trailer)              ""
   set mom_sim_address(G_adjust,trailer_len)          "0"
   set mom_sim_address(G_adjust,modal)                "1"
   set mom_sim_address(G_adjust,format)               "Digit_2"

   set mom_sim_nc_func(TL_ADJUST_PLUS)                "43"
   set mom_sim_nc_func(TL_ADJUST_MINUS)               "44"
   set mom_sim_nc_func(TL_ADJUST_CANCEL)              "49"

   set mom_sim_address(G_feed,leader)                 "G"
   set mom_sim_address(G_feed,leader_len)             "1"
   set mom_sim_address(G_feed,trailer)                ""
   set mom_sim_address(G_feed,trailer_len)            "0"
   set mom_sim_address(G_feed,modal)                  "1"
   set mom_sim_address(G_feed,format)                 "Digit_2"

   set mom_sim_address(G_spin,leader)                 "G"
   set mom_sim_address(G_spin,leader_len)             "1"
   set mom_sim_address(G_spin,trailer)                ""
   set mom_sim_address(G_spin,trailer_len)            "0"
   set mom_sim_address(G_spin,modal)                  "1"
   set mom_sim_address(G_spin,format)                 "Digit_2"

   set mom_sim_address(G_return,leader)               "G"
   set mom_sim_address(G_return,leader_len)           "1"
   set mom_sim_address(G_return,trailer)              ""
   set mom_sim_address(G_return,trailer_len)          "0"
   set mom_sim_address(G_return,modal)                "1"
   set mom_sim_address(G_return,format)               "Digit_2"

   set mom_sim_nc_func(CYCLE_RETURN_AUTO)             ""
   set mom_sim_nc_func(CYCLE_RETURN_MANUAL)           ""

   set mom_sim_address(G_motion,leader)               ""
   set mom_sim_address(G_motion,leader_len)           "0"
   set mom_sim_address(G_motion,trailer)              ""
   set mom_sim_address(G_motion,trailer_len)          "0"
   set mom_sim_address(G_motion,modal)                "1"
   set mom_sim_address(G_motion,format)               "Digit_2"

   set mom_sim_nc_func(MOTION_RAPID)                  "L"
   set mom_sim_nc_func(MOTION_LINEAR)                 "L"
   set mom_sim_nc_func(MOTION_CIRCULAR_CLW)           "DR+"
   set mom_sim_nc_func(MOTION_CIRCULAR_CCLW)          "DR-"
   set mom_sim_nc_func(CYCLE_DRILL)                   "L"
   set mom_sim_nc_func(CYCLE_DRILL_DWELL)             "L"
   set mom_sim_nc_func(CYCLE_DRILL_DEEP)              "L"
   set mom_sim_nc_func(CYCLE_DRILL_BREAK_CHIP)        "L"
   set mom_sim_nc_func(CYCLE_TAP)                     "L"
   set mom_sim_nc_func(CYCLE_BORE)                    "L"
   set mom_sim_nc_func(CYCLE_BORE_DRAG)               "L"
   set mom_sim_nc_func(CYCLE_BORE_NO_DRAG)            "L"
   set mom_sim_nc_func(CYCLE_BORE_BACK)               "L"
   set mom_sim_nc_func(CYCLE_BORE_MANUAL)             "L"
   set mom_sim_nc_func(CYCLE_BORE_DWELL)              "L"
   set mom_sim_nc_func(CYCLE_BORE_MANUAL_DWELL)       "L"
   set mom_sim_nc_func(CYCLE_START)                   "79"
   set mom_sim_nc_func(CYCLE_OFF)                     ""

   set mom_sim_address(G_mode,leader)                 "G"
   set mom_sim_address(G_mode,leader_len)             "1"
   set mom_sim_address(G_mode,trailer)                ""
   set mom_sim_address(G_mode,trailer_len)            "0"
   set mom_sim_address(G_mode,modal)                  "1"
   set mom_sim_address(G_mode,format)                 "Digit_2"

   set mom_sim_nc_func(INPUT_ABS)                     " "
   set mom_sim_nc_func(INPUT_INC)                     " "

   set mom_sim_address(G,leader)                      "G"
   set mom_sim_address(G,leader_len)                  "1"
   set mom_sim_address(G,trailer)                     ""
   set mom_sim_address(G,trailer_len)                 "0"
   set mom_sim_address(G,modal)                       "1"
   set mom_sim_address(G,format)                      "Digit_2"

   set mom_sim_nc_func(DELAY_SEC)                     "4"
   set mom_sim_nc_func(DELAY_REV)                     "4"
   set mom_sim_nc_func(WORK_CS_RESET)                 "92"
   set mom_sim_nc_func(RETURN_HOME)                   "28"
   set mom_sim_nc_func(UNIT_IN)                       "70"
   set mom_sim_nc_func(UNIT_MM)                       "71"

   set mom_sim_address(X,leader)                      "X"
   set mom_sim_address(X,leader_len)                  "1"
   set mom_sim_address(X,trailer)                     ""
   set mom_sim_address(X,trailer_len)                 "0"
   set mom_sim_address(X,modal)                       "1"
   set mom_sim_address(X,format)                      "Coordinate"

   set mom_sim_address(K3X,leader)                    "K3X"
   set mom_sim_address(K3X,leader_len)                "3"
   set mom_sim_address(K3X,trailer)                   ""
   set mom_sim_address(K3X,trailer_len)               "0"
   set mom_sim_address(K3X,modal)                     "1"
   set mom_sim_address(K3X,format)                    "Coordinate"

   set mom_sim_address(K2X,leader)                    "K2X"
   set mom_sim_address(K2X,leader_len)                "3"
   set mom_sim_address(K2X,trailer)                   ""
   set mom_sim_address(K2X,trailer_len)               "0"
   set mom_sim_address(K2X,modal)                     "1"
   set mom_sim_address(K2X,format)                    "Coordinate"

   set mom_sim_address(K1X,leader)                    "K1X"
   set mom_sim_address(K1X,leader_len)                "3"
   set mom_sim_address(K1X,trailer)                   ""
   set mom_sim_address(K1X,trailer_len)               "0"
   set mom_sim_address(K1X,modal)                     "1"
   set mom_sim_address(K1X,format)                    "Coordinate"

   set mom_sim_address(K3Y,leader)                    "K3Y"
   set mom_sim_address(K3Y,leader_len)                "3"
   set mom_sim_address(K3Y,trailer)                   ""
   set mom_sim_address(K3Y,trailer_len)               "0"
   set mom_sim_address(K3Y,modal)                     "1"
   set mom_sim_address(K3Y,format)                    "Coordinate"

   set mom_sim_address(K2Y,leader)                    "K2Y"
   set mom_sim_address(K2Y,leader_len)                "3"
   set mom_sim_address(K2Y,trailer)                   ""
   set mom_sim_address(K2Y,trailer_len)               "0"
   set mom_sim_address(K2Y,modal)                     "1"
   set mom_sim_address(K2Y,format)                    "Coordinate"

   set mom_sim_address(K1Y,leader)                    "K1Y"
   set mom_sim_address(K1Y,leader_len)                "3"
   set mom_sim_address(K1Y,trailer)                   ""
   set mom_sim_address(K1Y,trailer_len)               "0"
   set mom_sim_address(K1Y,modal)                     "1"
   set mom_sim_address(K1Y,format)                    "Coordinate"

   set mom_sim_address(K3Z,leader)                    "K3Z"
   set mom_sim_address(K3Z,leader_len)                "3"
   set mom_sim_address(K3Z,trailer)                   ""
   set mom_sim_address(K3Z,trailer_len)               "0"
   set mom_sim_address(K3Z,modal)                     "1"
   set mom_sim_address(K3Z,format)                    "Coordinate"

   set mom_sim_address(K2Z,leader)                    "K2Z"
   set mom_sim_address(K2Z,leader_len)                "3"
   set mom_sim_address(K2Z,trailer)                   ""
   set mom_sim_address(K2Z,trailer_len)               "0"
   set mom_sim_address(K2Z,modal)                     "1"
   set mom_sim_address(K2Z,format)                    "Coordinate"

   set mom_sim_address(K1Z,leader)                    "K1Z"
   set mom_sim_address(K1Z,leader_len)                "3"
   set mom_sim_address(K1Z,trailer)                   ""
   set mom_sim_address(K1Z,trailer_len)               "0"
   set mom_sim_address(K1Z,modal)                     "1"
   set mom_sim_address(K1Z,format)                    "Coordinate"

   set mom_sim_address(Y,leader)                      "Y"
   set mom_sim_address(Y,leader_len)                  "1"
   set mom_sim_address(Y,trailer)                     ""
   set mom_sim_address(Y,trailer_len)                 "0"
   set mom_sim_address(Y,modal)                       "1"
   set mom_sim_address(Y,format)                      "Coordinate"

   set mom_sim_address(Z,leader)                      "Z"
   set mom_sim_address(Z,leader_len)                  "1"
   set mom_sim_address(Z,trailer)                     ""
   set mom_sim_address(Z,trailer_len)                 "0"
   set mom_sim_address(Z,modal)                       "1"
   set mom_sim_address(Z,format)                      "Coordinate"

   set mom_sim_address(fourth_axis,leader)            "B"
   set mom_sim_address(fourth_axis,leader_len)        "1"
   set mom_sim_address(fourth_axis,trailer)           ""
   set mom_sim_address(fourth_axis,trailer_len)       "0"
   set mom_sim_address(fourth_axis,modal)             "1"
   set mom_sim_address(fourth_axis,format)            "Coordinate"

   set mom_sim_address(fifth_axis,leader)             "B"
   set mom_sim_address(fifth_axis,leader_len)         "1"
   set mom_sim_address(fifth_axis,trailer)            ""
   set mom_sim_address(fifth_axis,trailer_len)        "0"
   set mom_sim_address(fifth_axis,modal)              "1"
   set mom_sim_address(fifth_axis,format)             "Coordinate"

   set mom_sim_address(cycle_number,leader)           ""
   set mom_sim_address(cycle_number,leader_len)       "0"
   set mom_sim_address(cycle_number,trailer)          ""
   set mom_sim_address(cycle_number,trailer_len)      "0"
   set mom_sim_address(cycle_number,modal)            "1"
   set mom_sim_address(cycle_number,format)           "Digit_3"

   set mom_sim_address(J,leader)                      "Y"
   set mom_sim_address(J,leader_len)                  "1"
   set mom_sim_address(J,trailer)                     ""
   set mom_sim_address(J,trailer_len)                 "0"
   set mom_sim_address(J,modal)                       "1"
   set mom_sim_address(J,format)                      "Coordinate"

   set mom_sim_address(K,leader)                      "Z"
   set mom_sim_address(K,leader_len)                  "1"
   set mom_sim_address(K,trailer)                     ""
   set mom_sim_address(K,trailer_len)                 "0"
   set mom_sim_address(K,modal)                       "1"
   set mom_sim_address(K,format)                      "Coordinate"

   set mom_sim_address(R,leader)                      "R"
   set mom_sim_address(R,leader_len)                  "1"
   set mom_sim_address(R,trailer)                     ""
   set mom_sim_address(R,trailer_len)                 "0"
   set mom_sim_address(R,modal)                       "1"
   set mom_sim_address(R,format)                      "Coordinate"

   set mom_sim_address(F,leader)                      "F"
   set mom_sim_address(F,leader_len)                  "1"
   set mom_sim_address(F,trailer)                     ""
   set mom_sim_address(F,trailer_len)                 "0"
   set mom_sim_address(F,modal)                       "1"
   set mom_sim_address(F,format)                      "Feed"

   set mom_sim_address(T,leader)                      ""
   set mom_sim_address(T,leader_len)                  "0"
   set mom_sim_address(T,trailer)                     ""
   set mom_sim_address(T,trailer_len)                 "0"
   set mom_sim_address(T,modal)                       "1"
   set mom_sim_address(T,format)                      "Tcode"

   set mom_sim_address(S,leader)                      "S"
   set mom_sim_address(S,leader_len)                  "1"
   set mom_sim_address(S,trailer)                     ""
   set mom_sim_address(S,trailer_len)                 "0"
   set mom_sim_address(S,modal)                       "1"
   set mom_sim_address(S,format)                      "Digit_5"

   set mom_sim_address(D,leader)                      "D"
   set mom_sim_address(D,leader_len)                  "1"
   set mom_sim_address(D,trailer)                     ""
   set mom_sim_address(D,trailer_len)                 "0"
   set mom_sim_address(D,modal)                       "1"
   set mom_sim_address(D,format)                      "Digit_2"

   set mom_sim_address(H,leader)                      "H"
   set mom_sim_address(H,leader_len)                  "1"
   set mom_sim_address(H,trailer)                     ""
   set mom_sim_address(H,trailer_len)                 "0"
   set mom_sim_address(H,modal)                       "1"
   set mom_sim_address(H,format)                      "Hcode"

   set mom_sim_address(dwell,leader)                  "P"
   set mom_sim_address(dwell,leader_len)              "1"
   set mom_sim_address(dwell,trailer)                 ""
   set mom_sim_address(dwell,trailer_len)             "0"
   set mom_sim_address(dwell,modal)                   "1"
   set mom_sim_address(dwell,format)                  "Dwell_sec"

   set mom_sim_address(cycle_dwell,leader)            "Q211="
   set mom_sim_address(cycle_dwell,leader_len)        "5"
   set mom_sim_address(cycle_dwell,trailer)           ""
   set mom_sim_address(cycle_dwell,trailer_len)       "0"
   set mom_sim_address(cycle_dwell,modal)             "1"
   set mom_sim_address(cycle_dwell,format)            "Dwell_sec"

   set mom_sim_address(P_cutcom,leader)               "P"
   set mom_sim_address(P_cutcom,leader_len)           "1"
   set mom_sim_address(P_cutcom,trailer)              ""
   set mom_sim_address(P_cutcom,trailer_len)          "0"
   set mom_sim_address(P_cutcom,modal)                "1"
   set mom_sim_address(P_cutcom,format)               "Dwell_sec"

   set mom_sim_address(K_cycle,leader)                "K"
   set mom_sim_address(K_cycle,leader_len)            "1"
   set mom_sim_address(K_cycle,trailer)               ""
   set mom_sim_address(K_cycle,trailer_len)           "0"
   set mom_sim_address(K_cycle,modal)                 "1"
   set mom_sim_address(K_cycle,format)                "Coordinate"

   set mom_sim_address(cycle_step1,leader)            "I"
   set mom_sim_address(cycle_step1,leader_len)        "1"
   set mom_sim_address(cycle_step1,trailer)           ""
   set mom_sim_address(cycle_step1,trailer_len)       "0"
   set mom_sim_address(cycle_step1,modal)             "1"
   set mom_sim_address(cycle_step1,format)            "Coordinate"

   set mom_sim_address(cycle_step,leader)             "Q"
   set mom_sim_address(cycle_step,leader_len)         "1"
   set mom_sim_address(cycle_step,trailer)            ""
   set mom_sim_address(cycle_step,trailer_len)        "0"
   set mom_sim_address(cycle_step,modal)              "1"
   set mom_sim_address(cycle_step,format)             "Coordinate"

   set mom_sim_address(Q_cutcom,leader)               "Q"
   set mom_sim_address(Q_cutcom,leader_len)           "1"
   set mom_sim_address(Q_cutcom,trailer)              ""
   set mom_sim_address(Q_cutcom,trailer_len)          "0"
   set mom_sim_address(Q_cutcom,modal)                "1"
   set mom_sim_address(Q_cutcom,format)               "Coordinate"

   set mom_sim_address(E,leader)                      "E"
   set mom_sim_address(E,leader_len)                  "1"
   set mom_sim_address(E,trailer)                     ""
   set mom_sim_address(E,trailer_len)                 "0"
   set mom_sim_address(E,modal)                       "1"
   set mom_sim_address(E,format)                      "Coordinate"

   set mom_sim_address(M_spindle,leader)              "M"
   set mom_sim_address(M_spindle,leader_len)          "1"
   set mom_sim_address(M_spindle,trailer)             ""
   set mom_sim_address(M_spindle,trailer_len)         "0"
   set mom_sim_address(M_spindle,modal)               "1"
   set mom_sim_address(M_spindle,format)              "Digit_2"

   set mom_sim_address(M_range,leader)                "M"
   set mom_sim_address(M_range,leader_len)            "1"
   set mom_sim_address(M_range,trailer)               ""
   set mom_sim_address(M_range,trailer_len)           "0"
   set mom_sim_address(M_range,modal)                 "1"
   set mom_sim_address(M_range,format)                "Digit_2"

   set mom_sim_address(M_coolant,leader)              "M"
   set mom_sim_address(M_coolant,leader_len)          "1"
   set mom_sim_address(M_coolant,trailer)             ""
   set mom_sim_address(M_coolant,trailer_len)         "0"
   set mom_sim_address(M_coolant,modal)               "1"
   set mom_sim_address(M_coolant,format)              "Digit_2"

   set mom_sim_address(M,leader)                      "M"
   set mom_sim_address(M,leader_len)                  "1"
   set mom_sim_address(M,trailer)                     ""
   set mom_sim_address(M,trailer_len)                 "0"
   set mom_sim_address(M,modal)                       "1"
   set mom_sim_address(M,format)                      "Digit_2"

   set mom_sim_nc_func(PROG_STOP)                     "0"
   set mom_sim_nc_func(PROG_OPSTOP)                   "1"
   set mom_sim_nc_func(PROG_END)                      "2"
   set mom_sim_nc_func(TOOL_CHANGE)                   "6"
   set mom_sim_nc_func(PROG_STOP_REWIND)              "30"

   set mom_sim_address(cycle_rapid_to,leader)         "Q200="
   set mom_sim_address(cycle_rapid_to,leader_len)     "5"
   set mom_sim_address(cycle_rapid_to,trailer)        ""
   set mom_sim_address(cycle_rapid_to,trailer_len)    "0"
   set mom_sim_address(cycle_rapid_to,modal)          "1"
   set mom_sim_address(cycle_rapid_to,format)         "Coordinate"

   set mom_sim_address(cycle_pullback,leader)         "Q204="
   set mom_sim_address(cycle_pullback,leader_len)     "5"
   set mom_sim_address(cycle_pullback,trailer)        ""
   set mom_sim_address(cycle_pullback,trailer_len)    "0"
   set mom_sim_address(cycle_pullback,modal)          "1"
   set mom_sim_address(cycle_pullback,format)         "Coordinate"

   set mom_sim_address(N,leader)                      ""
   set mom_sim_address(N,leader_len)                  "0"
   set mom_sim_address(N,trailer)                     ""
   set mom_sim_address(N,trailer_len)                 "0"
   set mom_sim_address(N,modal)                       "1"
   set mom_sim_address(N,format)                      "Digit_4"

   set mom_sim_address(cycle_tap_lead,leader)         "Q239="
   set mom_sim_address(cycle_tap_lead,leader_len)     "5"
   set mom_sim_address(cycle_tap_lead,trailer)        ""
   set mom_sim_address(cycle_tap_lead,trailer_len)    "0"
   set mom_sim_address(cycle_tap_lead,modal)          "1"
   set mom_sim_address(cycle_tap_lead,format)         "Coordinate"

   set mom_sim_address(cycle_feed_to,leader)          "Q201="
   set mom_sim_address(cycle_feed_to,leader_len)      "5"
   set mom_sim_address(cycle_feed_to,trailer)         ""
   set mom_sim_address(cycle_feed_to,trailer_len)     "0"
   set mom_sim_address(cycle_feed_to,modal)           "1"
   set mom_sim_address(cycle_feed_to,format)          "Coordinate"

   set mom_sim_address(cycle_plunge,leader)           "Q202="
   set mom_sim_address(cycle_plunge,leader_len)       "5"
   set mom_sim_address(cycle_plunge,trailer)          ""
   set mom_sim_address(cycle_plunge,trailer_len)      "0"
   set mom_sim_address(cycle_plunge,modal)            "1"
   set mom_sim_address(cycle_plunge,format)           "Coordinate"

   set mom_sim_address(cycle_dwell_top,leader)        "Q210="
   set mom_sim_address(cycle_dwell_top,leader_len)    "5"
   set mom_sim_address(cycle_dwell_top,trailer)       ""
   set mom_sim_address(cycle_dwell_top,trailer_len)   "0"
   set mom_sim_address(cycle_dwell_top,modal)         "1"
   set mom_sim_address(cycle_dwell_top,format)        "Coordinate"

   set mom_sim_address(cycle_surface,leader)          "Q203="
   set mom_sim_address(cycle_surface,leader_len)      "5"
   set mom_sim_address(cycle_surface,trailer)         ""
   set mom_sim_address(cycle_surface,trailer_len)     "0"
   set mom_sim_address(cycle_surface,modal)           "1"
   set mom_sim_address(cycle_surface,format)          "Coordinate"

   set mom_sim_address(cycle_dwell_depth,leader)      "Q211="
   set mom_sim_address(cycle_dwell_depth,leader_len)  "5"
   set mom_sim_address(cycle_dwell_depth,trailer)     ""
   set mom_sim_address(cycle_dwell_depth,trailer_len)  "0"
   set mom_sim_address(cycle_dwell_depth,modal)       "1"
   set mom_sim_address(cycle_dwell_depth,format)      "AbsCoord"

   set mom_sim_address(circle_direction,leader)       ""
   set mom_sim_address(circle_direction,leader_len)   "0"
   set mom_sim_address(circle_direction,trailer)      ""
   set mom_sim_address(circle_direction,trailer_len)  "0"
   set mom_sim_address(circle_direction,modal)        "1"
   set mom_sim_address(circle_direction,format)       "String"

   set mom_sim_address(user_add,leader)               ""
   set mom_sim_address(user_add,leader_len)           "0"
   set mom_sim_address(user_add,trailer)              ""
   set mom_sim_address(user_add,trailer_len)          "0"
   set mom_sim_address(user_add,modal)                "1"
   set mom_sim_address(user_add,format)               "String"

   set mom_sim_address(user_add_1,leader)             ""
   set mom_sim_address(user_add_1,leader_len)         "0"
   set mom_sim_address(user_add_1,trailer)            ""
   set mom_sim_address(user_add_1,trailer_len)        "0"
   set mom_sim_address(user_add_1,modal)              "1"
   set mom_sim_address(user_add_1,format)             "String"

   set mom_sim_address(cutter_comp,leader)            ""
   set mom_sim_address(cutter_comp,leader_len)        "0"
   set mom_sim_address(cutter_comp,trailer)           ""
   set mom_sim_address(cutter_comp,trailer_len)       "0"
   set mom_sim_address(cutter_comp,modal)             "1"
   set mom_sim_address(cutter_comp,format)            "String"

   set mom_sim_address(star_of_program,leader)        "BEGIN PGM"
   set mom_sim_address(star_of_program,leader_len)    "9"
   set mom_sim_address(star_of_program,trailer)       ""
   set mom_sim_address(star_of_program,trailer_len)   "0"
   set mom_sim_address(star_of_program,modal)         "1"
   set mom_sim_address(star_of_program,format)        "String"

   set mom_sim_address(G_cutcom,leader)               ""
   set mom_sim_address(G_cutcom,leader_len)           "0"
   set mom_sim_address(G_cutcom,trailer)              ""
   set mom_sim_address(G_cutcom,trailer_len)          "0"
   set mom_sim_address(G_cutcom,modal)                "1"
   set mom_sim_address(G_cutcom,format)               "Digit_2"

   set mom_sim_nc_func(CUTCOM_LEFT)                   "RL"
   set mom_sim_nc_func(CUTCOM_RIGHT)                  "RR"
   set mom_sim_nc_func(CUTCOM_OFF)                    "R0"

   set mom_sim_address(cycle_orient,leader)           "Q"
   set mom_sim_address(cycle_orient,leader_len)       "1"
   set mom_sim_address(cycle_orient,trailer)          ""
   set mom_sim_address(cycle_orient,trailer_len)      "0"
   set mom_sim_address(cycle_orient,modal)            "1"
   set mom_sim_address(cycle_orient,format)           "Coordinate"

   set mom_sim_format(AbsCoord,type)                  "Numeral"
   set mom_sim_format(AbsCoord,plus)                  "0"
   set mom_sim_format(AbsCoord,lead_zero)             "0"
   set mom_sim_format(AbsCoord,integer)               "5"
   set mom_sim_format(AbsCoord,decimal)               "1"
   set mom_sim_format(AbsCoord,fraction)              "3"
   set mom_sim_format(AbsCoord,trail_zero)            "0"

   set mom_sim_format(Coordinate,type)                "Numeral"
   set mom_sim_format(Coordinate,plus)                "0"
   set mom_sim_format(Coordinate,lead_zero)           "0"
   set mom_sim_format(Coordinate,integer)             "5"
   set mom_sim_format(Coordinate,decimal)             "1"
   set mom_sim_format(Coordinate,fraction)            "3"
   set mom_sim_format(Coordinate,trail_zero)          "0"

   set mom_sim_format(Digit_2,type)                   "Text String"
   set mom_sim_format(Digit_2,plus)                   "0"
   set mom_sim_format(Digit_2,lead_zero)              "0"
   set mom_sim_format(Digit_2,integer)                ""
   set mom_sim_format(Digit_2,decimal)                "0"
   set mom_sim_format(Digit_2,fraction)               ""
   set mom_sim_format(Digit_2,trail_zero)             "0"

   set mom_sim_format(Digit_3,type)                   "Numeral"
   set mom_sim_format(Digit_3,plus)                   "0"
   set mom_sim_format(Digit_3,lead_zero)              "0"
   set mom_sim_format(Digit_3,integer)                "3"
   set mom_sim_format(Digit_3,decimal)                "0"
   set mom_sim_format(Digit_3,fraction)               "0"
   set mom_sim_format(Digit_3,trail_zero)             "1"

   set mom_sim_format(Digit_4,type)                   "Numeral"
   set mom_sim_format(Digit_4,plus)                   "0"
   set mom_sim_format(Digit_4,lead_zero)              "1"
   set mom_sim_format(Digit_4,integer)                "4"
   set mom_sim_format(Digit_4,decimal)                "0"
   set mom_sim_format(Digit_4,fraction)               "0"
   set mom_sim_format(Digit_4,trail_zero)             "1"

   set mom_sim_format(Digit_5,type)                   "Numeral"
   set mom_sim_format(Digit_5,plus)                   "0"
   set mom_sim_format(Digit_5,lead_zero)              "0"
   set mom_sim_format(Digit_5,integer)                "5"
   set mom_sim_format(Digit_5,decimal)                "0"
   set mom_sim_format(Digit_5,fraction)               "0"
   set mom_sim_format(Digit_5,trail_zero)             "1"

   set mom_sim_format(Dwell_sec,type)                 "Numeral"
   set mom_sim_format(Dwell_sec,plus)                 "0"
   set mom_sim_format(Dwell_sec,lead_zero)            "0"
   set mom_sim_format(Dwell_sec,integer)              "5"
   set mom_sim_format(Dwell_sec,decimal)              "1"
   set mom_sim_format(Dwell_sec,fraction)             "3"
   set mom_sim_format(Dwell_sec,trail_zero)           "0"

   set mom_sim_format(EventNum,type)                  "Numeral"
   set mom_sim_format(EventNum,plus)                  "1"
   set mom_sim_format(EventNum,lead_zero)             "1"
   set mom_sim_format(EventNum,integer)               "3"
   set mom_sim_format(EventNum,decimal)               "0"
   set mom_sim_format(EventNum,fraction)              "0"
   set mom_sim_format(EventNum,trail_zero)            "1"

   set mom_sim_format(Feed,type)                      "Numeral"
   set mom_sim_format(Feed,plus)                      "0"
   set mom_sim_format(Feed,lead_zero)                 "0"
   set mom_sim_format(Feed,integer)                   "7"
   set mom_sim_format(Feed,decimal)                   "1"
   set mom_sim_format(Feed,fraction)                  "2"
   set mom_sim_format(Feed,trail_zero)                "0"

   set mom_sim_format(Feed_DPM,type)                  "Numeral"
   set mom_sim_format(Feed_DPM,plus)                  "0"
   set mom_sim_format(Feed_DPM,lead_zero)             "0"
   set mom_sim_format(Feed_DPM,integer)               "5"
   set mom_sim_format(Feed_DPM,decimal)               "1"
   set mom_sim_format(Feed_DPM,fraction)              "2"
   set mom_sim_format(Feed_DPM,trail_zero)            "0"

   set mom_sim_format(Feed_FRN,type)                  "Numeral"
   set mom_sim_format(Feed_FRN,plus)                  "0"
   set mom_sim_format(Feed_FRN,lead_zero)             "0"
   set mom_sim_format(Feed_FRN,integer)               "5"
   set mom_sim_format(Feed_FRN,decimal)               "1"
   set mom_sim_format(Feed_FRN,fraction)              "3"
   set mom_sim_format(Feed_FRN,trail_zero)            "0"

   set mom_sim_format(Feed_INV,type)                  "Numeral"
   set mom_sim_format(Feed_INV,plus)                  "0"
   set mom_sim_format(Feed_INV,lead_zero)             "0"
   set mom_sim_format(Feed_INV,integer)               "5"
   set mom_sim_format(Feed_INV,decimal)               "1"
   set mom_sim_format(Feed_INV,fraction)              "3"
   set mom_sim_format(Feed_INV,trail_zero)            "0"

   set mom_sim_format(Feed_IPM,type)                  "Numeral"
   set mom_sim_format(Feed_IPM,plus)                  "0"
   set mom_sim_format(Feed_IPM,lead_zero)             "0"
   set mom_sim_format(Feed_IPM,integer)               "4"
   set mom_sim_format(Feed_IPM,decimal)               "1"
   set mom_sim_format(Feed_IPM,fraction)              "0"
   set mom_sim_format(Feed_IPM,trail_zero)            "0"

   set mom_sim_format(Feed_IPR,type)                  "Numeral"
   set mom_sim_format(Feed_IPR,plus)                  "0"
   set mom_sim_format(Feed_IPR,lead_zero)             "0"
   set mom_sim_format(Feed_IPR,integer)               "1"
   set mom_sim_format(Feed_IPR,decimal)               "1"
   set mom_sim_format(Feed_IPR,fraction)              "4"
   set mom_sim_format(Feed_IPR,trail_zero)            "0"

   set mom_sim_format(Feed_MMPM,type)                 "Numeral"
   set mom_sim_format(Feed_MMPM,plus)                 "0"
   set mom_sim_format(Feed_MMPM,lead_zero)            "0"
   set mom_sim_format(Feed_MMPM,integer)              "5"
   set mom_sim_format(Feed_MMPM,decimal)              "1"
   set mom_sim_format(Feed_MMPM,fraction)             "0"
   set mom_sim_format(Feed_MMPM,trail_zero)           "0"

   set mom_sim_format(Feed_MMPR,type)                 "Numeral"
   set mom_sim_format(Feed_MMPR,plus)                 "0"
   set mom_sim_format(Feed_MMPR,lead_zero)            "0"
   set mom_sim_format(Feed_MMPR,integer)              "2"
   set mom_sim_format(Feed_MMPR,decimal)              "1"
   set mom_sim_format(Feed_MMPR,fraction)             "3"
   set mom_sim_format(Feed_MMPR,trail_zero)           "0"

   set mom_sim_format(Hcode,type)                     "Numeral"
   set mom_sim_format(Hcode,plus)                     "0"
   set mom_sim_format(Hcode,lead_zero)                "1"
   set mom_sim_format(Hcode,integer)                  "2"
   set mom_sim_format(Hcode,decimal)                  "0"
   set mom_sim_format(Hcode,fraction)                 "0"
   set mom_sim_format(Hcode,trail_zero)               "1"

   set mom_sim_format(Rev,type)                       "Numeral"
   set mom_sim_format(Rev,plus)                       "0"
   set mom_sim_format(Rev,lead_zero)                  "0"
   set mom_sim_format(Rev,integer)                    "4"
   set mom_sim_format(Rev,decimal)                    "0"
   set mom_sim_format(Rev,fraction)                   "0"
   set mom_sim_format(Rev,trail_zero)                 "1"

   set mom_sim_format(Rotary,type)                    "Numeral"
   set mom_sim_format(Rotary,plus)                    "0"
   set mom_sim_format(Rotary,lead_zero)               "0"
   set mom_sim_format(Rotary,integer)                 "5"
   set mom_sim_format(Rotary,decimal)                 "1"
   set mom_sim_format(Rotary,fraction)                "3"
   set mom_sim_format(Rotary,trail_zero)              "0"

   set mom_sim_format(String,type)                    "Text String"
   set mom_sim_format(String,plus)                    "0"
   set mom_sim_format(String,lead_zero)               "0"
   set mom_sim_format(String,integer)                 ""
   set mom_sim_format(String,decimal)                 "0"
   set mom_sim_format(String,fraction)                ""
   set mom_sim_format(String,trail_zero)              "0"

   set mom_sim_format(Tcode,type)                     "Numeral"
   set mom_sim_format(Tcode,plus)                     "0"
   set mom_sim_format(Tcode,lead_zero)                "0"
   set mom_sim_format(Tcode,integer)                  "2"
   set mom_sim_format(Tcode,decimal)                  "0"
   set mom_sim_format(Tcode,fraction)                 "0"
   set mom_sim_format(Tcode,trail_zero)               "1"

   set mom_sim_format(Zero_int,type)                  "Numeral"
   set mom_sim_format(Zero_int,plus)                  "0"
   set mom_sim_format(Zero_int,lead_zero)             "1"
   set mom_sim_format(Zero_int,integer)               "1"
   set mom_sim_format(Zero_int,decimal)               "0"
   set mom_sim_format(Zero_int,fraction)              "0"
   set mom_sim_format(Zero_int,trail_zero)            "0"

   set mom_sim_format(Zero_real,type)                 "Numeral"
   set mom_sim_format(Zero_real,plus)                 "0"
   set mom_sim_format(Zero_real,lead_zero)            "1"
   set mom_sim_format(Zero_real,integer)              "1"
   set mom_sim_format(Zero_real,decimal)              "1"
   set mom_sim_format(Zero_real,fraction)             "1"
   set mom_sim_format(Zero_real,trail_zero)           "1"

}


#=============================================================
proc PB_CMD_vnc__G_adjust_code { } {
#=============================================================
  global mom_sim_nc_register
  global mom_sim_nc_code
  global mom_sim_nc_func


   if [string match "*$mom_sim_nc_func(TL_ADJUST_PLUS)*" $mom_sim_nc_code] {

     # When there's been a tool change, reset ref junction.
     # We may need to retrieve the actual tool length, if any, from H register.

      global mom_sim_tool_loaded
      global mom_sim_tool_junction

      if { ![string match "" $mom_sim_tool_loaded] } {
         global mom_sim_current_junction

         VNC_set_ref_jct "$mom_sim_tool_loaded"

         set mom_sim_tool_junction "$mom_sim_current_junction"
         set mom_sim_tool_loaded ""

        # Save current junction matrix to define a fictitious junction
        # when next tool is loaded but the WCS is not adjusted.
         global mom_sim_result mom_sim_result1
         global mom_sim_curr_jct_matrix mom_sim_curr_jct_origin

         SIM_ask_init_junction_xform $mom_sim_current_junction

         set mom_sim_curr_jct_matrix "$mom_sim_result"
         set mom_sim_curr_jct_origin "$mom_sim_result1"
      }

      set mom_sim_nc_register(TL_ADJUST) PLUS

   } elseif [string match "*$mom_sim_nc_func(TL_ADJUST_MINUS)*"  $mom_sim_nc_code] {

      set mom_sim_nc_register(TL_ADJUST) MINUS

   } elseif [string match "*$mom_sim_nc_func(TL_ADJUST_CANCEL)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(TL_ADJUST) OFF
   }
}


#=============================================================
proc PB_CMD_vnc__G_misc_code { } {
#=============================================================
  global mom_sim_pos
  global mom_sim_nc_register
  global mom_sim_nc_code
  global mom_sim_nc_func


   if [string match "*$mom_sim_nc_func(DELAY_SEC)*" $mom_sim_nc_code] {

   } elseif [string match "*$mom_sim_nc_func(DELAY_REV)*" $mom_sim_nc_code] {

   } elseif [string match "*$mom_sim_nc_func(UNIT_IN)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(UNIT) IN
      SIM_set_mtd_units "INCH" 

   } elseif [string match "*$mom_sim_nc_func(UNIT_MM)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(UNIT) MM
      SIM_set_mtd_units "MM" 

   } elseif [string match "*$mom_sim_nc_func(RETURN_HOME)*" $mom_sim_nc_code] {

     # Coord specified with this command is stored as the "intermediate point" that
     # the tool will position in rapid mode before going to the reference point.
     # Intermediate point (each axis) stays modal for future G28/G29.
     #
     # This command cancels cutcom and tool offsets.
     #
     # Axes of the "intermediate point" only exist when specified. Default it to
     # the ref. pt. will not be sufficient.
     # The int. pt. floats with respect to the active WCS (G54-59).
     # Reference point is fixed on a machine.

      set mom_sim_nc_register(RETURN_HOME) 1

   } elseif [string match "*$mom_sim_nc_func(RETURN_HOME_P)*" $mom_sim_nc_code] {

     # G30 P2 XYZ -- Return to the 2nd ref pt. P2 can be omitted.
     # G30 P3 XYZ -- Return to the 3rd ref pt.
     # G30 P4 XYZ -- Return to the 4th ref pt.
     #
     # G30 & G28 share the same intermediate point. I think?.

   } elseif [string match "*$mom_sim_nc_func(FROM_HOME)*" $mom_sim_nc_code] {

     # This command is normally issued immediately after a G28.
     #
     # Coord specified with this function is the target that the tool will position.
     # The tool will first position from the ref. pt. to the "intermediate point"
     # that have been defined in the previous G28 command, if any, in rapid mode
     # before going to its final destination.

      set mom_sim_nc_register(FROM_HOME) 1

   } elseif [string match "*$mom_sim_nc_func(MACH_CS_MOVE)*" $mom_sim_nc_code] {

     # Moves to a position in the Machine Coordiante System (MCS).
     # The origin of MCS (Machine Zero, Machine Datum) never changes.
     # One shot deal block. Ignored in incremental mode (G91).
     # MCS is never affected by G92 or G52 (LCS) until machine is powered off.
     # (I think, guess), G53 is used in the M06 macro for the tool change.

      set mom_sim_nc_register(MCS_MOVE) 1

     # Fake WCS offset. Restore it after move.
      set mom_sim_nc_register(WORK_OFFSET) [list]
      lappend mom_sim_nc_register(WORK_OFFSET) 0.0 0.0 0.0 0.0 0.0

   } elseif [string match "*$mom_sim_nc_func(WORK_CS_1)*" $mom_sim_nc_code] {

     # Select Work Coordinate System.
     # Each set of offsets (from Machine Zero) is entered and stored in the machine.
     # G54 is selected when powered on (?).
     # Work zero point offset value can be set in a program by G10 command (??).

      set mom_sim_nc_register(WCS) 1
      set mom_sim_nc_register(WORK_OFFSET) [list]
      foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
         lappend mom_sim_nc_register(WORK_OFFSET) $coord
      }

   } elseif [string match "*$mom_sim_nc_func(WORK_CS_2)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(WCS) 2
      set mom_sim_nc_register(WORK_OFFSET) [list]
      foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
         lappend mom_sim_nc_register(WORK_OFFSET) $coord
      }

   } elseif [string match "*$mom_sim_nc_func(WORK_CS_3)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(WCS) 3
      set mom_sim_nc_register(WORK_OFFSET) [list]
      foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
         lappend mom_sim_nc_register(WORK_OFFSET) $coord
      }

   } elseif [string match "*$mom_sim_nc_func(WORK_CS_4)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(WCS) 4
      set mom_sim_nc_register(WORK_OFFSET) [list]
      foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
         lappend mom_sim_nc_register(WORK_OFFSET) $coord
      }

   } elseif [string match "*$mom_sim_nc_func(WORK_CS_5)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(WCS) 5
      set mom_sim_nc_register(WORK_OFFSET) [list]
      foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
         lappend mom_sim_nc_register(WORK_OFFSET) $coord
      }

   } elseif [string match "*$mom_sim_nc_func(WORK_CS_6)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(WCS) 6
      set mom_sim_nc_register(WORK_OFFSET) [list]
      foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
         lappend mom_sim_nc_register(WORK_OFFSET) $coord
      }

   } elseif [string match "*$mom_sim_nc_func(LOCAL_CS_SET)*" $mom_sim_nc_code] {

     # Shift all WCS. Offsets are specified.
     #
     # Specify a local coordiante system within the active work coordinate system.
     # Shifts will be applied to All WCS.
     # G52 IP0 or G92 command cancels this command.

      set mom_sim_nc_register(SET_LOCAL) 1

   } elseif [string match "*$mom_sim_nc_func(WORK_CS_RESET)*" $mom_sim_nc_code] {

    #<07-18-03 gsl>
     # Disable work coord reset if S is in the block.
     # G92 is used to set max spindle speed.
      global mom_sim_o_buffer mom_sim_address
      if {[VNC_parse_nc_code $mom_sim_o_buffer $mom_sim_address(S,leader)] == 1 } {
return
      }


     # Modify Work Coordinate System (G54 - G59).
     #
     # This command immediately make current pos a new origin of the working coordiante system
     # The offsets are added to ALL work coordinate systems (G54 - G59).
     # Subsequent reference to any of the WCS will have the offsets in effect.
     #
     # XYZ specified with this command will be used to position the tool from new origin.
     # A Manual Reference Point Return cancels G92. All WCS return to normal (??).

#<08-08-03 gsl> Defer offsets calculation until entire block is parsed in VNC_sim_nc_block.
      set mom_sim_nc_register(RESET_WCS) 1
PB_VNC_send_message "-- RESET WCS"

if 0 {
      set mom_sim_nc_register(LOCAL_OFFSET) [list]
      set i 0
      foreach coord $mom_sim_nc_register(WORK_OFFSET) {
         lappend mom_sim_nc_register(LOCAL_OFFSET) [expr $mom_sim_pos($i) - $coord]
         incr i
      }
}

   }
}


#=============================================================
proc PB_CMD_vnc__G_mode_code { } {
#=============================================================
  global mom_sim_nc_register
  global mom_sim_nc_code
  global mom_sim_nc_func


   if [string match "*$mom_sim_nc_func(INPUT_ABS)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(INPUT) ABS

   } elseif [string match "*$mom_sim_nc_func(INPUT_INC)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(INPUT) INC
   }
}


#=============================================================
proc PB_CMD_vnc__G_motion_code { } {
#=============================================================
  global mom_sim_nc_register
  global mom_sim_nc_code
  global mom_sim_nc_func


   if [string match "*$mom_sim_nc_func(MOTION_RAPID)*"               $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "RAPID"

   } elseif [string match "*$mom_sim_nc_func(MOTION_LINEAR)*"        $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "LINEAR"

   } elseif [string match "*$mom_sim_nc_func(MOTION_CIRCULAR_CLW)*"  $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CIRCULAR_CLW"

   } elseif [string match "*$mom_sim_nc_func(MOTION_CIRCULAR_CCLW)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CIRCULAR_CCLW"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_DRILL)*"          $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_DRILL"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_DRILL_DWELL)*"    $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_DRILL_DWELL"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_DRILL_DEEP)*"     $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_DRILL_DEEP"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_DRILL_BREAK_CHIP)*"  $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_DRILL_BREAK_CHIP"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_TAP)*"               $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_TAP"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_BORE)*"              $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_BORE"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_BORE_DRAG)*"         $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_BORE_DRAG"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_BORE_NO_DRAG)*"      $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_BORE_NO_DRAG"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_BORE_BACK)*"         $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_BORE_BACK"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_BORE_MANUAL)*"       $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_BORE_MANUAL"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_BORE_MANUAL_DWELL)*" $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_BORE_MANUAL_DWELL"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_START)*"             $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_START"

   } elseif [string match "*$mom_sim_nc_func(CYCLE_OFF)*"               $mom_sim_nc_code] {

      set mom_sim_nc_register(MOTION) "CYCLE_OFF"

   }
}


#=============================================================
proc PB_CMD_vnc__G_plane_code { } {
#=============================================================
  global mom_sim_nc_register
  global mom_sim_nc_code
  global mom_sim_nc_func
  global mom_sim_cycle_spindle_axis


   if [string match "*$mom_sim_nc_func(PLANE_XY)*"        $mom_sim_nc_code] {

      set mom_sim_nc_register(PLANE) XY
      set mom_sim_cycle_spindle_axis 2

   } elseif [string match "*$mom_sim_nc_func(PLANE_ZX)*"  $mom_sim_nc_code] {

      set mom_sim_nc_register(PLANE) ZX
      set mom_sim_cycle_spindle_axis 1

   } elseif [string match "*$mom_sim_nc_func(PLANE_YZ)*"  $mom_sim_nc_code] {

      set mom_sim_nc_register(PLANE) YZ
      set mom_sim_cycle_spindle_axis 0
   }
}


#=============================================================
proc PB_CMD_vnc__M_misc_code { } {
#=============================================================
  global mom_sim_nc_register
  global mom_sim_nc_code
  global mom_sim_nc_func


   if [string match "*$mom_sim_nc_func(PROG_STOP)*"         $mom_sim_nc_code] {

   } elseif [string match "*$mom_sim_nc_func(PROG_OPSTOP)*" $mom_sim_nc_code] {

   } elseif [string match "*$mom_sim_nc_func(PROG_END)*"    $mom_sim_nc_code] {

     # Reset following functions on NC controller to the initial state.
     # (Fanuc System 9 Series)
     #
     #  G22 - Store stroke limit function ON
     #  G40 - Cutcom OFF
     #  G49 - Tool length adjust OFF
     #  G50 - Scaling OFF
     #  G54 - Work coordinate system 1
     #  G64 - Cutting mode
     #  G67 - Macro modal call cancel
     #  G69 - Coordinate system rotation OFF
     #  G80 - Canned cycle cancel
     #  G98 - Return to initial level (cycle)

      VNC_reset_controller

   } elseif [string match "*$mom_sim_nc_func(TOOL_CHANGE)*"      $mom_sim_nc_code] {

      VNC_tool_change

   } elseif [string match "*$mom_sim_nc_func(PROG_STOP_REWIND)*" $mom_sim_nc_code] {

      VNC_rewind_stop_program

   } else {
   }
}


#=============================================================
proc PB_CMD_vnc__R_code { } {
#=============================================================
  global mom_sim_nc_register

   set mom_sim_nc_register(R_IN_USE) 1
}


#=============================================================
proc PB_CMD_vnc____map_machine_tool_axes { } {
#=============================================================
  global mom_sim_address
  global mom_sim_num_machine_axes
  global mom_sim_mt_axis
  global mom_sim_result mom_sim_result1
  global mom_sim_zcs_base
  global mom_sim_spindle_comp mom_sim_spindle_jct
  global mom_sim_reverse_4th_table mom_sim_reverse_5th_table
  global mom_sim_machine_head


  #####################################################
  #
  # Configure parameters set between ##>>>>> & ##<<<<<.
  #
  #####################################################

##>>>>>
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # When desired, override the default number of machine axes
  # to change the number of controllable axes.
  # By default, this parameter has been set according to the post already.
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ## set mom_sim_num_machine_axes 5

  #++++++++++++++++++++++++++++++++++++++++++
  # Fetch physical axes (machine tool model). 
  #++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_mt_axis(X) X
   set mom_sim_mt_axis(Y) Y
   set mom_sim_mt_axis(Z) Z

   switch $mom_sim_num_machine_axes {
      "4" {
         set mom_sim_mt_axis(4) A
      }
      "5" {
         set mom_sim_mt_axis(4) B
         set mom_sim_mt_axis(5) C
      }
   }

  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Specify a component as ZCS base to be referenced in PB_VNC_csys.
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_zcs_base "MACHINE_BASE"

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Define spindle component and its junction for mounting tools.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_spindle_comp "B_HEAD"
   set mom_sim_spindle_jct  "SPINDLE_JUNCTION"

  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Reverse axis of rotation for 4th and/or 5th rotary table,
  # if they are not set accordingly in the machine tool model.
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   if { $mom_sim_num_machine_axes > 3 } {
      set mom_sim_reverse_4th_table  0
      set mom_sim_reverse_5th_table  0
   }

  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # If necessary, define junction for advanced kinematics
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++
  global mom_sim_advanced_kinematic_jct
  ##   set mom_sim_advanced_kinematic_jct "ROT_JCT"
##<<<<<



  # For this machine that all physical axes participate in executing a motion. 
  # Include all logical names for axes.

  # Map logical names (addresses) to physical axes (machine tool model). 
   SIM_set_linear_axes_map [concat $mom_sim_address(X,leader) $mom_sim_mt_axis(X)  $mom_sim_address(Y,leader) $mom_sim_mt_axis(Y)  $mom_sim_address(Z,leader) $mom_sim_mt_axis(Z)]

   SIM_set_linear_axes_config  [concat $mom_sim_mt_axis(X) $mom_sim_mt_axis(Y) $mom_sim_mt_axis(Z)]

   switch $mom_sim_num_machine_axes {
      "4" {
         SIM_set_rotary_axes_map     [concat $mom_sim_address(fourth_axis,leader) $mom_sim_mt_axis(4)]
         SIM_set_rotary_axes_config  [concat $mom_sim_mt_axis(4)]
      }
      "5" {
         SIM_set_rotary_axes_map     [concat $mom_sim_address(fourth_axis,leader) $mom_sim_mt_axis(4)  $mom_sim_address(fifth_axis,leader)  $mom_sim_mt_axis(5)]
         SIM_set_rotary_axes_config  [concat $mom_sim_mt_axis(4) $mom_sim_mt_axis(5)]
      }
   }
}


#=============================================================
proc PB_CMD_vnc____set_nc_definitions { } {
#=============================================================
#
# User defines additional parameters not set in the post.
#
  global mom_sim_word_separator mom_sim_word_separator_len
  global mom_sim_end_of_block mom_sim_end_of_block_len
  global mom_sim_address
  global mom_sim_wcs_offsets
  global mom_sim_control_out mom_sim_control_in
  global mom_sim_nc_register
  global mom_sim_nc_func
  global mom_sim_prog_rewind_stop_code
  global mom_sim_other_nc_codes
  global mom_sim_incr_linear_addrs
  global mom_sim_control_var_leader


  ################################################
  #
  # Add other NC codes that need to be simulated
  # but may have not been defined in Post Builder.
  #
  ################################################

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Define program rewind stop code here.  This will not be needed
  # in the future when UI for this code is implemented in PB.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_prog_rewind_stop_code "%"

  #++++++++++++++++++++++++++++++++++++++++++++
  # Define leader for the controller variables.
  #++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_control_var_leader    "#"

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Set default N/C input mode.  This value will be used
  # when no input mode function is specified in the N/C code.
  # It's also used as the intial mode when controller is reset.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_nc_register(INPUT)          ABS
   set mom_sim_nc_register(DEF_INPUT)      $mom_sim_nc_register(INPUT)


  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Specify NC codes that will cause movement of other devices.
  # Reaction to each code should be defined in  PB_CMD_vnc____sim_other_devides.
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_other_nc_codes [list]


  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Specify MOM Addresses used to command incremental linear axis movements.
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_incr_linear_addrs [list]


  #+++++++++++++++++++++++++++++++++++++++++++
  # Other G codes not defined in Post Builder
  # but referenced in simulation.
  #+++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_nc_func(RETURN_HOME_P)       "30"
   set mom_sim_nc_func(FROM_HOME)           "29"
   set mom_sim_nc_func(MACH_CS_MOVE)        "53"
   set mom_sim_nc_func(WORK_CS_1)           "54"
   set mom_sim_nc_func(WORK_CS_2)           "55"
   set mom_sim_nc_func(WORK_CS_3)           "56"
   set mom_sim_nc_func(WORK_CS_4)           "57"
   set mom_sim_nc_func(WORK_CS_5)           "58"
   set mom_sim_nc_func(WORK_CS_6)           "59"
   set mom_sim_nc_func(LOCAL_CS_SET)        "52"

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Actual Work coordinate offsets may need to be defined here
  # if they can not be passed from a UG/CAM Program.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   set mom_sim_wcs_offsets(0) [list]
   set mom_sim_wcs_offsets(1) [list]
   set mom_sim_wcs_offsets(2) [list]
   set mom_sim_wcs_offsets(3) [list]
   set mom_sim_wcs_offsets(4) [list]
   set mom_sim_wcs_offsets(5) [list]
   set mom_sim_wcs_offsets(6) [list]
   lappend mom_sim_wcs_offsets(0) 0.0 0.0 0.0 0.0 0.0
   lappend mom_sim_wcs_offsets(1) 0.0 0.0 0.0 0.0 0.0
   lappend mom_sim_wcs_offsets(2) 0.0 0.0 0.0 0.0 0.0
   lappend mom_sim_wcs_offsets(3) 0.0 0.0 0.0 0.0 0.0
   lappend mom_sim_wcs_offsets(4) 0.0 0.0 0.0 0.0 0.0
   lappend mom_sim_wcs_offsets(5) 0.0 0.0 0.0 0.0 0.0
   lappend mom_sim_wcs_offsets(6) 0.0 0.0 0.0 0.0 0.0
}


#=============================================================
proc PB_CMD_vnc____sim_other_devices { } {
#=============================================================
  global mom_sim_o_buffer
  global mom_sim_result mom_sim_result1
  global mom_sim_tool_loaded
  global mom_sim_spindle_comp mom_sim_spindle_jct
  global mom_sim_nc_register
  global mom_sim_address mom_sim_format

  global mom_sim_other_nc_codes
  global mom_sim_nc_address
  global mom_sim_nc_code
  global mom_sim_pos mom_sim_prev_pos
  global mom_sim_simulate_block


  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Specify action for each code encountered.
  #
  # Codes to be simulated are defined by mom_sim_other_nc_codes in
  # PB_CMD_vnc____set_nc_definitions.
  #
  # Example here has been defined for Mazak Integrex 200.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
if 0 { ;# We will implement the details later.
   switch $mom_sim_nc_address {

      T    { ;# Tool change
         PB_CMD_vnc__tool_change
         VNC_restore_pos_no_sim
      }

      G110 { ;# Cross machining starts

         set mom_sim_nc_register(CROSS_MACHINING) 1
         VNC_restore_pos_no_sim

        # Retain info of actual tool spindle to be restored
        # @ the end of cross-machining.

        # Retain original home position of the tool spindle.

        # Select sub spindle as the tool spindle for subsequent moves.

        # Retrieve sub spindle's home origin for the return move.

      }

      M306 { ;# Sub spindle unclamp
         set jaw1 CHUCK2_JAW1
         set jaw2 CHUCK2_JAW2
         set jaw3 CHUCK2_JAW3


         SIM_update
      }

      M307 { ;# Sub spindle clamp
         SIM_update
      }

      G31  { ;# Skip function
         VNC_restore_pos_no_sim
      }

      M06  { ;# Main spindle unclamp

        # Transfer part from main spindle to sub spindle.

         SIM_update
      }

      M07  { ;# Main spindle clamp
         SIM_update
      }

      G111 { ;# Cross machining ends

         set mom_sim_nc_register(CROSS_MACHINING) 0

        # Restore actual tool spindle

        # Restore tool spindle home position.
      }
   }
}

   switch $mom_sim_nc_address {

      T    { ;# Tool change
         PB_CMD_vnc__tool_change

        # Restore 4th axis (B) register, if it's present in the block for tool change purpose.
         if {[VNC_parse_nc_code $mom_sim_o_buffer $mom_sim_address(fourth_axis,leader)] == 1 } {
            set mom_sim_pos(3) $mom_sim_prev_pos(3)
         }

        # Disable further simulation
         set mom_sim_simulate_block 0
      }

      G110 { ;# Cross machining starts

         SIM_update

         set mom_sim_nc_register(CROSS_MACHINING) 1
         VNC_restore_pos_no_sim

        # Sub spindle unclamp
         set jaw1 CHUCK1_JAW1
         set jaw2 CHUCK1_JAW2
         set jaw3 CHUCK1_JAW3

         SIM_ask_axis_position $jaw1
         set jaw1_pos $mom_sim_result
         SIM_ask_axis_position $jaw2
         set jaw2_pos $mom_sim_result
         SIM_ask_axis_position $jaw3
         set jaw3_pos $mom_sim_result

         set jaw1 CHUCK2_JAW1
         set jaw2 CHUCK2_JAW2
         set jaw3 CHUCK2_JAW3

         set relay1 10
         set relay2 100

         SIM_move_linear_axis $relay1 $jaw1 1.5
         SIM_move_linear_axis $relay1 $jaw2 1.5
         SIM_move_linear_axis $relay1 $jaw3 1.5
         SIM_update

        # Move subspindle to part
         SIM_mount_kim_comp $relay2 Z_SUB_RAM CHUCK2 PART PART_SUB_JCT
         SIM_update

        # Sub spindle clamp
         SIM_move_linear_axis $relay1 $jaw1 $jaw1_pos
         SIM_move_linear_axis $relay1 $jaw2 $jaw2_pos
         SIM_move_linear_axis $relay1 $jaw3 $jaw3_pos
         SIM_update

        # Main spindle unclamp
         set jaw1 CHUCK1_JAW1
         set jaw2 CHUCK1_JAW2
         set jaw3 CHUCK1_JAW3

         SIM_move_linear_axis $relay1 $jaw1 1.5
         SIM_move_linear_axis $relay1 $jaw2 1.5
         SIM_move_linear_axis $relay1 $jaw3 1.5
         SIM_update

        # Return subspindle
         SIM_mount_kim_comp $relay2 Z_SUB_RAM Z_SUB_RAM MACHINE_BASE Z_SUB_RAM_BASE
         SIM_mount_kim_comp $relay2 PART PART_SUB_JCT Z_SUB_RAM CHUCK2
         SIM_update
      }

      G111 { ;# Cross machining ends

         set mom_sim_nc_register(CROSS_MACHINING) 0

        # Zero Z register to prepare Local WCS offset for subspindle
         set mom_sim_pos(2) 0
      }

      M200 -
      M201 { ;# Milling mode

         set mom_sim_nc_register(MACHINE_MODE) MILL
      }

      M202 { ;# Turning mode

         set mom_sim_nc_register(MACHINE_MODE) TURN

        # Zero Y.
         global mom_sim_pos
         set mom_sim_pos(1) 0
      }
    }
}


#=============================================================
proc PB_CMD_vnc__circular_move { } {
#=============================================================
  global mom_sim_address mom_sim_pos mom_sim_prev_pos
  global mom_sim_lg_axis
  global mom_sim_nc_register
  global mom_sim_circular_dir mom_sim_circular_plane
  global mom_sim_circular_vector

  global mom_sim_o_buffer


  # Search for R word
   if [info exists mom_sim_nc_register(R_IN_USE)] {

     # Unset it only if not modal!
      if { !$mom_sim_address(R,modal) } {
         unset mom_sim_nc_register(R_IN_USE)
      }
   }

   VNC_parse_nc_code $mom_sim_o_buffer $mom_sim_address(R,leader) PB_CMD_vnc__R_code


   VNC_set_feedrate_mode "CUT"

   set dir $mom_sim_circular_dir
   set plane $mom_sim_circular_plane


  # When "Unsigned Vector - Arc Start to Center" is used to define
  # the arc center vector, fake it into R case for arc center calculation.

   if [string match "Unsigned Vector - Arc Start to Center" $mom_sim_circular_vector] {

      set mom_sim_nc_register(R_IN_USE) 1

      switch $plane {
         "YZ" {
            set dx $mom_sim_pos(6)
            set dy $mom_sim_pos(7)
         }
         "ZX" {
            set dx $mom_sim_pos(7)
            set dy $mom_sim_pos(5)
         }
         default {
            set dx $mom_sim_pos(5)
            set dy $mom_sim_pos(6)
         }
      }

      set mom_sim_nc_register(R) [expr sqrt($dx*$dx + $dy*$dy)]
   }


   if [info exists mom_sim_nc_register(R_IN_USE)] {

      switch $plane {
         "YZ" {
            set dx [expr $mom_sim_pos(1) - $mom_sim_prev_pos(1)]
            set dy [expr $mom_sim_pos(2) - $mom_sim_prev_pos(2)]
         }
         "ZX" {
            set dx [expr $mom_sim_pos(2) - $mom_sim_prev_pos(2)]
            set dy [expr $mom_sim_pos(0) - $mom_sim_prev_pos(0)]
         }
         default {
            set dx [expr $mom_sim_pos(0) - $mom_sim_prev_pos(0)]
            set dy [expr $mom_sim_pos(1) - $mom_sim_prev_pos(1)]
         }
      }

      set r $mom_sim_nc_register(R)
      set a [expr atan2($dy,$dx)]
      set b [expr acos(sqrt($dx*$dx + $dy*$dy) / [expr 2*$r])]

     # Complement of arc
      if [expr $r < 0] {
         set dir [expr -1 * $dir]
      }
      set c [expr $a + $dir*$b]

      switch $plane {
         "YZ" {
            set j [expr $r * cos($c)]
            set k [expr $r * sin($c)]
         }
         "ZX" {
            set k [expr $r * cos($c)]
            set i [expr $r * sin($c)]
         }
         default {
            set i [expr $r * cos($c)]
            set j [expr $r * sin($c)]
         }
      }

   } else {

      switch $mom_sim_circular_vector {
         "Vector - Arc Start to Center" {
            set i [expr $mom_sim_prev_pos(0) + $mom_sim_pos(5)]
            set j [expr $mom_sim_prev_pos(1) + $mom_sim_pos(6)]
            set k [expr $mom_sim_prev_pos(2) + $mom_sim_pos(7)]
         }

         "Vector - Arc Center to Start" {
            set i [expr $mom_sim_prev_pos(0) - $mom_sim_pos(5)]
            set j [expr $mom_sim_prev_pos(1) - $mom_sim_pos(6)]
            set k [expr $mom_sim_prev_pos(2) - $mom_sim_pos(7)]
         }

         "Vector - Absolute Arc Center" {
            set i $mom_sim_pos(5)
            set j $mom_sim_pos(6)
            set k $mom_sim_pos(7)
         }
      }
   }


   global mom_sim_arc_output_mode
   global mom_sim_PI

   switch $plane {
      "YZ" {

        # Handle full circle case using half circle pt
         if [string match "FULL_CIRCLE" $mom_sim_arc_output_mode] {
            if { [expr $mom_sim_pos(1) == $mom_sim_prev_pos(1)] && 
                 [expr $mom_sim_pos(2) == $mom_sim_prev_pos(2)] } {

               set dx [expr $mom_sim_pos(1) - $j]
               set dy [expr $mom_sim_pos(2) - $k]
               set a [expr atan2($dy,$dx)]
               set b [expr $a + $mom_sim_PI]
               set r [expr sqrt($dx*$dx + $dy*$dy)]
               set px [expr $j + $r*cos($b)]
               set py [expr $k + $r*sin($b)]

               SIM_move_circular_zcs $dir 0 0  $mom_sim_lg_axis(Y)        $px  $mom_sim_lg_axis(Z)        $py  $mom_sim_address(J,leader) $j  $mom_sim_address(K,leader) $k
            }
         }

         SIM_move_circular_zcs $dir 0 0  $mom_sim_lg_axis(Y)        $mom_sim_pos(1)  $mom_sim_lg_axis(Z)        $mom_sim_pos(2)  $mom_sim_address(J,leader) $j  $mom_sim_address(K,leader) $k
      }

      "ZX" {

        # Handle full circle case using half circle pt
         if [string match "FULL_CIRCLE" $mom_sim_arc_output_mode] {
            if { [expr $mom_sim_pos(2) == $mom_sim_prev_pos(2)] && 
                 [expr $mom_sim_pos(0) == $mom_sim_prev_pos(0)] } {

               set dx [expr $mom_sim_pos(2) - $k]
               set dy [expr $mom_sim_pos(0) - $i]
               set a [expr atan2($dy,$dx)]
               set b [expr $a + $mom_sim_PI]
               set r [expr sqrt($dx*$dx + $dy*$dy)]
               set px [expr $k + $r*cos($b)]
               set py [expr $i + $r*sin($b)]

               SIM_move_circular_zcs $dir 0 0  $mom_sim_lg_axis(Z)        $px  $mom_sim_lg_axis(X)        $py  $mom_sim_address(K,leader) $k  $mom_sim_address(I,leader) $i
            }
         }

         SIM_move_circular_zcs 0 $dir 0  $mom_sim_lg_axis(Z)        $mom_sim_pos(2)  $mom_sim_lg_axis(X)        $mom_sim_pos(0)  $mom_sim_address(K,leader) $k  $mom_sim_address(I,leader) $i
      }

      default {

        # Handle full circle case using half circle pt
         if [string match "FULL_CIRCLE" $mom_sim_arc_output_mode] {
            if { [expr $mom_sim_pos(0) == $mom_sim_prev_pos(0)] && 
                 [expr $mom_sim_pos(1) == $mom_sim_prev_pos(1)] } {

               set dx [expr $mom_sim_pos(0) - $i]
               set dy [expr $mom_sim_pos(1) - $j]
               set a [expr atan2($dy,$dx)]
               set b [expr $a + $mom_sim_PI]
               set r [expr sqrt($dx*$dx + $dy*$dy)]
               set px [expr $i + $r*cos($b)]
               set py [expr $j + $r*sin($b)]

               SIM_move_circular_zcs $dir 0 0  $mom_sim_lg_axis(X)        $px  $mom_sim_lg_axis(Y)        $py  $mom_sim_address(I,leader) $i  $mom_sim_address(J,leader) $j
            }
         }

         SIM_move_circular_zcs 0 0 $dir  $mom_sim_lg_axis(X)        $mom_sim_pos(0)  $mom_sim_lg_axis(Y)        $mom_sim_pos(1)  $mom_sim_address(I,leader) $i  $mom_sim_address(J,leader) $j
      }
   }
}


#=============================================================
proc PB_CMD_vnc__cycle_move { } {
#=============================================================
  global mom_sim_lg_axis
  global mom_sim_pos mom_sim_prev_pos
  global mom_sim_cycle_rapid_to_pos
  global mom_sim_cycle_feed_to_pos
  global mom_sim_cycle_retract_to_pos
  global mom_sim_cycle_mode


#<07-02-03 gsl>
   set mom_sim_pos(0) $mom_sim_prev_pos(0)
   set mom_sim_pos(1) $mom_sim_prev_pos(1)
   set mom_sim_pos(2) $mom_sim_prev_pos(2)


   if $mom_sim_cycle_mode(start_block) {

     global mom_sim_cycle_spindle_axis
     global mom_sim_cycle_rapid_to_dist
     global mom_sim_cycle_feed_to_dist
     global mom_sim_cycle_retract_to_dist
     global mom_sim_cycle_entry_pos
     global mom_sim_nc_register

      set rapid_to_pos(0) $mom_sim_nc_register(X)
      set rapid_to_pos(1) $mom_sim_nc_register(Y)
      set rapid_to_pos(2) $mom_sim_nc_register(Z)

      if [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) > $rapid_to_pos($mom_sim_cycle_spindle_axis)] {
         set mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) $rapid_to_pos($mom_sim_cycle_spindle_axis)
      }

      set rapid_to_pos($mom_sim_cycle_spindle_axis)  $mom_sim_cycle_rapid_to_pos($mom_sim_cycle_spindle_axis)

      if [string match "*R -*" $mom_sim_cycle_mode(rapid_to)] {
         if [string match "*Distance*" $mom_sim_cycle_mode(rapid_to)] {
            set rapid_to_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) + $mom_sim_cycle_rapid_to_dist]
         }
      }
      set mom_sim_cycle_rapid_to_pos(0) $rapid_to_pos(0)
      set mom_sim_cycle_rapid_to_pos(1) $rapid_to_pos(1)
      set mom_sim_cycle_rapid_to_pos(2) $rapid_to_pos(2)

      set feed_to_pos(0) $mom_sim_nc_register(X)
      set feed_to_pos(1) $mom_sim_nc_register(Y)
      set feed_to_pos(2) $mom_sim_nc_register(Z)
      set feed_to_pos($mom_sim_cycle_spindle_axis)  $mom_sim_cycle_feed_to_pos($mom_sim_cycle_spindle_axis)

      switch $mom_sim_cycle_mode(feed_to) {
         "Distance" {
            set feed_to_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) - $mom_sim_cycle_feed_to_dist]
         }
      }
      set mom_sim_cycle_feed_to_pos(0) $feed_to_pos(0)
      set mom_sim_cycle_feed_to_pos(1) $feed_to_pos(1)
      set mom_sim_cycle_feed_to_pos(2) $feed_to_pos(2)

      set retract_to_pos(0) $mom_sim_nc_register(X)
      set retract_to_pos(1) $mom_sim_nc_register(Y)
      set retract_to_pos(2) $mom_sim_nc_register(Z)
      set retract_to_pos($mom_sim_cycle_spindle_axis)  $mom_sim_cycle_retract_to_pos($mom_sim_cycle_spindle_axis)

      if [string match "K -*" $mom_sim_cycle_mode(retract_to)] {
         if [string match "*Distance*" $mom_sim_cycle_mode(retract_to)] {
            set retract_to_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) + $mom_sim_cycle_retract_to_dist]
         }
      }
      set mom_sim_cycle_retract_to_pos(0) $retract_to_pos(0)
      set mom_sim_cycle_retract_to_pos(1) $retract_to_pos(1)
      set mom_sim_cycle_retract_to_pos(2) $retract_to_pos(2)
   }

   global mom_sim_num_machine_axes
   switch $mom_sim_num_machine_axes {
      4 {
        VNC_move_linear_zcs RAPID $mom_sim_lg_axis(X) $mom_sim_cycle_rapid_to_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_cycle_rapid_to_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_cycle_rapid_to_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3)
      }
      5 {
        VNC_move_linear_zcs RAPID $mom_sim_lg_axis(X) $mom_sim_cycle_rapid_to_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_cycle_rapid_to_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_cycle_rapid_to_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3) $mom_sim_lg_axis(5) $mom_sim_pos(4)
      }
      default {
        VNC_move_linear_zcs RAPID $mom_sim_lg_axis(X) $mom_sim_cycle_rapid_to_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_cycle_rapid_to_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_cycle_rapid_to_pos(2)
      }
   }

   VNC_move_linear_zcs CUT   $mom_sim_lg_axis(X) $mom_sim_cycle_feed_to_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_cycle_feed_to_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_cycle_feed_to_pos(2)

   VNC_move_linear_zcs CUT   $mom_sim_lg_axis(X) $mom_sim_cycle_retract_to_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_cycle_retract_to_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_cycle_retract_to_pos(2)
}


#=============================================================
proc PB_CMD_vnc__cycle_set { } {
#=============================================================
  global mom_sim_o_buffer
  global mom_sim_address mom_sim_pos mom_sim_prev_pos
  global mom_sim_nc_register
  global mom_sim_cycle_mode
  global mom_sim_cycle_rapid_to_pos
  global mom_sim_cycle_feed_to_pos
  global mom_sim_cycle_retract_to_pos
  global mom_sim_cycle_entry_pos
  global mom_sim_cycle_rapid_to_dist
  global mom_sim_cycle_feed_to_dist
  global mom_sim_cycle_retract_to_dist
  global mom_sim_cycle_spindle_axis


   set mom_sim_pos(0) $mom_sim_prev_pos(0)
   set mom_sim_pos(1) $mom_sim_prev_pos(1)
   set mom_sim_pos(2) $mom_sim_prev_pos(2)

   set mom_sim_cycle_rapid_to_pos($mom_sim_cycle_spindle_axis) $mom_sim_pos($mom_sim_cycle_spindle_axis)

   set mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) $mom_sim_pos($mom_sim_cycle_spindle_axis)

   set mom_sim_cycle_feed_to_pos(0) $mom_sim_nc_register(X)
   set mom_sim_cycle_feed_to_pos(1) $mom_sim_nc_register(Y)
   set mom_sim_cycle_feed_to_pos(2) $mom_sim_nc_register(Z)

   switch $mom_sim_cycle_mode(feed_to) {
      "Distance" {
         set mom_sim_cycle_feed_to_dist [expr abs($mom_sim_nc_register(Z))]

         if { $mom_sim_cycle_spindle_axis == 2 } { ;# Z axis
            set mom_sim_cycle_feed_to_pos(2) [expr $mom_sim_pos(2) - $mom_sim_cycle_feed_to_dist]
         } else {
            set mom_sim_cycle_feed_to_pos(2) $mom_sim_pos(2)
         }
         set mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_feed_to_pos($mom_sim_cycle_spindle_axis) + $mom_sim_cycle_feed_to_dist]
      }
   }

   set mom_sim_cycle_rapid_to_pos(0) $mom_sim_cycle_feed_to_pos(0)
   set mom_sim_cycle_rapid_to_pos(1) $mom_sim_cycle_feed_to_pos(1)
   set mom_sim_cycle_rapid_to_pos(2) $mom_sim_cycle_feed_to_pos(2)

   if [string match "Rapid_Traverse_&_R*" $mom_sim_cycle_mode(rapid_to)] {
#      set mom_sim_cycle_rapid_to_pos(0) $mom_sim_pos(0)
#      set mom_sim_cycle_rapid_to_pos(1) $mom_sim_pos(1)
#      set mom_sim_cycle_rapid_to_pos(2) $mom_sim_pos(2)
   }

   if [string match "*R -*" $mom_sim_cycle_mode(rapid_to)] {
      if [string match "*Distance*" $mom_sim_cycle_mode(rapid_to)] {
#         set mom_sim_cycle_rapid_to_pos(2) $mom_sim_pos(2)

#>>>
        # The 1st hole may have been @ rapid-to pos already.
         set mom_sim_cycle_rapid_to_dist [expr abs($mom_sim_nc_register(R))]

         if [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) ==  $mom_sim_pos($mom_sim_cycle_spindle_axis)] {
            set mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) - $mom_sim_cycle_rapid_to_dist]
         }

         set mom_sim_cycle_rapid_to_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) + $mom_sim_cycle_rapid_to_dist]

      } else {
         set mom_sim_cycle_rapid_to_pos($mom_sim_cycle_spindle_axis) $mom_sim_nc_register(R)
      }
   }

   set mom_sim_cycle_retract_to_pos(0) $mom_sim_cycle_rapid_to_pos(0)
   set mom_sim_cycle_retract_to_pos(1) $mom_sim_cycle_rapid_to_pos(1)
   set mom_sim_cycle_retract_to_pos(2) $mom_sim_cycle_rapid_to_pos(2)

   if [string match "K*" $mom_sim_cycle_mode(retract_to)] {
      if [string match "*Distance*" $mom_sim_cycle_mode(retract_to)] {
#         set mom_sim_cycle_retract_to_pos(2) $mom_sim_pos(2)
#>>>
        # The 1st hole may have been @ rapid-to pos already.
         set mom_sim_cycle_retract_to_dist [expr abs($mom_sim_nc_register(K_cycle))]

         if [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) ==  $mom_sim_pos($mom_sim_cycle_spindle_axis)] {
            set mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) - $mom_sim_cycle_retract_to_dist]
         }

         set mom_sim_cycle_retract_to_pos($mom_sim_cycle_spindle_axis)  [expr $mom_sim_cycle_entry_pos($mom_sim_cycle_spindle_axis) + $mom_sim_cycle_retract_to_dist]
      } else {
         set mom_sim_cycle_retract_to_pos($mom_sim_cycle_spindle_axis) $mom_sim_nc_register(K_cycle)
      }

   } elseif [string match "G98/G99*" $mom_sim_cycle_mode(retract_to)] {

      VNC_parse_nc_code $mom_sim_o_buffer $mom_sim_address(G_return,leader)

      global mom_sim_nc_code
      global mom_sim_nc_func

      if [string match "*$mom_sim_nc_func(CYCLE_RETURN_MANUAL)*" $mom_sim_nc_code] {
         switch $mom_sim_cycle_spindle_axis {
            0 {
               set mom_sim_cycle_retract_to_pos($mom_sim_cycle_spindle_axis)  $mom_sim_nc_register(LAST_X)
            }
            1 {
               set mom_sim_cycle_retract_to_pos($mom_sim_cycle_spindle_axis)  $mom_sim_nc_register(LAST_Y)
            }
            default {
               set mom_sim_cycle_retract_to_pos($mom_sim_cycle_spindle_axis)  $mom_sim_nc_register(LAST_Z)
            }
         }
      }
   }


   if { !$mom_sim_cycle_mode(start_block) } {
      PB_CMD_vnc__cycle_move
   }
}


#=============================================================
proc PB_CMD_vnc__from_home { } {
#=============================================================
  global mom_sim_nc_register
  global mom_sim_pos
  global mom_sim_lg_axis


  # Move to the intermediate pt
   set coord_list [list]
   if [info exists mom_sim_nc_register(REF_INT_PT_X)] {
      lappend coord_list $mom_sim_lg_axis(X)  $mom_sim_nc_register(REF_INT_PT_X)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_Y)] {
      lappend coord_list $mom_sim_lg_axis(Y)  $mom_sim_nc_register(REF_INT_PT_Y)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_Z)] {
      lappend coord_list $mom_sim_lg_axis(Z)  $mom_sim_nc_register(REF_INT_PT_Z)
   }

   global mom_sim_num_machine_axes
   if { $mom_sim_num_machine_axes > 3 } {
      if [info exists mom_sim_nc_register(REF_INT_PT_4)] {
         lappend coord_list $mom_sim_lg_axis(4)  $mom_sim_nc_register(REF_INT_PT_4)
      }
   }

   if { $mom_sim_num_machine_axes > 4 } {
      if [info exists mom_sim_nc_register(REF_INT_PT_5)] {
         lappend coord_list $mom_sim_lg_axis(5)  $mom_sim_nc_register(REF_INT_PT_5)
      }
   }

  # Create a temp jct for subsequent moves incase the tool is not set properly.
   VNC_create_tmp_jct


  # Move to the intermediate point.
   if { [llength $coord_list] > 0 } {
      eval VNC_move_linear_zcs RAPID $coord_list
   }

  # Move to target
   switch $mom_sim_num_machine_axes {
      4 {
         VNC_move_linear_zcs RAPID  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3)
      }
      5 {
         VNC_move_linear_zcs RAPID  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3)  $mom_sim_lg_axis(5) $mom_sim_pos(4)
      }
      default {
         VNC_move_linear_zcs RAPID  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)
      }
   }
}


#=============================================================
proc PB_CMD_vnc__init_sim_vars { } {
#=============================================================
  global mom_sim_word_separator mom_sim_word_separator_len
  global mom_sim_end_of_block mom_sim_end_of_block_len
  global mom_sim_pos
  global mom_sim_tool_loaded
  global mom_sim_tool_junction
  global mom_sim_curr_jct_matrix mom_sim_curr_jct_origin
  global mom_sim_nc_register
  global mom_sim_wcs_offsets
  global mom_sim_ug_tool_name
  global mom_sim_spindle_comp mom_sim_spindle_jct
  global mom_sim_mt_axis
  global mom_sim_PI
  global mom_sim_cycle_spindle_axis


  set mom_sim_PI [expr acos(-1.0)]


  # Initialize a null list for other NC codes to simulate.
  # Actual code list will be defined in PB_CMD_vnc____set_nc_definitions.
   global mom_sim_other_nc_codes
   set mom_sim_other_nc_codes [list]


  # Initialize physical machine tool axes assignment
  # So there won't be null variable referenced in subsequent code.
   set mom_sim_mt_axis(X) X
   set mom_sim_mt_axis(Y) Y
   set mom_sim_mt_axis(Z) Z
   set mom_sim_mt_axis(4) A
   set mom_sim_mt_axis(5) B


  # Initialize cycle spindle axis to Z
   set mom_sim_cycle_spindle_axis 2


  # Transfer static data from the Post.
   VNC_set_nc_definitions


  # Add user's NC data definition.
   if [llength [info commands "PB_CMD_vnc__set_nc_definitions"]] {
      PB_CMD_vnc__set_nc_definitions
   } elseif [llength [info commands "PB_CMD_vnc____set_nc_definitions"]] {
      PB_CMD_vnc____set_nc_definitions
   }


  # Map machine tool axes assignments
   PB_CMD_vnc____map_machine_tool_axes


  # Fetch logical axes assignments.
   global mom_sim_lg_axis mom_sim_nc_axes mom_sim_address
   global mom_sim_num_machine_axes

   set mom_sim_lg_axis(X) $mom_sim_address(X,leader)
   set mom_sim_lg_axis(Y) $mom_sim_address(Y,leader)
   set mom_sim_lg_axis(Z) $mom_sim_address(Z,leader)

   set mom_sim_nc_axes [concat $mom_sim_lg_axis(X) $mom_sim_lg_axis(Y) $mom_sim_lg_axis(Z)]

   switch $mom_sim_num_machine_axes {
      4 {
         set mom_sim_lg_axis(4) $mom_sim_mt_axis(4)
         lappend mom_sim_nc_axes $mom_sim_lg_axis(4)
      }
      5 {
         set mom_sim_lg_axis(4) $mom_sim_mt_axis(4)
         set mom_sim_lg_axis(5) $mom_sim_mt_axis(5)
         lappend mom_sim_nc_axes $mom_sim_lg_axis(4) $mom_sim_lg_axis(5)
      }
   }


  # Initialize some data to be used in simulation.

   if { ![info exists mom_sim_ug_tool_name] } {
      set mom_sim_ug_tool_name ""
   }

   if { ![info exists mom_sim_tool_loaded] } {
      set mom_sim_tool_loaded ""
   }

   if { ![info exists mom_sim_tool_junction] } {
      set mom_sim_tool_junction "$mom_sim_spindle_jct"
   }

   if { ![info exists mom_sim_curr_jct_matrix] } {
      lappend mom_sim_curr_jct_matrix 1.0 0.0 0.0  0.0 1.0 0.0  0.0 0.0 1.0
   }

   if { ![info exists mom_sim_curr_jct_origin] } {
      lappend mom_sim_curr_jct_origin 0.0 0.0 0.0
   }

   for {set i 0} {$i < 8} {incr i} {
      if { ![info exists mom_sim_pos($i)] } {
        # set mom_sim_pos($i) ""
         set mom_sim_pos($i) 0
      }
   }


  # Initialize controller state
   if { ![info exists mom_sim_nc_register(MOTION)] } {
      set mom_sim_nc_register(MOTION) RAPID
   }
   if { ![info exists mom_sim_nc_register(UNIT)] } {
      set mom_sim_nc_register(UNIT) IN
   }
   if { ![info exists mom_sim_nc_register(INPUT)] } {
      set mom_sim_nc_register(INPUT) ABS
   }
   if { ![info exists mom_sim_nc_register(STROKE_LIMIT)] } {
      set mom_sim_nc_register(STROKE_LIMIT) ON
   }
   if { ![info exists mom_sim_nc_register(CUTCOM)] } {
      set mom_sim_nc_register(CUTCOM) OFF
   }
   if { ![info exists mom_sim_nc_register(TL_ADJUST)] } {
      set mom_sim_nc_register(TL_ADJUST) OFF
   }
   if { ![info exists mom_sim_nc_register(SCALE)] } {
      set mom_sim_nc_register(SCALE) OFF
   }
   if { ![info exists mom_sim_nc_register(WCS)] } {
      set mom_sim_nc_register(WCS) 1
   }
   if { ![info exists mom_sim_nc_register(MACRO_MODAL)] } {
      set mom_sim_nc_register(MACRO_MODAL) OFF
   }
   if { ![info exists mom_sim_nc_register(WCS_ROTATE)] } {
      set mom_sim_nc_register(WCS_ROTATE) OFF
   }
   if { ![info exists mom_sim_nc_register(CYCLE)] } {
      set mom_sim_nc_register(CYCLE) OFF
   }
   if { ![info exists mom_sim_nc_register(CYCLE_RETURN)] } {
      set mom_sim_nc_register(CYCLE_RETURN) INIT_LEVEL
   }
   if { ![info exists mom_sim_nc_register(RETURN_HOME)] } {
      set mom_sim_nc_register(RETURN_HOME) 0
   }
   if { ![info exists mom_sim_nc_register(FROM_HOME)] } {
      set mom_sim_nc_register(FROM_HOME) 0
   }
   if { ![info exists mom_sim_nc_register(LOCAL_OFFSET)] } {
      set mom_sim_nc_register(LOCAL_OFFSET) [list]
      lappend mom_sim_nc_register(LOCAL_OFFSET) 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
   }
   if { ![info exists mom_sim_nc_register(WORK_OFFSET)] } {
      set mom_sim_nc_register(WORK_OFFSET) [list]
      foreach coord $mom_sim_wcs_offsets($mom_sim_nc_register(WCS)) {
         lappend mom_sim_nc_register(WORK_OFFSET) $coord
      }
   }


  # Initialize subspindle activation state
   set mom_sim_nc_register(CROSS_MACHINING) 0

  # Initialize machine mode
   set mom_sim_nc_register(MACHINE_MODE) MILL

  # Initialize msys state
   global mom_sim_csys_set

   set mom_sim_csys_set 0
}


#=============================================================
proc PB_CMD_vnc__linear_move { } {
#=============================================================
  global mom_sim_lg_axis mom_sim_pos
  global mom_sim_nc_register
  global mom_sim_num_machine_axes


   switch $mom_sim_num_machine_axes {
      4 {
         VNC_move_linear_zcs CUT  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3)
      }

      5 {
         VNC_move_linear_zcs CUT  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3)  $mom_sim_lg_axis(5) $mom_sim_pos(4)
      }
      default {
         VNC_move_linear_zcs CUT  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)
      }
   }

   set mom_sim_nc_register(LAST_X) $mom_sim_pos(0)
   set mom_sim_nc_register(LAST_Y) $mom_sim_pos(1)
   set mom_sim_nc_register(LAST_Z) $mom_sim_pos(2)
}


#=============================================================
proc PB_CMD_vnc__pass_csys_data { } {
#=============================================================
  global mom_sim_control_out mom_sim_control_in
  global mom_csys_matrix

   for { set i 0 } { $i < 12 } { incr i } {
      MOM_output_literal "$mom_sim_control_out CSYS_MTX_$i==$mom_csys_matrix($i) $mom_sim_control_in"
   }
}


#=============================================================
proc PB_CMD_vnc__pass_head_param { } {
#=============================================================
  global mom_sys_postname
  global CURRENT_HEAD
  global mom_sim_control_out mom_sim_control_in

   set post_name $mom_sys_postname($CURRENT_HEAD)

   MOM_output_literal "$mom_sim_control_out HEAD_NAME==$CURRENT_HEAD $mom_sim_control_in"
   MOM_output_literal "$mom_sim_control_out POST_NAME==$post_name $mom_sim_control_in"
}


#=============================================================
proc PB_CMD_vnc__pass_tool_param { } {
#=============================================================
  global mom_sim_control_out mom_sim_control_in
  global mom_tool_name

   MOM_output_literal "$mom_sim_control_out TOOL_NAME==$mom_tool_name $mom_sim_control_in"
}


#=============================================================
proc PB_CMD_vnc__rapid_move { } {
#=============================================================
  global mom_sim_lg_axis mom_sim_pos
  global mom_sim_nc_register
  global mom_sim_num_machine_axes


 # Rapid move will behave like a linear move for now.
 # Eventually we have to handle the dog-leg case.
 # Work-plane-change is already handled by the post.

   switch $mom_sim_num_machine_axes {
      4 {
         VNC_move_linear_zcs RAPID  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3)
      }

      5 {
         VNC_move_linear_zcs RAPID  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)  $mom_sim_lg_axis(4) $mom_sim_pos(3)  $mom_sim_lg_axis(5) $mom_sim_pos(4)
      }

      default {
         VNC_move_linear_zcs RAPID  $mom_sim_lg_axis(X) $mom_sim_pos(0)  $mom_sim_lg_axis(Y) $mom_sim_pos(1)  $mom_sim_lg_axis(Z) $mom_sim_pos(2)
      }
   }

   set mom_sim_nc_register(LAST_X) $mom_sim_pos(0)
   set mom_sim_nc_register(LAST_Y) $mom_sim_pos(1)
   set mom_sim_nc_register(LAST_Z) $mom_sim_pos(2)
}


#=============================================================
proc PB_CMD_vnc__reset_controller { } {
#=============================================================
  global mom_sim_nc_register


  # Initialize controller state
   set mom_sim_nc_register(MOTION)         RAPID
   set mom_sim_nc_register(UNIT)           $mom_sim_nc_register(DEF_UNIT)
   set mom_sim_nc_register(INPUT)          $mom_sim_nc_register(DEF_INPUT)
   set mom_sim_nc_register(STROKE_LIMIT)   ON
   set mom_sim_nc_register(CUTCOM)         OFF
   set mom_sim_nc_register(TL_ADJUST)      OFF
   set mom_sim_nc_register(SCALE)          OFF
   set mom_sim_nc_register(WCS)            0
   set mom_sim_nc_register(MACRO_MODAL)    OFF
   set mom_sim_nc_register(WCS_ROTATE)     OFF
   set mom_sim_nc_register(CYCLE)          OFF
   set mom_sim_nc_register(CYCLE_RETURN)   INIT_LEVEL
   set mom_sim_nc_register(RETURN_HOME)    0
   set mom_sim_nc_register(FROM_HOME)      0
}


#=============================================================
proc PB_CMD_vnc__return_home { } {
#=============================================================
  global mom_sim_nc_register
  global mom_sim_lg_axis
  global mom_sim_num_machine_axes


#<07-31-03 gsl>
  # We'll simulate the subspindle movements with different codes.
   if $mom_sim_nc_register(CROSS_MACHINING) {
return
   }


  # Fetch specified components of the intermediate pt.
   set coord_list [list]
   if [info exists mom_sim_nc_register(REF_INT_PT_X)] {
      lappend coord_list $mom_sim_lg_axis(X)  $mom_sim_nc_register(REF_INT_PT_X)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_Y)] {
      lappend coord_list $mom_sim_lg_axis(Y)  $mom_sim_nc_register(REF_INT_PT_Y)
   }
   if [info exists mom_sim_nc_register(REF_INT_PT_Z)] {
      lappend coord_list $mom_sim_lg_axis(Z)  $mom_sim_nc_register(REF_INT_PT_Z)
   }

   if { $mom_sim_num_machine_axes > 3 } {
      if [info exists mom_sim_nc_register(REF_INT_PT_4)] {
         lappend coord_list $mom_sim_lg_axis(4)  $mom_sim_nc_register(REF_INT_PT_4)
      }
   }

   if { $mom_sim_num_machine_axes > 4 } {
      if [info exists mom_sim_nc_register(REF_INT_PT_5)] {
         lappend coord_list $mom_sim_lg_axis(5)  $mom_sim_nc_register(REF_INT_PT_5)
      }
   }

PB_VNC_send_message "INT PT >$coord_list<"

  # Position tool to intermediate pt, if specified.
   if { [llength $coord_list] > 0 } {
      eval VNC_move_linear_zcs RAPID $coord_list
   }

  # Position spindle (not tool) to reference pt
   PB_CMD_vnc__send_dogs_home

  # Reset controller
   VNC_reset_controller
}


#=============================================================
proc PB_CMD_vnc__rewind_stop_program { } {
#=============================================================
   PB_CMD_vnc__send_dogs_home
   VNC_reset_controller
}


#=============================================================
proc PB_CMD_vnc__send_dogs_home { } {
#=============================================================
  global mom_sim_mt_axis
  global mom_sim_num_machine_axes
  global mom_sim_nc_register


  #<08-06-03 gsl> Move axes directly.
   SIM_move_linear_axis 5 $mom_sim_mt_axis(X) [lindex $mom_sim_nc_register(REF_PT) 0]
   SIM_move_linear_axis 5 $mom_sim_mt_axis(Y) [lindex $mom_sim_nc_register(REF_PT) 1]
   SIM_move_linear_axis 5 $mom_sim_mt_axis(Z) [lindex $mom_sim_nc_register(REF_PT) 2]

PB_VNC_send_message "REF PT >$mom_sim_nc_register(REF_PT)<"

   if [expr $mom_sim_num_machine_axes > 3] {
      SIM_move_rotary_axis 5 $mom_sim_mt_axis(4) 0
   }

   if [expr $mom_sim_num_machine_axes > 4] {
      SIM_move_rotary_axis 5 $mom_sim_mt_axis(5) 0
   }
 
   SIM_update


  # Keep track of current position
   global mom_sim_pos

   set ref_pt [SIM_ask_last_position_zcs]

   set mom_sim_pos(0) [lindex $ref_pt 0]

   if [string match "TURN" $mom_sim_nc_register(MACHINE_MODE)] {
     # Zero Y.
      set mom_sim_pos(1) 0
   } else {
      set mom_sim_pos(1) [lindex $ref_pt 1]
   }
   set mom_sim_pos(2) [lindex $ref_pt 2]
   set mom_sim_pos(3) 0
   set mom_sim_pos(4) 0
   set mom_sim_pos(5) 0
   set mom_sim_pos(6) 0
   set mom_sim_pos(7) 0
}


#=============================================================
proc PB_CMD_vnc__send_message { } {
#=============================================================
   global mom_sim_message

   PB_VNC_send_message "$mom_sim_message"
}


#=============================================================
proc PB_CMD_vnc__set_kinematics { } {
#=============================================================
   PB_VNC_set_kinematics
}


#=============================================================
proc PB_CMD_vnc__set_nc_definitions { } {
#=============================================================
   PB_CMD_vnc____set_nc_definitions

  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Define more codes to be processed for a subordinate VNC.
  #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}


#=============================================================
proc PB_CMD_vnc__set_param_per_msg { } {
#=============================================================
  global mom_sim_msg_key mom_sim_msg_word

   switch $mom_sim_msg_key {

      "TOOL_NAME" {
         global mom_sim_ug_tool_name
         set mom_sim_ug_tool_name "$mom_sim_msg_word"
      }

      "HEAD_NAME" {
         global mom_sim_machine_head
         set mom_sim_machine_head "$mom_sim_msg_word"
      }

      "POST_NAME" {
         global mom_sim_post_name
         set mom_sim_post_name "$mom_sim_msg_word"
      }

      "CYCLE_SPINDLE_AXIS" {
         global mom_sim_cycle_spindle_axis
         set mom_sim_cycle_spindle_axis "$mom_sim_msg_word"
      }

      "FIXTURE_OFFSET" {
      }

      default {
      }
   }


  #<09-30-03 gsl> Added case to grab CSYS_MTX_'s.
   global mom_sim_csys_matrix mom_sim_csys_set

   if [string match "CSYS_MTX_*" $mom_sim_msg_key] {
      set tokens [split $mom_sim_msg_key _]
      set idx [lindex $tokens 2]

      set mom_sim_csys_matrix($idx) "$mom_sim_msg_word"

     # When csys is completely defined, map and set ZCS junction for simulation.
      if { $idx == 11 } {
         PB_CMD_vnc__set_kinematics
         set mom_sim_csys_set 1
      }
   }
}


#=============================================================
proc PB_CMD_vnc__sim_motion { } {
#=============================================================
  global mom_sim_nc_register


#<07-31-03 gsl>
  # We'll simulate the subspindle movements with different codes.
   if $mom_sim_nc_register(CROSS_MACHINING) {
return
   }


  # Create a temp jct for subsequent moves incase the tool is not set properly.
   VNC_create_tmp_jct

   switch $mom_sim_nc_register(MOTION) {
      "RAPID" {
         VNC_rapid_move
      }

      "LINEAR" {
         VNC_linear_move
      }

      "CIRCULAR_CLW" {
         VNC_circular_move CLW
      }

      "CIRCULAR_CCLW" {
         VNC_circular_move CCLW
      }
   }

   if [string match "CYCLE_*" $mom_sim_nc_register(MOTION)] {
      VNC_cycle_move
   }
}


#=============================================================
proc PB_CMD_vnc__sim_other_devices { } {
#=============================================================
   PB_CMD_vnc____sim_other_devices

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # Simulate more devices specific for a subordinate VNC.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++
}


#=============================================================
proc PB_CMD_vnc__tool_change { } {
#=============================================================
  global sim_prev_tool_name 
  global mom_sim_result   
  global mom_sim_ug_tool_name
  global mom_sim_tool_loaded
  global mom_sim_spindle_comp mom_sim_spindle_jct
  global mom_sim_lg_axis 
  global mom_sim_nc_register


  # Position spindle to reference point.
   PB_CMD_vnc__send_dogs_home


   set sim_tool_name ""

   if {$sim_prev_tool_name != $mom_sim_ug_tool_name && $mom_sim_ug_tool_name  != ""} {

#>>>>>
#  This is where you add detailed movements such as rotating tool changer,
#  unmounting old tool and mounting new tool and/or getting next tool in ready position.
#<<<<<

      VNC_unmount_tool $sim_prev_tool_name
      SIM_mount_tool "15" "UG_NAME" $mom_sim_ug_tool_name  "$mom_sim_spindle_comp" "$mom_sim_spindle_jct"

      set sim_tool_name $mom_sim_result 

      if {$sim_tool_name != ""} {
         SIM_activate_tool $sim_tool_name
      }

      SIM_update 

      set sim_prev_tool_name $mom_sim_ug_tool_name
   }


   set mom_sim_tool_loaded $sim_tool_name

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # In the future, we may only want to change the jct when G43.
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   VNC_set_ref_jct $sim_tool_name

   global mom_sim_tool_junction mom_sim_current_junction
   set mom_sim_tool_junction "$mom_sim_current_junction"
}
