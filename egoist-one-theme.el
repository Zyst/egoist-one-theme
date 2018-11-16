;;; egoist-one-theme.el --- Atom One Dark color theme

;; Copyright 2018 Zyst

;; Author: Zyst <https://github.com/Zyst>
;; URL: https://github.com/Zyst/egoist-one-theme
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

;; This is my fork of atom-one-dark-theme which customizes some elements
;; to my liking.


;;; Code:

(deftheme egoist-one-theme
  "Egoist One - Fork of atom-one-dark-theme which customizes some elements to my liking")

(defvar egoist-one-colors-alist
  (let* ((256color  (eq (display-color-cells (selected-frame)) 256))
         (colors `(("egoist-one-accent"   . "#528BFF")
                   ("egoist-one-fg"       . (if ,256color "color-248" "#ABB2BF"))
                   ("egoist-one-bg"       . (if ,256color "color-235" "#282C34"))
                   ("egoist-one-bg-1"     . (if ,256color "color-234" "#121417"))
                   ("egoist-one-bg-hl"    . (if ,256color "color-236" "#2C323C"))
                   ("egoist-one-gutter"   . (if ,256color "color-239" "#4B5363"))
                   ("egoist-one-mono-1"   . (if ,256color "color-248" "#ABB2BF"))
                   ("egoist-one-mono-2"   . (if ,256color "color-244" "#828997"))
                   ("egoist-one-mono-3"   . (if ,256color "color-240" "#5C6370"))
                   ("egoist-one-cyan"     . "#56B6C2")
                   ("egoist-one-blue"     . "#61AFEF")
                   ("egoist-one-purple"   . "#D19A66")
                   ("egoist-one-green"    . "#98C379")
                   ("egoist-one-red-1"    . "#E06C75")
                   ("egoist-one-red-2"    . "#BE5046")
                   ("egoist-one-orange-1" . "#D19A66")
                   ("egoist-one-orange-2" . "#E5C07B")
                   ("egoist-one-gray"     . (if ,256color "color-237" "#3E4451"))
                   ("egoist-one-silver"   . (if ,256color "color-247" "#9DA5B4"))
                   ("egoist-one-black"    . (if ,256color "color-233" "#21252B"))
                   ("egoist-one-border"   . (if ,256color "color-232" "#181A1F")))))
    colors)
  "List of Egoist One colors.")

(defmacro egoist-one-with-color-variables (&rest body)
  "Bind the colors list around BODY."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@ (mapcar (lambda (cons)
                      (list (intern (car cons)) (cdr cons)))
                    egoist-one-colors-alist))
     ,@body))

(egoist-one-with-color-variables
  (custom-theme-set-faces
   'egoist-one

   `(default ((t (:foreground ,egoist-one-fg :background ,egoist-one-bg))))
   `(success ((t (:foreground ,egoist-one-green))))
   `(warning ((t (:foreground ,egoist-one-orange-2))))
   `(error ((t (:foreground ,egoist-one-red-1 :weight bold))))
   `(link ((t (:foreground ,egoist-one-blue :underline t :weight bold))))
   `(link-visited ((t (:foreground ,egoist-one-blue :underline t :weight normal))))
   `(cursor ((t (:background ,egoist-one-accent))))
   `(fringe ((t (:background ,egoist-one-bg))))
   `(region ((t (:background ,egoist-one-gray))))
   `(highlight ((t (:background ,egoist-one-gray))))
   `(hl-line ((t (:background ,egoist-one-bg-hl))))
   `(vertical-border ((t (:background ,egoist-one-border :foreground ,egoist-one-border))))
   `(secondary-selection ((t (:background ,egoist-one-bg-1))))
   `(query-replace ((t (:inherit (isearch)))))
   `(minibuffer-prompt ((t (:foreground ,egoist-one-silver))))

   `(font-lock-builtin-face ((t (:foreground ,egoist-one-cyan))))
   `(font-lock-comment-face ((t (:foreground ,egoist-one-mono-3))))
   `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
   `(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face ((t (:foreground ,egoist-one-blue))))
   `(font-lock-keyword-face ((t (:foreground ,egoist-one-purple :weight normal))))
   `(font-lock-preprocessor-face ((t (:foreground ,egoist-one-mono-2))))
   `(font-lock-string-face ((t (:foreground ,egoist-one-green))))
   `(font-lock-type-face ((t (:foreground ,egoist-one-orange-2))))
   `(font-lock-constant-face ((t (:foreground ,egoist-one-cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,egoist-one-red-1))))
   `(font-lock-warning-face ((t (:foreground ,egoist-one-mono-3 :bold t))))

   ;; mode-line
   `(mode-line ((t (:background ,egoist-one-black :foreground ,egoist-one-silver :box (:color ,egoist-one-border :line-width 1)))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-inactive ((t (:background ,egoist-one-border :foreground ,egoist-one-gray :box (:color ,egoist-one-border :line-width 1)))))

   ;; window-divider
   `(window-divider ((t (:foreground ,egoist-one-border))))
   `(window-divider-first-pixel ((t (:foreground ,egoist-one-border))))
   `(window-divider-last-pixel ((t (:foreground ,egoist-one-border))))

   ;; ido
   `(ido-first-match ((t (:foreground ,egoist-one-purple :weight bold))))
   `(ido-only-match ((t (:foreground ,egoist-one-red-1 :weight bold))))
   `(ido-subdir ((t (:foreground ,egoist-one-blue))))
   `(ido-virtual ((t (:foreground ,egoist-one-mono-3))))

   ;; ace-jump
   `(ace-jump-face-background ((t (:foreground ,egoist-one-mono-3 :background ,egoist-one-bg-1 :inverse-video nil))))
   `(ace-jump-face-foreground ((t (:foreground ,egoist-one-red-1 :background ,egoist-one-bg-1 :inverse-video nil))))

   ;; company-mode
   `(company-tooltip ((t (:foreground ,egoist-one-fg :background ,egoist-one-bg-1))))
   `(company-tooltip-annotation ((t (:foreground ,egoist-one-mono-2 :background ,egoist-one-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,egoist-one-fg :background ,egoist-one-gray))))
   `(company-tooltip-mouse ((t (:background ,egoist-one-gray))))
   `(company-tooltip-common ((t (:foreground ,egoist-one-orange-2 :background ,egoist-one-bg-1))))
   `(company-tooltip-common-selection ((t (:foreground ,egoist-one-orange-2 :background ,egoist-one-gray))))
   `(company-preview ((t (:background ,egoist-one-bg))))
   `(company-preview-common ((t (:foreground ,egoist-one-orange-2 :background ,egoist-one-bg))))
   `(company-scrollbar-fg ((t (:background ,egoist-one-mono-1))))
   `(company-scrollbar-bg ((t (:background ,egoist-one-bg-1))))

   ;; flymake
   `(flymake-error ((t (:underline (:color ,egoist-one-red-1 :style wave)))))
   `(flymake-note ((t (:underline (:color ,egoist-one-green :style wave)))))
   `(flymake-warning ((t (:underline (:color ,egoist-one-orange-1 :style wave)))))

   ;; flycheck
   `(flycheck-error ((t (:underline (:color ,egoist-one-red-1 :style wave)))))
   `(flycheck-info ((t (:underline (:color ,egoist-one-green :style wave)))))
   `(flycheck-warning ((t (:underline (:color ,egoist-one-orange-1 :style wave)))))

   ;; compilation
   `(compilation-face ((t (:foreground ,egoist-one-fg))))
   `(compilation-line-number ((t (:foreground ,egoist-one-mono-2))))
   `(compilation-column-number ((t (:foreground ,egoist-one-mono-2))))
   `(compilation-mode-line-exit ((t (:inherit compilation-info :weight bold))))
   `(compilation-mode-line-fail ((t (:inherit compilation-error :weight bold))))

   ;; isearch
   `(isearch ((t (:foreground ,egoist-one-bg :background ,egoist-one-purple))))
   `(isearch-fail ((t (:foreground ,egoist-one-red-2 :background nil))))
   `(lazy-highlight ((t (:foreground ,egoist-one-purple :background ,egoist-one-bg-1 :underline ,egoist-one-purple))))

   ;; diff-hl (https://github.com/dgutov/diff-hl)
   '(diff-hl-change ((t (:foreground "#E9C062" :background "#8b733a"))))
   '(diff-hl-delete ((t (:foreground "#CC6666" :background "#7a3d3d"))))
   '(diff-hl-insert ((t (:foreground "#A8FF60" :background "#547f30"))))

   ;; dired-mode
   '(dired-directory ((t (:inherit (font-lock-keyword-face)))))
   '(dired-flagged ((t (:inherit (diff-hl-delete)))))
   '(dired-symlink ((t (:foreground "#FD5FF1"))))

   ;; helm
   `(helm-header ((t (:foreground ,egoist-one-mono-2
                      :background ,egoist-one-bg
                      :underline nil
                      :box (:line-width 6 :color ,egoist-one-bg)))))
   `(helm-source-header ((t (:foreground ,egoist-one-orange-2
                             :background ,egoist-one-bg
                             :underline nil
                             :weight bold
                             :box (:line-width 6 :color ,egoist-one-bg)))))
   `(helm-selection ((t (:background ,egoist-one-gray))))
   `(helm-selection-line ((t (:background ,egoist-one-gray))))
   `(helm-visible-mark ((t (:foreground ,egoist-one-bg :foreground ,egoist-one-orange-2))))
   `(helm-candidate-number ((t (:foreground ,egoist-one-green :background ,egoist-one-bg-1))))
   `(helm-separator ((t (:background ,egoist-one-bg :foreground ,egoist-one-red-1))))
   `(helm-M-x-key ((t (:foreground ,egoist-one-orange-1))))
   `(helm-bookmark-addressbook ((t (:foreground ,egoist-one-orange-1))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,egoist-one-purple))))
   `(helm-bookmark-info ((t (:foreground ,egoist-one-green))))
   `(helm-bookmark-man ((t (:foreground ,egoist-one-orange-2))))
   `(helm-bookmark-w3m ((t (:foreground ,egoist-one-purple))))
   `(helm-match ((t (:foreground ,egoist-one-orange-2))))
   `(helm-ff-directory ((t (:foreground ,egoist-one-cyan :background ,egoist-one-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,egoist-one-fg :background ,egoist-one-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,egoist-one-green :background ,egoist-one-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,egoist-one-red-1 :background ,egoist-one-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,egoist-one-orange-2 :background ,egoist-one-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,egoist-one-bg :background ,egoist-one-orange-2 :weight normal))))
   `(helm-buffer-not-saved ((t (:foreground ,egoist-one-red-1))))
   `(helm-buffer-process ((t (:foreground ,egoist-one-mono-2))))
   `(helm-buffer-saved-out ((t (:foreground ,egoist-one-fg))))
   `(helm-buffer-size ((t (:foreground ,egoist-one-mono-2))))
   `(helm-buffer-directory ((t (:foreground ,egoist-one-purple))))
   `(helm-grep-cmd-line ((t (:foreground ,egoist-one-cyan))))
   `(helm-grep-file ((t (:foreground ,egoist-one-fg))))
   `(helm-grep-finish ((t (:foreground ,egoist-one-green))))
   `(helm-grep-lineno ((t (:foreground ,egoist-one-mono-2))))
   `(helm-grep-finish ((t (:foreground ,egoist-one-red-1))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-swoop-target-line-block-face ((t (:background ,egoist-one-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-line-face ((t (:background ,egoist-one-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-word-face ((t (:background ,egoist-one-purple :foreground "#ffffff"))))
   `(helm-locate-finish ((t (:foreground ,egoist-one-green))))
   `(info-menu-star ((t (:foreground ,egoist-one-red-1))))

   ;; ivy
   `(ivy-confirm-face ((t (:inherit minibuffer-prompt :foreground ,egoist-one-green))))
   `(ivy-current-match ((t (:background ,egoist-one-gray :weight normal))))
   `(ivy-highlight-face ((t (:inherit font-lock-builtin-face))))
   `(ivy-match-required-face ((t (:inherit minibuffer-prompt :foreground ,egoist-one-red-1))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,egoist-one-bg-hl))))
   `(ivy-minibuffer-match-face-2 ((t (:inherit ivy-minibuffer-match-face-1 :background ,egoist-one-black :foreground ,egoist-one-purple :weight semi-bold))))
   `(ivy-minibuffer-match-face-3 ((t (:inherit ivy-minibuffer-match-face-2 :background ,egoist-one-black :foreground ,egoist-one-green :weight semi-bold))))
   `(ivy-minibuffer-match-face-4 ((t (:inherit ivy-minibuffer-match-face-2 :background ,egoist-one-black :foreground ,egoist-one-orange-2 :weight semi-bold))))
   `(ivy-minibuffer-match-highlight ((t (:foreground ,egoist-one-blue))))
   `(ivy-modified-buffer ((t (:inherit default :foreground ,egoist-one-orange-1))))
   `(ivy-virtual ((t (:inherit font-lock-builtin-face :slant italic))))

   ;; counsel
   `(counsel-key-binding ((t (:foreground ,egoist-one-orange-2 :weight bold))))

   ;; swiper
   `(swiper-match-face-1 ((t (:inherit ivy-minibuffer-match-face-1))))
   `(swiper-match-face-2 ((t (:inherit ivy-minibuffer-match-face-2))))
   `(swiper-match-face-3 ((t (:inherit ivy-minibuffer-match-face-3))))
   `(swiper-match-face-4 ((t (:inherit ivy-minibuffer-match-face-4))))

   ;; git-commit
   `(git-commit-comment-action  ((t (:foreground ,egoist-one-green :weight bold))))
   `(git-commit-comment-branch  ((t (:foreground ,egoist-one-blue :weight bold))))
   `(git-commit-comment-heading ((t (:foreground ,egoist-one-orange-2 :weight bold))))

   ;; git-gutter
   `(git-gutter:added ((t (:foreground ,egoist-one-green :weight bold))))
   `(git-gutter:deleted ((t (:foreground ,egoist-one-red-1 :weight bold))))
   `(git-gutter:modified ((t (:foreground ,egoist-one-orange-1 :weight bold))))

   ;; man
   `(Man-overstrike ((t (:inherit font-lock-type-face :weight bold))))
   `(Man-underline ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; woman
   `(woman-bold ((t (:inherit font-lock-type-face :weight bold))))
   `(woman-italic ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; dictionary
   `(dictionary-button-face ((t (:inherit widget-button))))
   `(dictionary-reference-face ((t (:inherit font-lock-type-face :weight bold))))
   `(dictionary-word-entry-face ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; jabber
   `(jabber-roster-user-online ((t (:foreground ,egoist-one-green))))
   `(jabber-roster-user-away ((t (:foreground ,egoist-one-red-1))))
   `(jabber-roster-user-xa ((t (:foreground ,egoist-one-red-2))))
   `(jabber-roster-user-dnd ((t (:foreground ,egoist-one-purple))))
   `(jabber-roster-user-chatty ((t (:foreground ,egoist-one-orange-2))))
   `(jabber-roster-user-error ((t (:foreground ,egoist-one-red-1 :bold t))))
   `(jabber-roster-user-offline ((t (:foreground ,egoist-one-mono-3))))
   `(jabber-chat-prompt-local ((t (:foreground ,egoist-one-blue))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,egoist-one-orange-2))))
   `(jabber-chat-prompt-system ((t (:foreground ,egoist-one-mono-3))))
   `(jabber-chat-error ((t (:inherit jabber-roster-user-error))))
   `(jabber-rare-time-face ((t (:foreground ,egoist-one-cyan))))
   `(jabber-activity-face ((t (:inherit jabber-chat-prompt-foreign))))
   `(jabber-activity-personal-face ((t (:inherit jabber-chat-prompt-local))))

   ;; eww
   `(eww-form-checkbox ((t (:inherit eww-form-submit))))
   `(eww-form-file ((t (:inherit eww-form-submit))))
   `(eww-form-select ((t (:inherit eww-form-submit))))
   `(eww-form-submit ((t (:background ,egoist-one-gray :foreground ,egoist-one-fg :box (:line-width 2 :color ,egoist-one-border :style released-button)))))
   `(eww-form-text ((t (:inherit widget-field :box (:line-width 1 :color ,egoist-one-border)))))
   `(eww-form-textarea ((t (:inherit eww-form-text))))
   `(eww-invalid-certificate ((t (:foreground ,egoist-one-red-1))))
   `(eww-valid-certificate ((t (:foreground ,egoist-one-green))))

   ;; js2-mode
   `(js2-error ((t (:underline (:color ,egoist-one-red-1 :style wave)))))
   `(js2-external-variable ((t (:foreground ,egoist-one-cyan))))
   `(js2-warning ((t (:underline (:color ,egoist-one-orange-1 :style wave)))))
   `(js2-function-call ((t (:inherit (font-lock-function-name-face)))))
   `(js2-function-param ((t (:foreground ,egoist-one-mono-1))))
   `(js2-jsdoc-tag ((t (:foreground ,egoist-one-purple))))
   `(js2-jsdoc-type ((t (:foreground ,egoist-one-orange-2))))
   `(js2-jsdoc-value((t (:foreground ,egoist-one-red-1))))
   `(js2-object-property ((t (:foreground ,egoist-one-red-1))))

   ;; magit
   `(magit-section-highlight ((t (:background ,egoist-one-bg-hl))))
   `(magit-section-heading ((t (:foreground ,egoist-one-orange-2 :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,egoist-one-fg :weight bold))))
   `(magit-diff-file-heading ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,egoist-one-gray :weight bold))))
   `(magit-diff-file-heading-selection ((t (:foreground ,egoist-one-orange-2 :background ,egoist-one-bg-hl :weight bold))))
   `(magit-diff-hunk-heading ((t (:foreground ,egoist-one-mono-2 :background ,egoist-one-gray))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,egoist-one-mono-1 :background ,egoist-one-mono-3))))
   `(magit-diff-hunk-heading-selection ((t (:foreground ,egoist-one-purple :background ,egoist-one-mono-3))))
   `(magit-diff-context ((t (:foreground ,egoist-one-fg))))
   `(magit-diff-context-highlight ((t (:background ,egoist-one-bg-1 :foreground ,egoist-one-fg))))
   `(magit-diffstat-added ((t (:foreground ,egoist-one-green))))
   `(magit-diffstat-removed ((t (:foreground ,egoist-one-red-1))))
   `(magit-process-ok ((t (:foreground ,egoist-one-green))))
   `(magit-process-ng ((t (:foreground ,egoist-one-red-1))))
   `(magit-log-author ((t (:foreground ,egoist-one-orange-2))))
   `(magit-log-date ((t (:foreground ,egoist-one-mono-2))))
   `(magit-log-graph ((t (:foreground ,egoist-one-silver))))
   `(magit-sequence-pick ((t (:foreground ,egoist-one-orange-2))))
   `(magit-sequence-stop ((t (:foreground ,egoist-one-green))))
   `(magit-sequence-part ((t (:foreground ,egoist-one-orange-1))))
   `(magit-sequence-head ((t (:foreground ,egoist-one-blue))))
   `(magit-sequence-drop ((t (:foreground ,egoist-one-red-1))))
   `(magit-sequence-done ((t (:foreground ,egoist-one-mono-2))))
   `(magit-sequence-onto ((t (:foreground ,egoist-one-mono-2))))
   `(magit-bisect-good ((t (:foreground ,egoist-one-green))))
   `(magit-bisect-skip ((t (:foreground ,egoist-one-orange-1))))
   `(magit-bisect-bad ((t (:foreground ,egoist-one-red-1))))
   `(magit-blame-heading ((t (:background ,egoist-one-bg-1 :foreground ,egoist-one-mono-2))))
   `(magit-blame-hash ((t (:background ,egoist-one-bg-1 :foreground ,egoist-one-purple))))
   `(magit-blame-name ((t (:background ,egoist-one-bg-1 :foreground ,egoist-one-orange-2))))
   `(magit-blame-date ((t (:background ,egoist-one-bg-1 :foreground ,egoist-one-mono-3))))
   `(magit-blame-summary ((t (:background ,egoist-one-bg-1 :foreground ,egoist-one-mono-2))))
   `(magit-dimmed ((t (:foreground ,egoist-one-mono-2))))
   `(magit-hash ((t (:foreground ,egoist-one-purple))))
   `(magit-tag  ((t (:foreground ,egoist-one-orange-1 :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,egoist-one-green :weight bold))))
   `(magit-branch-local   ((t (:foreground ,egoist-one-blue :weight bold))))
   `(magit-branch-current ((t (:foreground ,egoist-one-blue :weight bold :box t))))
   `(magit-head           ((t (:foreground ,egoist-one-blue :weight bold))))
   `(magit-refname        ((t (:background ,egoist-one-bg :foreground ,egoist-one-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,egoist-one-bg :foreground ,egoist-one-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,egoist-one-bg :foreground ,egoist-one-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,egoist-one-green))))
   `(magit-signature-bad       ((t (:foreground ,egoist-one-red-1))))
   `(magit-signature-untrusted ((t (:foreground ,egoist-one-orange-1))))
   `(magit-cherry-unmatched    ((t (:foreground ,egoist-one-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,egoist-one-purple))))
   `(magit-reflog-commit       ((t (:foreground ,egoist-one-green))))
   `(magit-reflog-amend        ((t (:foreground ,egoist-one-purple))))
   `(magit-reflog-merge        ((t (:foreground ,egoist-one-green))))
   `(magit-reflog-checkout     ((t (:foreground ,egoist-one-blue))))
   `(magit-reflog-reset        ((t (:foreground ,egoist-one-red-1))))
   `(magit-reflog-rebase       ((t (:foreground ,egoist-one-purple))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,egoist-one-green))))
   `(magit-reflog-remote       ((t (:foreground ,egoist-one-cyan))))
   `(magit-reflog-other        ((t (:foreground ,egoist-one-cyan))))

   ;; message
   `(message-cited-text ((t (:foreground ,egoist-one-green))))
   `(message-header-cc ((t (:foreground ,egoist-one-orange-1 :weight bold))))
   `(message-header-name ((t (:foreground ,egoist-one-purple))))
   `(message-header-newsgroups ((t (:foreground ,egoist-one-orange-2 :weight bold :slant italic))))
   `(message-header-other ((t (:foreground ,egoist-one-red-1))))
   `(message-header-subject ((t (:foreground ,egoist-one-blue))))
   `(message-header-to ((t (:foreground ,egoist-one-orange-2 :weight bold))))
   `(message-header-xheader ((t (:foreground ,egoist-one-silver))))
   `(message-mml ((t (:foreground ,egoist-one-purple))))
   `(message-separator ((t (:foreground ,egoist-one-mono-3 :slant italic))))

   ;; notmuch
   `(notmuch-crypto-decryption ((t (:foreground ,egoist-one-purple :background ,egoist-one-black))))
   `(notmuch-crypto-signature-bad ((t (:foreground ,egoist-one-red-1 :background ,egoist-one-black))))
   `(notmuch-crypto-signature-good ((t (:foreground ,egoist-one-green :background ,egoist-one-black))))
   `(notmuch-crypto-signature-good-key ((t (:foreground ,egoist-one-green :background ,egoist-one-black))))
   `(notmuch-crypto-signature-unknown ((t (:foreground ,egoist-one-orange-1 :background ,egoist-one-black))))
   `(notmuch-hello-logo-background ((t (:inherit default))))
   `(notmuch-message-summary-face ((t (:background ,egoist-one-black))))
   `(notmuch-search-count ((t (:inherit default :foreground ,egoist-one-silver))))
   `(notmuch-search-date ((t (:inherit default :foreground ,egoist-one-purple))))
   `(notmuch-search-matching-authors ((t (:inherit default :foreground ,egoist-one-orange-2))))
   `(notmuch-search-non-matching-authors ((t (:inherit font-lock-comment-face :slant italic))))
   `(notmuch-tag-added ((t (:underline ,egoist-one-green))))
   `(notmuch-tag-deleted ((t (:strike-through ,egoist-one-red-2))))
   `(notmuch-tag-face ((t (:foreground ,egoist-one-green))))
   `(notmuch-tag-unread ((t (:foreground ,egoist-one-red-1))))
   `(notmuch-tree-match-author-face ((t (:inherit notmuch-search-matching-authors))))
   `(notmuch-tree-match-date-face ((t (:inherit notmuch-search-date))))
   `(notmuch-tree-match-face ((t (:weight semi-bold))))
   `(notmuch-tree-match-tag-face ((t (:inherit notmuch-tag-face))))
   `(notmuch-tree-no-match-face ((t (:slant italic :weight light :inherit font-lock-comment-face))))

   ;; elfeed
   `(elfeed-log-debug-level-face ((t (:background ,egoist-one-black :foreground ,egoist-one-green))))
   `(elfeed-log-error-level-face ((t (:background ,egoist-one-black :foreground ,egoist-one-red-1))))
   `(elfeed-log-info-level-face ((t (:background ,egoist-one-black :foreground ,egoist-one-blue))))
   `(elfeed-log-warn-level-face ((t (:background ,egoist-one-black :foreground ,egoist-one-orange-1))))
   `(elfeed-search-date-face ((t (:foreground ,egoist-one-purple))))
   `(elfeed-search-feed-face ((t (:foreground ,egoist-one-orange-2))))
   `(elfeed-search-tag-face ((t (:foreground ,egoist-one-green))))
   `(elfeed-search-title-face ((t (:foreground ,egoist-one-mono-1))))
   `(elfeed-search-unread-count-face ((t (:foreground ,egoist-one-silver))))

   ;; perspective
   `(persp-selected-face ((t (:foreground ,egoist-one-blue))))

   ;; powerline
   `(powerline-active1 ((,class (:background ,egoist-one-bg-hl :foreground ,egoist-one-purple))))
   `(powerline-active2 ((,class (:background ,egoist-one-bg-hl :foreground ,egoist-one-purple))))
   `(powerline-inactive1 ((,class (:background ,egoist-one-bg :foreground ,egoist-one-fg))))
   `(powerline-inactive2 ((,class (:background ,egoist-one-bg :foreground ,egoist-one-fg))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,egoist-one-blue))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,egoist-one-green))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,egoist-one-orange-1))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,egoist-one-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,egoist-one-purple))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,egoist-one-orange-2))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,egoist-one-blue))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,egoist-one-green))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,egoist-one-orange-1))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,egoist-one-cyan))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,egoist-one-purple))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,egoist-one-orange-2))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,egoist-one-red-1 :weight bold))))

   ;; rbenv
   `(rbenv-active-ruby-face ((t (:foreground ,egoist-one-green))))

   ;; elixir
   `(elixir-atom-face ((t (:foreground ,egoist-one-cyan))))
   `(elixir-attribute-face ((t (:foreground ,egoist-one-red-1))))

   ;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,egoist-one-red-1 :background ,egoist-one-gray :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,egoist-one-gray :weight bold))))

   ;; spaceline
   `(spaceline-flycheck-error  ((,class (:foreground ,egoist-one-red-1))))
   `(spaceline-flycheck-info   ((,class (:foreground ,egoist-one-green))))
   `(spaceline-flycheck-warning((,class (:foreground ,egoist-one-orange-1))))
   `(spaceline-python-venv ((,class (:foreground ,egoist-one-purple))))

   ;; web-mode
   `(web-mode-doctype-face ((t (:inherit font-lock-comment-face))))
   `(web-mode-error-face ((t (:background ,egoist-one-black :foreground ,egoist-one-red-1))))
   `(web-mode-html-attr-equal-face ((t (:inherit default))))
   `(web-mode-html-attr-name-face ((t (:foreground ,egoist-one-orange-1))))
   `(web-mode-html-tag-bracket-face ((t (:inherit default))))
   `(web-mode-html-tag-face ((t (:foreground ,egoist-one-red-1))))
   `(web-mode-symbol-face ((t (:foreground ,egoist-one-orange-1))))

   ;; flx-ido
   `(flx-highlight-face ((t (:inherit (link) :weight bold))))

   ;; rpm-spec-mode
   `(rpm-spec-tag-face ((t (:foreground ,egoist-one-blue))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground "#FFFFFF" :background ,egoist-one-red-2))))
   `(rpm-spec-macro-face ((t (:foreground ,egoist-one-orange-2))))
   `(rpm-spec-var-face ((t (:foreground ,egoist-one-red-1))))
   `(rpm-spec-doc-face ((t (:foreground ,egoist-one-purple))))
   `(rpm-spec-dir-face ((t (:foreground ,egoist-one-cyan))))
   `(rpm-spec-package-face ((t (:foreground ,egoist-one-red-2))))
   `(rpm-spec-ghost-face ((t (:foreground ,egoist-one-red-2))))
   `(rpm-spec-section-face ((t (:foreground ,egoist-one-orange-2))))

   ;; guix
   `(guix-true ((t (:foreground ,egoist-one-green :weight bold))))

   ;; gomoku
   `(gomoku-O ((t (:foreground ,egoist-one-red-1 :weight bold))))
   `(gomoku-X ((t (:foreground ,egoist-one-green :weight bold))))

   ;; term
   `(term-color-black ((t :foreground ,egoist-one-mono-1)))
   `(term-color-blue ((t (:foreground ,egoist-one-blue))))
   `(term-color-cyan ((t :foreground ,egoist-one-cyan)))
   `(term-color-green ((t (:foreground ,egoist-one-green))))
   `(term-color-magenta ((t :foreground ,egoist-one-purple)))
   `(term-color-red ((t :foreground ,egoist-one-red-1)))
   `(term-color-white ((t :foreground ,egoist-one-fg)))
   `(term-color-yellow ((t (:foreground ,egoist-one-orange-1))))

   ;; linum
   `(linum ((t (:foreground ,egoist-one-gutter :background ,egoist-one-bg))))
   ;; hlinum
   `(linum-highlight-face ((t (:foreground ,egoist-one-fg :background ,egoist-one-bg))))
   ;; native line numbers (emacs version >=26)
   `(line-number ((t (:foreground ,egoist-one-gutter :background ,egoist-one-bg))))
   `(line-number-current-line ((t (:foreground ,egoist-one-fg :background ,egoist-one-bg))))

   ;; regexp-builder
   `(reb-match-0 ((t (:background ,egoist-one-gray))))
   `(reb-match-1 ((t (:background ,egoist-one-black :foreground ,egoist-one-purple :weight semi-bold))))
   `(reb-match-2 ((t (:background ,egoist-one-black :foreground ,egoist-one-green :weight semi-bold))))
   `(reb-match-3 ((t (:background ,egoist-one-black :foreground ,egoist-one-orange-2 :weight semi-bold))))

   ;; desktop-entry
   `(desktop-entry-deprecated-keyword-face ((t (:inherit font-lock-warning-face))))
   `(desktop-entry-group-header-face ((t (:inherit font-lock-type-face))))
   `(desktop-entry-locale-face ((t (:inherit font-lock-string-face))))
   `(desktop-entry-unknown-keyword-face ((t (:underline (:color ,egoist-one-red-1 :style wave) :inherit font-lock-keyword-face))))
   `(desktop-entry-value-face ((t (:inherit default))))

   ;; latex-mode
   `(font-latex-sectioning-0-face ((t (:foreground ,egoist-one-blue :height 1.0))))
   `(font-latex-sectioning-1-face ((t (:foreground ,egoist-one-blue :height 1.0))))
   `(font-latex-sectioning-2-face ((t (:foreground ,egoist-one-blue :height 1.0))))
   `(font-latex-sectioning-3-face ((t (:foreground ,egoist-one-blue :height 1.0))))
   `(font-latex-sectioning-4-face ((t (:foreground ,egoist-one-blue :height 1.0))))
   `(font-latex-sectioning-5-face ((t (:foreground ,egoist-one-blue :height 1.0))))
   `(font-latex-bold-face ((t (:foreground ,egoist-one-green :weight bold))))
   `(font-latex-italic-face ((t (:foreground ,egoist-one-green))))
   `(font-latex-warning-face ((t (:foreground ,egoist-one-red-1))))
   `(font-latex-doctex-preprocessor-face ((t (:foreground ,egoist-one-cyan))))

   ;; org-mode
   `(org-date ((t (:foreground ,egoist-one-cyan))))
   `(org-footnote ((t (:foreground ,egoist-one-cyan))))
   `(org-sexp-date ((t (:foreground ,egoist-one-cyan))))

   ;; calendar
   `(diary ((t (:inherit warning))))
   `(holiday ((t (:foreground ,egoist-one-green))))

   ;; gud
   `(breakpoint-disabled ((t (:foreground ,egoist-one-orange-1))))
   `(breakpoint-enabled ((t (:foreground ,egoist-one-red-1 :weight bold))))

   ;; realgud
   `(realgud-overlay-arrow1        ((t (:foreground ,egoist-one-green))))
   `(realgud-overlay-arrow3        ((t (:foreground ,egoist-one-orange-1))   `(realgud-overlay-arrow2        ((t (:foreground ,egoist-one-orange-2))))
))
   '(realgud-bp-enabled-face       ((t (:inherit (error)))))
   `(realgud-bp-disabled-face      ((t (:inherit (secondary-selection)))))
   `(realgud-bp-line-enabled-face  ((t (:box (:color ,egoist-one-red-1)))))
   `(realgud-bp-line-disabled-face ((t (:box (:color ,egoist-one-gray)))))
   `(realgud-line-number           ((t (:foreground ,egoist-one-mono-2))))
   `(realgud-backtrace-number      ((t (:inherit (secondary-selection)))))

   ;; undo-tree
   `(undo-tree-visualizer-current-face ((t (:foreground ,egoist-one-red-1))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,egoist-one-orange-1))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,egoist-one-cyan))))
   ))

