(in-package :sigin)

(defparameter *save-data-file* #P"~/save-data.txt")
(defparameter *data* (make-hash-table))
(defparameter *now-data* nil)

(defun save-data ()
  (with-open-file (out (namestring *save-data-file*) 
                     :if-does-not-exist :create
                     :if-exists :supersede :direction :output)
    (with-standard-io-syntax 
      (print *data* out))))

(defun load-data ()
  (with-open-file (in (namestring *save-data-file*))
    (with-standard-io-syntax
      (setf *data* (read in)))))

(defun add-now-data (index)
  (if (and (gethash index *data*) (>= index 0)) 
      (if (find index *now-data*)  
        (format t "index:~A is add~%" index)
        (setf *now-data* (append *now-data* (list index))))
      (format t "input is not number~%")))

(defun add-data (index data)
  (setf (gethash index *data*) data))

(defun get-in ()
  (format t "Input:")
  (force-output *query-io*)
  (read-line *query-io*))

(defun get-in-number ()
  (or (parse-integer (get-in) :junk-allowed t) -1))

(defun format-no-in-data ()
  (maphash #'(lambda (k v)
               (if (not (find k *now-data*))
                   (format t "index:~A, Data:~A~%" k v))
               ) *data*))

(defun refresh-now-data ()
  (setf *now-data* nil))

(defun sigin-f ()
  (do ((in (get-in-number) (get-in-number)))
      ((= in 0) 0)
      (add-now-data in)
      (format-no-in-data)))

(in-package :cl-user)
