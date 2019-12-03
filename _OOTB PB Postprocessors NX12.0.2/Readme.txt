These data is for your convenience if you still like to use OOTB Post Builder posts processors from NX installed version NX12.0.2.
Running a CAM example which refer to such a post will no longer shipped with NX1847 and following releases.
You can still use these ones by adding them back into the library  for your need.

What to do:

1)	Pick the archive file of the machine you like to use. 
	(Sim01-Sim16….zip)
2)	Copy the content of the archive into the related folder under:
	.. mach\resource\library\machine\installed_machines
3)	Copy the content of the file
	Add_to_machine_database.dat (part of the archive file)
	into your library file machine_database.dat located at:
	..mach\resource\library\machine\ascii

If that is done you can uses the CAM part files, which refer to the old library entries.