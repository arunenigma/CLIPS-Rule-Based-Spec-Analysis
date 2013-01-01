;; Rule to find features missing in Spec 

(defrule MAIN::missing-feature-unigrams
	(words-under alias)
	(feature-alias(feature ?feature)(alias ?alias)(dic ?d))
    (not(word-data(word ?word&:(eq (str-compare ?word ?alias) 0))))
	=>
	(bind ?len (length$ (create$ (explode$ $?alias))))
	(if(= ?len 1)
		then
			(printout missing_feature_facts "(missing_feature(feature "?alias")(attrib no)(dic "?d"))" crlf)))

(defrule MAIN::missing-feature-bigrams
	(words-under alias)
	(feature-alias(feature ?feature)(alias ?alias)(dic ?d))
	(not (bigram-data(bigram ?bigram&:(eq (str-compare ?bigram ?alias) 0))))
	=>
	(bind ?len (length$ (create$ (explode$ $?alias))))
	(if(= ?len 2)
		then
			(printout missing_feature_facts "(missing_feature(feature "?alias")(attrib no)(dic "?d"))" crlf)))


(defrule MAIN::missing-feature-tigrams
	(words-under alias)
	(feature-alias(feature ?feature)(alias ?alias)(dic ?d))
	(not (trigram-data(trigram ?trigram&:(eq (str-compare ?trigram ?alias) 0))))
	=>
	(bind ?len (length$ (create$ (explode$ $?alias))))
	(if(= ?len 3)
		then
			(printout missing_feature_facts "(missing_feature(feature "?alias")(attrib no)(dic "?d"))" crlf)))

(defrule MAIN::missing-feature-4grams
	(words-under alias)
	(feature-alias(feature ?feature)(alias ?alias)(dic ?d))
	(not (fourgram-data(fourgram ?fourgram&:(eq (str-compare ?fourgram ?alias) 0))))
	=>
	(bind ?len (length$ (create$ (explode$ $?alias))))
	(if(= ?len 4)
		then
			(printout missing_feature_facts "(missing_feature(feature "?alias")(attrib no)(dic "?d"))" crlf)))

(defrule MAIN::missing-feature-5grams
	(words-under alias) ;; trigger
	(feature-alias(feature ?feature)(alias ?alias)(dic ?d))
	(not (fivegram-data(fivegram ?fivegram&:(eq (str-compare ?fivegram ?alias) 0))))
	=>
	(bind ?len (length$ (create$ (explode$ $?alias))))
	(if(= ?len 5)
		then
			(printout missing_feature_facts "(missing_feature(feature "?alias")(attrib no)(dic "?d"))" crlf)))