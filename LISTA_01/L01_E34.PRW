#include "totvs.ch"

User Function ex34_L01()
    Local nNum := 0
    Local nIdade := 0
    Local nPeso := 0
    Local nSomaIdade := 0
    Local nPesados := 0
    Local nMedia := 0

    For nNum := 1 To 7
        nIdade := Val(FWInputBox("Idade da pessoa " + cValToChar(nNum) + " de 7", ""))
        nPeso := Val(FWInputBox("Peso da pessoa " + cValToChar(nNum) + " de 7", ""))
        nSomaIdade += nIdade
        If nPeso > 90
            nPesados++
        EndIf
    Next nNum
    nMedia := nSomaIdade / 7
    MsgInfo("Pessoas com mais de 90 quilos: " + cValToChar(nPesados) + CRLF + ;
    "Media das idades: " + cValToChar(nMedia), "Resultado")
Return Nil
