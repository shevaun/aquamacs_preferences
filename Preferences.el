;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(require 'package)
;; Marmalade
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; The original ELPA archive still has some useful
;; stuff.
(add-to-list 'package-archives
	     '("elpa" . "http://tromey.com/elpa/"))
(package-initialize)

(load-file "~/.emacs.d/rvm.el")
(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(setq vc-handled-backends '(git))

;; fixes buggy ruby indentation in aquamacs 3.0a http://stackoverflow.com/questions/19900180/emacs-24-ruby-mode-indentation-behavior-when-using-iterator-such-as-each
(setq ruby-use-smie nil)

;; better buffer switching
(require 'flx-ido)
(require 'tramp)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; Colour Scheme
(require 'color-theme)
(color-theme-initialize) ;; required for Aquamacs
(load-file "~/.emacs.d/color-themes/railscasts.el")
(color-theme-railscasts)

(add-to-list 'load-path "~/src/github/magit")
(require 'magit)

(dolist (elm '("yasnippet" "full-ack" "slim-mode"))
 (add-to-list 'load-path (concat "~/.emacs.d/vendor/" elm)))

(require 'slim-mode)
(require 'coffee-mode)
(require 'yaml-mode)
(require 'haml-mode)
(require 'sass-mode)

(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; ---- ruby -----

(require 'ruby-mode)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/rails-minor-mode"))
(require 'rails)

(add-to-list 'load-path (expand-file-name "~/Library/Application\ Support/Aquamacs\ Emacs/rhtml-minor-mode"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode (lambda () (rails-minor-mode 1)))

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.prawn$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rtex$" . latex-mode))
(add-to-list 'auto-mode-alist '("\\.rsel$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

;; General settings
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; Key bindings
(global-set-key [M-return] 'imenu)
(global-set-key [M-C-delete] 'backward-kill-sexp)
(global-set-key "\C-cH" 'hide-lines)
(global-set-key [S-M-f12] 'previous-buffer)
(global-set-key [M-f12] 'next-buffer)
(global-set-key [S-f12] 'main-rails-project)
(global-set-key [C-S-f12] 'make-main-rails-project)
(global-set-key [f12] 'toggle-buffer)
(global-set-key [C-M-tab] 'ispell-complete-word)
(global-set-key [f6] 'hs-toggle-hiding)
(global-set-key [C-f6] 'hs-hide-all)
(global-set-key [S-f6] 'hs-show-all)
(global-set-key [?\s-.] 'myswitch-to-scratch)
(global-set-key [?\C-o] 'open-line-above)
(global-set-key [f5] 'ack)
(global-set-key [S-f5] 'project-find)
(global-set-key [f10] 'next-match)
(global-set-key [C-f10] 'compile)
(global-set-key [S-f9] 'ruby-test:find-last)
(global-set-key [C-f9] 'ruby-test:run-one)
(global-set-key [C-S-f9] 'ruby-test:run)
(global-set-key [f9] 'ruby-test:rerun)
(global-set-key [S-f10] 'ruby-test:toggle)
(global-set-key [M-f9] 'ruby-test:previous)
(global-set-key [s-M-f9] 'ruby-test:delete-current)
(global-set-key [s-S-f9] 'ruby-test:list-marks)
(global-set-key [S-M-f9] 'ruby-test:next)
(global-set-key [C-f11] 'work-mark:add)
(global-set-key [S-f11] 'work-mark:current)
(global-set-key [M-f11] 'work-mark:previous)
(global-set-key [s-M-f11] 'work-mark:delete-current)
(global-set-key [s-S-f11] 'work-mark:list-marks)
(global-set-key [S-M-f11] 'work-mark:next)
(global-set-key [f11] 'work-mark:toggle)
(global-set-key [?\C-'] 'rails-core:goto-backtrace)
(global-set-key [f7] 'ediff-revision)
(global-set-key [f8] 'ediff-buffers)
(global-set-key [M-f10] 'switch-to-compile-buffer)
(global-set-key [C-tab] 'indent-according-to-mode)
(global-set-key [?\s-D] 'describe-text-properties)
(global-set-key [C-S-iso-lefttab] 'vcursor-swap-point)
(global-set-key [?\C-+] 'text-scale-decrease)
(global-set-key [?\M-+] 'text-scale-mode)
(global-set-key [?\C-=] 'text-scale-increase)
(global-set-key (kbd "C-x C-e") 'eval-buffer)


;; functions

(defun toggle-buffer ()
  "switch to other-buffer"
  (interactive "")
 (switch-to-buffer (other-buffer))
  )

(defun open-line-above (count)
  "open-line from any point along line"
  (interactive "p")
  (indent-according-to-mode)
  (beginning-of-line)
  (open-line count)
  (indent-according-to-mode)
  )
