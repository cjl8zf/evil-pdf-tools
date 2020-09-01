;;; evil-pdf-tools.el --- Adds evil key bindings to pdf-tools -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Chrstopher Lloyd

;; Author: Chrstopher Lloyd <cjl8zf@virginia.edu>
;;         George H. Seelinger <ghseeli@gmail.com>

;; Version: 0.0.1

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; evil-pdf-tools provides a minor mode that adds evil style keybindings to pdf-tools

;;; Code:


(define-minor-mode evil-pdf-tools-mode
  "A minor mode to add evil key bindings to pdf-tools."
  :lighter " evil-pdf-tools"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map "k" 'pdf-view-previous-line-or-previous-page)
	    (define-key map "j" 'pdf-view-next-line-or-next-page)
	    (define-key map "l" 'image-forward-hscroll)
	    (define-key map "h" 'image-backward-hscroll)
	    (define-key map (kbd "C-f") 'pdf-view-scroll-up-or-next-page)
	    (define-key map (kbd "C-b") 'pdf-view-scroll-down-or-previous-page)
	    (define-key map "gg" 'pdf-view-first-page)
	    (define-key map "G" 'pdf-view-last-page)
	    (define-key map "r" 'revert-buffer)
	    (define-key map ":" 'evil-ex)
	    (define-key map "/" 'isearch-forward) map)
  (evil-pdf-tools-setup))

(defun evil-pdf-tools-setup ()
  "Modify isearch to behave like evil search."
  (progn
    (add-function :before (symbol-function 'isearch-forward) #'evil-like-search-setup)
    (add-function :after (symbol-function 'isearch-forward) #'evil-like-search-setup)))

(defun evil-like-search-setup (&optional ARG PRED)
  "After enter is pressed in isearch the letters n and N are used to navigate the results."
  (progn
    (define-key isearch-mode-map (kbd "<return>")
      '(lambda () (interactive)
	 (progn
	   (define-key isearch-mode-map "n" 'isearch-repeat-forward)
	   (define-key isearch-mode-map "N" 'isearch-repeat-backward))))
    (define-key isearch-mode-map "n" 'isearch-printing-char)
    (define-key isearch-mode-map "N" 'isearch-printing-char)))

;;;###autoload
(add-hook 'pdf-view-mode-hook 'evil-pdf-tools-mode)

(provide 'evil-pdf-tools)
;;; evil-pdf-tools.el ends here

