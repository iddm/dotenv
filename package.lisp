;;;; package.lisp

(defpackage #:dotenv
  (:use #:cl)
  (:export #:dot-env-load!)
  (:shadowing-import-from #:str))
