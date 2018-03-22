;;;; dotenv.asd

(asdf:defsystem #:dotenv
  :description "Ease work with .env files."
  :author "Victor Polevoy <fx@thefx.co>"
  :license  "MIT"
  :version "0.1.0"
  :serial t
  :depends-on (#:str)
  :components ((:file "package")
               (:file "dotenv")))
