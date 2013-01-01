;; CLIPS 4gram generator

(deftemplate fourgram-data
	(slot fourgram)(multislot location-id)(multislot signature))

(defrule MAIN::4gram-create
	(stmt statement)
	(spec-statement(statement ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?x (lowcase ?x))
	(bind ?list(create$))
	(bind ?fourgram-1(create$))
	(bind ?fourgram-2(create$))
	(bind ?fourgram-3(create$))
	(bind ?fourgram-4(create$))
	(bind ?fourgram-list(create$))
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
	(bind ?fourgram-1(create$ ?fourgram-1 (sub-string ?start ?end ?x)))
	(bind ?start(+ ?end 2)))
	(bind ?fourgram-2 (rest$ ?fourgram-1))
	(bind ?fourgram-3 (rest$ ?fourgram-2))
	(bind ?fourgram-4 (rest$ ?fourgram-3))

	(bind ?l(length$ ?fourgram-1))
	(loop-for-count (?loop 1 (- ?l 1))
		do
			(bind ?w1(nth$ ?loop ?fourgram-1))
			(if(and (neq "" ?w1)(neq nil ?w1))
				then
					(bind ?w2(nth$ ?loop ?fourgram-2))
					(if(and (neq "" ?w2)(neq nil ?w2))
						then
							(bind ?w3(nth$ ?loop ?fourgram-3))
							(if(and(neq "" ?w3)(neq nil ?w3))
								then
									(bind ?w4(nth$ ?loop ?fourgram-4))
									(if(and(neq "" ?w4)(neq nil ?w4))
										then
											(bind ?bg(str-cat ?w1 " " ?w2))
											(bind ?tg(str-cat ?bg " " ?w3))
											(bind ?fg(str-cat ?tg " " ?w4))
											(bind ?fourgram-list(create$ ?fourgram-list ?fg))
									else
										(break))
							else
								(break))
					else
						(break))
			else
				(break)))
			
	(if(<> 0 (length$ ?fourgram-list))
		then
			(progn$ (?i ?fourgram-list)
			(bind ?loc (implode$ $?location-id))
			(bind ?sig (implode$ $?signature))
			(printout fourgram_facts "(fourgram-data(fourgram ""\""?i"\""")(location-id "?loc")(signature "?sig"))" crlf)
			(assert(fourgram-data(fourgram ?i)(location-id $?location-id)(signature $?signature))))))
