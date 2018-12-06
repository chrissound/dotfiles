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
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                  (concat (concat (file-name-nondirectory buffer-file-name) " - ") (abbreviate-file-name (buffer-file-name)))
                "%b"))))

(setq magit-display-buffer-function #'magit-display-buffer-pop-up-frame)

(spacemacs/set-leader-keys "mgm" 'helm-imenu)
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
