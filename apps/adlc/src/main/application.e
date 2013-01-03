note
	component:   "openEHR Archetype Project"
	description : "[
				   Command-line form of the compiler.
				   
				   Command line:
				   	adlc [options] action archetype_id_pattern
				   	
				   Options:
				   	(see OPTIONS_PROCESSOR class)
				   ]"
	keywords:    "ADL, archetype, compiler, command line"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class
	APPLICATION

inherit
	SHARED_APP_ROOT

	SHARED_ARCHETYPE_SERIALISERS

create
	make

feature -- Definitions

	Validate_action: STRING = "validate"

	Serialise_action: STRING = "serialise"

	Actions: ARRAYED_LIST [STRING]
		once
			create Result.make (0)
			Result.extend (Validate_action)
			Result.extend (Serialise_action)
		end

feature -- Initialization

	make
			-- Run application.
		do
			app_root.initialise_shell
			if app_root.ready_to_initialise_app then
				options_processor.execute (agent start)
			end
		end

feature -- Access

	output_format: STRING

feature -- Status Report

	verbose_output: BOOLEAN

	use_flat_source: BOOLEAN

feature -- Commands

	start
		local
			prof_key: STRING
			aca: ARCH_CAT_ARCHETYPE
			finished: BOOLEAN
		do
			app_root.initialise_app
			if options_processor.is_verbose then
				print (billboard.content)
				verbose_output := True
			end
			if not app_root.has_errors then
				app_root.archetype_compiler.set_global_visual_update_action (agent compiler_global_gui_update)
				app_root.archetype_compiler.set_archetype_visual_update_action (agent compiler_archetype_gui_update)

				-- now process command line
				if options_processor.show_config then
					-- location of .cfg file
					io.put_string (get_msg ("config_file_location", <<user_config_file_path>>))

					-- repository info
					io.put_string (get_text ("profiles_info_text") + "%N")
					across repository_profiles as profs_csr loop
						prof_key := profs_csr.key + ": " + spaces.substring (1, spaces.count - profs_csr.key.count - 2)
						io.put_string ("%T" + prof_key +  profs_csr.item.reference_repository + "%N")
					end
					io.put_string (get_msg ("current_profile_info_text", <<repository_profiles.current_profile_name>>))

					-- RM schemas info
					io.put_string (get_text ("rm_schemas_info_text"))
					across rm_schemas_access.valid_top_level_schemas as loaded_schemas_csr loop
						io.put_string ("%T" + loaded_schemas_csr.key + "%N")
					end
				else
					-- see if user wants to change profile
					if attached options_processor.profile as prof then
						if repository_profiles.has_profile (prof) then
							set_current_profile (prof)
						else
							io.put_string (get_msg ("profile_does_not_exist_err", <<prof>>))
							finished := True
						end
					end

					if not finished then
						-- first try and match the user-provided archetype id pattern to some real arguments
						matched_archetype_ids := current_arch_cat.matching_ids (options_processor.archetype_id_pattern, Void, Void)
						if matched_archetype_ids.is_empty then
							io.put_string (get_msg ("no_matching_ids_err", <<options_processor.archetype_id_pattern, repository_profiles.current_profile_name>>))
							finished := True
						else
							-- record flat option
							use_flat_source := options_processor.use_flat_source

							-- set output format
							if attached options_processor.output_format as of then
								if has_serialiser_format (of) then
									output_format := of
								else
									io.put_string (get_msg ("invalid_serialisation_format_err", <<of, archetype_all_serialiser_formats_string>>))
									finished := True
								end
							else
								output_format := Syntax_type_adl
							end

							-- perform action for all matching archetypes
							if not finished then
								across matched_archetype_ids as arch_ids_csr loop
									aca := current_arch_cat.archetype_index.item (arch_ids_csr.item)
									archetype_compiler.build_lineage (aca, 0)

									-- process action
									if options_processor.action.is_equal (Validate_action) then
										io.put_string (aca.status)

									elseif options_processor.action.is_equal (Serialise_action) then
										if aca.is_valid then
											io.put_string (aca.serialise (use_flat_source, output_format))
										end
									else
										io.put_string (get_msg ("invalid_action_err", <<options_processor.action, valid_actions_string>>))
									end
								end
							end
						end
					end
				end
			else
				io.put_string (app_root.errors.as_string)
			end
		end

feature {NONE} -- Implementation

	matched_archetype_ids: ARRAYED_LIST [STRING]

	valid_actions_string: STRING
		once
			create Result.make_empty
			across Actions as actions_csr loop
				Result.append (actions_csr.item)
				if actions_csr.target_index < Actions.count then
					Result.append (", ")
				end
			end
		end

	options_processor: OPTIONS_PROCESSOR
		once
			create Result.make
			Result.set_is_usage_displayed_on_error (True)
		end

	compiler_global_gui_update (msg: STRING)
			-- Update UI with progress on build.
		do
			if verbose_output then
				print (msg)
			end
		end

	compiler_archetype_gui_update (msg: STRING; ara: detachable ARCH_CAT_ARCHETYPE; depth: INTEGER)
			-- Update UI with progress on build.
		do
			if verbose_output then
				print (msg)
			end
		end

	spaces: STRING = "                        "

end