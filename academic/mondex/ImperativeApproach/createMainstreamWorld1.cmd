-- Create Coins -----------------------------------------------------

!create coin1, coin2, coin3 : Coin

-- Create World -----------------------------------------------------

!create world : AbWorld

-- Abel has no Coin ---------------------------------------
!create abelP : AbPurse

-- The Bank has 2 Coins -----------------------------------

!create bankP : AbPurse

!insert (bankP, coin1) into Balance 
!insert (bankP, coin2) into Balance

-- Cain has 1 Coin ----------------------------------------
!create cainP : AbPurse

!insert (cainP, coin3) into Balance

-- Purses belong to World ---------------------------------

!insert (world, bankP) into AbstractAuthenticPurses 
!insert (world, cainP) into AbstractAuthenticPurses 
!insert (world, abelP) into AbstractAuthenticPurses
