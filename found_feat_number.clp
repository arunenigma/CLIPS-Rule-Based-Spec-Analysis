(defrule MAIN::ff-number
	(words-under ?t)
	(found_feature(feat ?f)(loc-id $?l)(sig $?s)(type ?t)(dic ?d))
	=> 
	(bind ?loc (implode$ $?l))
	(bind ?sig (implode$ $?s))
	(printout ff_number_facts "(ff-number(feature ""\""?f"\""")(type "?t")(loc-id "?loc")(sig "?sig")(dic "?d"))" crlf)
	)



