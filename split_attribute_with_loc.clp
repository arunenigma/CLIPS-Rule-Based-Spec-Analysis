(defrule MAIN::found-attrib-with-loc-unigram-match
	(attribute-alias(alias ?x)(type ?t))
	(word-data(word ?x)(location-id $?loc ?word)(signature $?sig ?w))
	=>
	(bind ?l (implode$ $?loc))
	(bind ?s (implode$ $?sig))
	(printout split_attrib_with_loc_facts "(split-attrib-loc(attribute ""\""?x"\""")(location-id "?l")(signature "?s")(type ""\""?t"\"""))" crlf))

(defrule MAIN::found-attrib-with-loc-bigram-match
	(attribute-alias(alias ?x)(type ?t))
	(bigram-data(bigram ?x)(location-id $?loc)(signature $?sig))
	=>
	(bind ?l (implode$ $?loc))
	(bind ?s (implode$ $?sig))
	(printout split_attrib_with_loc_facts "(split-attrib-loc(attribute ""\""?x"\""")(location-id "?l")(signature "?s")(type ""\""?t"\"""))" crlf))