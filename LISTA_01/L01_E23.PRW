#include "totvs.ch"

User Function ex23_L01()
    Local nNum := 0
    Local nValue := 0
    Local nNegativos := 0

    For nNum := 1 To 10
        nValue := Val(FWInputBox("Coloque o valor " + cValToChar(nNum) + " de 10", ""))
        If nValue < 0
            nNegativos++
        EndIf
    Next nNum
    MsgInfo("Quantidade de valores negativos: " + cValToChar(nNegativos), "Negativos")
Return Nil
