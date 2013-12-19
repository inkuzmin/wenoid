(in-package #:wenoid)

(defun test (url)
  (drakma:http-request url))


(defun getp (param)
   (equal "get" (getf param :method)))


(defun postp (param)
   (equal "post" (getf param :method)))

(defun extract-get-params (params)
  (loop for param in params
     when (getp param)
     collect param))

(defun extract-post-params (params)
  (loop for param in params
     when (postp param)
     collect param))

(defun params-to-string (params)
  (let ((query (with-output-to-string (s)
             (format s "?")
             (dolist (param params)
               (format s "~a=" (getf param :name))
               (format s "~a&" (getf param :value))))))
    (drakma:url-encode (subseq query 0 (- (length query) 1)) :utf-8)))

(defun request-index (chat params)
  (let* ((get-params  (extract-get-params params))
        (post-params (extract-post-params params))
        (url (concatenate 'string chat "/index" (params-to-string get-params))))
    (format t "~a" url)))
    ;(format t "~a" get-params)
    ;(format t "~a" post-params))))
;    (drakma:http-request ""
 ;                        :method :post
  ;                       :parameters '(("entered_login" . "test")
   ;                                    ("entered_password" . "test"))))
