;;;; dotenv.asd

(asdf:defsystem #:dotenv
  :description "Ease pain with working with .env files."
  :author "Victor Polevoy <fx@thefx.co>"
  :license "MIT"
  :version "0.1.0"
  :serial t
  :depends-on (#:str)
  :components ((:file "package")
               (:file "dotenv"))
  :in-order-to ((test-op (test-op dotenv-test))))

(asdf:defsystem #:dotenv-test
   :depends-on (:dotenv
                :prove)
   :defsystem-depends-on (:prove-asdf)
   :components
   ((:test-file "test"))
   :perform (test-op :after (op c)
                     (funcall (intern #.(string :run) :prove) c)))
