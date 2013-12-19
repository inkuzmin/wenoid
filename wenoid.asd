(defpackage #:wenoid-asd
  (:use :cl :asdf))

(in-package :wenoid-asd)

(defsystem #:wenoid
  :name "wenoid"
  :version "0.0.0"
  :maintainer "inkuzm"
  :serial t
  :description "AI chat bot for august4u"
  :author "inkuzm"
  :license "MIT"
  :depends-on ("cl-ppcre" "drakma")
  :components ((:file "packages")
               (:file "wenoid")))
