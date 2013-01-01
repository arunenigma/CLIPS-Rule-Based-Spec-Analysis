(defrule MAIN::found-attribute-feature-match
	(split-attrib-loc(attribute ?a)(location-id $?loc)(signature $?s)(type ?t))
	(found_feature(feat ?f)(loc-id $?loc)(sig $?s)(dic ?d))
	=>
	(printout found_attribute_facts "(found-attribute(feature "?f")(type "?t")(attribute "?a")(dic "?d"))" crlf))

