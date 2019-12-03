##############################################################################
#
#   FILE NAME:  Makino_Post_Options.tcl
#
#
# Description
#   This file is called by the Makino post to set up the various posting
#   options, which are:
#
#           USER COMMENT        user definable
#
#           HIGH SPEED OPTION:  ON              (default - use G05 P10000)
#                               OFF             (select from pulldown - no extra code)
#
#           CIRCULAR INTERP:    ON             (default)
#                               OFF            (select from pulldown)
#
#           GRAPHITE OPTION:    ON              (default - use M413/M412)
#                               OFF             (select from pulldown - no extra code)
#
#           COOLANT:            OFF             (default)
#                               ON              (select from pulldown)
#
#
# Release History:
#	Version 1.0 - 06/03/04
#   Version 1.1 - 06/03/05  -   Moved M06 to a separate line, below the tool call
#                           -   Replaced "ELECTRODE" option with permanent G28 code
#                           -   I,J,K set to non-modal
#                           -   Added Circular Interpolation option (ON/OFF).
#                           -   Moved HS option "OFF" infront of G28 code
#   Version 1.2 - 06/04/13  -   Moved high speed option callout to appear after the
#                               "Tool Adjust register" block.
#                           -   High speed option output changed from "G05 P10000"
#                               to:     M250
#                                       G05 P10000
#                           -   Changed all G00 moves to be G01 F700 - done by changing
#                               G_motion Rapid Move to G_motion Linear Move and created
#                               a new user-defined F-word set to 700.
#   Version 1.3 - 06/04/17  -   Changed Circular Interpolation default to be OFF.
#   Version 1.4 - 06/08/02  -   Added a line in proc "PB_CMD_URC_Set_Home_Position_OSS"
#                               to FORCE ONCE X Y Z output (What was happening was that
#                               because this proc outputs an X0Y0, if the next G01 line of
#                               output started at X0 or Y0, these values would not
#                               be output due to modality).
#   Version 1.5 - 07/02/26  -   Changed circular interpolation default from OFF to ON 
#   Version 1.6 - 07/03/13  -   Changed minimum circular radius from 0.0001" to 0.001"
#                               as well as adding an option to disable output to the
#                               information screen. This was done to decrease the length
#                               of time it takes to post large files.
#
#
#
# Author:  Ulas Chypchar, T.A.S.
# Company: UGS Canada Ltd.
#          2550 Matheson Blvd. E., Suite 130
#          Mississauga, Ontario L4W 4Z1
#          905-212-4500
#
###############################################################################


#==============================================================================
#   Setting default values for the post option values
#==============================================================================
#
set HSOP "ON"
set CINT "ON"
set GROP "ON"
set COOL "OFF"


#==============================================================================
#   Set up the menu buttons to display each item of the arrays above and put the
#   selected item in the entry window to allow it to be slightly modified
#==============================================================================
#
wm title . "Makino POST OPTIONS V1.7"


#                   Title Block for user text input section
#------------------------------------------------------------------------------
label .uti -text "USER TEXT INPUT" \
    -relief sunken -justify center  \
    -font {"Arial" 12 bold} \
    -background gray90

grid .uti -row 0 -column 0 -columnspan 6 -sticky news -padx 10 -pady 10


#                       Menu for User Comment
#------------------------------------------------------------------------------
menubutton  .m_UCOM -font {-size 10 -weight bold} \
            -text "User Comment:" \
            -background honeydew3 \
            -direction below -menu .m_UCOM.m -relief raised

menu .m_UCOM.m -tearoff 0

entry .e_UCOM -textvariable UCOM -relief sunken -width 79 -font {-size 10 -weight bold}
grid .m_UCOM -row 1 -column 0 -columnspan 4 -sticky w -padx 5 -pady 10
grid .e_UCOM -row 1 -column 1 -columnspan 5 -sticky w -padx 5




#                   Title Block for output settings
#------------------------------------------------------------------------------
label .ops -text "OUTPUT SETTINGS" \
    -relief sunken -justify center  \
    -font {"Arial" 12 bold} \
    -background gray90

grid .ops -row 2 -column 0 -columnspan 6 -sticky news -padx 10 -pady 10




#           Menu for setting the High Speed Option (ON or OFF)
#------------------------------------------------------------------------------
menubutton  .m_HSOP -font {-size 10 -weight bold} \
            -text "High Speed Option: " \
            -background LemonChiffon2  \
            -direction below -menu .m_HSOP.m -relief raised

