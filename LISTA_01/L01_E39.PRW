#include "totvs.ch"
User Function ex39()
Local aNomes := {}
Local nSorteado := 0

// TROQUE pelos nomes reais dos participantes da trilha Start II
aAdd(aNomes, "Participante 1")
aAdd(aNomes, "Participante 2")
aAdd(aNomes, "Participante 3")
aAdd(aNomes, "Participante 4")
aAdd(aNomes, "Participante 5")

nSorteado := Randomize(1, Len(aNomes) + 1)

MsgInfo("O nome sorteado foi: " + aNomes[nSorteado], "Sorteio")

Return Nil
