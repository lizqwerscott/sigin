(defsystem "sigin"
  :version "0.1.0"
  :author "lizqwer"
  :license "BSD "
  :components ((:file "package")
               (:file "main" :depends-on ("package")))
  :description "sigin")
