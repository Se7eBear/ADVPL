#include "totvs.ch"

User Function ex14_L03()
    Local aNums := {}
    Local cStr := ""
    Local nI := 0

    For nI := 1 To 5
        aAdd(aNums, Val(FWInputBox("Digite o numero " + cValToChar(nI), Space(10))))
    Next nI
    For nI := 1 To Len(aNums)
        cStr += cValToChar(aNums[nI]) + If(nI < Len(aNums), ", ", "")
    Next nI
    FWAlertInfo(cStr, "Numeros digitados")
Return Nil
 