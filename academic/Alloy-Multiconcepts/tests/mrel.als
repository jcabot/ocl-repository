module mrel [s, t]
open multi as m

sig Head { sLeg : one s, tLeg : one t }

// fact { some Head }

// ternary relation representation
fun get[] : s -> Head -> t {
  { a: s, h: Head, b: t |  h.sLeg = a and h.tLeg = b}
}

pred moe[source: s, target: t, n: Int] {
  #(get[].mdom[source].mran[target]) = n
}

// lift from an ordinary binary relation
pred liftedFrom[r: s -> t] {
  (~sLeg).tLeg = r && #Head = #r
}

pred composedFrom[ span1 : s -> univ -> univ,
                  span2 : univ -> univ -> t ] {
  let sLeg1=span1.sleg, tLeg1=span1.tleg, Hd1 = span1.head,
      sLeg2=span2.sleg, tLeg2=span2.tleg, Hd2 = span2.head
  | some p1: Head -> Hd1, p2: Head -> Hd2
  | pullback[Hd1, Hd2, tLeg1, sLeg2, Head, p1, p2]
 && sLeg = p1.sLeg1 && tLeg = p2.tLeg2
}


// another ternary relation representation, head goes at the first column
// one potential benefit is that the type signature for ternary relations
// cound have quantifier `one` at the second and third column
// every ternary relation matching such a constaint can be regarded as a span.
// The type signature contains more information than the one above.
fun get'[] : Head -> one s -> one t {
  { h:Head, a: s, b: t | h.sLeg = a and h.tLeg = b }
}
