##############################################################################
# Author: Javier Garcia - UGS PLM Solutions - Madrid
#         javi.garcia@ugs.com
# Version: 01.00 * 19-Oct-2004 * Initial version
#
#
##############################################################################


  set html_file                  ""
  set html_file_name             ""
  set jg_z_min                   99999


# Open HTML file
proc open_html_file { } {
  global html_file html_file_name
  global mom_output_file_directory mom_output_file_basename
  global mom_group_name
  global mom_jg_image_file

  set mom_jg_image_file ${mom_output_file_directory}${mom_group_name}

  set jg_dll_file t:\\pospro\\graphics_window_2_gif.dll
  if {[file exists $jg_dll_file]} {
    MOM_run_user_function $jg_dll_file ufusr
  } else {
    MOM_output_to_listing_device "** Can't find graphics_window_2_gif.dll"
  }

  set html_file_name "${mom_output_file_directory}${mom_group_name}.html"
  if {[file exists $html_file_name]} { MOM_remove_file $html_file_name }
  set html_file [open "$html_file_name" w]

}


# Generates HTML header
proc start_of_html { } {
  global html_file
  global mom_group_name
  global mom_date
  global mom_part_name
  global jg_z_min

  set img_ext ".gif"
  set jg_image_name $mom_group_name$img_ext
  
  set jg_z_min 99999

  puts $html_file "<html>"
  puts $html_file "<head>"
  puts $html_file "<title>Datos del programa $mom_group_name</title>"
  puts $html_file "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">"
  puts $html_file "</head>"
  puts $html_file ""

  puts $html_file "<body bgcolor=\"#FFFFFF\">"
  puts $html_file "<table width=\"500\" border=\"1\" height=\"500\" align=\"center\">"
  puts $html_file "  <tr>"
  puts $html_file "<td><img src=\"$jg_image_name\" width=\"500\" height=\"500\"></td>"
  puts $html_file "  </tr>"
  puts $html_file "</table>"

  puts $html_file "<table width=\"740\" border=\"1\" align=\"center\" vspace=\"5\">"
  puts $html_file "  <tr>"
  puts $html_file "    <td width=\"126\"><font face=\"Times New Roman, Times, serif\" size=\"3\">Programa NC</font></td>"
  puts $html_file "    <td width=\"291\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$mom_group_name</font></td>"
  puts $html_file "    <td width=\"300\"><font face=\"Times New Roman, Times, serif\" size=\"3\">Fecha: </font>"
  puts $html_file "      <font size=\"2\" face=\"Times New Roman, Times, serif\">$mom_date</font></td>"
  puts $html_file "  </tr>"
  puts $html_file "  <tr>"
  puts $html_file "    <td colspan=\"3\"><font face=\"Times New Roman, Times, serif\" size=\"3\">Fichero "
  puts $html_file "      UG</font>: <font size=\"2\" face=\"Times New Roman, Times, serif\">"
  puts $html_file "      $mom_part_name</font></td>"
  puts $html_file "  </tr>"
  puts $html_file "</table>"

  puts $html_file "</table>"
  puts $html_file "<table width=\"740\" border=\"1\" align=\"center\" vspace=\"5\">"
  puts $html_file "  <tr> "
  puts $html_file "    <td width=\"152\"><font size=\"3\" face=\"Times New Roman, Times, serif\">Operacion</font></td>"
  puts $html_file "    <td width=\"78\"><font size=\"3\" face=\"Times New Roman, Times, serif\">Z min.</font></td>"
  puts $html_file "    <td width=\"49\"><font size=\"3\" face=\"Times New Roman, Times, serif\">F</font></td>"
  puts $html_file "    <td width=\"49\"><font size=\"3\" face=\"Times New Roman, Times, serif\">S</font></td>"
  puts $html_file "    <td width=\"130\"><font size=\"3\" face=\"Times New Roman, Times, serif\">Creces</font></td>"
  puts $html_file "    <td width=\"20\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T</font></td>"
  puts $html_file "    <td width=\"20\"><font size=\"3\" face=\"Times New Roman, Times, serif\">G</font></td>"
  puts $html_file "    <td width=\"64\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T dia.</font></td>"
  puts $html_file "    <td width=\"53\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T rad.</font></td>"
  puts $html_file "    <td width=\"61\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T len.</font></td>"
  puts $html_file "  </tr>"
}


# Generates HTML line
proc put_line_of_html { } {

  global html_file
  global mom_path_name
  global mom_feed_cut_value
  global mom_spindle_rpm
  global mom_stock_part mom_stock_floor
  global mom_operation_type
  global mom_tool_diameter mom_tool_corner1_radius
  global mom_tool_number mom_tool_length
  global mom_fixture_offset_value
  global jg_z_min


# Calculos previos
  set jg_zmin [format "%4.3lf" $jg_z_min] ; set jg_z_min 99999
  set jg_feed [format "%5.0lf" $mom_feed_cut_value]
  set jg_speed [format "%5.0lf" $mom_spindle_rpm]
  if {[info exists mom_stock_floor]} {
    set jg_creces [format "XY %2.3lf Z %2.3lf" $mom_stock_part $mom_stock_floor]
  } else {
    if {$mom_operation_type == "Fixed-axis Surface Contouring"} {
      set jg_creces [format "%2.3lf" $mom_stock_part]
    } else {
      set jg_creces "N/A"
    }
  }
  set jg_tool_num  [format "%2.0lf" $mom_tool_number]
  set jg_tool_fix  [format "%2.0lf" $mom_fixture_offset_value]
  set jg_tool_dia  [format "%3.3lf" $mom_tool_diameter]
  set jg_tool_rad  [format "%2.3lf" $mom_tool_corner1_radius]
  set jg_tool_len  [format "%3.3lf" $mom_tool_length]

  puts $html_file "  <tr> "
  puts $html_file "    <td width=\"152\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$mom_path_name</font></td>"
  puts $html_file "    <td width=\"78\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_zmin</font></td>"
  puts $html_file "    <td width=\"49\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_feed</font></td>"
  puts $html_file "    <td width=\"49\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_speed</font></td>"
  puts $html_file "    <td width=\"130\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_creces</font></td>"
  puts $html_file "    <td width=\"20\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_tool_num</font></td>"
  puts $html_file "    <td width=\"20\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_tool_fix</font></td>"
  puts $html_file "    <td width=\"64\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_tool_dia</font></td>"
  puts $html_file "    <td width=\"53\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_tool_rad</font></td>"
  puts $html_file "    <td width=\"61\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_tool_len</font></td>"
  puts $html_file "  </tr>"
}


# Generates HTML footer
proc foot_of_html { } {

  global html_file

  puts $html_file "</table>"
  puts $html_file "<p>&nbsp;</p>"
  puts $html_file "</body>"
  puts $html_file "</html>"
}


# Close HTML file
proc close_html_file { } {
  global html_file
  close $html_file
}


# Find Z min
proc jg_calcula_limites { } {
  global jg_z_min
  global mom_pos
  global mom_cycle_feed_to_pos

  if {[info exists mom_cycle_feed_to_pos]} {
    if {$mom_cycle_feed_to_pos(2) < $jg_z_min} { set jg_z_min $mom_cycle_feed_to_pos(2) }
  } else {
    if {$mom_pos(2) < $jg_z_min} { set jg_z_min $mom_pos(2) }
  }
}