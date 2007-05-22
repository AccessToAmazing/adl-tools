indexing
	description: "[
		Objects that represent an EV_DIALOG.
		The original version of this class was generated by EiffelBuild.
		This class is the implementation of an EV_DIALOG generated by EiffelBuild.
		You should not modify this code by hand, as it will be re-generated every time
		 modifications are made to the project.
		 	]"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	OPTION_DIALOG_IMP

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end
			
	CONSTANTS
		undefine
			is_equal, default_create, copy
		end

feature {NONE}-- Initialization

	initialize is
			-- Initialize `Current'.
		do
			Precursor {EV_DIALOG}
			initialize_constants
			
				-- Create all widgets.
			create l_ev_vertical_box_1
			create l_ev_horizontal_box_1
			create l_ev_label_1
			create option_dialog_editor_command_edit
			create option_dialog_editor_command_button
			create l_ev_horizontal_box_2
			create option_dialog_node_tree_expand_cb
			create l_ev_horizontal_box_3
			create l_ev_cell_1
			create option_dialog_ok_button
			create option_dialog_cancel_button
			
				-- Build widget structure.
			extend (l_ev_vertical_box_1)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_1)
			l_ev_horizontal_box_1.extend (l_ev_label_1)
			l_ev_horizontal_box_1.extend (option_dialog_editor_command_edit)
			l_ev_horizontal_box_1.extend (option_dialog_editor_command_button)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_2)
			l_ev_horizontal_box_2.extend (option_dialog_node_tree_expand_cb)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_3)
			l_ev_horizontal_box_3.extend (l_ev_cell_1)
			l_ev_horizontal_box_3.extend (option_dialog_ok_button)
			l_ev_horizontal_box_3.extend (option_dialog_cancel_button)
			
			create string_constant_set_procedures.make (10)
			create string_constant_retrieval_functions.make (10)
			create integer_constant_set_procedures.make (10)
			create integer_constant_retrieval_functions.make (10)
			create pixmap_constant_set_procedures.make (10)
			create pixmap_constant_retrieval_functions.make (10)
			create integer_interval_constant_retrieval_functions.make (10)
			create integer_interval_constant_set_procedures.make (10)
			create font_constant_set_procedures.make (10)
			create font_constant_retrieval_functions.make (10)
			create pixmap_constant_retrieval_functions.make (10)
			create color_constant_set_procedures.make (10)
			create color_constant_retrieval_functions.make (10)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_1)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_2)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_3)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_1.set_padding (?))
			integer_constant_retrieval_functions.extend (agent dialog_padding_width)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_1.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent dialog_border_width)
			l_ev_horizontal_box_1.disable_item_expand (l_ev_label_1)
			l_ev_horizontal_box_1.disable_item_expand (option_dialog_editor_command_button)
			l_ev_label_1.set_text ("Editor")
			color_constant_set_procedures.extend (agent option_dialog_editor_command_edit.set_background_color (?))
			color_constant_retrieval_functions.extend (agent editable_colour)
			option_dialog_editor_command_edit.set_minimum_width (300)
			option_dialog_editor_command_button.set_text ("Browse...")
			option_dialog_editor_command_button.set_minimum_width (65)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_2.set_padding (?))
			integer_constant_retrieval_functions.extend (agent dialog_padding_width)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_2.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent dialog_border_width)
			option_dialog_node_tree_expand_cb.set_text ("Show defiinition tree expanded?")
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_3.set_padding (?))
			integer_constant_retrieval_functions.extend (agent dialog_padding_width)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_3.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent dialog_border_width)
			l_ev_horizontal_box_3.disable_item_expand (option_dialog_ok_button)
			l_ev_horizontal_box_3.disable_item_expand (option_dialog_cancel_button)
			l_ev_cell_1.set_minimum_width (100)
			option_dialog_ok_button.set_text ("OK")
			option_dialog_ok_button.set_minimum_width (100)
			option_dialog_cancel_button.set_text ("Cancel")
			option_dialog_cancel_button.set_minimum_width (100)
			integer_constant_set_procedures.extend (agent set_maximum_width (?))
			integer_constant_retrieval_functions.extend (agent app_max_width)
			integer_constant_set_procedures.extend (agent set_maximum_height (?))
			integer_constant_retrieval_functions.extend (agent app_max_height)
			set_title ("ADL Workbench options")
			
			set_all_attributes_using_constants
			
				-- Connect events.
			option_dialog_editor_command_edit.return_actions.extend (agent option_dialog_ok)
			option_dialog_editor_command_button.select_actions.extend (agent get_editor_command_directory)
			option_dialog_ok_button.select_actions.extend (agent option_dialog_ok)
			option_dialog_cancel_button.select_actions.extend (agent option_dialog_cancel)

				-- Call `user_initialization'.
			user_initialization
		end


