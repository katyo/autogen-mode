;;; autogen-mode.el --- GNU AutoGen editing mode
;;
;; Filename: autogen-mode.el
;; Author: Kayo <kayo@illumium.org>
;; Maintainer: Kayo <kayo@illumium.org>
;; Copyright (C) 2017, Kayo, all rights reserved.
;; Version: 1.0
;; Package-Requires: ((emacs "24"))
;; URL: https://github.com/katyo/autogen-mode
;; Keywords: emacs, autogen
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This file is *NOT* part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;   A major-mode for editing GNU AutoGen templates.
;;
;;   Usage: https://github.com/katyo/autogen-mode
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(defconst autogen-mode--font-lock
  ;; (regexp-opt '("autogen5" "template" "break" "case" "continue" "debug" "define" "elif" "else" "enddef" "endfor" "endif" "endwhile" "esac" "expr" "for" "in" "if" "include" "invoke" "return" "select" "unknown" "while"))
  '(("\\[\\+\\|\\+\\]" . font-lock-preprocessor-face)
    ("\\(\\-\\*\\-\\).*\\1" . font-lock-comment-face)
    ("\\(?:#\\|\\bcomment\\b\\).*" . font-lock-comment-face)
    ("\\b\\(?:autogen[[:digit:]]?\\|break\\|c\\(?:\\(?:as\\|ontinu\\)e\\)\\|de\\(?:bug\\|fine\\)\\|e\\(?:l\\(?:if\\|se\\)\\|nd\\(?:def\\|for\\|if\\|while\\)\\|sac\\|xpr\\)\\|for\\|i\\(?:n\\(?:\\(?:clud\\|vok\\)e\\)\\|[fn]\\)\\|return\\|select\\|template\\|unknown\\|while\\)\\b" . font-lock-keyword-face)
    ("__\\(?:[[:alpha:]][[:alnum:]]*\\)__" . font-lock-builtin-face)
    ("\"\\(?:[^\"]+\\|\\\"\\)\"" . font-lock-string-face))
  "GNU AutoGen mode font lock")

(define-derived-mode autogen-mode text-mode "autogen"
  "Major mode for editing GNU AutoGen templates."
  (setq-local font-lock-defaults '(autogen-mode--font-lock)))

(provide 'autogen-mode)
