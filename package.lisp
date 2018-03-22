;;;; package.lisp

(defpackage #:dotenv
  (:use #:cl)
  (:export #:dot-env-load!)
  (:export #:dot-env)
  (:shadowing-import-from #:str))
