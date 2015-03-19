-- AbTransferOkay() -------------------------------------------------

!openter world abTransferOkay(bankP, abelP, Set{coin1})

!delete (bankP, coin1) from Balance

!insert (abelP, coin1) into Balance

!opexit
