#lang racket

(require "../src/bytes-contracts.rkt" rackunit rackunit/text-ui)

(define-test-suite bytes-contracts-suite
  (check-exn exn:fail?
             (lambda () (contract (bytes-len</c 2) (bytes #x11 #xAA #xBB) #t #f)))
  (check-exn exn:fail?
             (lambda () (contract (bytes-len=/c 2) (bytes #x11) #t #f)))
  (check-not-exn (lambda () (contract (bytes-len=/c 2) (bytes #x11 #xFF) #t #f)))
  (check-not-exn (lambda () (contract (bytes-len</c 2) (bytes #x11) #t #f))))

(run-tests bytes-contracts-suite)

