;; CLIPS trigram generator

(deftemplate trigram-data
	(slot trigram)(multislot location-id)(multislot signature))

(defrule MAIN::trigram-create
	(stmt statement)
	(spec-statement(statement ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?x(lowcase ?x))
	(bind ?list(create$))
	(bind ?trigram-1(create$))
	(bind ?trigram-2(create$))
	(bind ?trigram-3(create$))
	(bind ?trigram-list(create$))
	(bind ?len(str-length ?x))
	(bind ?p(str-index " " ?x))
	(loop-for-count (?traverse 1 ?len) 
		do
			(bind ?char(sub-string ?traverse ?traverse ?x))
			(if(eq TRUE (eq " " ?char))
				then
					(bind ?list(create$ ?list ?traverse))))
	(bind ?list(create$ ?list (+ ?len 1)))
	(bind ?start 1)
	(progn$ (?i ?list)
	(bind ?end (- ?i 1))
	(bind ?trigram-1(create$ ?trigram-1 (sub-string ?start ?end ?x)))
	(bind ?start(+ ?end 2)))
	(bind ?trigram-2 (rest$ ?trigram-1))
	(bind ?trigram-3 (rest$ ?trigram-2))
	(bind ?l(length$ ?trigram-1))
	(loop-for-count (?loop 1 (- ?l 1))
		do
			(bind ?w1(nth$ ?loop ?trigram-1))
			(if(and (neq "" ?w1)(neq nil ?w1))
				then
					(bind ?w2(nth$ ?loop ?trigram-2))
					(if(and(neq "" ?w2)(neq nil ?w2))
						then
							(bind ?w3(nth$ ?loop ?trigram-3))
							(if(and(neq "" ?w3)(neq nil ?w3))
								then
									(bind ?bg(str-cat ?w1 " " ?w2))
									(bind ?tg(str-cat ?bg " " ?w3))
									(bind ?trigram-list(create$ ?trigram-list ?tg))
							else
								(break))
					else
						(break))
			else
				(break)))
			
	(if(<> 0 (length$ ?trigram-list))
		then
			(progn$ (?i ?trigram-list)
			(bind ?loc (implode$ $?location-id))
			(bind ?sig (implode$ $?signature))
			(printout trigram_facts "(trigram-data(trigram ""\""?i"\""")(location-id "?loc")(signature "?sig"))" crlf)
			(assert(trigram-data(trigram ?i)(location-id $?location-id)(signature $?signature))))))



