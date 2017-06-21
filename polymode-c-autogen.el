;;; polymode-c-autogen.el --- GNU AutoGen template editing mode for C
;;
;; Filename: polymode-c-autogen.el
;; Author: Kayo <kayo@illumium.org>
;; Maintainer: Kayo <kayo@illumium.org>
;; Copyright (C) 2017, Kayo, all rights reserved.
;; Version: 1.0
;; Package-Requires: ((emacs "24"))
;; URL: https://github.com/katyo/autogen-mode
;; Keywords: emacs, autogen, c
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
;;   A GNU AutoGen template editing mode for C. It uses `polymode`
;;   to combine the root `c-mode` with `autogen-mode` in template
;;   directives. Using **scheme-mode** for scheme chunks into templates
;;   currently not supported.
;;
;;   Usage: https://github.com/katyo/autogen-mode
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'autogen-mode)
(require 'polymode)

;; Polymode host mode for GNU AutoGen
(defcustom pm-host/c
  (pm-bchunkmode "c"
                 :mode 'c-mode)
  "C host chunkmode"
  :group 'hostmodes
  :type 'object)

(defcustom  pm-inner/c+autogen
  (pm-hbtchunkmode "c"
                   :mode 'autogen-mode
                   :head-reg "\\[\\+"
                   :tail-reg "\\+\\]"
                   :head-adjust-face 'font-lock-preprocessor-face
                   :tail-adjust-face 'font-lock-preprocessor-face)
  "AutoGen chunk."
  :group 'innermodes
  :type 'object)

(defcustom  pm-inner/autogen+scheme
  (pm-hbtchunkmode "scheme"
                   :mode 'scheme-mode
                   :head-reg "("
                   :tail-reg ")")
  "Scheme chunk (incomplete)."
  :group 'innermodes
  :type 'object)

(defcustom pm-poly/c+autogen
  (pm-polymode-one "c+autogen"
                   :hostmode 'pm-host/c
                   :innermode 'pm-inner/c+autogen)
  "AutoGen C template polymode."
  :group 'polymodes
  :type 'object)

(define-polymode poly-c+autogen-mode pm-poly/c+autogen :lighter "PM-Cag")

(provide 'polymode-c-autogen)
