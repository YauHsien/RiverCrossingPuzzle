;; The file contains code in
;; -*- Emacs-Lisp -*-
;; to solve the River Crossing Puzzle.

(defun may-eat (eater eatee)
  "Eatting-Relationship"
  (cond
   ((and (equal 'Sheep eater) (equal 'Cabbage eatee)) t)
   ((and (equal 'Wolf eater) (equal 'Sheep eatee)) t)
   (t nil)))

(defun eaten-by (eatee eater)
  "Reversed Eatting-Relationship"
  (may-eat eater eatee))

(defun combine-2-in-3 (list)
  "Build all 2-combinations from 3-items"
  (cond
   ((< (length list) 2) nil)
   ((= (length list) 2) (cons list nil))
   (t (cons
       (cons (car list) (cons (cadr list) nil))
       (append
        (combine-2-in-3 (cons (car list) (cddr list)))
        (combine-2-in-3 (cdr list)))))))

(defun not-in-trouble (list)
  "Take all 2-combinations from list"
  (cl-remove-if-not
   (lambda (list1) (apply 'may-eat list1))
   (combine-2-in-3 list)))

;; stuck
(cl-remove-if-not (lambda (n) (apply 'numberp (cons n nil))) '(1 2 3 p))
(apply (lambda (n) (apply 'numberp (cons n nil))) '(2))
(apply 'may-eat '('('Wolf 'Sheep)))
