(deffunction is-an-integer(?n)
	(bind ?len (length$ (str-cat ?n)))
	(bind ?threshold 0)
	(loop-for-count (?i 1 ?len) 
		do
		(bind ?c (sub-string ?i ?i (str-cat ?n)))
		(if (or (eq "0" ?c) (eq "1" ?c) (eq "2" ?c) (eq "3" ?c) (eq "4" ?c)(eq "5" ?c) (eq "6" ?c) (eq "7" ?c) (eq "8" ?c) (eq "9" ?c))
			then
			(bind ?threshold (+ ?threshold 1))))
	(if (> ?len 1)
		then
			(if (> ?threshold 2)
				then
					return TRUE
				else
					return FALSE)
	else
		(if (= ?threshold 1)
			then
				return TRUE
			else 
				return FALSE)))
			
(defrule MAIN::find-number-attributes
	(ff-number(feature ?x)(loc-id $?loc)(sig $?sig)(dic ?dic))
	(word-data(word ?y)(location-id $?loc ?word)(signature $?sig ?w))
	(spec-statement(statement ?stmt)(location-id $?loc)(signature $?sig))
	=>
	(if (eq ?x ?y)
		then
		(bind ?words (explode$ ?stmt))
		(progn$ (?word ?words)
		(if (eq (str-cat ?word) ?x)
			then
			(bind ?pot (create$ (- ?word-index 1) (+ ?word-index 1)))
			(bind ?may-be (create$ (- ?word-index 2) (+ ?word-index 2)))
			(bind ?depth-2 (create$ (- ?word-index 3) (+ ?word-index 3)))

	(progn$ (?word ?pot)
		(if (eq (is-an-integer (nth$ ?word (explode$ ?stmt))) TRUE)
			then
			(bind ?a (nth$ ?word (explode$ ?stmt)))
			(printout number_attributes "(number-attribute(feature "?x")(type number)(attribute "?a")(dic "?dic"))" crlf)))		

	(progn$ (?word ?may-be)
		(if (eq (is-an-integer (nth$ ?word (explode$ ?stmt))) TRUE)
			then
			(bind ?a (nth$ ?word (explode$ ?stmt)))
			(printout number_attributes "(number-attribute(feature "?x")(type number)(attribute "?a")(dic "?dic"))" crlf)))

		
	(progn$ (?word ?depth-2)
		(if (eq (is-an-integer (nth$ ?word (explode$ ?stmt))) TRUE)
			then
			(bind ?a (nth$ ?word (explode$ ?stmt)))
			(printout number_attributes "(number-attribute(feature "?x")(type number)(attribute "?a")(dic "?dic"))" crlf)))
			)
		)
	)
)
