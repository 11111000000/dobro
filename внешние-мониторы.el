;;; внешние-мониторы.el --- Настройка второго монитора
;;; Commentary:
;;; Code:

(eval-after-load 'exwm
  '(progn
     (require 'exwm-randr)

     (setq exwm-randr-workspace-output-plist '(0 "VGA-1" 1 "LVDS-1"))

     (defun monitor-on-right ()
       "Monitor on top with normal orientation."
       (start-process-shell-command
        "xrandr" nil "xrandr --output VGA-1 --auto --rotate normal --output LVDS-1 --auto --left-of VGA-1 --primary")
       (exwm-randr-refresh))

     (defun monitor-on-right-rotate ()
       "Monitor on top with normal orientation."
       (start-process-shell-command
        "xrandr" nil "xrandr --output VGA-1 --auto --rotate left --output LVDS-1 --auto --left-of VGA-1 --primary")
       (exwm-randr-refresh))

     ;; (defun monitor-on-right-rotate ()
     ;;   "monitor on top with normal orientation"
     ;;   (start-process-shell-command
     ;;    "xrandr" nil "xrandr --output VGA-1 --auto --rotate left --primary --output LVDS-1 --auto --left-of VGA-1"))

     (exwm-randr-enable)

     (add-hook 'exwm-randr-screen-change-hook
               'monitor-on-right)

     )
  )

(provide 'внешние-мониторы)
;;; внешние-мониторы.el ends here
