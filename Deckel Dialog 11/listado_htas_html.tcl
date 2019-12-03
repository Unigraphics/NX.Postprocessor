##############################################################################
# Author: Javier Garcia - UGS PLM Solutions - Madrid
#         javi.garcia@ugs.com
#
# Version: 01.00 * 24-Apr-2007 * Initial
#
#
#    This file contains the procedures to generate a shop documentation in
# HTML format. This documentation is a list of tools used in a particular program
#
##############################################################################

#       Javi's variables

  set html_file                   ""
  set html_file_name              ""
  set listado_total_htas          ""
  set n_listado_total_htas        0
  set listado_num_htas            ""


####################################################
####################################################


# Open HTML file
proc JG_open_html_file { } {

  global html_file html_file_name
  global mom_output_file_directory
  global mom_output_file_basename mom_group_name
  global mom_jg_image_file

  set nombre [string range $mom_group_name 1 10]
  set html_file_name "${mom_output_file_directory}${nombre}.html"
  if {[file exists $html_file_name]} { MOM_remove_file $html_file_name }
  set html_file [open "$html_file_name" w]

}

#=============================================================

# Generates HTML header
proc JG_start_of_html { } {

  global html_file
  global mom_output_file_basename mom_group_name
  global mom_jg_image_file
  global mom_part_name

  set jg_group_name [string range $mom_group_name 1 10]

  set t [clock seconds]
  set jg_fecha [clock format $t -format "%d.%m.%Y"]
  set jg_image_name ${jg_group_name}.gif
  
  puts $html_file "<html>"
  puts $html_file "<head>"
  puts $html_file "<title>Datos del programa $jg_group_name</title>"
  puts $html_file "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">"
  puts $html_file "</head>"
  puts $html_file ""

  puts $html_file "<body bgcolor=\"#FFFFFF\">"
  puts $html_file "<table width=\"500\" border=\"3\" height=\"500\" align=\"center\">"
  puts $html_file "  <tr>"
  puts $html_file "<td><img src=\"$jg_image_name\" width=\"500\" height=\"500\"></td>"
  puts $html_file "  </tr>"
  puts $html_file "</table>"

  puts $html_file "<table width=\"740\" border=\"3\" align=\"center\" vspace=\"5\">"
  puts $html_file "  <tr>"
  puts $html_file "    <td width=\"126\"><font face=\"Times New Roman, Times, serif\" size=\"3\">NC Program</font></td>"
  puts $html_file "    <td width=\"291\"><font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_group_name</font></td>"
  puts $html_file "    <td width=\"300\"><font face=\"Times New Roman, Times, serif\" size=\"3\">Date: </font>"
  puts $html_file "      <font size=\"2\" face=\"Times New Roman, Times, serif\">$jg_fecha</font></td>"
  puts $html_file "  </tr>"
  puts $html_file "  <tr>"
  puts $html_file "    <td colspan=\"3\"><font face=\"Times New Roman, Times, serif\" size=\"3\">File "
  puts $html_file "      UG</font>: <font size=\"2\" face=\"Times New Roman, Times, serif\">"
  puts $html_file "      $mom_part_name</font></td>"
  puts $html_file "  </tr>"
  puts $html_file "</table>"

  puts $html_file "<table width=\"740\" border=\"2\" align=\"center\" vspace=\"5\">"
  puts $html_file "  <tr> "
  puts $html_file "    <td width=\"100\"><font size=\"3\" face=\"Times New Roman, Times, serif\">Tool</font></td>"
  puts $html_file "    <td width=\"200\"><font size=\"3\" face=\"Times New Roman, Times, serif\">Description</font></td>"
  puts $html_file "    <td width=\"20\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T</font></td>"
  puts $html_file "    <td width=\"50\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T dia.</font></td>"
  puts $html_file "    <td width=\"50\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T rad.</font></td>"
  puts $html_file "    <td width=\"50\"><font size=\"3\" face=\"Times New Roman, Times, serif\">T len.</font></td>"
  puts $html_file "  </tr>"
}

#=============================================================

# Generates HTML line
proc JG_write_tool { } {

  global html_file
  global mom_tool_name mom_tool_description
  global mom_tool_diameter mom_tool_corner1_radius
  global mom_tool_number mom_tool_length
  global mom_tool_type mom_tool_point_angle
  global listado_total_htas n_listado_total_htas
  global listado_num_htas

  if { $n_listado_total_htas != 0 } {
    if { [lsearch $listado_total_htas $mom_tool_name] == -1} {
      lappend listado_total_htas $mom_tool_name
      lappend listado_num_htas $mom_tool_number
      incr n_listado_total_htas
    } else {
      return
    }
  } else {
    lappend listado_total_htas $mom_tool_name
    lappend listado_num_htas $mom_tool_number
    incr n_listado_total_htas
  }

  set jg_tool_nam  $mom_tool_name
  set jg_tool_des  $mom_tool_description
  set jg_tool_num  [format "%2.0lf" $mom_tool_number]
  set jg_tool_dia  [format "%3.3lf" $mom_tool_diameter]
 # MOM_output_to_listing_device "$mom_tool_type"
  if { $mom_tool_type == "Drilling Tool" } {
    set angulo_punta [ expr $mom_tool_point_angle * 180.0 / 3.1415925]
    set jg_tool_rad  [format "%3.3lf" $angulo_punta]
  } else {
    set jg_tool_rad  [format "%2.3lf" $mom_tool_corner1_radius]
  }
  set jg_tool_len  [format "%3.3lf" $mom_tool_length]

  puts $html_file "  <tr> "
  puts $html_file "    <td width=\"100\"><font size=\"3\" face=\"Times New Roman, Times, serif\">$jg_tool_nam</font></td>"
  puts $html_file "    <td width=\"200\"><font size=\"3\" face=\"Times New Roman, Times, serif\">$jg_tool_des</font></td>"
  puts $html_file "    <td width=\"20\"><font size=\"3\" face=\"Times New Roman, Times, serif\">$jg_tool_num</font></td>"
  puts $html_file "    <td width=\"50\"><font size=\"3\" face=\"Times New Roman, Times, serif\">$jg_tool_dia</font></td>"
  puts $html_file "    <td width=\"50\"><font size=\"3\" face=\"Times New Roman, Times, serif\">$jg_tool_rad</font></td>"
  puts $html_file "    <td width=\"50\"><font size=\"3\" face=\"Times New Roman, Times, serif\">$jg_tool_len</font></td>"
  puts $html_file "  </tr>"
}

#=============================================================

# Generates HTML footer
proc JG_foot_of_html { } {

  global html_file
  global mom_output_file_directory
  global mom_output_file_basename mom_group_name
  global mom_jg_image_file

  puts $html_file "</table>"
  puts $html_file "<p>&nbsp;</p>"
  puts $html_file "</body>"
  puts $html_file "</html>"

  set jg_group_name [string range $mom_group_name 1 10]
  set mom_jg_image_file ${mom_output_file_directory}${jg_group_name}

  set jg_dll_file h:\\ug_posts\\graphics_window_2_gif.dll
  if {[file exists $jg_dll_file]} {
    MOM_run_user_function $jg_dll_file ufusr
  } else {
    MOM_output_to_listing_device "** Can't find the file graphics_window_2_gif.dll into"
    MOM_output_to_listing_device "** folder h:\\ug_posts"
  }

}

#=============================================================

# Close HTML file
proc JG_close_html_file { } {
  global html_file
  close $html_file
}

