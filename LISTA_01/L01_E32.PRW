#include "totvs.ch"

User Function ex32_L01()
    Local aArray1 := {}
    Local aArray2 := {}
    Local nNum := 0
    Local nValue := 0
    Local nIguais := 0

    For nNum := 1 To 15
        nValue := Val(FWInputBox("aArray1 - coloque o numero " + cValToChar(nNum) + " de 15", ""))
        aAdd(aArray1, nValue)
    Next nNum
    For nNum := 1 To 15
        nValue := Val(FWInputBox("aArray2 - coloque o numero " + cValToChar(nNum) + " de 15", ""))
        aAdd(aArray2, nValue)
    Next nNum
    For nNum := 1 To 15
        If aArray1[nNum] == aArray2[nNum]
            nIguais++
        EndIf
    Next nNum
    MsgInfo("Numeros iguais nas mesmas posicoes: " + cValToChar(nIguais), "Comparacao")
Return Nil
