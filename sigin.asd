(in-package :cl-user)

(defsystem "sigin"
  :version "0.1.0"
  :author "lizqwer"
  :license "BSD "
  :depends-on ("uiop")
  :components ((:file "package")
               (:file "main" :depends-on ("package")))
  :description "sigin")
