(add-to-list 'load-path (concat emacs-plugin-dir "/jdee-2.4.1/lisp"))
(load "jde")

(setq jde-jdk '("1.6.0_26"))

(setq jde-jdk-registry '(
		  ("1.5.0._17" . "/home/bin/java/jdk1.5.0_17") 
		  ("1.6.0_26" . "/home/bin/java/jdk1.6.0_26") 
		  ("1.7" . "/usr/lib/jvm/java-7-openjdk")))
						 




