/** This is to test composition. */

open multi

open mset[First] as mset1
open mrel[First, Second] as mrel1
open mset[Second] as mset2
open mrel[Second, Third] as mrel2
open mrel[First, Third] as mrel3

abstract sig First {}
one sig a, b, c extends First {}

abstract sig Second {}
one sig i, j extends Second {}

abstract sig Third {}
one sig x, y, z extends Third {}


// [[ a, a, a, b, c, c ]]
fact {
  mset1/moe[a, 2]
  mset1/moe[b, 1]
  mset1/moe[c, 2]
}

fact {
  mrel1/moe[a, i, 2]
  mrel1/moe[a, j, 0]
  mrel1/moe[b, i, 1]
  mrel1/moe[b, j, 2]
  mrel1/moe[c, i, 0]
  mrel1/moe[c, j, 2]
}

fact {
  mrel2/moe[i, x, 1]
  mrel2/moe[i, y, 0]
  mrel2/moe[i, z, 2]
  mrel2/moe[j, x, 1]
  mrel2/moe[j, y, 0]
  mrel2/moe[j, z, 0]
}


fact {
  mset2/composedFrom[mset1/get, mrel1/get]
  mrel3/composedFrom[mrel1/get, mrel2/get]
}

assert result {
  mset2/moe[i, 5]
  mset2/moe[j, 6]
}

assert result1 {
  mrel3/moe[a, x, 2]
  mrel3/moe[a, y, 0]
  mrel3/moe[a, z, 4]
  mrel3/moe[b, x, 3]
  mrel3/moe[b, y, 0]
  mrel3/moe[b, z, 2]
  mrel3/moe[c, x, 2]
  mrel3/moe[c, y, 0]
  mrel3/moe[c, z, 0]

}
check result for 16 but 6 int
check result1 for 16 but 6 int
