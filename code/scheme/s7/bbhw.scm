;;;
;;; Copyright © 2024 Christopher Augustus
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at http://mozilla.org/MPL/2.0/.
;;;
(begin
(define count #f)
(define input "")
(display "## TODO: s7 REPL DOES NOT SUPPORT COMMAND LINE ARGS\n")
(do () (count)
    (if (string=? input "")
        (begin (display "countdown: ")
               (set! input (let ((s (read-line)))
                                (substring s 0 (- (length s) 1))))))
    (set! count (string->number input))
    (if (or (not (integer? count)) (< count 0))
        (begin (display (format #f "Invalid countdown ~S, try again...\n" input))
               (set! count #f)
               (set! input ""))))
(display "World, Hello...")
(display "\n## TODO: s7 AND Scheme DO NOT SUPPORT SLEEP\n")
(do ((i count (- i 1))) ((zero? i))
    (begin (display (format #f "~A..." i))))
        ;;TODO: (sleep 1))
(display "Bye Bye.\n")
)
