indexing
	component:   "openEHR Archetype Project"
	description: "Test case for adding an ordinal to an archetype definition"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003,2004 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TC_ARCHETYPE_ADD_OBJECT_ORDINAL
	
inherit
	TEST_CASE
		export
			{NONE} all
		redefine
			prereqs
		end
		
	SHARED_TEST_ENV
		export
			{NONE} all
		end
		
create
	make

feature -- Initialisation

	make(arg:ANY) is
	    do
	    end

feature -- Access

	title: STRING is "Test Archetype Add C_DV_ORDINAL node"

	prereqs: ARRAY[STRING] is 
			-- ids of prerequisite test cases
		once
			Result := <<"TC_ARCHETYPE_CREATE", "TC_ONTOLOGY_OPOULATE">>
		end

feature -- testing

	execute is
		local
			archetype: ARCHETYPE
			cf: CONSTRAINT_MODEL_FACTORY
			an_attr_node: C_ATTRIBUTE
			an_ordinal_node: C_DV_ORDINAL
			an_ordinal: ORDINAL
			a_term: ARCHETYPE_TERM
		do
			archetype := adl_interface.adl_engine.archetype

			-- set root node term to first term added and make it a SECTION type
			cf := adl_interface.constraint_model_factory
			
			-- set id on root node
			archetype.definition.set_object_id("at0001")
			
			-- add ordinal node
			an_attr_node := cf.create_c_attribute_single (archetype.definition, "an_ordinal")
			an_ordinal_node := cf.create_c_dv_ordinal(an_attr_node)

			-- add some ordinal items to it
			an_ordinal := cf.create_ordinal (0, "local::at0020")
			an_ordinal_node.add_item(an_ordinal)
			an_ordinal := cf.create_ordinal (1, "local::at0021")
			an_ordinal_node.add_item(an_ordinal)
			an_ordinal := cf.create_ordinal (2, "local::at0022")
			an_ordinal_node.add_item(an_ordinal)

			create a_term.make("at0020")
			a_term.add_item("text", "+")
			ontology.add_term_definition("en", a_term)

			create a_term.make("at0021")
			a_term.add_item("text", "++")
			ontology.add_term_definition("en", a_term)

			create a_term.make("at0022")
			a_term.add_item("text", "+++")
			ontology.add_term_definition("en", a_term)

			-- add another ordinal node with no items
			an_attr_node := cf.create_c_attribute_single (archetype.definition, "an_ordinal_empty")
			an_ordinal_node := cf.create_c_dv_ordinal(an_attr_node)

			if archetype.is_valid then
				adl_interface.adl_engine.serialise (serialise_format)	
				io.put_string(adl_interface.adl_engine.serialised_archetype)	
			else
				io.put_string(archetype.errors)	
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
--| The Original Code is tc_archetype_add_object_ordinal.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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