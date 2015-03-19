-- AbTransferLost() -------------------------------------------------

!openter world abTransferLost(cainP, abelP, Set{coin3})

!delete (cainP, coin3) from Balance

!insert (cainP, coin3) into Lost

!opexit
