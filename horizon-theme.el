;;; horizon-theme.el --- Horizon color theme

;; Copyright 2019 Jonathan Chu

;; Author: Jonathan Chu <me@jonathanchu.is>
;; URL: https://github.com/jonathanchu/emacs-horizon-theme
;; Version: 0.1.0

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; An Emacs port of the Horizon theme for VS Code.

;;; Code:

(deftheme horizon
  "Horizon - An Emacs port of the Horizon theme for VS Code.")

(defvar horizon-colors-alist
  (let* ((256color  (eq (display-color-cells (selected-frame)) 256))
         (colors `(("horizon-accent"   . "#528BFF")
                   ("horizon-fg"       . (if ,256color "color-248" "#ABB2BF"))
                   ("horizon-bg"       . (if ,256color "color-235" "#282C34"))
                   ("horizon-bg-1"     . (if ,256color "color-234" "#121417"))
                   ("horizon-bg-hl"    . (if ,256color "color-236" "#2C323C"))
                   ("horizon-gutter"   . (if ,256color "color-239" "#4B5363"))
                   ("horizon-mono-1"   . (if ,256color "color-248" "#ABB2BF"))
                   ("horizon-mono-2"   . (if ,256color "color-244" "#828997"))
                   ("horizon-mono-3"   . (if ,256color "color-240" "#5C6370"))
                   ("horizon-cyan"     . "#56B6C2")
                   ("horizon-blue"     . "#61AFEF")
                   ("horizon-purple"   . "#C678DD")
                   ("horizon-green"    . "#98C379")
                   ("horizon-red-1"    . "#E06C75")
                   ("horizon-red-2"    . "#BE5046")
                   ("horizon-orange-1" . "#D19A66")
                   ("horizon-orange-2" . "#E5C07B")
                   ("horizon-gray"     . (if ,256color "color-237" "#3E4451"))
                   ("horizon-silver"   . (if ,256color "color-247" "#9DA5B4"))
                   ("horizon-black"    . (if ,256color "color-233" "#21252B"))
                   ("horizon-border"   . (if ,256color "color-232" "#181A1F")))))
    colors)
  "List of Horizon colors.")

(defmacro horizon-with-color-variables (&rest body)
  "Bind the colors list around BODY."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@ (mapcar (lambda (cons)
                      (list (intern (car cons)) (cdr cons)))
                    horizon-colors-alist))
     ,@body))

(horizon-with-color-variables
 (custom-theme-set-faces
  'horizon

  `(default ((t (:foreground ,horizon-fg :background ,horizon-bg))))
  `(success ((t (:foreground ,horizon-green))))
  `(warning ((t (:foreground ,horizon-orange-2))))
  `(error ((t (:foreground ,horizon-red-1 :weight bold))))
  `(link ((t (:foreground ,horizon-blue :underline t :weight bold))))
  `(link-visited ((t (:foreground ,horizon-blue :underline t :weight normal))))
  `(cursor ((t (:background ,horizon-accent))))
  `(fringe ((t (:background ,horizon-bg))))
  `(region ((t (:background ,horizon-gray :distant-foreground ,horizon-mono-2))))
  `(highlight ((t (:background ,horizon-gray :distant-foreground ,horizon-mono-2))))
  `(hl-line ((t (:background ,horizon-bg-hl :distant-foreground nil))))
  `(vertical-border ((t (:background ,horizon-border :foreground ,horizon-border))))
  `(secondary-selection ((t (:background ,horizon-bg-1))))
  `(query-replace ((t (:inherit (isearch)))))
  `(minibuffer-prompt ((t (:foreground ,horizon-silver))))
  `(tooltip ((t (:foreground ,horizon-fg :background ,horizon-bg-1 :inherit variable-pitch))))

  `(font-lock-builtin-face ((t (:foreground ,horizon-cyan))))
  `(font-lock-comment-face ((t (:foreground ,horizon-mono-3 :slant italic))))
  `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
  `(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
  `(font-lock-function-name-face ((t (:foreground ,horizon-blue))))
  `(font-lock-keyword-face ((t (:foreground ,horizon-purple :weight normal))))
  `(font-lock-preprocessor-face ((t (:foreground ,horizon-mono-2))))
  `(font-lock-string-face ((t (:foreground ,horizon-green))))
  `(font-lock-type-face ((t (:foreground ,horizon-orange-2))))
  `(font-lock-constant-face ((t (:foreground ,horizon-cyan))))
  `(font-lock-variable-name-face ((t (:foreground ,horizon-red-1))))
  `(font-lock-warning-face ((t (:foreground ,horizon-mono-3 :bold t))))
  `(font-lock-negation-char-face ((t (:foreground ,horizon-cyan :bold t))))

  ;; mode-line
  `(mode-line ((t (:background ,horizon-black :foreground ,horizon-silver :box (:color ,horizon-border :line-width 1)))))
  `(mode-line-buffer-id ((t (:weight bold))))
  `(mode-line-emphasis ((t (:weight bold))))
  `(mode-line-inactive ((t (:background ,horizon-border :foreground ,horizon-gray :box (:color ,horizon-border :line-width 1)))))

  ;; window-divider
  `(window-divider ((t (:foreground ,horizon-border))))
  `(window-divider-first-pixel ((t (:foreground ,horizon-border))))
  `(window-divider-last-pixel ((t (:foreground ,horizon-border))))

  ;; custom
  `(custom-state ((t (:foreground ,horizon-green))))

  ;; ido
  `(ido-first-match ((t (:foreground ,horizon-purple :weight bold))))
  `(ido-only-match ((t (:foreground ,horizon-red-1 :weight bold))))
  `(ido-subdir ((t (:foreground ,horizon-blue))))
  `(ido-virtual ((t (:foreground ,horizon-mono-3))))

  ;; ace-jump
  `(ace-jump-face-background ((t (:foreground ,horizon-mono-3 :background ,horizon-bg-1 :inverse-video nil))))
  `(ace-jump-face-foreground ((t (:foreground ,horizon-red-1 :background ,horizon-bg-1 :inverse-video nil))))

  ;; ace-window
  `(aw-background-face ((t (:inherit font-lock-comment-face))))
  `(aw-leading-char-face ((t (:foreground ,horizon-red-1 :weight bold))))

  ;; company-mode
  `(company-tooltip ((t (:foreground ,horizon-fg :background ,horizon-bg-1))))
  `(company-tooltip-annotation ((t (:foreground ,horizon-mono-2 :background ,horizon-bg-1))))
  `(company-tooltip-selection ((t (:foreground ,horizon-fg :background ,horizon-gray))))
  `(company-tooltip-mouse ((t (:background ,horizon-gray))))
  `(company-tooltip-common ((t (:foreground ,horizon-orange-2 :background ,horizon-bg-1))))
  `(company-tooltip-common-selection ((t (:foreground ,horizon-orange-2 :background ,horizon-gray))))
  `(company-preview ((t (:background ,horizon-bg))))
  `(company-preview-common ((t (:foreground ,horizon-orange-2 :background ,horizon-bg))))
  `(company-scrollbar-fg ((t (:background ,horizon-mono-1))))
  `(company-scrollbar-bg ((t (:background ,horizon-bg-1))))
  `(company-template-field ((t (:inherit highlight))))


  ;; flyspell
  `(flyspell-duplicate ((t (:underline (:color ,horizon-orange-1 :style wave)))))
  `(flyspell-incorrect ((t (:underline (:color ,horizon-red-1 :style wave)))))

  ;; flymake
  `(flymake-error ((t (:underline (:color ,horizon-red-1 :style wave)))))
  `(flymake-note ((t (:underline (:color ,horizon-green :style wave)))))
  `(flymake-warning ((t (:underline (:color ,horizon-orange-1 :style wave)))))

  ;; flycheck
  `(flycheck-error ((t (:underline (:color ,horizon-red-1 :style wave)))))
  `(flycheck-info ((t (:underline (:color ,horizon-green :style wave)))))
  `(flycheck-warning ((t (:underline (:color ,horizon-orange-1 :style wave)))))

  ;; compilation
  `(compilation-face ((t (:foreground ,horizon-fg))))
  `(compilation-line-number ((t (:foreground ,horizon-mono-2))))
  `(compilation-column-number ((t (:foreground ,horizon-mono-2))))
  `(compilation-mode-line-exit ((t (:inherit compilation-info :weight bold))))
  `(compilation-mode-line-fail ((t (:inherit compilation-error :weight bold))))

  ;; isearch
  `(isearch ((t (:foreground ,horizon-bg :background ,horizon-purple))))
  `(isearch-fail ((t (:foreground ,horizon-red-2 :background nil))))
  `(lazy-highlight ((t (:foreground ,horizon-purple :background ,horizon-bg-1 :underline ,horizon-purple))))

  ;; diff-hl (https://github.com/dgutov/diff-hl)
  '(diff-hl-change ((t (:foreground "#E9C062" :background "#8b733a"))))
  '(diff-hl-delete ((t (:foreground "#CC6666" :background "#7a3d3d"))))
  '(diff-hl-insert ((t (:foreground "#A8FF60" :background "#547f30"))))

  ;; dired-mode
  '(dired-directory ((t (:inherit (font-lock-keyword-face)))))
  '(dired-flagged ((t (:inherit (diff-hl-delete)))))
  '(dired-symlink ((t (:foreground "#FD5FF1"))))
  ))

(horizon-with-color-variables
 (custom-theme-set-variables
  'horizon
  ;; fill-column-indicator
  `(fci-rule-color ,horizon-gray)

  ;; tetris
  ;; | Tetromino | Color                    |
  ;; | O         | `horizon-orange-2' |
  ;; | J         | `horizon-blue'     |
  ;; | L         | `horizon-orange-1' |
  ;; | Z         | `horizon-red-1'    |
  ;; | S         | `horizon-green'    |
  ;; | T         | `horizon-purple'   |
  ;; | I         | `horizon-cyan'     |
  '(tetris-x-colors
    [[229 192 123] [97 175 239] [209 154 102] [224 108 117] [152 195 121] [198 120 221] [86 182 194]])

  ;; ansi-color
  `(ansi-color-names-vector
    [,horizon-black ,horizon-red-1 ,horizon-green ,horizon-orange-2
                    ,horizon-blue ,horizon-purple ,horizon-cyan ,horizon-fg])
  ))

(defvar horizon-theme-force-faces-for-mode t
  "If t, horizon-theme will use Face Remapping to alter the theme faces for
the current buffer based on its mode in an attempt to mimick the Horizon
Theme for VS Code as best as possible.
The reason this is required is because some modes (html-mode, jyaml-mode, ...)
do not provide the necessary faces to do theming without conflicting with other
modes.
Current modes, and their faces, impacted by this variable:
* js2-mode: font-lock-constant-face, font-lock-doc-face, font-lock-variable-name-face
* html-mode: font-lock-function-name-face, font-lock-variable-name-face
")

;; Many modes in Emacs do not define their own faces and instead use standard Emacs faces when it comes to theming.
;; That being said, to have a real "Horizon Theme" for Emacs, we need to work around this so that these themes look
;; as much like "Horizon Theme" as possible.  This means using per-buffer faces via "Face Remapping":
;;
;;   http://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Remapping.html
;;
;; Of course, this might be confusing to some when in one mode they see keywords highlighted in one face and in another
;; mode they see a different face.  That being said, you can set the `horizon-theme-force-faces-for-mode` variable to
;; `nil` to disable this feature.
(defun horizon-theme-change-faces-for-mode ()
  (interactive)
  (when (or horizon-theme-force-faces-for-mode (called-interactively-p))
    (horizon-with-color-variables
     (cond
      ((member major-mode '(js2-mode))
       (face-remap-add-relative 'font-lock-constant-face :foreground horizon-orange-1)
       (face-remap-add-relative 'font-lock-doc-face '(:inherit (font-lock-comment-face)))
       (face-remap-add-relative 'font-lock-variable-name-face :foreground horizon-mono-1))
      ((member major-mode '(html-mode))
       (face-remap-add-relative 'font-lock-function-name-face :foreground horizon-red-1)
       (face-remap-add-relative 'font-lock-variable-name-face :foreground horizon-orange-1))))))

(add-hook 'after-change-major-mode-hook 'horizon-theme-change-faces-for-mode)

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'horizon)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; horizon-theme.el ends here