menu .m_HSOP.m -tearoff 0

.m_HSOP.m add command -label "ON" -command {set HSOP "ON"}
.m_HSOP.m add separator
.m_HSOP.m add command -label "OFF" -command {set HSOP "OFF"}
.m_HSOP.m add separator

entry .e_HSOP -textvariable HSOP -relief sunken -width 16 -font {-size 10 -weight bold}

grid .m_HSOP -row 3 -column 0 -sticky w  -padx 10 -pady 15
grid .e_HSOP -row 3 -column 1 -sticky w  -padx 5




#                Menu for selecting circular interpolation mode
#------------------------------------------------------------------------------
menubutton  .m_CINT -font {-size 10 -weight bold} \
            -text "Circular Interp: " \
            -background LemonChiffon2  \
            -direction below -menu .m_CINT.m -relief raised

menu .m_CINT.m -tearoff 0

.m_CINT.m add command -label "ON" -command {set CINT "ON"}
.m_CINT.m add separator
.m_CINT.m add command -label "OFF" -command {set CINT "OFF"}
.m_CINT.m add separator

entry .e_CINT -textvariable CINT -relief sunken -width 16 -font {-size 10 -weight bold}

grid .m_CINT -row 3 -column 2 -sticky w -padx 10 -pady 15
grid .e_CINT -row 3 -column 3 -sticky w -padx 5




#               Menu for setting the Graphite Option (ON or OFF)
#------------------------------------------------------------------------------
menubutton  .m_GROP -font {-size 10 -weight bold} \
            -text "Graphite Option: " \
            -background LemonChiffon2  \
            -direction below -menu .m_GROP.m -relief raised

menu .m_GROP.m -tearoff 0

.m_GROP.m add command -label "ON" -command {set GROP "ON"}
.m_GROP.m add separator
.m_GROP.m add command -label "OFF" -command {set GROP "OFF"}
.m_GROP.m add separator

entry .e_GROP -textvariable GROP -relief sunken -width 16 -font {-size 10 -weight bold}

grid .m_GROP -row 4 -column 0 -sticky w -padx 10 -pady 15
grid .e_GROP -row 4 -column 1 -sticky w -padx 5




#               Menu for setting the Coolant Option (ON or OFF)
#------------------------------------------------------------------------------
menubutton  .m_COOL -font {-size 10 -weight bold} \
            -text "Coolant: " \
            -background LemonChiffon2  \
            -direction below -menu .m_COOL.m -relief raised

menu .m_COOL.m -tearoff 0

.m_COOL.m add command -label "OFF" -command {set COOL "OFF"}
.m_COOL.m add separator
.m_COOL.m add command -label "FLOOD" -command {set COOL "FLOOD"}
.m_COOL.m add separator
.m_COOL.m add command -label "MIST" -command {set COOL "MIST"}
.m_COOL.m add separator
.m_COOL.m add command -label "TAP" -command {set COOL "TAP"}
.m_COOL.m add separator
.m_COOL.m add command -label "THROUGH" -command {set COOL "THROUGH"}
.m_COOL.m add separator

entry .e_COOL -textvariable COOL -relief sunken -width 16 -font {-size 10 -weight bold}

grid .m_COOL -row 4 -column 2 -sticky w -padx 10 -pady 15
grid .e_COOL -row 4 -column 3 -sticky w -padx 5





#                               Separator
#------------------------------------------------------------------------------
label .sep -relief ridge -justify center  \
    -font {"Arial" 3 bold} \
    -background gray90

grid .sep -row 7 -column 0 -columnspan 6 -sticky news -padx 1 -pady 10



button .quit -text " CANCEL  (Use default settings)" -command {UseDefaults} \
        -font {-size 12 -weight bold} \
            -background red1

button .done -text " OKAY  (Use current settings)" -command {ChangeDefaults} \
        -font {-size 12 -weight bold} \
            -background PaleGreen3

grid .done -row 8 -column 0 -columnspan 2 -sticky nsw -padx 5 -pady 10
grid .quit -row 8 -column 4 -columnspan 2 -sticky nse -padx 5 -pady 10




