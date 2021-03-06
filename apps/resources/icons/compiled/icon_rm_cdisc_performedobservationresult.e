note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RM_CDISC_PERFORMEDOBSERVATIONRESULT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/cdisc/performedobservationresult"
			make_with_size (16, 16)
			fill_memory
		end

feature {NONE} -- Image data
	
	c_colors_0 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
				{
					#define B(q) #q
					#ifdef EIF_WINDOWS
						#define A(a,r,g,b) B(\x##b\x##g\x##r\x##a)
					#else
						#define A(a,r,g,b) B(\x##r\x##g\x##b\x##a)
					#endif

					char l_data[] =
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,DF,AE,A8) A(FF,E2,89,82) A(FF,C7,58,52) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,BC,BC,BC) A(FF,D8,D8,D8) 
					A(FF,D0,92,8D) A(FF,BE,46,41) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,AF,BE,AF) A(FF,D6,D6,D6) A(FF,CF,CD,CC) A(FF,7F,7F,7E) A(FF,B7,68,64) A(FF,00,00,80) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,6C,C7,6C) A(FF,89,D2,89) 
					A(FF,B7,CB,B5) A(FF,7F,7E,7E) A(FF,97,94,93) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6C,C7,6C) A(FF,83,D1,83) A(FF,60,C2,60) A(FF,37,92,37) A(FF,80,8F,7D) A(FF,00,00,80) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(FF,6C,C7,6C) A(FF,83,D1,83) 
					A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,6C,C7,6C) A(FF,83,D1,83) A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(FF,00,00,80) A(FF,00,00,80) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6C,C7,6C) A(FF,83,D1,83) 
					A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6C,C7,6C) A(FF,83,D1,83) A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(FF,00,00,80) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(FF,6C,C7,6C) A(FF,83,D1,83) 
					A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(FF,6C,C7,6C) A(FF,83,D1,83) A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(00,00,00,00) A(FF,00,00,80) 
					A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6C,C7,6C) A(FF,83,D1,83) 
					A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,DA,BE,64) A(FF,A3,CF,7F) A(FF,60,C2,60) A(FF,31,92,31) A(FF,1F,88,1F) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E9,CF,7F) 
					A(FF,B8,B4,66) A(FF,47,87,33) A(FF,1F,88,1F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C0,AF,7B) A(FF,D3,B5,71) A(FF,93,73,37) A(FF,71,59,2B) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,26,25,25) A(FF,5C,4B,2B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
		end

end