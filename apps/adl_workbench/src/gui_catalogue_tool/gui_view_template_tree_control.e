note
	component:   "openEHR Archetype Project"
	description: "Composite control for viewing templates"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class GUI_VIEW_TEMPLATE_TREE_CONTROL

inherit
	GUI_ARTEFACT_TREE_CONTROL
		rename
			make as make_tree_control
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (an_edit_archetype_agent: like edit_archetype_agent;
			a_save_archetype_agent: like save_archetype_agent;
			a_focus_archetype_agent: like focus_archetype_agent)
		do
			make_tree_control (an_edit_archetype_agent, a_save_archetype_agent)
			focus_archetype_agent := a_focus_archetype_agent
			artefact_types := <<{ARTEFACT_TYPE}.template>>
		end

feature -- Commands

	update_tree_node_for_archetype (ara: attached ARCH_CAT_ARCHETYPE)
			-- update Explorer tree node with changes in compilation status
		local
			an_id: STRING
		do
			an_id := ara.id.as_string
--			if gui_node_descriptor_map.has (an_id) then
				ev_tree_node_populate (ara)
--			elseif attached ara.old_id then
--				if gui_node_descriptor_map.has (ara.old_id.as_string) then
--					gui_node_descriptor_map.replace_key (ara.id.as_string, ara.old_id.as_string)
--					populate_template_nodes (gui_node_descriptor_map.item (ara.id.as_string))
--				end
--			end
		end

