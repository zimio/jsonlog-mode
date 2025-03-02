(require 'logview)

(defun jsonlog-initialize ()
  (let ((lines
         (jsonlog-parse-buffer)))
    (when lines
          (let ((jsonlog-buffer
                 (generate-new-buffer "jsonlog")))
            (switch-to-buffer jsonlog-buffer)
            (jsonlog-insert-lines-buffer lines jsonlog-buffer)))))

(defun jsonlog-insert-lines-buffer (lines buffer)
  (dolist (line lines)
    (insert line "\n")))

(defun jsonlog-parse-buffer ()
  (goto-char (point-min))
  (let ((lines nil))
    (while (not (eobp))
      (let ((parsed-line nil))
        (setq parsed-line
              (jsonlog-parse-line
               (thing-at-point 'line t)))
        (when parsed-line
          (push parsed-line lines)))
      (forward-line 1))
    (nreverse  lines)))

(defun jsonlog-parse-line (line)
  (let ((parsed-line (ignore-errors
                       (json-parse-string line))))
    (when (hash-table-p parsed-line)
          (jsonlog-convert-to-string parsed-line))))

(defun jsonlog-convert-to-string (line)
  (format "%s [%s] %s %s - %s"
          (jsonlog-convert-timestamp (gethash "@timestamp" line))
          (jsonlog-shorten-name (gethash "thread_name" line))
          (gethash "level" line)
          (gethash "logger_name" line)
          (gethash "message" line)))

(defun jsonlog-shorten-name (name)
  ;; Picks the last part of a name with namespaces
  (car (last (split-string name "\\."))))

(defun jsonlog-convert-timestamp (timestamp)
  "Convert 'YYYY-MM-DDTHH:MM:SS.ssssssZ' to 'YYYY-MM-DD HH:MM:SS.sss'."
  (let* ((split-time (split-string timestamp "[TZ]")) ;; Split at 'T' and 'Z'
         (date (nth 0 split-time))
         (time-part (nth 1 split-time))
         (time-split (split-string time-part "\\.")) ;; Split at '.'
         (time (nth 0 time-split))
         (milliseconds (substring (or (nth 1 time-split) "000") 0 3))) ;; Take first 3 digits
    (format "%s %s.%s" date time milliseconds)))

(define-derived-mode jsonlog-mode fundamental-mode "Json Log Viewer" :group 'jsonlog
  "A mode that allows logview to parse json"
  (jsonlog-initialize)
  (logview-mode))


(provide 'jsonlog-mode)