#==============================================================================
#
#
# Arguments:
#
#
# Results:
#
#
#==============================================================================
proc UseDefaults { } {
#==============================================================================

    #--------------------------------------------------------------------------
    #   Preload all of the post variables with their default values
    #   - regardless of whether or not the user entered/selected any other
    #   values.
    #--------------------------------------------------------------------------
    #
    set UCOM "No User Comment"  ; # Causes post to skip this line
    set HSOP "ON"
    set CINT "ON"
    set GROP "ON"
    set COOL "OFF"

    #   Return these values back to Post Builder as a list
    #
    set l_return [list $UCOM $HSOP $CINT $GROP $COOL]

    puts $l_return
    destroy .


}




#==============================================================================
#
#
# Arguments:
#
#
# Results:
#
#
#==============================================================================
proc ChangeDefaults { } {
#==============================================================================

    global  UCOM
    global  HSOP
    global  CINT
    global  GROP
    global  COOL
    


    #==========================================================================
    #   NOTE:   The original input variables are re-mapped to a second set of
    #           variables so that should an invalid entry be made, the main
    #           menu will still display the correct default options and not
    #           error out.
    #==========================================================================


    #--------------------------------------------------------------------------
    #   Check to see whether or not a user comment was entered
    #--------------------------------------------------------------------------
    #
    if {$UCOM == ""} {
        set UC  "No User Comment"   ; # Causes post to skip this line

    } else {
        set UC $UCOM
    }


    #--------------------------------------------------------------------------
    #   Check to make sure that the user didn't enter a bogus High Speed Option:
    #
    #   Valid options = ON or OFF
    #--------------------------------------------------------------------------
    #
    if {[string toupper $HSOP] != "ON" && [string toupper $HSOP] != "OFF" } {
        tk_messageBox   -type ok \
                        -message    "* * * * * YOU HAVE SPECIFIED AN INVALID HIGH SPEED OPTION! \
                        * * * * *\n\nSelect either 'ON' or 'OFF' from the pulldown menu..." \
                        -icon error

        .e_HSOP select clear
        set HSOP "ON"

        return

    } else {
        set HS [string toupper $HSOP]
    }



    #--------------------------------------------------------------------------
    #   Determine the circular interpolation setting:   ON
    #                                                   OFF
    #--------------------------------------------------------------------------
    #
    if {[string toupper $CINT] != "ON" && [string toupper $CINT] != "OFF" } {
        tk_messageBox   -type ok \
                        -message    "* * * * * INVALID OPTION SPECIFIED FOR CIRCULAR INTERPOLATION MODE! \
                        * * * * *\n\nSelect either 'ON' or 'OFF' from the pulldown menu..." \
                        -icon error

        .e_CINT select clear
        set CINT "ON"

        return

    } else {
        set CI [string toupper $CINT]
    }


    #--------------------------------------------------------------------------
    #   Check to make sure that the user didn't enter a bogus Graphite Option:
    #
    #   Valid options = ON or OFF
    #--------------------------------------------------------------------------
    #
    if {[string toupper $GROP] != "ON" && [string toupper $GROP] != "OFF" } {
        tk_messageBox   -type ok \
                        -message    "* * * * * YOU HAVE SPECIFIED AN INVALID GRAPHITE OPTION! \
                        * * * * *\n\nSelect either 'ON' or 'OFF' from the pulldown menu..." \
                        -icon error

        .e_GROP select clear
        set GROP "ON"

        return

    } else {
        set GR [string toupper $GROP]
    }


    #--------------------------------------------------------------------------
    #   Check to make sure that the user didn't enter a bogus Coolant Option:
    #
    #   Valid options = ON or OFF
    #--------------------------------------------------------------------------
    #
    if { [string toupper $COOL] != "OFF" && [string toupper $COOL] != "FLOOD" && \
         [string toupper $COOL] != "MIST" && [string toupper $COOL] != "TAP"  && \
         [string toupper $COOL] != "THROUGH" } {

        tk_messageBox   -type ok \
                        -message    "* * * * * YOU HAVE SPECIFIED AN INVALID COOLANT OPTION! \
                        * * * * *\n\nSelect one of the options from the pulldown menu..." \
                        -icon error

        .e_COOL select clear
        set COOL "OFF"

        return

    } else {
        set CL [string toupper $COOL]
    }



    #--------------------------------------------------------------------------
    #   All entries check out - so return these values back to Post Builder
    #   as a list
    #--------------------------------------------------------------------------
    #
    set l_return [list $UC $HS $CI $GR $CL]

    puts $l_return
    destroy .

}
