;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; to get aquamacs connecting to melpa package repo
(with-eval-after-load 'tls
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
  (push "/private/etc/ssl/cert.pem" gnutls-trustfiles))

(defvar custom-packages
  '(ag exec-path-from-shell feature-mode rbenv rspec-mode ruby-tools yaml-mode flx-ido)
  "A list of packages to ensure are installed at launch.")

(defun custom-packages-installed-p ()
  (loop for p in custom-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (custom-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Aquamacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p custom-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'custom-packages)
;;; custom-packages.el ends here

;; package exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq vc-handled-backends '(git))

;; no tabs by default. modes that really need tabs should enable
;; indent-tabs-mode explicitly. makefile-mode already does that, for
;; example.
(setq-default indent-tabs-mode nil)

;; if indent-tabs-mode is off, untabify before saving
(add-hook 'write-file-hooks
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))
            nil ))

;; fixes buggy ruby indentation in aquamacs 3.0a http://stackoverflow.com/questions/19900180/emacs-24-ruby-mode-indentation-behavior-when-using-iterator-such-as-each
;;(setq ruby-use-smie nil)
(setq js-indent-level 2)

;; better buffer switching
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(flx-ido-mode 1)
(setq ido-use-faces nil)

;; Set default ruby version
(setq rbenv-installation-dir "/opt/homebrew/bin/rbenv")
(rbenv-use-corresponding)

(require 'coffee-mode)
(require 'sass-mode)
(require 'snippet)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; --- searching ---
(require 'ag) ;; install from melpa
(setq ag-highlight-search t)
(setq ag-reuse-buffers 't)

;; ---- go ----
;;(require 'go-mode)
;;(add-hook 'go-mode-hook 'rats-mode)

;; ---- ruby -----

(require 'ruby-mode)

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/rails-minor-mode"))
;; (require 'rails)

;;(add-to-list 'load-path (expand-file-name "~/Library/Application\ Support/Aquamacs\ Emacs/rhtml-minor-mode"))
;;(require 'rhtml-mode)
;;(add-hook 'rhtml-mode (lambda () (rails-minor-mode 1)))

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


(require 'web-mode)

(setq web-mode-engines-alist
  '(("erb" . "\\.erb.html\\'"))
)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (web-mode-set-engine "erb")
)
(add-hook 'web-mode-hook  'my-web-mode-hook)


;; (require 'mmm-auto)
;; (setq mmm-global-mode 'auto)
;; (mmm-add-mode-ext-class 'html-erb-mode "\\.html.erb\\'" 'erb)
;; (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
;; (add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
            (global-linum-mode 1)))

(setq ruby-insert-encoding-magic-comment nil)

;; -- modes --
(require 'feature-mode) ;; install from melpa
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; General settings
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'whitespace)
(setq whitespace-line-column 120) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'ruby-mode-hook 'whitespace-mode)

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
(global-set-key [f5] 'ag-project)
(global-set-key [S-f5] 'ag-project-dired)
(global-set-key [C-f5] 'ag-regexp)
(global-set-key [f10] 'next-match)
(global-set-key [C-f10] 'compile)
(global-set-key [f9] 'rspec-verify) ;; run current test file
(global-set-key [S-f9] 'rspec-verify-single) ;; run current spec
(global-set-key [C-f9] 'rspec-rerun) ;; rerun last test
(global-set-key [C-S-f9] 'ruby-test:run)
(global-set-key [S-f10] 'ruby-test:toggle)
(global-set-key [M-f9] 'ruby-test:previous)
(global-set-key [s-M-f9] 'ruby-test:delete-current)
(global-set-key [s-S-f9] 'ruby-test:list-marks)
(global-set-key [S-M-f9] 'ruby-test:next)
;; (global-set-key [C-f11] 'work-mark:add)
;; (global-set-key [S-f11] 'work-mark:current)
;; (global-set-key [M-f11] 'work-mark:previous)
;; (global-set-key [s-M-f11] 'work-mark:delete-current)
;; (global-set-key [s-S-f11] 'work-mark:list-marks)
;; (global-set-key [S-M-f11] 'work-mark:next)
;; (global-set-key [f11] 'work-mark:toggle)
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
(global-set-key (kbd "C-'") 'mark-line-or-next)

;; functions

(defun senny-ruby-open-spec-other-buffer ()
  (interactive)
  (when (featurep 'rspec-mode)
    (let ((source-buffer (current-buffer))
          (other-buffer (progn
                          (rspec-toggle-spec-and-target)
                          (current-buffer))))
      (switch-to-buffer source-buffer)
      (pop-to-buffer other-buffer))))

(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "^C s") 'senny-ruby-open-spec-other-buffer)))

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

(defun mark-line-or-next ()
  "Marks the current line or extends the mark if there is no current selection"
  (interactive)
  (if mark-active
      (forward-line)
    (progn
      (beginning-of-line)
      (push-mark (point))
      (end-of-line)
      (forward-char)
      (activate-mark)))
  )



(fset 'convert_hash_to_19
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([4 19 61 62 return backspace backspace backspace 58 19 58 return left] 0 "%d")) arg)))

(set-face-attribute 'region nil :background "#000" :foreground "#ff00ff")
