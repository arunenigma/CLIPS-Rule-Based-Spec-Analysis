(defrule MAIN::set-attribute
	(words-under ?t)
	(found-attribute(feature $?f)(type ?t)(attribute $?a)(dic ?d))
	=>
	(bind ?feat (implode$ $?f))
	(bind ?attrib (implode$ $?a))
	(printout set_attribute_facts "(set-attribute(feature "?feat")(type "?t")(attribute "?attrib")(dic "?d"))" crlf))

