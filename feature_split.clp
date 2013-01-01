;; splitting feature 

(deftemplate feature-alias
	(slot feature)(multislot alias))

(defrule MAIN::dict-feature-alias-creation
	(words-under feature)
	(dict(feature $?x)(type ?t)(dic ?d))
	=>
	(bind ?x (implode$ ?x))
	(bind ?x (lowcase ?x))
	(bind ?l(str-length ?x))
	(if(eq TRUE(integerp(bind ?p (str-index "-" ?x))))
		then
			(bind ?p(str-index "-" ?x))
			(bind ?b (- ?p 1))
			(bind ?a (+ ?p 1))
			(bind ?before (sub-string 0 ?b ?x))
			(bind ?after (sub-string ?a ?l ?x))
			(bind ?stripped-string (str-cat ?before " " ?after))
			(if(eq TRUE(integerp(bind ?p (str-index "-" ?stripped-string))))
				then
					(bind ?l(str-length ?stripped-string))
					(bind ?p(str-index "-" ?stripped-string))
					(bind ?b (- ?p 1))
					(bind ?a (+ ?p 1))
					(bind ?before (sub-string 0 ?b ?stripped-string))
					(bind ?after (sub-string ?a ?l ?stripped-string))
					(bind ?stripped-stripped-string (str-cat ?before " " ?after))
					(if(eq TRUE(integerp(bind ?p (str-index "-" ?stripped-stripped-string))))
						then
							(bind ?l(str-length ?stripped-stripped-string))
							(bind ?p(str-index "-" ?stripped-stripped-string))
							(bind ?b (- ?p 1))
							(bind ?a (+ ?p 1))
							(bind ?before (sub-string 0 ?b ?stripped-stripped-string))
							(bind ?after (sub-string ?a ?l ?stripped-stripped-string))
							(bind ?stripped-stripped-stripped-string (str-cat ?before " " ?after))
							(printout splitted_features "(feature-alias(feature ""\""?x"\""")(alias ""\""?stripped-stripped-stripped-string"\""")(type "\"""?t"\""")(dic ""\""?d"\"""))" crlf)
							(assert(feature-alias(feature ?x)(alias ?stripped-stripped-stripped-string)))
					else
					(printout splitted_features "(feature-alias(feature ""\""?x"\""")(alias ""\""?stripped-stripped-string"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)
					(assert(feature-alias(feature ?x)(alias ?stripped-stripped-string))))
			else
			(printout splitted_features "(feature-alias(feature ""\""?x"\""")(alias ""\""?stripped-string"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)
			(assert(feature-alias(feature ?x)(alias ?stripped-string))))
	else
		(printout splitted_features "(feature-alias(feature ""\""?x"\""")(alias ""\""?x"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)
		(assert(feature-alias(feature ?x)(alias ?x)))))
	
