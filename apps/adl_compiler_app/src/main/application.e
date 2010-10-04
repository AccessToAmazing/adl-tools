note
	description : "[
				   This application simulates what a real application written in C, Java or another langauge might do, 
				   across the language interface. To see a C-language equivalent, go to the directory deployment/C/
				   c_tester_for_adl_compiler.
				   ]"
	date        : "$Date$"
	revision    : "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

	SHARED_APP_ROOT

create
	make

feature -- Initialization

	make
			-- Run application.
		local
			rep_profiles: attached HASH_TABLE [ARRAYED_LIST[STRING], STRING]
			new_prof: STRING
		do
			app_root.initialise
			print("Config file path: " + app_root.user_config_file_path + "%N")
			if app_root.initialised then
				print("APP_ROOT initialisation succeeded; repository profiles available:%N")
				rep_profiles := app_root.repository_profiles
				if not rep_profiles.is_empty then
					from rep_profiles.start until rep_profiles.off loop
						print(rep_profiles.key_for_iteration + "%N")
						rep_profiles.forth
					end
					if app_root.current_repository_profile.is_empty then
						rep_profiles.start
						new_prof := rep_profiles.key_for_iteration
					else
						new_prof := app_root.current_repository_profile
					end
					app_root.set_current_repository_profile (new_prof)

					print ("Populating repository " + app_root.current_repository_profile + "...")
					app_root.use_current_profile
					print ("complete%N")

					print("Doing complete build on current profile%N")
					app_root.archetype_compiler.set_visual_update_action (agent build_ui_update)
					app_root.archetype_compiler.build_all
				else
					print("No repository profiles found; add entries to .cfg file for current_repository_profile and [profiles] section%N")
				end
			else
				print("APP_ROOT initialisation failed%N")
			end
		end

	build_ui_update (ara: ARCH_REP_ARCHETYPE)
			-- Update UI with progress on build.
		do
			print (archetype_compiler.status)
		end

end