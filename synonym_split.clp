;; CLIPS code to splice synonyms

(deftemplate synonym-alias
	(slot synonym)(multislot alias)(slot feature))

(defrule MAIN::dict-synonym-alias-creation
	(words-under synonym)
	(dict(feature ?f)(synonym ?x)(dic ?d))
	=>
	(bind ?f (str-cat ?f))
	(bind ?l (str-length ?x))
	(if(eq TRUE(integerp(bind ?p (str-index "," ?x))))
		then
			(bind ?p(str-index "," ?x))
			(bind ?b (- ?p 1))
			(bind ?a (+ ?p 1))

			(bind ?before (sub-string 0 ?b ?x))
			(if(eq TRUE(integerp(bind ?p (str-index "-" ?before))))
				then
					(bind ?len(str-length ?before))
					(bind ?pin(str-index "-" ?before))
					(bind ?pre (- ?pin 1))
					(bind ?next (+ ?pin 1))
					(bind ?bf (sub-string 0 ?pre ?before))
					(bind ?af (sub-string ?next ?len ?before))
					(bind ?stripped-string (str-cat ?bf " " ?af))
					(printout splitted_synonyms "(synonym-alias(synonym ""\""?x"\""")(alias ""\""?stripped-string"\""")(feature ""\""?f"\""")(dic ""\""?d"\"""))" crlf)
					(assert(synonym-alias(synonym ?x)(alias ?stripped-string)(feature ?f)))
			else
				(printout splitted_synonyms "(synonym-alias(synonym ""\""?x"\""")(alias ""\""?before"\""")(feature ""\""?f"\""")(dic ""\""?d"\"""))" crlf)
				(assert(synonym-alias(synonym ?x)(alias ?before)(feature ?f))))
			
			(bind ?after (sub-string ?a ?l ?x))
			(if(eq TRUE(integerp(bind ?p (str-index "-" ?after))))
				then
					(bind ?len(str-length ?after))
					(bind ?pin(str-index "-" ?after))
					(bind ?pre (- ?pin 1))
					(bind ?next (+ ?pin 1))
					(bind ?bf (sub-string 0 ?pre ?after))
					(bind ?af (sub-string ?next ?len ?after))
					(bind ?stripped-string (str-cat ?bf " " ?af))
				(printout splitted_synonyms "(synonym-alias(synonym ""\""?x"\""")(alias ""\""?stripped-string"\""")(feature ""\""?f"\""")((dic ""\""?d"\"""))" crlf)
					(assert(synonym-alias(synonym ?x)(alias ?stripped-string)(feature ?f)))
			else
				(printout splitted_synonyms "(synonym-alias(synonym ""\""?x"\""")(alias ""\""?after"\""")(feature ""\""?f"\""")(dic ""\""?d"\"""))" crlf)
				(assert(synonym-alias(synonym ?x)(alias ?after)(feature ?f))))
	else

		(if(eq TRUE(integerp(bind ?p (str-index "-" ?x))))
				then
					(bind ?len(str-length ?x))
					(bind ?pin(str-index "-" ?x))
					(bind ?pre (- ?pin 1))
					(bind ?next (+ ?pin 1))
					(bind ?bf (sub-string 0 ?pre ?x))
					(bind ?af (sub-string ?next ?len ?x))
					(bind ?stripped-string (str-cat ?bf " " ?af))
					(printout splitted_synonyms "(synonym-alias(synonym ""\""?x"\""")(alias ""\""?stripped-string"\""")(feature ""\""?f"\""")(dic ""\""?d"\"""))" crlf)
					(assert(synonym-alias(synonym ?x)(alias ?stripped-string)(feature ?f)))
			else
				(bind ?x (str-cat ?x))
				(printout splitted_synonyms "(synonym-alias(synonym ""\""?x"\""")(alias ""\""?x"\""")(feature ""\""?f"\""")(dic ""\""?d"\"""))" crlf)
				(assert(synonym-alias(synonym ?x)(alias ?x)(feature ?f)))))
)



