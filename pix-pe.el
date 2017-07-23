;;; pix-pe.el --- Generate pseudo-random pix.pe images

;; Copyright (C) xxxx  -

;; Author: - <xxx@xxx.xxx>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
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

;; ---

;;; Code:

(defun pxp-make-pixpe-url (query-string)
  ""
  (concat "http://pix.pe/#" query-string))

(defun pxp-random-color-palette ()
  ""
  (let ((reserved-chars (list "C" "E" "G" "I" "K" "M" "O" "Q")))
    (nth (random (length reserved-chars)) reserved-chars)))

(defun pxp-generate-random-pixpe-url ()
  ""
  (let* ((chars (list
                 "a"
                 "b"
                 "c"
                 "d"
                 "e"
                 "f"
                 "g"
                 "h"
                 "i"
                 "j"
                 "k"
                 "l"
                 "m"
                 "n"
                 "o"
                 "p"
                 "q"
                 "r"
                 "s"
                 "t"
                 "u"
                 "v"
                 "x"
                 "y"
                 "z"

                 "A"
                 "B"
                 ;; "C"
                 "D"
                 ;; "E"
                 "F"
                 ;; "G"
                 "H"
                 ;; "I"
                 "J"
                 ;; "K"
                 "L"
                 ;; "M"
                 "N"
                 ;; "O"
                 "P"
                 ;; "Q"
                 "R"
                 "S"
                 "T"
                 "U"
                 "V"
                 "X"
                 "Y"
                 "Z"
                 "_"
                 ))
         (num-chars 128)
         (query-string (make-pixpe-url (pxp-random-color-palette))))
    (progn
      (dotimes (i num-chars)
        (setq query-string (concat query-string
                                   (nth (random (length chars)) chars))))
      query-string)))


(defun pxp-pixpeify-this (msg)
  ""
  (unless (> (length msg) 128)
    (progn
      (setq msg (concat (pxp-random-color-palette) (format "%-128s" msg)))
      (replace-regexp-in-string " " "_" msg))))


(provide 'pix-pe)
;;; pix-pe.el ends here
