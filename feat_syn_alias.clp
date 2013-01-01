(deftemplate feat-syn-alias
	(slot feature)(slot alias))

(defrule feat-syn-alias-rule
	(trigger feature)
	(feature-alias(feature ?f)(alias ?x))
	(synonym-alias(feature ?f)(alias ?y))
	=>
	(printout feat-syn "(feat-syn-alias(feature ""\""?f"\""")(alias ""\""?y"\""")" crlf)
	(assert(feat-syn-alias(feature ?f)(alias ?y))))

