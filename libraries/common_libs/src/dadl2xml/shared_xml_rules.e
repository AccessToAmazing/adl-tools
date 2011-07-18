note
	component:   "openEHR Archetype Project"
	description: "Object containing rules for controlling XML serialisation and deserialisation in ADL Workbench"
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_XML_RULES

inherit
	SHARED_XML_RULES_FILE_ACCESS
		export
			{NONE} all
		end

feature -- Access

	xml_rules: XML_RULES
			-- set of rules to do with IM class, keyed by class name to which they apply
		do
			if xml_rules_out_of_date then
				if attached {XML_RULES} xml_rules_cfg.object_value ("/", "XML_RULES") as x then
					xml_rules_cache.put(x)
				else
					xml_rules_cache.put (create {XML_RULES}.make)
				end
			end
			Result := xml_rules_cache.item
		end

	xml_rules_cache: CELL [XML_RULES]
		once
			create Result.put (Void)
		end

feature -- Status Report

	xml_rules_out_of_date: BOOLEAN
			-- True if rules have changed and need to be reread
		do
			Result := not attached xml_rules_cache.item
		end

feature -- Element change

	mark_xml_rules_put_of_date
			-- force later re-read of rules; assumes changes have not been committed yet, but will be
		do
			xml_rules_cache.put (Void)
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
--| The Original Code is xml_conversion_rules.e.
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
