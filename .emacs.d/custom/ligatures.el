;;;;;;;;;;;;;;;
;; Ligatures ;;
;;;;;;;;;;;;;;;
(use-package ligature
  :load-path "~/.emacs.d/ligature/"
  ;;:ensure t
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\" "://"))
  (ligature-set-ligatures 'cc-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t)
  )


;; (use-package composite
;;   :defer t
;;   :init
;;   (defvar composition-ligature-table (make-char-table nil))
;;   :hook
;;   (((prog-mode conf-mode nxml-mode markdown-mode help-mode)
;;     . (lambda () (setq-local composition-function-table composition-ligature-table))))
;;   :config
;;   ;; support ligatures, some toned down to prevent hang
;;   ;;(when (version<= "27.0" emacs-version)
;;   (let ((alist
;;          '((33 . ".\\(?:\\(==\\|[!=]\\)[!=]?\\)")
;;            (35 . ".\\(?:\\(###?\\|_(\\|[(:=?[_{]\\)[#(:=?[_{]?\\)")
;;            (36 . ".\\(?:\\(>\\)>?\\)")
;;            (37 . ".\\(?:\\(%\\)%?\\)")
;;            (38 . ".\\(?:\\(&\\)&?\\)")
;;            (42 . ".\\(?:\\(\\*\\*\\|[*>]\\)[*>]?\\)")
;;            ;; (42 . ".\\(?:\\(\\*\\*\\|[*/>]\\).?\\)")
;;            (43 . ".\\(?:\\([>]\\)>?\\)")
;;            ;; (43 . ".\\(?:\\(\\+\\+\\|[+>]\\).?\\)")
;;            (45 . ".\\(?:\\(-[->]\\|<<\\|>>\\|[-<>|~]\\)[-<>|~]?\\)")
;;            ;; (46 . ".\\(?:\\(\\.[.<]\\|[-.=]\\)[-.<=]?\\)")
;;            (46 . ".\\(?:\\(\\.<\\|[-=]\\)[-<=]?\\)")
;;            (47 . ".\\(?:\\(//\\|==\\|[=>]\\)[/=>]?\\)")
;;            ;; (47 . ".\\(?:\\(//\\|==\\|[*/=>]\\).?\\)")
;;            (48 . ".\\(?:\\(x[a-fA-F0-9]\\).?\\)")
;;            (58 . ".\\(?:\\(::\\|[:<=>]\\)[:<=>]?\\)")
;;            (59 . ".\\(?:\\(;\\);?\\)")
;;            (60 . ".\\(?:\\(!--\\|\\$>\\|\\*>\\|\\+>\\|-[-<>|]\\|/>\\|<[-<=]\\|=[<>|]\\|==>?\\||>\\||||?\\|~[>~]\\|[$*+/:<=>|~-]\\)[$*+/:<=>|~-]?\\)")
;;            (61 . ".\\(?:\\(!=\\|/=\\|:=\\|<<\\|=[=>]\\|>>\\|[=>]\\)[=<>]?\\)")
;;            (62 . ".\\(?:\\(->\\|=>\\|>[-=>]\\|[-:=>]\\)[-:=>]?\\)")
;;            (63 . ".\\(?:\\([.:=?]\\)[.:=?]?\\)")
;;            (91 . ".\\(?:\\(|\\)[]|]?\\)")
;;            ;; (92 . ".\\(?:\\([\\n]\\)[\\]?\\)")
;;            (94 . ".\\(?:\\(=\\)=?\\)")
;;            (95 . ".\\(?:\\(|_\\|[_]\\)_?\\)")
;;            (119 . ".\\(?:\\(ww\\)w?\\)")
;;            (123 . ".\\(?:\\(|\\)[|}]?\\)")
;;            (124 . ".\\(?:\\(->\\|=>\\||[-=>]\\||||*>\\|[]=>|}-]\\).?\\)")
;;            (126 . ".\\(?:\\(~>\\|[-=>@~]\\)[-=>@~]?\\)"))))
;;     (dolist (char-regexp alist)
;;       (set-char-table-range composition-ligature-table (car char-regexp)
;;                             `([,(cdr char-regexp) 0 font-shape-gstring]))))
;;   (set-char-table-parent composition-ligature-table composition-function-table);;)
;;   )

