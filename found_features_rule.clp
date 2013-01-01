(defrule MAIN::splitted-feature-unigram-match
	(feature-alias(feature ?feature)(alias ?x)(type ?t)(dic ?d))
	(word-data(word ?x)(location-id $?loc ?word)(signature $?sig ?w))
	=>
	(bind ?location-vector (implode$ $?loc))
	(bind ?signature (implode$ $?sig))
	(printout found_feature_facts "(found_feature(feat ""\""?x"\""")(loc-id "?location-vector")(sig "?signature")(type ""\""?t"\""")(dic "?d"))" crlf))

(defrule MAIN::splitted-feature-bigram-match
	(feature-alias(feature ?feature)(alias ?x)(type ?t)(dic ?d))
	(bigram-data(bigram ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?loc-vec (implode$ $?location-id))
	(bind ?signat (implode$ $?signature))
	(printout found_feature_facts "(found_feature(feat ""\""?x"\""")(loc-id "?loc-vec")(sig "?signat")(type ""\""?t"\""")(dic "?d"))" crlf))

(defrule MAIN::splitted-feature-trigram-match
	(feature-alias(feature ?feature)(alias ?x)(type ?t)(dic ?d))
	(trigram-data(trigram ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?loc-vec (implode$ $?location-id))
	(bind ?signat (implode$ $?signature))
	(printout found_feature_facts "(found_feature(feat ""\""?x"\""")(loc-id "?loc-vec")(sig "?signat")(type ""\""?t"\""")(dic "?d"))" crlf))

(defrule MAIN::splitted-feature-4gram-match
	(feature-alias(feature ?feature)(alias ?x)(type ?t)(dic ?d))
	(fourgram-data(fourgram ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?loc-vec (implode$ $?location-id))
	(bind ?signat (implode$ $?signature))
	(printout found_feature_facts "(found_feature(feat ""\""?x"\""")(loc-id "?loc-vec")(sig "?signat")(type ""\""?t"\""")(dic "?d"))" crlf))

(defrule MAIN::splitted-feature-5gram-match
	(feature-alias(feature ?feature)(alias ?x)(type ?t)(dic ?d))
	(fivegram-data(fivegram ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?loc-vec (implode$ $?location-id))
	(bind ?signat (implode$ $?signature))
	(printout found_feature_facts "(found_feature(feat ""\""?x"\""")(loc-id "?loc-vec")(sig "?signat")(type ""\""?t"\""")(dic "?d"))" crlf))