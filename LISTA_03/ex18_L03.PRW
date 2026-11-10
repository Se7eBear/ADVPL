#include "totvs.ch"
User Function ex18_L03()
    Local cNome := Space(50)
    Local cMsg := ""
    Local nI := 0

    cNome := ALLTrim(FWInputBox("Digite seu nome", cNome))
    For nI := 1 To Len(cNome)
        cMsg += SubStr(cNome, 1, nI) + CRLF
    Next nI
    FWAlertInfo(cMsg, "Nome em escada")
Return Nil
