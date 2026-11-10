#include "totvs.ch"
User Function ex17_L03()
    Local cNome := Space(50)
    Local cMsg := ""
    Local nI := 0

    cNome := ALLTrim(FWInputBox("Digite seu nome", cNome))
    For nI := 1 To Len(cNome)
        cMsg += SubStr(cNome, nI, 1) + CRLF
    Next nI
    FWAlertInfo(cMsg, "Nome na vertical")
Return Nil
