;; Setup `load-path'

(defun python-join-path (p &rest ps)
  (if ps (expand-file-name p (apply #'python-join-path ps)) p))

(let* ((current-directory (file-name-directory load-file-name))
       (features-directory (python-join-path current-directory ".."))
       (project-directory (python-join-path features-directory ".."))
       (util-directory (python-join-path "util" project-directory)))
  (add-to-list 'load-path project-directory)
  (add-to-list 'load-path (python-join-path "espuds" util-directory))
  (add-to-list 'load-path (python-join-path
                           "ert" "lisp" "emacs-lisp" util-directory)))


;; Load modules
(require 'python)
(require 'espuds)
(require 'ert)


;; Test setup/teardown
(Before
 (switch-to-buffer (get-buffer-create "*python-test*"))
 (erase-buffer))

(After
 (kill-buffer (get-buffer "*python-test*")))
