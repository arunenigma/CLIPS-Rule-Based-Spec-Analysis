;; CLIPS code to splice attributes


(defrule MAIN::dict-attribute-alias-creation
	(words-under attribute)
	(dict(attribute ?x)(type ?t)(dic ?d))
	=>
	(bind ?l (str-length (str-cat ?x)))
	(bind ?x (str-cat ?x))
	(if(eq TRUE(integerp(bind ?p (str-index "," ?x))))
		then
			(bind ?p(str-index "," ?x))
			(bind ?b (- ?p 1))
			(bind ?a (+ ?p 1))
			(bind ?before (sub-string 0 ?b ?x))
			(if(eq TRUE(integerp(bind ?p (str-index "," ?before))))
				then
					(bind ?len(str-length ?before))
					(bind ?pin(str-index "," ?before))
					(bind ?pre (- ?pin 1))
					(bind ?next (+ ?pin 1))
					(bind ?bf (sub-string 0 ?pre ?before))
					(bind ?af (sub-string ?next ?len ?before))
					(bind ?stripped-string (str-cat ?bf " " ?af))
									
				(if(eq TRUE(integerp(bind ?p (str-index "," ?stripped-string))))
					then
						(bind ?len(str-length ?stripped-string))
						(bind ?pin(str-index "," ?stripped-string))
						(bind ?pre (- ?pin 1))
						(bind ?next (+ ?pin 1))
						(bind ?bf (sub-string 0 ?pre ?stripped-string))
						(bind ?af (sub-string ?next ?len ?stripped-string))
						(bind ?stripped-stripped-string (str-cat ?bf " " ?af))

					(if(eq TRUE(integerp(bind ?p (str-index "," ?stripped-stripped-string))))
					then
						(bind ?len(str-length ?stripped-stripped-string))
						(bind ?pin(str-index "," ?stripped-stripped-string))
						(bind ?pre (- ?pin 1))
						(bind ?next (+ ?pin 1))
						(bind ?bf (sub-string 0 ?pre ?stripped-stripped-string))
						(bind ?af (sub-string ?next ?len ?stripped-stripped-string))
						(bind ?stripped-stripped-stripped-string (str-cat ?bf " " ?af))

						(if(eq TRUE(integerp(bind ?p (str-index "," ?stripped-stripped-stripped-string))))
						then
							(bind ?len(str-length ?stripped-stripped-stripped-string))
							(bind ?pin(str-index "," ?stripped-stripped-stripped-string))
							(bind ?pre (- ?pin 1))
							(bind ?next (+ ?pin 1))
							(bind ?bf (sub-string 0 ?pre ?stripped-stripped-stripped-string))
							(bind ?af (sub-string ?next ?len ?stripped-stripped-stripped-string))
							(bind ?stripped-stripped-stripped-stripped-string (str-cat ?bf " " ?af))
							(progn$ (?i (create$ (explode$ ?stripped-stripped-stripped-stripped-string)))
							(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf))
						else
							(progn$ (?i (create$ (explode$ ?stripped-stripped-stripped-string)))
							(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)))		

					else
						(progn$ (?i (create$ (explode$ ?stripped-stripped-string)))
						(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)))
						
				else
					
						(progn$ (?i (create$ (explode$ ?stripped-string)))
						(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)))				
			else
				
					(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?before"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf))
			

			(bind ?after (sub-string ?a ?l ?x))
			(if(eq TRUE(integerp(bind ?p (str-index "," ?after))))
				then
					(bind ?len(str-length ?after))
					(bind ?pin(str-index "," ?after))
					(bind ?pre (- ?pin 1))
					(bind ?next (+ ?pin 1))
					(bind ?bf (sub-string 0 ?pre ?after))
					(bind ?af (sub-string ?next ?len ?after))
					(bind ?stripped-string (str-cat ?bf " " ?af))

					(if(eq TRUE(integerp(bind ?p (str-index "," ?stripped-string))))
						then
							(bind ?len(str-length ?stripped-string))
							(bind ?pin(str-index "," ?stripped-string))
							(bind ?pre (- ?pin 1))
							(bind ?next (+ ?pin 1))
							(bind ?bf (sub-string 0 ?pre ?stripped-string))
							(bind ?af (sub-string ?next ?len ?stripped-string))
							(bind ?stripped-stripped-string (str-cat ?bf " " ?af))
						
						(if(eq TRUE(integerp(bind ?p (str-index "," ?stripped-stripped-string))))
							then
								(bind ?len(str-length ?stripped-stripped-string))
								(bind ?pin(str-index "," ?stripped-stripped-string))
								(bind ?pre (- ?pin 1))
								(bind ?next (+ ?pin 1))
								(bind ?bf (sub-string 0 ?pre ?stripped-stripped-string))
								(bind ?af (sub-string ?next ?len ?stripped-stripped-string))
								(bind ?stripped-stripped-stripped-string (str-cat ?bf " " ?af))
	
							(if(eq TRUE(integerp(bind ?p (str-index "," ?stripped-stripped-stripped-string))))
								then
								(bind ?len(str-length ?stripped-stripped-stripped-string))
								(bind ?pin(str-index "," ?stripped-stripped-stripped-string))
								(bind ?pre (- ?pin 1))
								(bind ?next (+ ?pin 1))
								(bind ?bf (sub-string 0 ?pre ?stripped-stripped-stripped-string))
								(bind ?af (sub-string ?next ?len ?stripped-stripped-stripped-string))
								(bind ?stripped-stripped-stripped-stripped-string (str-cat ?bf " " ?af))
	
								(progn$ (?i (create$ (explode$ ?stripped-stripped-stripped-stripped-string)))
								(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf))
						else
							(progn$ (?i (create$ (explode$ ?stripped-stripped-stripped-string)))
							(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)))
					else
						(progn$ (?i (create$ (explode$ ?stripped-stripped-string)))
						(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)))
				else
						
						(progn$ (?i (create$ (explode$ ?stripped-string)))
						(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?i"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)))
			else
				
					(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?after"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf))
		else

			(if(eq TRUE(integerp(bind ?p (str-index "," ?x))))
					then
						(bind ?len(str-length ?x))
						(bind ?pin(str-index "," ?x))
						(bind ?pre (- ?pin 1))
						(bind ?next (+ ?pin 1))
						(bind ?bf (sub-string 0 ?pre ?x))
						(bind ?af (sub-string ?next ?len ?x))
						(bind ?stripped-string (str-cat ?bf " " ?af))
						(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?stripped-string"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf)
			
			else
				(bind ?x (str-cat ?x))
				(printout splitted_attributes "(attribute-alias(attribute ""\""?x"\""")(alias ""\""?x"\""")(type ""\""?t"\""")(dic ""\""?d"\"""))" crlf))
))



