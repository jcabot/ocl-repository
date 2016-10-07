open multi                                  // a utility module providing the function drop

open mrel[Bundle, Item] as Contains          // declare a multirelation from Bundle to Item
open mrel[Item, Category] as BelongsTo     // declare a multirelation from Item to Category
open mrel[Bundle, Category] as Result            // to be the result of Contains;;BelongsTo

abstract sig Bundle {}                                                      // Bundle class
one sig B1, B2 extends Bundle {}                                        // Bundle instances
abstract sig Item {                                                           // Item class
  belongsTo: set Category             // declare an ordinary relation from Item to Category
}
one sig Bread, Butter, Milk extends Item {}                               // Item instances
fact {
  Bread.belongsTo = Bakery                                     // Set up belongsTo relation
  Butter.belongsTo = Dairy
  Milk.belongsTo = Dairy
}
abstract sig Category {}                                                  // Category class
one sig Dairy, Bakery extends Category {}                             // Category instances

fact {
  BelongsTo/liftedFrom[belongsTo]          // lift the ordinary relation to a multirelation
  Result/composedFrom[Contains/get, BelongsTo/get]                 // perform the multijoin
  // rules
  all b : Bundle | #(b<:Result/get:>Dairy) >= 2              // at least two dairy products
  all b : Bundle | #(b.(drop[Result/get])) >= 2                  // at least two categories
}

assert AllHaveBread {               // based on our rules, all bundles should contain bread
  all b: Bundle | some drop[b<:Contains/get].Bread
}

fun disp1[] : univ->univ->univ {
  Contains/get
}

fun disp2[] : univ->univ->univ {
  BelongsTo/get
}


run {} for 6 Contains/Head, 3 BelongsTo/Head, 20 Result/Head
check AllHaveBread for 6 Contains/Head, 3 BelongsTo/Head, 20 Result/Head
