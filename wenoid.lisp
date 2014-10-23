(in-package #:wenoid)

(setf drakma:*drakma-default-external-format* :WINDOWS-1251)

(defun test (url)
  (drakma:http-request url))


(defun getp (param)
   (equal "get" (getf param :method)))


(defun postp (param)
   (equal "post" (getf param :method)))

(defun extract-get-params (params)
  (loop for param in params
     when (getp param)
     collect (cons (getf param :name) (getf param :value))))
  

(defun extract-post-params (params)
  (loop for param in params
     when (postp param)
     collect (cons (getf param :name) (getf param :value))))

(defun params-to-string (params)
  (let ((query (with-output-to-string (stream)
             (format stream "?")
             (loop for (name . value) in params
                do (format stream "~a=~a&" name value)))))
             ;(dolist (param params)
              ; (format s "~a=" (getf param :name))
            ;(format s "~a&" (getf param :value))))))
    (subseq query 0 (- (length query) 1))))


(defun request-august (chat page &optional (params nil))
  (let* ((get-params (extract-get-params params))
        (post-params (extract-post-params params))
        (url (concatenate 'string chat "/" page (params-to-string get-params))))
    (drakma:http-request url
                         :method :post
                         :parameters post-params)))
  
