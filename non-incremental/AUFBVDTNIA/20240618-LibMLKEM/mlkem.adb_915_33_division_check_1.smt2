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

;; nth
(declare-fun nth1 ((_ BitVec 16)
  Int) Bool)

;; lsr
(declare-fun lsr1 ((_ BitVec 16)
  Int) (_ BitVec 16))

;; asr
(declare-fun asr1 ((_ BitVec 16)
  Int) (_ BitVec 16))

;; lsl
(declare-fun lsl1 ((_ BitVec 16)
  Int) (_ BitVec 16))

(declare-const two_power_size_minus_one1 Int)

;; two_power_size_minus_one_val
(assert (= two_power_size_minus_one1 (pow2 (- 16 1))))

;; to_int
(define-fun to_int2 ((x (_ BitVec 16))) Int
  (ite (bvsge x (_ bv0 16)) (bv2nat x) (- (- 65536 (bv2nat x)))))

;; lsr_bv_is_lsr
(assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
    (= (bvlshr x n) (lsr1 x (bv2nat n)))))

;; asr_bv_is_asr
(assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
    (= (bvashr x n) (asr1 x (bv2nat n)))))

;; lsl_bv_is_lsl
(assert
  (forall ((x (_ BitVec 16)) (n (_ BitVec 16)))
    (= (bvshl x n) (lsl1 x (bv2nat n)))))

;; nth_bv
(declare-fun nth_bv1 ((_ BitVec 16)
  (_ BitVec 16)) Bool)

;; nth_bv_def
(assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
    (= (= (nth_bv1 x i) true) (not (= (bvand (bvlshr x i) #x0001) #x0000)))))

;; Nth_bv_is_nth
(assert
  (forall ((x (_ BitVec 16)) (i (_ BitVec 16)))
    (= (nth1 x (bv2nat i)) (nth_bv1 x i))))

;; Nth_bv_is_nth2
(assert
  (forall ((x (_ BitVec 16)) (i Int))
    (=>
      (and (<= 0 i) (< i 65536))
      (= (nth_bv1 x ((_ int2bv 16) i)) (nth1 x i)))))

(declare-datatypes ((t__ref 0))
  (((t__refqtmk (t__content (_ BitVec 16))))))

(declare-sort udu 0)

;; in_range
(define-fun in_range ((x (_ BitVec 16))) Bool
  (and (bvule #x0000 x) (bvule x #x03FF)))

(declare-const dummy udu)

;; to_rep
(declare-fun to_rep (udu) (_ BitVec 16))

;; of_rep
(declare-fun of_rep ((_ BitVec 16)) udu)

;; inversion_axiom
(assert
  (forall ((x udu)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
(assert (forall ((x udu)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
(assert
  (forall ((x (_ BitVec 16)))
    (! (let ((y (bvurem x #x0400)))
         (=> (in_range y) (= (to_rep (of_rep x)) y))) :pattern ((to_rep
                                                                  (of_rep x))) )))

(declare-const f (Array Int udu))

(declare-sort byte 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-const dummy1 byte)

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

(declare-datatypes ((map__ref 0))
  (((map__refqtmk (map__content (Array Int byte))))))

(declare-sort u8_bit 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 8))

;; in_range
(define-fun in_range1 ((x (_ BitVec 8))) Bool
  (and (bvule #x00 x) (bvule x #x01)))

(declare-const dummy2 u8_bit)

;; to_rep
(declare-fun to_rep2 (u8_bit) (_ BitVec 8))

;; of_rep
(declare-fun of_rep2 ((_ BitVec 8)) u8_bit)

;; inversion_axiom
(assert
  (forall ((x u8_bit))
    (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
(assert
  (forall ((x u8_bit)) (! (in_range1 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
(assert
  (forall ((x (_ BitVec 8)))
    (! (=> (in_range1 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                                  (of_rep2 x))) )))

(declare-datatypes ((map__ref1 0))
  (((map__refqtmk1 (map__content1 (Array Int u8_bit))))))

;; mlkem__byteencodedu__b__aggregate_def
(declare-fun mlkem__byteencodedu__b__aggregate_def ((_ BitVec 8)) (Array Int u8_bit))

;; def_axiom
(assert
  (forall ((temp___2441 (_ BitVec 8)))
    (forall ((temp___2442 Int))
      (=>
        (in_range1 temp___2441)
        (= (to_rep2
             (select (mlkem__byteencodedu__b__aggregate_def temp___2441) temp___2442)) temp___2441)))))

;; Goal def'vc
;; File "mlkem.adb", line 898, characters 0-0
(assert
  (not
  (forall ((a (_ BitVec 16)) (this_bit (_ BitVec 16)))
    (forall ((b (Array Int u8_bit)))
      (=>
        (= b (mlkem__byteencodedu__b__aggregate_def #x00))
        (=>
          (in_range a)
          (=>
            (in_range this_bit)
            (forall ((i Int))
              (=>
                (= i 0)
                (=>
                  (= (and (ite (<= 0 i) true false) (ite (<= i 255)
                                                      true
                                                      false)) true)
                  (forall ((a1 (_ BitVec 16)) (this_bit1 (_ BitVec 16)) (i1 Int))
                    (=>
                      (= (and (ite (and (in_range a1) (in_range this_bit1))
                                true
                                false) (ite (and (<= 0 i1) (<= i1 255))
                                         true
                                         false)) true)
                      (forall ((o (_ BitVec 16)))
                        (=>
                          (= (to_rep (select f i1)) o)
                          (forall ((a2 (_ BitVec 16)))
                            (=>
                              (= a2 o)
                              (forall ((j Int))
                                (=>
                                  (= j 0)
                                  (=>
                                    (= (and (ite (<= 0 j) true false) 
                                    (ite (<= j 9)
                                      true
                                      false)) true)
                                    (forall ((b1 (Array Int u8_bit)) (a3 (_ BitVec 16)) (this_bit2 (_ BitVec 16)) (j1 Int))
                                      (=>
                                        (= (and (ite (and
                                                       (in_range a3)
                                                       (in_range this_bit2))
                                                  true
                                                  false) (ite (and
                                                                (<= 0 j1)
                                                                (<= j1 9))
                                                           true
                                                           false)) true)
                                        (forall ((this_bit3 (_ BitVec 16)))
                                          (=>
                                            (= this_bit3 (bvurem a3 #x0002))
                                            (forall ((o1 u8_bit))
                                              (=>
                                                (= (to_rep2 o1) ((_ extract 7 0) this_bit3))
                                                (forall ((b2 (Array Int u8_bit)))
                                                  (=>
                                                    (= b2 (store b1 (+ (* i1 10) j1) o1))
                                                    (not (= #x0002 #x0000)))))))))))))))))))))))))))))

(check-sat)
(exit)
