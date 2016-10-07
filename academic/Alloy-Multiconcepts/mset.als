module mset [g]
open multi as m

abstract sig Idx {
  f : one g
}

// fact { some Idx }

// binary relation representation
fun get[] : Idx -> one g { f }

/** multiple ways to `initialize` a mset
  * 1. by stating the multiplicity of each element
  * 2. is isomorphic to another mset
  * 3. is lifted from an ordinary set.
  */

// multiplicity Of element
pred moe[e: g, n: Int] {
  #(f:>e) = n
}
// is isomorphic to another family
pred isomorphicTo[ family: univ -> one univ ] {
  let I = family.idx |
  some r: I->Idx | bijection[r, I, Idx] && r.f = family
}
// lift from an ordinary set
pred liftedFrom[ s: univ ] {
  Idx.f = s && #Idx = #s
}

// this family is a multi-join result from fam and span]
pred composedFrom[fami: univ -> one univ,
                 span: univ -> univ -> g ] {
  let I = fami.idx, sLeg = span.sleg, tLeg = span.tleg, Hd = span.head
  | some p1: Idx->I, p2: Idx-> Hd
  | pullback[I, Hd, fami, sLeg, Idx, p1, p2]
 && f = p2.tLeg
}
