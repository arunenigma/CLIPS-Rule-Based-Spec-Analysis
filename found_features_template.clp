(deftemplate feature-alias
	(slot feature)(slot alias)(slot type)(slot dic))
(deftemplate bigram-data
	(slot bigram)(multislot location-id)(multislot signature))
(deftemplate trigram-data
	(slot trigram)(multislot location-id)(multislot signature))
(deftemplate fourgram-data
	(slot fourgram)(multislot location-id)(multislot signature))
(deftemplate fivegram-data
	(slot fivegram)(multislot location-id)(multislot signature))