(egoist-one-with-color-variables
  (custom-theme-set-variables
   'egoist-one
   ;; fill-column-indicator
   `(fci-rule-color ,egoist-one-gray)

   ;; tetris
   ;; | Tetromino | Color                    |
   ;; | O         | `egoist-one-orange-2' |
   ;; | J         | `egoist-one-blue'     |
   ;; | L         | `egoist-one-orange-1' |
   ;; | Z         | `egoist-one-red-1'    |
   ;; | S         | `egoist-one-green'    |
   ;; | T         | `egoist-one-purple'   |
   ;; | I         | `egoist-one-cyan'     |
   '(tetris-x-colors
     [[229 192 123] [97 175 239] [209 154 102] [224 108 117] [152 195 121] [198 120 221] [86 182 194]])

   ;; ansi-color
   `(ansi-color-names-vector
     [,egoist-one-black ,egoist-one-red-1 ,egoist-one-green ,egoist-one-orange-2
      ,egoist-one-blue ,egoist-one-purple ,egoist-one-cyan ,egoist-one-fg])
   ))

(defvar egoist-one-theme-force-faces-for-mode t
  "If t, egoist-one-theme will use Face Remapping to alter the theme faces for
the current buffer based on its mode in an attempt to mimick the Atom One Dark
Theme from Atom.io as best as possible.
The reason this is required is because some modes (html-mode, jyaml-mode, ...)
do not provide the necessary faces to do theming without conflicting with other
modes.
Current modes, and their faces, impacted by this variable:
* js2-mode: font-lock-constant-face, font-lock-doc-face, font-lock-variable-name-face
")

;; Many modes in Emacs do not define their own faces and instead use standard Emacs faces when it comes to theming.
;; That being said, to have a real "Atom One Dark Theme" for Emacs, we need to work around this so that these themes look
;; as much like "Atom One Dark Theme" as possible.  This means using per-buffer faces via "Face Remapping":
;;
;;   http://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Remapping.html
;;
;; Of course, this might be confusing to some when in one mode they see keywords highlighted in one face and in another
;; mode they see a different face.  That being said, you can set the `egoist-one-theme-force-faces-for-mode` variable to
;; `nil` to disable this feature.
(defun egoist-one-theme-change-faces-for-mode ()
  (interactive)
  (and (eq egoist-one-theme-force-faces-for-mode t)
       (cond
        ((member major-mode '(js2-mode))
         ;; egoist-one-orange-1
         (face-remap-add-relative 'font-lock-constant-face :foreground "#D19A66")
         (face-remap-add-relative 'font-lock-doc-face '(:inherit (font-lock-comment-face)))
         ;; egoist-one-mono-1
         (face-remap-add-relative 'font-lock-variable-name-face :foreground "#ABB2BF"))
        )))

(add-hook 'after-change-major-mode-hook 'egoist-one-theme-change-faces-for-mode)

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'egoist-one)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; egoist-one-theme.el ends here
