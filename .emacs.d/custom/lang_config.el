;;;;;;;;;;;;;;;;;;;;;;
;; Language Supports ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; Find a project via projectile
(defun nick/projectile-proj-find-function(dir)
  (let((root (projectile-project-root dir)))
    (and root (cons 'transient root))))
(with-eval-after-load 'project
  (add-to-list 'project-find-functions
	       'nick/projectile-proj-find-function))
(setq company-backends
      (cons 'company-capf
	    (remove 'company-capf company-backends)))

;;(defvar verilator (executable-find "verilator")
;;  "Verilator executable path")
(defvar xvlog (executable-find "xvlog")
  "xvlog executable path")

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-verilog-verilator-executable "/usr/bin/verilator_bin"))

(use-package verilog-mode
  :ensure t
  :config
  (add-hook 'verilog-mode-hook '(lambda ()
				  (setq compilation-error-regexp-alist (delete 'gnu compilation-error-regexp-alist))))
  (setq verilog-tool 'verilog-linter
	verilog-linter "usr/bin/verilator_bin --lint-only --sv --Wall -I ./cpu_pkg.sv __FILE__"
	verilog-coverage "iverilog"
	verilog-simulator "vvp"
	verilog-compiler "iverilog"
	verilog-indent-level 4
	verilog-indent-level-behavioral 4
	verilog-indent-level-declaration 4
	verilog-indent-level-directive 4
	verilog-indent-level-module 4))

;; LSP shit starts here
(use-package lsp-mode
  :ensure t
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil)
  (add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
  (add-hook 'vhdl-mode-hook #'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'c-mode-hook #'lsp)
  (add-hook 'python-mode-hook #'lsp)
  (setq lsp-clients-clangd-args '("-j=4" "-background-index" "-log=error")))

(use-package lsp-ui
  :ensure t
  :requires lsp-mode flycheck
  :commands lsp-ui-mode
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (setq lsp-ui-doc-enable t
	lsp-ui-peek-enable t
	lsp-ui-doc-position 'top
	lsp-ui-doc-include-signature t
	lsp-ui-sideline-enable nil
	lsp-ui-flycheck-enable t
	lsp-ui-flycheck-list-position 'right
	lsp-ui-flycheck-live-reporting t
	lsp-ui-peek-enable t
	lsp-ui-peek-list-width 60
	lsp-ui-peek-peek-height 25
	eldoc-echo-area-use-multiline-p nil))

(use-package company-lsp
  :ensure t
  :requires company
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  (setq company-transformers nil
	company-lsp-async t
	company-lsp-cache-candidates nil))

;; VHDL
;;(lsp-register-client (make-lsp-client :new-connection (lsp-stdio-connection '("vhdl-tool" "lsp"))
;;				      :major-modes '(vhdl-mode)
;;				      :language-id "VHDL"
;;				      :server-id 'lsp-vhdl-mode))

;; C/C++
(setq tab-width 4
      c-default-style "linux"
      c-basic-offset 4
      lsp-clients-clangd-executable (executable-find "clangd"))


;; Python
(defvar pyls (executable-find "pyls")
  "Python Language Server executable path.")


;; JavaScript/Typescript
(defvar js-ts (executable-find "javascript-typescript-langserver")
  "Javascript/Typescript Language Server path.")

(use-package js2-mode
	     :ensure t
	     :init
	     '(js2-mode . (js-ts "--strict")))

(use-package typescript-mode
	     :ensure t
	     :init
	     '(typescript-mode . (js-ts "--strict")))


;; ;; Haskell
;; (defvar haskell-exe (executable-find "REPLACE"))
;; (use-package haskell-mode
;;   :ensure t)
;; (add-to-list 'eglot-server-programs
;; 	     '(haskell-mode . (haskell-exe "")))

;; ;; Latex
;; (use-package auctex
;;   :ensure t
;;   :init
;;   (setq TeX-auto-save t)
;;   (setq TeX-parse-self t)
;;   (setq-default TeX-master nil)
;;   (setq reftex-plug-into-AUCTeX t)
;;   :config
;;   (use-package reftex
;;     :ensure t
;;     :config
;;     (add-hook 'LaTeX-mode-hook 'turn-on-reftex))
;;   (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;   (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;   (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode))

;; LSP for JavaScript and TypeScript
;; (use-package lsp-javascript-typescript
;; 	     :ensure t
;; 	     :init
;; 	     (add-to-list 'js-mode-hook #'lsp-javascript-typescript-enable)
;; 	     (add-to-list 'typescript-mode-hook #'lsp-javascript-typescript-enable))



