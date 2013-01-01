(defrule MAIN::ff-bool
	(words-under ?t)
	(found_feature(feat ?f)(loc-id $?l)(sig $?s)(type ?t)(dic ?d))
	=>
	(printout ff_bool_facts "(ff-bool(feature "?f")(type "?t")(attribute yes)(dic "?d"))" crlf))

