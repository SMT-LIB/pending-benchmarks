;; produced by cvc4_16_smtcomp.drv ;;
(set-info :smt-lib-version 2.6)
(set-logic AUFBVDTNIA)
(set-info :source |
Generated by: Rod Chapman
Generated on: 2024-02-26
Generator: GNATProve 13.2.1 and Why3 1.5.0
Application: Proof of LibMLKEM Cryptographic Library
Target solver: CVC4, CVC5, Z3
Publications: https://github.com/awslabs/LibMLKEM
|)
(set-info :license "https://www.apache.org/licenses/LICENSE-2.0")
(set-info :category "industrial")
(set-info :status unsat)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort us_private 0)

(declare-const us_null_ext__ us_private)

(declare-datatypes ((int__ref 0))
  (((int__refqtmk (int__content Int)))))

(declare-datatypes ((bool__ref 0))
  (((bool__refqtmk (bool__content Bool)))))

;; nth
(declare-fun nth ((_ BitVec 8)
  Int) Bool)

;; lsr
(declare-fun lsr ((_ BitVec 8)
  Int) (_ BitVec 8))

;; asr
(declare-fun asr ((_ BitVec 8)
  Int) (_ BitVec 8))

;; lsl
(declare-fun lsl ((_ BitVec 8)
  Int) (_ BitVec 8))

;; abs
(define-fun abs1 ((x Int)) Int
  (ite (<= 0 x) x (- x)))

