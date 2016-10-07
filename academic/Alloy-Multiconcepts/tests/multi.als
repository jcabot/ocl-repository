module multi

open util/relation as rel
open util/ternary  as ter


/** utility functions */

// make a ternary identity relation
fun id3[e: univ] : univ->univ->univ {
  {a, b, c: e | a = b and b = c}
}
// return the index set of family f
fun idx[f: univ -> one univ] : univ { rel/dom[f] }
// return the ground set of family f
fun grd[f: univ -> one univ] : univ { rel/ran[f] }
// return the head of the span
fun head[span: univ -> univ -> univ] : univ
  { ter/mid[span] }
// return the source leg of the span
fun sleg[span: univ -> univ -> univ] : univ -> univ
  { ~(ter/select12[span]) }
// return the target leg of the span
fun tleg[span: univ -> univ -> univ] : univ -> univ
  { ter/select23[span] }

/** inverse */
// flip the 1st and 3rd column
fun inverse[span: univ->univ->univ] : span {
  ter/flip13[span]
}

/** domain and range restriction */
// return the ternary relation starting with e
fun mdom[span: univ->univ->univ, e: univ] : span {
  e <: span
}
// return the ternary relation ending with e
fun mran[span: univ->univ->univ, e: univ] : span {
  span :> e
}

/** union, intersection and disjoint union */
// max-union, element with larger multiplicity wins
fun union[f1, f2: univ->one univ] : univ->one univ {
  let I = idx[f1]+idx[f2], G = grd[f1]+grd[f2] |
    { i: I, g: G | (i in idx[f1] && g = i.f1 && #f1:>g >= #f2:>g) or
                   (i in idx[f2] && g = i.f2 && #f1:>g <  #f2:>g ) }
}
// min-intersection, element with smaller multiplicity wins
fun intersection[f1, f2: univ->one univ] : univ->one univ {
  let I = idx[f1]+idx[f2], G = grd[f1]+grd[f2] |
    { i: I, g: G | (i in idx[f1] && g = i.f1 && #f1:>g <= #f2:>g) or
                   (i in idx[f2] && g = i.f2 && #f1:>g >  #f2:>g ) }
}
// disjoint union, simply a union of two families
fun merge[f1, f2: univ->one univ] : univ->one univ {
  f1 + f2
}

/** drop indices and return ordinary set or relation */
fun drop[f: univ -> one univ] : univ.f {
  rel/ran[f]
}

fun drop[span: univ -> univ -> univ] : ((span.univ).univ) -> (univ.(univ.span)) {
  ter/select13[span]
}

/** pullback predicate */
pred pullback[ X: univ, Y: univ, f: X -> one univ, g: Y -> one univ,
               P: univ, p1: P -> X, p2: P -> Y ] {
  (no X or no Y) implies { no P } else {
  all x: X | all y: Y | x.f = y.g implies
    { one p: P | p.p1 = x && p.p2 = y }
  #P = #(f.~g)
  }
}