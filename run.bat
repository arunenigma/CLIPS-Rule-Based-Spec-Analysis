(load "csv_import.clp")
(CSV-import "arm.csv" dict object feature synonym relation type attribute dic)
(CSV-import "uart.csv" dict object feature synonym relation type attribute dic)
(CSV-import "timer.csv" dict object feature synonym relation type attribute dic)
(CSV-import "axi.csv" dict object feature synonym relation type attribute dic)
(CSV-import "zpu.csv" dict object feature synonym relation type attribute dic)
(CSV-import "intr_ctlr.csv" dict object feature synonym relation type attribute dic)
(CSV-import "crypto_blake.csv" dict object feature synonym relation type attribute dic)
(CSV-import "crypto_jh.csv" dict object feature synonym relation type attribute dic)
(CSV-import "mem_ctlr.csv" dict object feature synonym relation type attribute dic)


(retract 1)
(save-facts dict-facts.clp local dict)
(load-facts "dict-facts.clp")

(open "splitted_objects.clp" splitted_objects "w")
(printout splitted_objects "(deffacts object-alias-facts" crlf)
(open "splitted_features.clp" splitted_features "w")
(printout splitted_features "(deffacts feature-alias-facts" crlf)
(open "splitted_synonyms.clp" splitted_synonyms "w")
(printout splitted_synonyms "(deffacts synonym-alias-facts" crlf)
(open "splitted_attributes.clp" splitted_attributes "w")
(printout splitted_attributes "(deffacts attribute-alias-facts" crlf)

(load "feature_split.clp")
(load "object_split.clp")
(load "synonym_split.clp")
(load "attribute_split.clp")

(assert(words-under feature))
(assert(words-under object))
(assert(words-under synonym))
(assert(words-under attribute))

(run)

(save-facts splitted_feat.clp local feature-alias)
(save-facts splitted_syn.clp local synonym-alias)

(printout splitted_objects ")" crlf)
(printout splitted_features ")" crlf)
(printout splitted_synonyms ")" crlf)
(printout splitted_attributes ")" crlf)

;***************************************************************

(open "feature_synonym_mapping.clp" feat-syn "w")
(printout feat-syn "(deffacts feat-syn-alias-facts" crlf)

(load-facts "splitted_feat.clp")
(load-facts "splitted_syn.clp")
(load "feat_syn_alias.clp")
(assert(trigger feature))
(run)

(printout feat-syn ")")
(close)
(clear)
;***************************************************************

(open "bigram_facts.clp" bigram_facts "w")
(printout bigram_facts "(deffacts bigram-data-facts" crlf)
(load "all_statements_template.clp")
(load "all_statements_facts.clp")
(load "bigram.clp")
(reset)
(assert(stmt statement))
(run)
(printout bigram_facts ")")
(clear)
;***************************************************************

(open "trigram_facts.clp" trigram_facts "w")
(printout trigram_facts "(deffacts trigram-data-facts" crlf)
(load "all_statements_template.clp")
(load "all_statements_facts.clp")
(load "trigram.clp")
(reset)
(assert(stmt statement))
(run)
(printout trigram_facts ")")
(clear)
;***************************************************************

(open "fourgram_facts.clp" fourgram_facts "w")
(printout fourgram_facts "(deffacts fourgram-data-facts" crlf)
(load "all_statements_template.clp")
(load "all_statements_facts.clp")
(load "4gram.clp")
(reset)
(assert(stmt statement))
(run)
(printout fourgram_facts ")")
(clear)
;***************************************************************

(open "fivegram_facts.clp" fivegram_facts "w")
(printout fivegram_facts "(deffacts fivegram-data-facts" crlf)
(load "all_statements_template.clp")
(load "all_statements_facts.clp")
(load "5gram.clp")
(reset)
(assert(stmt statement))
(run)
(printout fivegram_facts ")")
(clear)
;***************************************************************

(open "found_feature_facts.clp" found_feature_facts "w")
(printout found_feature_facts "(deffacts found_feature_facts" crlf)

(load "all_words_template.clp")
(load "found_features_template.clp")

(load "all_words_facts.clp")
(load "splitted_features.clp")
(load "bigram_facts.clp")
(load "trigram_facts.clp")
(load "fourgram_facts.clp")
(load "fivegram_facts.clp")
(load "found_features_rule.clp")
(reset)
(run)
(printout found_feature_facts ")")
(clear)
;***************************************************************

