#!/bin/sh 
#	component:   "Deep Thought Reusable Libraries"
#	description: "ADL Parser builder script"
#	keywords:    "ADL, parser"
#
#	author:      "Thomas Beale"
#	support:     "Ocean Informatics <support@OceanInformatics.biz>"
#	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
#	license:     "See notice at bottom of class"
#
#	file:        "$URL$"
#	revision:    "$LastChangedRevision$"
#	last_change: "$LastChangedDate$"
#

geyacc --new_typing -v parser_errs.txt -t CADL_TOKENS -o cadl_validator.e cadl_validator.y

geyacc --doc=html -v parser_errs.txt -t CADL_TOKENS -o cadl_validator.html cadl_validator.y
