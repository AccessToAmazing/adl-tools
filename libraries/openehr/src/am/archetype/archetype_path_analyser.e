indexing
	component:   "openEHR Archetype Project"
	description: "[
				 Validator of archeype paths.
		         ]"
	keywords:    "path"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class ARCHETYPE_PATH_ANALYSER

inherit
	ARCHETYPE_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} valid_concept_code
		end

feature -- Initialisation

	set_from_path (a_path: OG_PATH) is
			-- create from an OG_PATH
		require
			a_path_valid: a_path /= Void
		do
			target := a_path
			calculate_level
		end

	set_from_string (a_path: STRING) is
			-- create from a STRING
		require
			a_path_valid: a_path /= Void
		do
			create target.make_from_string(a_path)
			calculate_level
		end

feature -- Access

	target: OG_PATH
			-- differential archetype

	level: INTEGER

feature {NONE} -- Implementation

	calculate_level is
			-- get the deepest level of this path, determined from the depth of the object codes
		do
			from
				target.start
			until
				target.off
			loop
				if is_valid_code (target.item.object_id) then
					level := level.max(specialisation_depth_from_code (target.item.object_id))
				end
				target.forth
			end
		end

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is archetype_local_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
