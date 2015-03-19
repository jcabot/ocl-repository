-- AbTransferOkay() -------------------------------------------------

!openter world abTransferOkay(bankP, abelP, Set{coin1})

!delete (bankP, coin1) from Balance

!insert (abelP, coin1) into Balance

-- Transfer coin2 from cainP to bankP ---------------------

!delete (cainP, coin3) from Balance

!insert (bankP, coin3) into Balance

!opexit
