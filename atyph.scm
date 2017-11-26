(define (symbol->elem-str sym attrs closed?)
  (let ((str (symbol->string sym)))
    (if closed?
      ; TODO: Join strings of attrs.
      (string-append "</" str attrs ">")
      (string-append "<" str attrs ">"))))

(define (aty-walktree dom output)
  (cond
    ; TODO: Single symbol for a single self-closed element.
    ((symbol? (car dom))
     (let ((elem (car dom))
           (attrs (aty-walkattrs (cdr dom))))
       (cons (symbol->elem-str elem attrs #f) output)
       (cons (symbol->elem-str elem '() #t) output))))

(display (aty-walktree (read) '()))

(newline)
