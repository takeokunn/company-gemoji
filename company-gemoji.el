;;; company-gemoji.el --- summary -*- lexical-binding: t -*-

;; Author: takeo obara
;; Maintainer: takeo obara
;; Version: 1.0.0
;; Package-Requires: (company)
;; Homepage: https://github.com/takeokunn/company-gemoji
;; Keywords: company


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


(require 'cl-lib)
(require 'company)
(require 'text-mode)

(require 'company-gemoji-data)

(defcustom company-gemoji-self-keywords '()
  ""
  :type '(alist string))

(defvar company-gemoji--keywords
  (cl-concatenate 'list company-gemoji-data-keywords company-gemoji-self-keywords))

(defun company-gemoji--candidates (prefix)
  (let (res)
    (message prefix)
    (dolist (item company-gemoji--keywords)
      (when (string-prefix-p prefix item)
        (push item res)))
    res))

(defun company-gemoji (command &optional arg &rest ignored)
  "Gemoji backend for company mode."
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-gemoji))
    (prefix (when (eq major-mode 'text-mode)
              (company-grab-symbol)))
    (candidates (company-gemoji--candidates arg))))

(provide 'company-gemoji)

;;; company-gemoji.el ends here
