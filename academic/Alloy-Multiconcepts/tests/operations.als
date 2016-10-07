/* This is to test union, intersection, merge */

open multi

open mset[First] as mset1
open mset[FirstAlias] as mset2

abstract sig First {}
one sig a, b, c extends First {}

sig FirstAlias in First {}
fact { FirstAlias = First }


fact {
  mset1/moe[a, 2]
  mset1/moe[b, 3]
  mset1/moe[c, 1]
}

fact {
  mset2/moe[a, 1]
  mset2/moe[b, 2]
  mset2/moe[c, 3]
}

assert union {
  let res = union[mset1/get, mset2/get]
   | #res:>a = 2 && #res:>b = 3 && #res:>c = 3
}

assert intersection {
  let res = intersection[mset1/get, mset2/get]
   | #res:>a = 1 && #res:>b = 2 && #res:>c = 1
}

assert merge {
  let res = merge[mset1/get, mset2/get]
   | #res:>a = 3 && #res:>b = 5 && #res:>c = 4
}


check union for 10
check intersection for 10
check merge for 10
run {} for 10
