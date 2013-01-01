;; CLIPS bigram generator

(deftemplate bigram-data
	(slot bigram)(multislot location-id)(multislot signature))

(defrule MAIN::bigram-create
	(stmt statement)
	(spec-statement(statement ?x)(location-id $?location-id)(signature $?signature))
	=>
	(bind ?x(lowcase ?x))
	(bind ?list(create$))
	(bind ?bigram-1(create$))
	(bind ?bigram-2(create$))
	(bind ?bigram-list(create$))
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
	(bind ?bigram-1(create$ ?bigram-1 (sub-string ?start ?end ?x)))
	(bind ?start(+ ?end 2)))
	(bind ?bigram-2 (rest$ ?bigram-1))
	(bind ?l(length$ ?bigram-1))
	(loop-for-count (?loop 1 (- ?l 1))
		do
			(bind ?w1(nth$ ?loop ?bigram-1))
			(bind ?w2(nth$ ?loop ?bigram-2))
			(if(neq "" ?w2)
				then
					(bind ?bg(str-cat ?w1 " " ?w2))
					(bind ?bigram-list(create$ ?bigram-list ?bg))
			else
				(break)))
	(if(<> 0 (length$ ?bigram-list))
		then
			(progn$ (?i ?bigram-list)
			(bind ?loc (implode$ $?location-id))
			(bind ?sig (implode$ $?signature))
			(printout bigram_facts "(bigram-data(bigram ""\""?i"\""")(location-id "?loc")(signature "?sig"))" crlf)
			(assert(bigram-data(bigram ?i)(location-id $?location-id)(signature $?signature))))))
