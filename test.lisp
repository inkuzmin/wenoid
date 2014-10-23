(require :usocket)

(defparameter sock (usocket:socket-connect "google.com" 80))

(format (usocket:socket-stream sock) "~A~%~A~%~%" 
                                        "GET / HTTP/1.1"
                                        "Connection: clos)

(force-output (usocket:socket-stream sock))

(do ((line                                                             
         (read-line (usocket:socket-stream sock) nil)                        
         (read-line (usocket:socket-stream sock) nil)))                      
       ((not line))                                                       
      (format t "~A" line))
