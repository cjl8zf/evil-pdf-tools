;;; evil-pdf-tools-test.el --- Tests for evil-pdf-tools.el

;; Copyright (C) 2013 Chrstopher Lloyd

;; Author: Chrstopher Lloyd <chris@d-172-26-103-3.dhcp.virginia.edu>

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

;; Tests for evil-pdf-tools.el

;;; Code:

(require 'ert)
(require 'evil-pdf-tools)

(ert-deftest evil-pdf-tools-check-sum ()
  (should (equal (+ 1 1) 2)))

(provide 'evil-pdf-tools-test)

;;; evil-pdf-tools-test.el ends here
