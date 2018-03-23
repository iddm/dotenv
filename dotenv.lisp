;;;; dotenv.lisp

(in-package #:dotenv)

(defparameter *dot-env-data* (make-hash-table :test 'equal))

(defun get-env (name &optional default)
  #+CMU
  (let ((x (assoc name ext:*environment-list*
                  :test #'string=)))
    (if x (cdr x) default))
  #-CMU
  (or
   #+Allegro (sys:getenv name)
   #+CLISP (ext:getenv name)
   #+ECL (si:getenv name)
   #+SBCL (sb-unix::posix-getenv name)
   #+LISPWORKS (lispworks:environment-variable name)
   default))

(defun parse-env-string (string)
  "Reads environment string (KEY=VALUE). Returns the pair on success, NIL otherwise."
  (let ((pair (str:split "=" string :omit-nulls t)))
    (if (= (list-length pair) 2) pair nil)))

(defun dot-env-read-vars (vars)
  "Reads provided environment variables into *dot-env-data*."
  (dolist (var vars)
    (let ((var (parse-env-string var)))
      (if (not var) (return-from dot-env-read-vars) (setf (gethash (car var) *dot-env-data*) (cdr var)))))
  T)

(defun dot-env-load! (&optional names)
  "Reads provided .env files."
  (dolist (name (or names '(".env")))
    (dot-env-read-vars (uiop:read-file-lines name))))

(defun dot-env (name &optional default)
  "Reads the .env or env variable with such name.
  Returns passed default value or nil if not found"
  (or (car (gethash name *dot-env-data*)) (get-env name default)))
