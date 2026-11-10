#include "totvs.ch"

User Function ex16_L03()
    Local cNome := Space(50)
    Local cInvertido := ""
    Local nI := 0

    cNome := FWInputBox("Digite seu nome", cNome)
    cNome := Upper(ALLTrim(cnome))

    for nI := Len(cNome) To 1 Step -1
        cInvertido += SubStr(cNome, nI, 1)
    Next nI

    FWAlertInfo(cInvertido, "nome invertido")
Return Nil
