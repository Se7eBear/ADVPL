#include "totvs.ch"

User Function ex15_L01()
    Local cValue1 := FWInputBox("Escreva o primeiro valor", "")
    Local nValue1 := Val(cValue1)
    Local cValue2 := ""
    Local nValue2 := 0
    Local nTotal := 0

    While nValue2 == 0
        cValue2 := FWInputBox("Escreva o segundo valor", "")
        nValue2 := val(cValue2)
        If nValue2 == 0
            MsgAlert("O divisor nao pode ser zero. Tente novamente.", "Atencao")
        EndIf
    EndDo
    nTotal := nValue1 / nValue2
    MsgInfo("Resultado da divisao entre os dois valores: " + cValToChar(nTotal), "Divisao feita.")
Return Nil
