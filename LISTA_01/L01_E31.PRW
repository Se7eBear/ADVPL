#include "totvs.ch"

User Function ex31_L01()
    Local aNumeros := {}
    Local nNum := 0
    Local nAux := 0
    Local nValue := 0
    Local nTemp := 0
    Local cMsg := ""

    For nNum := 1 To 10
        nValue := Val(FWInputBox("Coloque o numero " + cValToChar(nNum) + " de 10", ""))
        aAdd(aNumeros, nValue)
    Next nNum
    For nNum := 1 To Len(aNumeros) - 1
        For nAux := 1 To Len(aNumeros) - nNum
            If aNumeros[nAux] > aNumeros[nAux + 1]
                nTemp := aNumeros[nAux]
                aNumeros[nAux] := aNumeros[nAux + 1]
                aNumeros[nAux + 1] := nTemp
            EndIf
        Next nAux
    Next nNum
    For nNum := 1 To Len(aNumeros)
        cMsg += cValToChar(aNumeros[nNum]) + " "
    Next nNum
    MsgInfo("Numeros ordenados: " + cMsg, "Ordem crescente")
Return Nil
