;; splitting object

(deftemplate object-alias
	(slot object)(multislot alias))

(defrule MAIN::dict-object-alias-creation
	(words-under object)
	(dict(object ?x))
	=>
	(bind ?x(lowcase ?x))
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
							(bind ?w ?stripped-stripped-stripped-string)
							(printout splitted_objects "(object-alias(object ""\""?x"\""")(alias ""\""?w"\"""))" crlf)
							(assert(object-alias(object ?x)(alias ?w)))
					else
					(bind ?w ?stripped-stripped-string)
					(printout splitted_objects "(object-alias(object ""\""?x"\""")(alias ""\""?w"\"""))" crlf)
					(assert(object-alias(object ?x)(alias ?w))))
			else
			(bind ?w ?stripped-string)
			(printout splitted_objects "(object-alias(object ""\""?x"\""")(alias ""\""?w"\"""))" crlf)
			(assert(object-alias(object ?x)(alias ?w))))
	else
		(printout splitted_objects "(object-alias(object ""\""?x"\""")(alias ""\""?x"\"""))" crlf)
		(assert(object-alias(object ?x)(alias ?x)))))
	
