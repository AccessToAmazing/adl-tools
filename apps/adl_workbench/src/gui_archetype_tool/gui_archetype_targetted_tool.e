note
	description: "Summary description for {GUI_ARCHETYPE_TARGETTED_TOOL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	GUI_ARCHETYPE_TARGETTED_TOOL

inherit
	GUI_TOOL
		redefine
			can_repopulate
		end

feature -- Access

	target_archetype_descriptor: ARCH_CAT_ARCHETYPE
			-- archetype to which this tool is targetted

	target_archetype: ARCHETYPE
			-- differential or flat version of archetype, depending on setting of `differential_view'
		do
			if differential_view then
				Result := target_archetype_descriptor.differential_archetype
			else
				Result := target_archetype_descriptor.flat_archetype
			end
		end

	selected_language: attached STRING

	last_populate_timestamp: DATE_TIME
			-- timestamp of last populate or repopulate

feature -- Status Report

	differential_view: BOOLEAN

	can_populate (aca: attached ARCH_CAT_ARCHETYPE): BOOLEAN
		do
			Result := aca.is_valid
		end

	can_repopulate: BOOLEAN
		do
			Result := attached target_archetype_descriptor
		end

	is_populated: BOOLEAN
		do
			Result := attached target_archetype_descriptor
		end

feature -- Commands

	populate (aca: attached ARCH_CAT_ARCHETYPE; differential_view_flag: BOOLEAN; a_selected_language: attached STRING)
			-- populate the control by creating it from scratch
		require
			can_populate (aca)
		do
			target_archetype_descriptor := aca
			differential_view := differential_view_flag
			selected_language := a_selected_language
			clear
			do_populate
			create last_populate_timestamp.make_now
		end

	repopulate
			-- repopulate if targetted to same archetype as previously
		do
			do_populate
			create last_populate_timestamp.make_now
		end

	repopulate_with_language (a_selected_language: attached STRING)
			-- repopulate with changed language
		do
			selected_language := a_selected_language
			repopulate
		end

feature {NONE} -- Implementation

	do_populate
		deferred
		end

invariant
	Reverse_link_set: ev_root_container.data = Current

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
--| The Original Code is gui_archetype_targetted_tool.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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