feature -- Access

	l_ev_cell_1: EV_CELL
	option_dialog_editor_command_button, option_dialog_ok_button, option_dialog_cancel_button: EV_BUTTON
	l_ev_horizontal_box_1,
	l_ev_horizontal_box_2, l_ev_horizontal_box_3: EV_HORIZONTAL_BOX
	l_ev_vertical_box_1: EV_VERTICAL_BOX
	option_dialog_node_tree_expand_cb: EV_CHECK_BUTTON
	l_ev_label_1: EV_LABEL
	option_dialog_editor_command_edit: EV_TEXT_FIELD

feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN is
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end
	
	user_initialization is
			-- Feature for custom initialization, called at end of `initialize'.
		deferred
		end
	
	option_dialog_ok is
			-- Called by `return_actions' of `option_dialog_editor_command_edit'.
		deferred
		end
	
	get_editor_command_directory is
			-- Called by `select_actions' of `option_dialog_editor_command_button'.
		deferred
		end
	
	option_dialog_cancel is
			-- Called by `select_actions' of `option_dialog_cancel_button'.
		deferred
		end
	
	
feature {NONE} -- Constant setting

	set_attributes_using_string_constants is
			-- Set all attributes relying on string constants to the current
			-- value of the associated constant.
		local
			s: STRING_GENERAL
		do
			from
				string_constant_set_procedures.start
			until
				string_constant_set_procedures.off
			loop
				string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).call (Void)
				s := string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).last_result
				string_constant_set_procedures.item.call ([s])
				string_constant_set_procedures.forth
			end
		end
		
	set_attributes_using_integer_constants is
			-- Set all attributes relying on integer constants to the current
			-- value of the associated constant.
		local
			i: INTEGER
			arg1, arg2: INTEGER
			int: INTEGER_INTERVAL
		do
			from
				integer_constant_set_procedures.start
			until
				integer_constant_set_procedures.off
			loop
				integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).call (Void)
				i := integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).last_result
				integer_constant_set_procedures.item.call ([i])
				integer_constant_set_procedures.forth
			end
			from
				integer_interval_constant_retrieval_functions.start
				integer_interval_constant_set_procedures.start
			until
				integer_interval_constant_retrieval_functions.off
			loop
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg1 := integer_interval_constant_retrieval_functions.item.last_result
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg2 := integer_interval_constant_retrieval_functions.item.last_result
				create int.make (arg1, arg2)
				integer_interval_constant_set_procedures.item.call ([int])
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_set_procedures.forth
			end
		end
		
	set_attributes_using_pixmap_constants is
			-- Set all attributes relying on pixmap constants to the current
			-- value of the associated constant.
		local
			p: EV_PIXMAP
		do
			from
				pixmap_constant_set_procedures.start
			until
				pixmap_constant_set_procedures.off
			loop
				pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).call (Void)
				p := pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).last_result
				pixmap_constant_set_procedures.item.call ([p])
				pixmap_constant_set_procedures.forth
			end
		end
		
	set_attributes_using_font_constants is
			-- Set all attributes relying on font constants to the current
			-- value of the associated constant.
		local
			f: EV_FONT
		do
			from
				font_constant_set_procedures.start
			until
				font_constant_set_procedures.off
			loop
				font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).call (Void)
				f := font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).last_result
				font_constant_set_procedures.item.call ([f])
				font_constant_set_procedures.forth
			end	
		end
		
	set_attributes_using_color_constants is
			-- Set all attributes relying on color constants to the current
			-- value of the associated constant.
		local
			c: EV_COLOR
		do
			from
				color_constant_set_procedures.start
			until
				color_constant_set_procedures.off
			loop
				color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).call (Void)
				c := color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).last_result
				color_constant_set_procedures.item.call ([c])
				color_constant_set_procedures.forth
			end
		end
		
	set_all_attributes_using_constants is
			-- Set all attributes relying on constants to the current
			-- calue of the associated constant.
		do
			set_attributes_using_string_constants
			set_attributes_using_integer_constants
			set_attributes_using_pixmap_constants
			set_attributes_using_font_constants
			set_attributes_using_color_constants
		end
					
	string_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [STRING_GENERAL]]]
	string_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], STRING_GENERAL]]
	integer_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER]]]
	integer_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	pixmap_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_PIXMAP]]]
	pixmap_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_PIXMAP]]
	integer_interval_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	integer_interval_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER_INTERVAL]]]
	font_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_FONT]]]
	font_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_FONT]]
	color_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_COLOR]]]
	color_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_COLOR]]
	
	integer_from_integer (an_integer: INTEGER): INTEGER is
			-- Return `an_integer', used for creation of
			-- an agent that returns a fixed integer value.
		do
			Result := an_integer
		end

end
