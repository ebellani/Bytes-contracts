#lang at-exp racket

(require racket/contract
         scribble/srcdoc)

(require/doc racket/base
             scribble/manual)

(provide/doc
 [proc-doc/names
  bytes-len</c (natural-number/c . -> . contract?)
  (max-length) @{Recognizes bytes that have fewer than @racket[max-length] elements.}]
 [proc-doc/names
  bytes-len=/c (natural-number/c . -> . contract?)
  (len) @{Recognizes bytes that have exactly @racket[len] elements.}])

(define (bytes-len/c len fn)
  (flat-contract
   (lambda (expr)
     (and bytes?
        (fn (bytes-length expr) len)))))

(define (bytes-len</c max-length)
  (bytes-len/c max-length <))

(define (bytes-len=/c length)
  (bytes-len/c length =))