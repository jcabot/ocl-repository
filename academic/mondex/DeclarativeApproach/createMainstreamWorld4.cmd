-- createLostWorld( ) ---------------------------------------------------------

!openter metaOperations createLostWorld('CainsPurse', 'AbelsPurse', Set{coin3})

-- TransferDetails -> AbTransferLost() ------------------------------

!create thirdWorldDetails : TransferDetails

!set thirdWorldDetails.fromPurse := 'CainsPurse'
!set thirdWorldDetails.toPurse := 'AbelsPurse'
!set thirdWorldDetails.value := Set{coin3}

!insert (thirdWorld, thirdWorldDetails) into WorldTransfer

-- Create fourth World ----------------------------------------------

!create fourthWorld : AbEndWorld

-- Abel has 1 Coin ---------------------------------------------------
!create abelPFourth : AbPurse

!set abelPFourth.name := 'AbelsPurse'

!insert (abelPFourth, coin1) into Balance

-- Bank has 1 Coin --------------------------------------------------

!create bankPFourth : AbPurse

!set bankPFourth.name := 'BanksPurse'

!insert (bankPFourth, coin2) into Balance

-- Cain has no Coin but 1 Lost --------------------------------------
!create cainPFourth : AbPurse

!set cainPFourth.name := 'CainsPurse'

!insert (cainPFourth, coin3) into Lost

-- Purses belong to initital World ----------------------------------

!insert (fourthWorld, abelPFourth) into AbstractAuthenticPurses
!insert (fourthWorld, bankPFourth) into AbstractAuthenticPurses
!insert (fourthWorld, cainPFourth) into AbstractAuthenticPurses

-- Evolving World ---------------------------------------------------

!insert (thirdWorld, fourthWorld) into Order

-- EndState Transfer Details ----------------------------------------

!create fourthWorldDetails : TransferDetails

!insert (fourthWorld, fourthWorldDetails) into WorldTransfer 

!opexit
