;
; uLisp Query Language - 9th April 2019
; See http://www.ulisp.com/show?2I60
;

; Database

(defvar *rules* nil)

(defun add (rule)
  (unless (assoc (car rule) *rules*) (push (list (car rule)) *rules*))
  (push (cdr rule) (cdr (assoc (car rule) *rules*)))
  t)

; Match

(defun match (x y &optional binds)
  (cond
   ((eq x y) (if binds binds '((t))))
   ((assoc x binds) (match (binding x binds) y binds))
   ((assoc y binds) (match x (binding y binds) binds))
   ((var? x) (cons (cons x y) binds))
   ((var? y) (cons (cons y x) binds))
   (t
    (when (and (consp x) (consp y))
      (let ((m (match (car x) (car y) binds)))
        (when m (match (cdr x) (cdr y) m)))))))

(defun var? (x)
  (and (symbolp x) (eq (char (string x) 0) #\?)))

(defun binding (x binds)
  (let ((b (assoc x binds)))
    (when b 
      (or (binding (cdr b) binds)
          (cdr b)))))

; Inference

(defun query (expr &optional binds)
  (case (car expr)
    (and (query-and (reverse (cdr expr)) binds))
    (or (query-or (cdr expr) binds))
    (not (query-not (second expr) binds))
    (test (query-test (second expr) binds))
    (t (lookup (car expr) (cdr expr) binds))))

(defun lookup (pred args &optional binds)
  (mapcan 
   (lambda (x)
     (let ((m (match args x binds)))
       (when m (list m))))
   (cdr (assoc pred *rules*))))
 
(defun query-and (clauses binds)
  (if (null clauses)
      (list binds)
    (mapcan (lambda (b) (query (car clauses) b))
            (query-and (cdr clauses) binds))))
 
(defun query-or (clauses binds)
  (apply 'append (mapcar (lambda (c) (query c binds)) clauses)))
 
(defun query-not (clause binds)
  (unless (query clause binds)
    (list binds)))

(defun subs (lst binds)
  (cond
   ((null lst) nil)
   ((atom lst) (if (assoc lst binds) (cdr (assoc lst binds)) lst))
   (t (cons (subs (car lst) binds) (subs (cdr lst) binds)))))

(defun query-test (tst binds)
  (when (eval (subs tst binds))
    (list binds)))

(defun answer (expr output)
  (dolist (binds (query expr nil))
    (mapc (lambda (p) (princ p) (princ #\space)) (subs output binds))
    (terpri)))

(defun read-data ()
  (dolist (rules *data*)
    (let ((pred (first rules))
          (data (cdr rules)))
      (mapc (lambda (rule) (add (cons (first rule) (cons pred (cdr rule))))) data)))
  t)