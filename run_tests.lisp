 (setf asdf:*central-registry*
   (list* '*default-pathname-defaults*
          #p"./"
          asdf:*central-registry*))

(asdf:test-system :dotenv)

