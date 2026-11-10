#include "totvs.ch"

User Function ex33_L01()
    Local aNumeros := {}
    Local aVisto := {}
    Local nNum := 0
    Local nAux := 0
    Local nValue := 0
    Local cPosicoes := ""
    Local cMsg := ""

    For nNum := 1 To 20
        nValue := Val(FWInputBox("Coloque o numero " + cValToChar(nNum) + " de 20", ""))
        aAdd(aNumeros, nValue)
        aAdd(aVisto, .F.)
    Next nNum
    For nNum := 1 To Len(aNumeros)
        If !aVisto[nNum]
            cPosicoes := cValToChar(nNum)
            For nAux := nNum + 1 To Len(aNumeros)
                If aNumeros[nAux] == aNumeros[nNum]
                    cPosicoes += ", " + cValToChar(nAux)
                    aVisto[nAux] := .T.
                EndIf
            Next nAux
            If cPosicoes != cValToChar(nNum)
                cMsg += "Numero " + cValToChar(aNumeros[nNum]) + " repetido nas posicoes: " + cPosicoes + CRLF
            EndIf
        EndIf
    Next nNum
    If Empty(cMsg)
        MsgInfo("Nao existem numeros repetidos.", "Repetidos")
    Else
        MsgInfo(cMsg, "Repetidos")
    EndIf
Return Nil
