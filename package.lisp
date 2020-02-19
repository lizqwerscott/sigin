(in-package :cl-user)

(defpackage :sigin
  (:use :common-lisp :uiop)
  (:export :sigin-f
           :add-data
           :load-data
           :save-data
           :refresh-now-data))

