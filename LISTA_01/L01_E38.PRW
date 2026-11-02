#include "totvs.ch"
User Function ex38()
Local nNum := 0
Local nIdade := 0
Local nMaiores := 0

For nNum := 1 To 10
    nIdade := Val(FWInputBox("Idade da pessoa " + cValToChar(nNum) + " de 10", ""))
    If nIdade >= 18
        nMaiores++
    EndIf
Next nNum

MsgInfo("Pessoas com 18 anos ou mais: " + cValToChar(nMaiores), "Maiores de idade")

Return Nil
