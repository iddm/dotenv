# dotenv

This is a project to parse dotenv (`.env`) files.
You already know what that means, don't you?

## Description

This project provides all the necessary functions for
interaction with **dotenv** files (usually it is `.env`).

### API

#### dot-env-load!
The function's prototype is:

```lisp
(defun dot-env-load! (&optional names)
```

It reads the **dotenv** files provided in the optional list or
reads only `.env` file is the list is empty or was not provided.

**Usage:**

```lisp
;; Loads the `.env` only because the arguments list is empty.
(dot-env-load!)
;; Loads the provided files.
(dot-env-load! '(".env" "test.env"))
```

#### dot-env
The function's prototype is:

```lisp
(defun dot-env (name &optional default)
```

It reads the value of a variable **dotenv** with passed name.
If there is no such a variable there, it reads the process environment.
If there is nothing too, it returns `default` or `NIL`.

**Usage:**

```lisp
(dot-env-load!)
(dot-env "HOME")
```


## License

[MIT license](./LICENSE)

