(defpackage :dotenv/test
  (:use :cl :dotenv :prove))
(in-package :dotenv/test)

(defun env-parse-test ()
  "Testing env key-value parsing"

  (plan 6)

  (let ((valid-record '("KEY=VALUE"))
        (empty-record '(""))
        (invalid-record-1 '("KEY"))
        (invalid-record-2 '("KEY="))
        (invalid-record-3 '("=VALUE"))
        (invalid-record-4 '("=")))
    (is (dot-env-read-vars valid-record) t)
    (is (dot-env-read-vars empty-record) nil)
    (is (dot-env-read-vars invalid-record-1) nil)
    (is (dot-env-read-vars invalid-record-2) nil)
    (is (dot-env-read-vars invalid-record-3) nil)
    (is (dot-env-read-vars invalid-record-4) nil))

  (finalize))

(env-parse-test)