feature {NONE} -- Implementation

	focus_archetype_agent: PROCEDURE [ANY, TUPLE [STRING]]

	select_archetype_with_delay (aca: ARCH_CAT_ARCHETYPE)
		do
			selected_archetype_node := aca
			if selection_history.selected_item /= aca then
				delayed_select_archetype_agent.set_interval (300)
			end
		end

	delayed_select_archetype_agent: EV_TIMEOUT
			-- Timer to delay a moment before calling `select_archetype_agent'.
		once
			create Result
			Result.actions.extend (
				agent
					do
						delayed_select_archetype_agent.set_interval (0)
						focus_archetype_agent.call ([selected_archetype_node.global_artefact_identifier])
						selection_history.set_selected_item (selected_archetype_node)
						gui_agents.select_archetype_agent.call ([selected_archetype_node])
						ev_tree_node_populate (selected_archetype_node)
					end
			)
		end

	do_populate
		do
 			source.do_all_archetypes (agent ev_tree_node_populate)
			gui_grid.resize_columns_to_content
		end

   	ev_tree_node_populate (ara: attached ARCH_CAT_ARCHETYPE)
   			-- Add a node representing `an_item' to `gui_file_tree'.
   		local
			og_iterator: OG_ITERATOR
		do
			-- make sure it is a template of some kind
			if artefact_types.has (ara.artefact_type) then
				-- if it is compiled & valid, display its flat filler structure
				if ev_node_descriptor_map.has (ara.qualified_name) then
					if ara.is_valid then
						ev_tree_item_stack.extend (ev_node_descriptor_map.item (ara.qualified_name))
						gui_grid.remove_sub_rows (ev_tree_item_stack.item)
						if attached {EV_GRID_LABEL_ITEM} ev_tree_item_stack.item.item (1) as gli then
							gli.set_pixmap (catalogue_node_pixmap (ara))
						end

						-- add slot filler structure below this row
						create og_iterator.make (ara.flat_archetype.definition.representation)
						og_iterator.do_all (agent ev_node_build_enter_action, agent ev_node_build_exit_action)
						ev_tree_item_stack.remove
					else
						if attached {EV_GRID_LABEL_ITEM} ev_node_descriptor_map.item (ara.qualified_name) as gli then
							gli.set_pixmap (catalogue_node_pixmap (ara))
						end
					end
				else -- otherwise just display the template root
					attach_node (ara.id.rm_entity + "." + ara.name, catalogue_node_pixmap (ara), ara)
					ev_node_descriptor_map.force (ev_tree_item_stack.item, ara.qualified_name)
					ev_tree_item_stack.remove
				end
			end
		end

	ev_node_build_enter_action (an_og_node: attached OG_ITEM; indent_level: INTEGER)
		local
			ara: ARCH_CAT_ARCHETYPE
			ca_path: STRING
			csr: ARCHETYPE_CONSTRAINT
		do
			if attached {ARCHETYPE_CONSTRAINT} an_og_node.content_item as ca then
				if attached {C_ATTRIBUTE} ca as c_attr then
					-- first see if it is an atribute containing any ext ref nodes
					from c_attr.children.start until c_attr.children.off or attached {C_ARCHETYPE_ROOT} c_attr.children.item as car loop
						c_attr.children.forth
					end

					-- now compute the path from this attr node back to the nearest C_ARCHETYPE_ROOT
					from csr := c_attr until csr.parent = Void loop
						if attached {C_ARCHETYPE_ROOT} csr as car then
							ca_path := c_attr.path_to_node(car)
						end
						csr := csr.parent
					end
					if not attached ca_path then
						ca_path := c_attr.path
					end
					if not c_attr.children.off then
						attach_node (ca_path, get_icon_pixmap ("archetype/" + c_attribute_pixmap_string (c_attr)), Void)
					end
				elseif attached {C_ARCHETYPE_ROOT} ca as car and attached source as dir then
					ara := dir.archetype_index.item (car.archetype_id)
					attach_node (ara.id.rm_entity + "." + ara.name, catalogue_node_pixmap (ara), ara)
				end
			end
		end

	ev_node_build_exit_action (an_og_node: attached OG_ITEM; indent_level: INTEGER)
		do
			if attached {C_ATTRIBUTE} an_og_node.content_item as c_attr then
				from c_attr.children.start until c_attr.children.off or attached {C_ARCHETYPE_ROOT} c_attr.children.item as car loop
					c_attr.children.forth
				end
				if not c_attr.children.off then
					ev_tree_item_stack.remove
				end
			elseif attached {C_ARCHETYPE_ROOT} an_og_node.content_item as car then
				ev_tree_item_stack.remove
			end
		end

	c_attribute_pixmap_string (c_attr: C_ATTRIBUTE): STRING
			-- string name of pixmap for attribute c_attr
			-- FIXME: this is a straight copy from GUI_NODE_MAP_CONTROL and should be consolidated at some point
		do
			create Result.make(0)
			Result.append ("c_attribute")
			if c_attr.is_multiple then
				if c_attr.cardinality = Void or else c_attr.cardinality.interval.lower = 0 then
					Result.append (".multiple.optional")
				else
					Result.append (".multiple")
				end
			else
				if c_attr.existence = Void or else c_attr.existence.lower = 0 then
					Result.append (".optional")
				end
			end
		end

	attach_node (str: STRING; pixmap: EV_PIXMAP; ara: detachable ARCH_CAT_ARCHETYPE)
			-- attach a node into the tree
		do
			-- add row to grid
			if ev_tree_item_stack.is_empty then
				gui_grid.add_row (1, ara)
			else
				gui_grid.add_sub_row (ev_tree_item_stack.item, ara)
			end
			ev_tree_item_stack.extend (gui_grid.last_row)
			gui_grid.set_last_row_label_col (1, str, Void, Void, pixmap)

			if attached ara then
				ev_node_descriptor_map.force (gui_grid.last_row, ara.qualified_name)

				-- context menu
				if attached {EV_GRID_LABEL_ITEM} gui_grid.last_row.item (1) as gli then
		 			gli.pointer_button_press_actions.force_extend (agent archetype_node_handler (gui_grid.last_row, ?, ?, ?))
		 			gli.select_actions.force_extend (agent select_archetype_with_delay (ara))
				end
			end
		end

   	update_tree_node (ev_grid_row: EV_GRID_ROW)
   			-- Set the icon appropriate to the item attached to `node'.
		do
 			if attached {ARCH_CAT_MODEL_NODE} ev_grid_row.data as acmn then -- it is a model node
				if acmn.is_class and attached {EV_GRID_LABEL_ITEM} ev_grid_row.item (1) as gli then
					gli.set_pixmap (catalogue_node_pixmap (acmn))
				end
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
--| The Original Code is adl_node_control.e.
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