;; Abs_le
(assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
(assert (forall ((x Int)) (<= 0 (abs1 x))))

;; Div_unique
(assert
  (forall ((x Int) (y Int) (q Int))
    (=>
      (< 0 y)
      (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
(assert
  (forall ((x Int) (y Int))
    (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
(assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
(assert
  (forall ((x Int) (y Int))
    (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
(assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
(assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
(assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
(assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
(assert
  (forall ((y Int))
    (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
(assert
  (forall ((x Int) (y Int) (z Int))
    (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
(assert
  (forall ((x Int) (y Int) (z Int))
    (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

;; pow2
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; two_power_size_minus_one_val
(assert (= two_power_size_minus_one (pow2 (- 8 1))))

;; to_int
(define-fun to_int1 ((x (_ BitVec 8))) Int
  (ite (bvsge x (_ bv0 8)) (bv2nat x) (- (- 256 (bv2nat x)))))

;; lsr_bv_is_lsr
(assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
    (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
(assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
    (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
(assert
  (forall ((x (_ BitVec 8)) (n (_ BitVec 8)))
    (= (bvshl x n) (lsl x (bv2nat n)))))

;; nth_bv
(declare-fun nth_bv ((_ BitVec 8)
  (_ BitVec 8)) Bool)

;; nth_bv_def
(assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
    (= (= (nth_bv x i) true) (not (= (bvand (bvlshr x i) #x01) #x00)))))

;; Nth_bv_is_nth
(assert
  (forall ((x (_ BitVec 8)) (i (_ BitVec 8)))
    (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
(assert
  (forall ((x (_ BitVec 8)) (i Int))
    (=> (and (<= 0 i) (< i 256)) (= (nth_bv x ((_ int2bv 8) i)) (nth x i)))))

;; min
(define-fun min ((x Int) (y Int)) Int
  (ite (<= x y) x y))

;; max
(define-fun max ((x Int) (y Int)) Int
  (ite (<= x y) y x))

;; Min_r
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
(assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
(assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
(assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
(assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

(declare-sort byte 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-const dummy byte)

(declare-sort tinteger_32B 0)

;; tinteger_32B'int
(declare-fun tinteger_32Bqtint (tinteger_32B) Int)

;; tinteger_32B'axiom
(assert
  (forall ((i tinteger_32B))
    (and
      (<= (- 2147483648) (tinteger_32Bqtint i))
      (<= (tinteger_32Bqtint i) 2147483647))))

;; in_range
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

(declare-const dummy1 tinteger_32B)

;; to_rep
(define-fun to_rep ((x tinteger_32B)) Int
  (tinteger_32Bqtint x))

;; of_rep
(declare-fun of_rep (Int) tinteger_32B)

;; inversion_axiom
(assert
  (forall ((x tinteger_32B))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
(assert
  (forall ((x tinteger_32B))
    (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
(assert
  (forall ((x Int))
    (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                               (of_rep x))) )))

(declare-sort n32 0)

;; in_range
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

(declare-const dummy2 n32)

;; to_rep
(declare-fun to_rep1 (byte) (_ BitVec 8))

;; of_rep
(declare-fun of_rep1 ((_ BitVec 8)) byte)

;; inversion_axiom
(assert
  (forall ((x byte)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
(assert true)

;; coerce_axiom
(assert
  (forall ((x (_ BitVec 8)))
    (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(declare-datatypes ((t 0))
  (((tqtmk (rec__first tinteger_32B)(rec__last tinteger_32B)))))

;; dynamic_property
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range low)
    (and
      (in_range high)
      (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int byte))(rt t)))))

;; to_array
(define-fun to_array ((a us_t)) (Array Int byte)
  (elts a))

;; first
(define-fun first ((a us_t)) Int
  (to_rep (rec__first (rt a))))

;; last
(define-fun last ((a us_t)) Int
  (to_rep (rec__last (rt a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
(assert (<= 0 value__size))

;; object__size_axiom
(assert (<= 0 object__size))

;; component__size_axiom
(assert (<= 0 component__size))

;; alignment_axiom
(assert (<= 0 alignment))

(declare-const dummy3 us_t)

(declare-const x us_t)

(declare-const y us_t)

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_667 us_t) (temp___is_init_663 Bool) (temp___skip_constant_664 Bool) (temp___do_toplevel_665 Bool) (temp___do_typ_inv_666 Bool)) Bool
  (=>
    (not (= temp___skip_constant_664 true))
    (dynamic_property
      0
      2147483647
      (first temp___expr_667)
      (last temp___expr_667))))

;; dynamic_property
(define-fun dynamic_property1 ((first_int Int) (last_int Int) (x1 Int)) Bool
  (and (<= first_int x1) (<= x1 last_int)))

(declare-const dummy4 tinteger_32B)

;; Goal def'vc
;; File "mlkem.adb", line 1945, characters 0-0
(assert
  (not
  (=>
    (dynamic_invariant x true false true true)
    (=>
      (dynamic_invariant y true false true true)
      (=>
        (= (first x) (first y))
        (=>
          (= (last x) (last y))
          (forall ((d Bool))
            (=>
              (= d (distinct 1 0))
              (let ((temp___3477 (first x)))
                (let ((temp___3478 (last x)))
                  (forall ((i Int))
                    (=>
                      (= i temp___3477)
                      (=>
                        (= (and (ite (<= temp___3477 i) true false) (ite (<= i temp___3478)
                                                                    true
                                                                    false)) true)
                        (=>
                          (and (<= (first y) i) (<= i (last y)))
                          (forall ((o (_ BitVec 8)))
                            (=>
                              (= (to_rep1 (select (to_array y) i)) o)
                              (forall ((o1 (_ BitVec 8)))
                                (=>
                                  (= (to_rep1 (select (to_array x) i)) o1)
                                  (forall ((d1 Bool))
                                    (=>
                                      (= d1 (and d (ite (= o1 o) true false)))
                                      (forall ((d2 Bool) (i1 Int))
                                        (=>
                                          (=
                                            (= d2 true)
                                            (forall ((j Int))
                                              (=>
                                                (and
                                                  (<= (first x) j)
                                                  (<= j i1))
                                                (= (to_rep1
                                                     (select (to_array x) j)) 
                                                (to_rep1
                                                  (select (to_array y) j))))))
                                          (=>
                                            (= (and (ite (dynamic_property1
                                                           (first x)
                                                           (last x)
                                                           i1)
                                                      true
                                                      false) (ite (and
                                                                    (<= 
                                                                    (first
                                                                    x) i1)
                                                                    (<= i1 
                                                                    (last
                                                                    x)))
                                                               true
                                                               false)) true)
                                            (=>
                                              (not (= i1 temp___3478))
                                              (forall ((i2 Int))
                                                (=>
                                                  (= i2 (+ i1 1))
                                                  (=>
                                                    (and
                                                      (<= (first y) i2)
                                                      (<= i2 (last y)))
                                                    (forall ((o2 (_ BitVec 8)))
                                                      (=>
                                                        (= (to_rep1
                                                             (select 
                                                             (to_array
                                                               y) i2)) o2)
                                                        (forall ((o3 (_ BitVec 8)))
                                                          (=>
                                                            (= (to_rep1
                                                                 (select 
                                                                 (to_array
                                                                   x) i2)) o3)
                                                            (forall ((d3 Bool))
                                                              (=>
                                                                (= d3 (and d2 
                                                                (ite (= o3 o2)
                                                                  true
                                                                  false)))
                                                                (forall 
                                                                  ((usf Int))
                                                                  (=>
                                                                    (= (and 
                                                                    (ite (<= 
                                                                    (first
                                                                    x) usf)
                                                                    true
                                                                    false) 
                                                                    (ite (<= usf i2)
                                                                    true
                                                                    false)) true)
                                                                    (=>
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    y) usf)
                                                                    (<= usf 
                                                                    (last
                                                                    y)))
                                                                    (forall 
                                                                    ((o4 (_ BitVec 8)))
                                                                    (=>
                                                                    (= 
                                                                    (to_rep1
                                                                    (select 
                                                                    (to_array
                                                                    y) usf)) o4)
                                                                    (and
                                                                    (<= 
                                                                    (first
                                                                    x) usf)
                                                                    (<= usf 
                                                                    (last
                                                                    x)))))))))))))))))))))))))))))))))))))))))

(check-sat)
(exit)