(open "missing_feature_facts.clp" missing_feature_facts "w")
(printout missing_feature_facts "(deffacts missing_feature_facts" crlf)

(load "all_words_template.clp")
(load "found_features_template.clp")
(load "all_words_facts.clp")
(load "splitted_features.clp")
(load "bigram_facts.clp")
(load "trigram_facts.clp")
(load "fourgram_facts.clp")
(load "fivegram_facts.clp")
(load "missing_features_rule.clp")
(reset)
(assert(words-under alias))
(run)
(printout missing_feature_facts ")")
(clear)

;***************************************************************

(open "split_attrib_with_loc_facts.clp" split_attrib_with_loc_facts "w")
(printout split_attrib_with_loc_facts "(deffacts split_attrib_with_loc_facts" crlf)
(load "all_words_template.clp")
(load "found_features_template.clp")
(load "splitted_attributes_template.clp")
(load "splitted_attributes.clp")
(load "all_words_facts.clp")
(load "bigram_facts.clp")
(load "split_attribute_with_loc.clp");;rule
(reset)
(run)
(printout split_attrib_with_loc_facts ")" crlf)
(clear)
;***************************************************************

;; collecting found attributes of features

(open "found_attribute_facts.clp" found_attribute_facts "w")
(printout found_attribute_facts "(deffacts found-attribute-facts" crlf)
(load "split_attrib_with_loc_facts_template.clp")
(load "found_feature_facts_template.clp")
(load "split_attrib_with_loc_facts.clp")
(load "found_feature_facts.clp")
(load "found_attributes.clp")
(reset)
(run)
(printout found_attribute_facts ")" crlf)
(clear)

;***************************************************************

;; collecting set attributes alone

(open "set_attribute_facts.clp" set_attribute_facts "w")
(printout set_attribute_facts "(deffacts set-attribute-facts" crlf)
(load "found_attribute_facts_template.clp")
(load "found_attribute_facts.clp")
(load "set_attributes.clp")
(reset)
(assert(words-under set))
(run)
(printout set_attribute_facts ")" crlf)
(clear)

;***************************************************************

;; collecting found features of type bool attributes alone

(open "ff_bool_facts.clp" ff_bool_facts "w")
(printout ff_bool_facts "(deffacts ff_bool_facts" crlf)
(load "found_feature_facts_template.clp")
(load "found_feature_facts.clp")
(load "found_feat_bool.clp")
(reset)
(assert(words-under "bool"))
(run)
(printout ff_bool_facts ")" crlf)
(clear)

;***************************************************************

;; collecting found features of type number attributes alone

(open "ff_number_facts.clp" ff_number_facts "w")
(printout ff_number_facts "(deffacts ff_number_facts" crlf)
(load "found_feature_facts_template.clp")
(load "found_feature_facts.clp")
(load "found_feat_number.clp")
(reset)
(assert(words-under "number"))
(run)
(printout ff_number_facts ")" crlf)
(clear)

;***************************************************************

;; finding number attributes

(open "number_attributes.clp" number_attributes "w")
(printout number_attributes "(deffacts number-attribute-facts" crlf)
(load "ff_number_facts_template.clp")
(load "all_words_template.clp")
(load "ff_number_facts.clp")
(load "all_words_facts.clp")
(load "all_statements_template.clp")
(load "all_statements_facts.clp")
(load "find_number_attributes_rule.clp")
(reset)
(run)
(printout number_attributes ")" crlf)
(close)
(clear)

;***************************************************************

;; combining facts(missing bool features,found bool features,found set features,found number attributes)

(load "combined_facts_template.clp")
(load "missing_feature_facts.clp")
(load "ff_bool_facts.clp")
(load "set_attribute_facts.clp")
(load "number_attributes.clp")
(load "combined_facts_generate_rule.clp")
(reset)
(assert(words-under feature))
(run)
(save-facts ff.clp local filled-feature)
(clear)


(deftemplate filled-feature 
	(multislot feature)(slot type)(multislot attribute)(slot dic))
(load-facts "ff.clp")
(load "csv_export.clp")
(CSV-export "out_ff.csv" filled-feature)

;***************************************************************



























