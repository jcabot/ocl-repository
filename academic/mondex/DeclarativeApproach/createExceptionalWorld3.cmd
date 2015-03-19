-- createOkayWorld( ) ---------------------------------------------------------

!openter metaOperations createOkayWorld('BanksPurse', 'AbelsPurse', Set{coin1})

-- TransferDetails -> AbTransferOkay() ------------------------------

!create secondWorldDetails : TransferDetails

!set secondWorldDetails.fromPurse := 'BanksPurse'
!set secondWorldDetails.toPurse := 'AbelsPurse'
!set secondWorldDetails.value := Set{coin1}

!insert (secondWorld, secondWorldDetails) into WorldTransfer

-- Create third World -----------------------------------------------

!create thirdWorld : AbWorld

-- Abel has 1 Coin ---------------------------------------------------
!create abelPThird : AbPurse

!set abelPThird.name := 'AbelsPurse'

!insert (abelPThird, coin1) into Balance

-- The Bank has 2 Coins --------------------------------------------------

!create bankPThird : AbPurse

!set bankPThird.name := 'BanksPurse'

!insert (bankPThird, coin2) into Balance
!insert (bankPThird, coin3) into Balance

-- Cain has 1 Coin --------------------------------------------------
!create cainPThird : AbPurse

!set cainPThird.name := 'CainsPurse'

-- Purses belong to initital World ----------------------------------

!insert (thirdWorld, abelPThird) into AbstractAuthenticPurses
!insert (thirdWorld, bankPThird) into AbstractAuthenticPurses
!insert (thirdWorld, cainPThird) into AbstractAuthenticPurses

-- Evolving World ---------------------------------------------------

!insert (secondWorld, thirdWorld) into Order

!opexit
