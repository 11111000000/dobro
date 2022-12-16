;;; package --- Summary
;;; Commentary:
;;; Code:
;;; Справка

(use-package help
  :straight (:type built-in)
  )

;;; Info

(use-package info   
  :bind (:map Info-mode-map
         ("DEL" . Info-history-back)
         ("B" . Info-history-back)
         ("F" . Info-history-forward)
         ("h" . Info-up)
         ("j" . next-line)
         ("k" . previous-line)
         ("l" . Info-follow-nearest-node)
         ("<XF86Back>" . nil)
         ("<XF86Forward>" . nil)))


;;; Дополнительная справка

(use-package helpful 
  :ensure t 
  :defer t
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)
         ("C-c d" . helpful-at-point)
         ("C-h F" . helpful-function)
         ("C-h C" . helpful-command)))

;;;  Изучение API Elisp

(use-package elisp-demos 
  :ensure t 
  :config)

;;; Подсказка комбинаций кавиш

(use-package guide-key
  :ensure t
  :defer t
  :diminish " C-?"
  :custom
  ((guide-key/guide-key-sequence '("C-x" "C-c" "ESC" "C-," "C-z" "C-t" "C-." "s-p"
                                   "M-t" "M-g" "SPC" "C-d" "F1" "M-s"))
   (guide-key/popup-window-position 'top)
   (guide-key/recursive-key-sequence-flag t)
   (guide-key/idle-delay 1.7)
   (guide-key/text-scale-amount -1)
   (guide-key/highlight-prefix-regexp "Prefix")
   (guide-key/highlight-command-regexp
    '("rectangle"
      ("buffer" . "sky blue")
      ("org" . "cornflower blue")
      ("outshine" . "Dark Violet")
      ("helm" . "lime green")
      ("consult" . "lime green")
      ("popwin" . "hot pink")
      ("macro" . "medium orchid")
      ("region" . "cadet blue")
      ("mark" . "moccasin")))
   )
  :init
  (guide-key-mode t))

;;; Документация по языку во всплывающем окне

(use-package eldoc-box
  :ensure t
  :custom
  (eldoc-idle-delay 1)
  :hook ((emacs-lisp-mode . eldoc-box-hover-mode)
         (prog-mode . eldoc-box-hover-mode)
         (eglot-managed-mode-hook . eldoc-box-hover-mode)
         (eldoc-box-frame-hook . (lambda () (setq cursor-in-non-selected-windows nil)))
         )
  
  :config
  (setq-default cursor-in-non-selected-windows nil)
  
  (set-face-attribute 'eldoc-box-border nil :background (face-foreground 'font-lock-comment-face))
  (set-face-attribute 'eldoc-box-body nil :family "Iosevka" :weight 'normal :italic nil :height 110))

;;; Статистика нажатий

(use-package keyfreq
  :ensure t
  :config
  (keyfreq-mode)
  (keyfreq-autosave-mode))


(provide 'справка)
;;; справка.el ends here
