#include "totvs.ch"

User Function ex39_L01()
    Local aNomes := {}
    Local nSorteado := 0

    aAdd(aNomes, "Bruno Sete")
    aAdd(aNomes, "Rodrigo")
    aAdd(aNomes, "Wagner")
    aAdd(aNomes, "Eduardo")
    aAdd(aNomes, "Leonardo")
    nSorteado := Randomize(1, Len(aNomes) + 1)
    MsgInfo("O nome sorteado foi: " + aNomes[nSorteado], "Sorteio")
Return Nil
