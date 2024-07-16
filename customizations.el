(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments (quote ("--smart-case" "--stats")))
 '(ag-ignore-list (quote ("*.css" "*.sass")))
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 360 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-fill-function nil t)
 '(dabbrev-abbrev-char-regexp "\\sw\\|\\s_")
 '(dabbrev-abbrev-skip-leading-regexp ":")
 '(dabbrev-backward-only nil)
 '(dabbrev-case-fold-search nil)
 '(default-frame-alist
    (quote
     ((cursor-type . box)
      (vertical-scroll-bars . right)
      (internal-border-width . 0)
      (fringe)
      (modeline . t)
      (color-theme-name . color-theme-railscasts)
      (tool-bar-lines . 0)
      (menu-bar-lines . 1)
      (right-fringe . 12)
      (left-fringe . 4)
      (font . "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
      (fontsize . 0)
      (font-backend ns)
      (background-color . "#232323")
      (border-color . "#232323")
      (background-mode . dark)
      (mouse-color . "sienna1")
      (cursor-color . "red")
      (foreground-color . "#E6E1DC"))))
 '(exec-path
   (quote
    ("/Users/shevaun/.rbenv/bin" "/Users/shevaun/.rbenv/shims" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/opt/X11/bin" "/usr/local/MacGPG2/bin" "/Users/shevaun/.rvm/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Aquamacs.app/Contents/MacOS/libexec" "/Applications/Aquamacs.app/Contents/MacOS/bin" "/usr/texbin" "/opt/boxen/homebrew/bin")))
 '(fringe-indicator-alist
   (quote
    ((continuation nil nil)
     (truncation left-truncation right-truncation)
     (continuation left-continuation right-continuation)
     (overlay-arrow . right-triangle)
     (up . up-arrow)
     (down . down-arrow)
     (top top-left-angle top-right-angle)
     (bottom bottom-left-angle bottom-right-angle top-right-angle top-left-angle)
     (top-bottom left-bracket right-bracket top-right-angle top-left-angle)
     (empty-line . empty-line)
     (unknown . question-mark))) t)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(ns-right-command-modifier (quote meta))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(package-selected-packages
   (quote
    (mmm-mode web-mode rats go-mode flx-ido yaml-mode ruby-tools rspec-mode rbenv projectile ocodo-svg-modelines feature-mode exec-path-from-shell ag)))
 '(rspec-spec-command "./bin/rspec")
 '(rspec-use-bundler-when-possible nil)
 '(rspec-use-rake-when-possible nil)
 '(rspec-use-spring-when-possible nil)
 '(safe-local-variable-values (quote ((encoding . utf-8) (lexical-binding . t))))
 '(text-mode-hook nil)
 '(visual-line-mode nil t)
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#232323" :foreground "#E6E1DC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Monaco"))))
 '(feature-mode-default ((t (:inherit autoface-default :height 140 :family "PT Mono"))) t)
 '(html-erb-mode-default ((t (:inherit html-mode-default :height 130 :family "Monaco"))) t)
 '(markdown-mode-default ((t (:inherit text-mode-default :height 130 :family "Monaco"))) t)
 '(rhtml-mode-default ((t (:inherit html-mode-default :height 130 :family "Monaco"))) t)
 '(ruby-mode-default ((t (:inherit prog-mode-default :background "#000000" :height 130 :foundry "SimSun" :family "Monaco"))) t)
 '(yaml-mode-default ((t (:inherit text-mode-default :height 130 :family "Monaco"))) t))
