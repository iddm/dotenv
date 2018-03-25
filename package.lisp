;;;; package.lisp

(defpackage #:dotenv
  (:use #:cl)
  (:export #:load!)
  (:export #:read-vars)
  (:export #:value)
  (:shadowing-import-from #:str))
