/**
  This is to test the associativity of span composition.
  say we have three spans:
  mPQ: P -/-> Q
  mQR: Q -/-> R
  mRS: R -/-> S
  
  The following equality should holds.
  (mPQ ; mQR) ; mRS == mPQ ; (mQR ; mRS)
*/

open multi


open mrel[P, Q] as mPQ
open mrel[Q, R] as mQR
open mrel[R, S] as mRS

open mrel[P, R] as rPR
open mrel[Q, S] as rQS


open mrel[P, S] as r1
open mrel[aliasP, S] as r2 


abstract sig P {}
one sig p1, p2 extends P {}
sig aliasP in P {}
fact { aliasP = P }

abstract sig Q {}
one sig q1, q2 extends Q {}

abstract sig R {}
one sig r1, r2 extends R {}

abstract sig S {}
one sig s1, s2 extends S {}

fact {
  //#r1/Head > 3
  //#r2/Head > 3
}


fact {
  rPR/composedFrom[mPQ/get, mQR/get]
  r1/composedFrom[rPR/get, mRS/get]

  rQS/composedFrom[mQR/get, mRS/get]
  r2/composedFrom[mPQ/get, rQS/get]
}

assert assoc {
  all p: P | all s: S | #(p<:r1/get:>s) = #(p<:r2/get:>s)
}


fun disp_r1[] : univ->univ->univ {
  r1/get
}

fun disp_r2[] : univ->univ->univ {
  r2/get
}

check assoc for 4
run {} for 3
