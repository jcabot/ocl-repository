-- Create MetaOperations ------------------------------------------------------

!create metaOperations : MetaOperations

-- createInitialWorld() -------------------------------------------------------

!openter metaOperations createInitialWorld(3, Set{'AbelsPurse', 'BanksPurse', 'CainsPurse'})

-- Create 3 Coins ---------------------------------------------------

!create coin1, coin2, coin3 : Coin

-- Create initial World ---------------------------------------------

!create initialWorld : AbInitWorld

-- Abel has no Coin -----------------------------------------
!create abelPInit : AbPurse

!set abelPInit.name := 'AbelsPurse'

-- The Bank has 2 Coins ---------------------------------------

!create bankPInit : AbPurse

!set bankPInit.name := 'BanksPurse'

!insert (bankPInit, coin1) into Balance
!insert (bankPInit, coin2) into Balance

-- Cain has 1 Coin -----------------------------------------
!create cainPInit : AbPurse

!set cainPInit.name := 'CainsPurse'

!insert (cainPInit, coin3) into Balance

-- Purses belong to initital World -------------------------

!insert (initialWorld, abelPInit) into AbstractAuthenticPurses
!insert (initialWorld, bankPInit) into AbstractAuthenticPurses
!insert (initialWorld, cainPInit) into AbstractAuthenticPurses

-- Create Validation instance ---------------------------------------

!create validation : WorldsValidation

!insert (validation, initialWorld) into Init

!create operations : AbOperations

!insert (validation, operations) into ValidOperations

-- Create Constraints -----------------------------------------------

!create commomConstraints : CommonConstraints
!create ignoreConstraints : IgnoreConstraints
!create okayConstraints : OkayConstraints
!create lostConstraints : LostConstraints

!insert (operations, commomConstraints) into OperationsCommonConstraints
!insert (operations, ignoreConstraints) into OperationsIgnoreConstraints
!insert (operations, okayConstraints) into OperationsOkayConstraints
!insert (operations, lostConstraints) into OperationsLostConstraints

!opexit
