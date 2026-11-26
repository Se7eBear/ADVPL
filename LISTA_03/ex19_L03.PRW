#include "totvs.ch"

User Function ex19_L03()
    Local cFrase := ""
    Local cLetra := ""
    Local aVog   := {"A", "E", "I", "O", "U"}
    Local aCont  := {0, 0, 0, 0, 0}
    Local nEsp   := 0
    Local nI     := 0
    Local nPos   := 0
    Local cMsg   := ""

    cFrase := AllTrim(FWInputBox("Digite uma frase", ""))

    If Empty(cFrase)
        MsgAlert("Digite uma frase.", "Atencao")
        Return Nil
    EndIf

    cFrase := Upper(FwNoAccent(cFrase))

    For nI := 1 To Len(cFrase)
        cLetra := SubStr(cFrase, nI, 1)
        If cLetra == " "
            nEsp++
        Else
            nPos := At(cLetra, "AEIOU")
            If nPos > 0
                aCont[nPos]++
            EndIf
        EndIf
    Next nI

    cMsg := "Espacos em branco: " + cValToChar(nEsp) + CRLF
    For nI := 1 To Len(aVog)
        cMsg += aVog[nI] + ": " + cValToChar(aCont[nI])
        If nI < Len(aVog)
            cMsg += ", "
        EndIf
    Next nI

    MsgInfo(cMsg, "Resultado")
Return Nil
