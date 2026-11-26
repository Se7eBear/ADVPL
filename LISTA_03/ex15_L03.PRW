#include "totvs.ch"

User Function ex15_L03()
    Local aMeses := {"Janeiro", "Fevereiro", "Marco", "Abril", "Maio", "Junho", ;
                     "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"}
    Local aTemp  := {}
    Local nSoma  := 0
    Local nMedia := 0
    Local nI     := 0
    Local cMsg   := ""
    Local cAcima := ""

    For nI := 1 To Len(aMeses)
        aAdd(aTemp, Val(FWInputBox("Temperatura media de " + aMeses[nI], "")))
        nSoma += aTemp[nI]
    Next nI

    nMedia := nSoma / Len(aTemp)

    For nI := 1 To Len(aTemp)
        If aTemp[nI] > nMedia
            cAcima += aMeses[nI] + ": " + cValToChar(aTemp[nI]) + " Graus" + CRLF
        EndIf
    Next nI

    cMsg := "Media Anual: " + cValToChar(Round(nMedia, 1)) + " Graus" + CRLF
    If Empty(cAcima)
        cMsg += "Nenhum mes acima da media."
    Else
        cMsg += cAcima
    EndIf

    MsgInfo(cMsg, "Temperaturas")
Return Nil
