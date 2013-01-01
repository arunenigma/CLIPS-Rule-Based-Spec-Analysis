(deftemplate filled-feature
	(multislot feature)(slot type)(multislot attribute)(slot dic))

(defrule MAIN::combine-facts-bool-yes
	(words-under feature)
	(missing_feature(feature $?f)(dic ?d))	
	=>	
	(assert(filled-feature(feature $?f)(type bool)(attribute no)(dic ?d))))

(defrule MAIN::combine-facts-bool-no
	(words-under feature)
	(ff-bool(feature $?f)(dic ?d))	
	=>	
	(assert(filled-feature(feature $?f)(type bool)(attribute yes)(dic ?d))))

(defrule MAIN::combine-facts-set-attribute
	(words-under feature)
	(set-attribute(feature $?f)(type set)(attribute $?a)(dic ?d))	
	=>	
	(assert(filled-feature(feature $?f)(type set)(attribute $?a)(dic ?d))))


(defrule MAIN::combine-facts-number-attribute
	(words-under feature)
	(number-attribute(feature $?f)(type number)(attribute $?a)(dic ?d))	
	=>	
	(assert(filled-feature(feature $?f)(type number)(attribute $?a)(dic ?d))))

