;; org mode extra
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
  (lambda ()
    (org-archive-subtree)
    (setq org-map-continue-from (outline-previous-heading)))
  "/DONE" 'tree))

(setq x-select-enable-clipboard t)
(defun magit-display-buffer-pop-up-frame (buffer)
  (if (with-current-buffer buffer (eq major-mode 'magit-status-mode))
      (display-buffer buffer
                      '((display-buffer-reuse-window
                        display-buffer-pop-up-frame)
                        (reusable-frames . t)))
    (magit-display-buffer-traditional buffer)))
(defun my-clean-frames-and-buffers ()
  "Kills all unmodified buffers and closes all but the selected frame."
  (interactive)
  (save-window-excursion
    (dolist (buffer (buffer-list))
      (and (buffer-live-p buffer)
          (not (buffer-modified-p buffer))
          (kill-buffer buffer))))
  (delete-other-frames))
(defun my-frame-title ()
  ""
  (shell-command-to-string
   (concat
    "sodiumSierraStrawberry "
    (abbreviate-file-name (buffer-file-name))
    " --limit 80"
    )
   )
  )
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                 (concat (file-name-nondirectory buffer-file-name) " --- " (my-frame-title))
                 ;; '(my-frame-title)
                 ;;(concat (concat (file-name-nondirectory buffer-file-name) " - ") (abbreviate-file-name (buffer-file-name)))

                 "%b")))
      )

(setq magit-display-buffer-function #'magit-display-buffer-pop-up-frame)

(spacemacs/set-leader-keys "mgm" 'helm-imenu)
(spacemacs/set-leader-keys "gfd" 'magit-diff-buffer-file)
(define-key evil-motion-state-map "-" 'deer)
(defun insert-file-name ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))
(defun insert-file-name-without-extension ()
  "Insert the full path file name into the current buffer."
  (interactive)
  (insert (file-name-sans-extension (buffer-file-name (window-buffer (minibuffer-selected-window))))))

(with-eval-after-load 'intero
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))

(provide 'chris-config)

(add-hook 'prog-mode-hook 'highlight-indentation-mode)
(add-hook 'yaml-mode-hook 'highlight-indentation-mode)
(add-hook 'text-mode-hook 'highlight-indentation-mode)
(setq recentf-max-menu-items 5000)

;; ;; update git-gutter automatically..
;; (custom-set-variables
;;  '(git-gutter:update-interval 1))

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(setq diff-hl-side 'left)

(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
(setq tramp-verbose 6)

(setq-default adaptive-wrap-extra-indent 2)
(add-hook 'visual-line-mode-hook #'adaptive-wrap-prefix-mode)
(global-visual-line-mode +1)
(setq-default dotspacemacs-configuration-layers
              '((haskell :variables haskell-enable-hindent-style "chris-done")))

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

;; clipboard support terminal
(setq x-select-enable-clipboard t 
      x-select-enable-primary t)
(add-hook 'org-mode-hook (lambda()
                           (define-key
                             evil-normal-state-local-map
                             (kbd "M-RET")
                             #'org-meta-return)
                           (define-key
                             evil-insert-state-local-map
                             (kbd "M-RET")
                             #'org-meta-return)))
