;; CLIPS 5gram generator

(deftemplate fivegram-data
	(slot fivegram)(multislot location-id)(multislot signature))

(defrule MAIN::5gram-create
	(stmt statement)
	(spec-statement(statement ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?x (lowcase ?x))
	(bind ?list(create$))
	(bind ?fivegram-1(create$))
	(bind ?fivegram-2(create$))
	(bind ?fivegram-3(create$))
	(bind ?fivegram-4(create$))
	(bind ?fivegram-5(create$))
	(bind ?fivegram-list(create$))
	(bind ?len(str-length ?x))
	(bind ?p(str-index " " ?x))
	(loop-for-count (?traverse 1 ?len) 
		do
			(bind ?char(sub-string ?traverse ?traverse ?x))
			(if(eq TRUE (eq " " ?char))
				then
					(bind ?list(create$ ?list ?traverse)))) ;;?list is a list of all indices of " "
	(bind ?list(create$ ?list (+ ?len 1))) ;; appending the penultimate index of string to list
	(bind ?start 1)
	(progn$ (?i ?list)
	(bind ?end (- ?i 1))
	(bind ?fivegram-1(create$ ?fivegram-1 (sub-string ?start ?end ?x)))
	(bind ?start(+ ?end 2)))
	(bind ?fivegram-2 (rest$ ?fivegram-1))
	(bind ?fivegram-3 (rest$ ?fivegram-2))
	(bind ?fivegram-4 (rest$ ?fivegram-3))
	(bind ?fivegram-5 (rest$ ?fivegram-4))

	(bind ?l(length$ ?fivegram-1))
	(loop-for-count (?loop 1 (- ?l 1))
		do
			(bind ?w1(nth$ ?loop ?fivegram-1))
			(if(and (neq "" ?w1)(neq nil ?w1))
				then
					(bind ?w2(nth$ ?loop ?fivegram-2))
					(if(and (neq "" ?w2)(neq nil ?w2))
						then
							(bind ?w3(nth$ ?loop ?fivegram-3))
							(if(and(neq "" ?w3)(neq nil ?w3))
								then
									(bind ?w4(nth$ ?loop ?fivegram-4))
									(if(and(neq "" ?w4)(neq nil ?w4))
										then
											(bind ?w5(nth$ ?loop ?fivegram-5))
											(if(and(neq "" ?w5)(neq nil ?w5))
												then
													(bind ?bg(str-cat ?w1 " " ?w2))
													(bind ?tg(str-cat ?bg " " ?w3))
													(bind ?fg(str-cat ?tg " " ?w4))
													(bind ?fiveg(str-cat ?fg " " ?w5))
													(bind ?fivegram-list(create$ ?fivegram-list ?fiveg))
											else
												(break))
									else
										(break))
							else
								(break))
					else
						(break))
			else
				(break)))
			
	(if(<> 0 (length$ ?fivegram-list))
		then
			(progn$ (?i ?fivegram-list)
			(bind ?loc (implode$ $?location-id))
			(bind ?sig (implode$ $?signature))
			(printout fivegram_facts "(fivegram-data(fivegram ""\""?i"\""")(location-id "?loc")(signature "?sig"))" crlf)
			(assert(fivegram-data(fivegram ?i)(location-id $?location-id)(signature $?signature))))))
