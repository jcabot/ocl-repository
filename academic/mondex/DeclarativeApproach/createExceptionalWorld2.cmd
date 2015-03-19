-- createIgnoreWorld( ) -------------------------------------------------------

!openter metaOperations createIgnoreWorld()

-- Undefined TransferDetails -> AbIgnore() --------------------------

!create initialWorldDetails : TransferDetails

!insert (initialWorld, initialWorldDetails) into WorldTransfer

-- Create second World ----------------------------------------------

!create secondWorld : AbWorld

-- Abel has no Coin --------------------------------------------------
!create abelPSecond : AbPurse

!set abelPSecond.name := 'AbelsPurse'

-- Bank has 2 Coins -------------------------------------------------

!create bankPSecond : AbPurse

!set bankPSecond.name := 'BanksPurse'

!insert (bankPSecond, coin1) into Balance
!insert (bankPSecond, coin2) into Balance

-- Cain has 1 Coin --------------------------------------------------
!create cainPSecond : AbPurse

!set cainPSecond.name := 'CainsPurse'

!insert (cainPSecond, coin3) into Balance

-- Purses belong to second World ------------------------------------

!insert (secondWorld, abelPSecond) into AbstractAuthenticPurses
!insert (secondWorld, bankPSecond) into AbstractAuthenticPurses
!insert (secondWorld, cainPSecond) into AbstractAuthenticPurses

-- Evolving World ---------------------------------------------------

!insert (initialWorld, secondWorld) into Order

-- Set of Purses changes ----------------------------------
!create newPurse : AbPurse
!insert (secondWorld, newPurse) into AbstractAuthenticPurses

!opexit
