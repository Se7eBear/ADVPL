#include "totvs.ch"
User Function ex22()
Local nValue := Val(FWInputBox("Coloque um inteiro", ""))
Local nNum := 0
Local nI := 0
Local cMsg := ""

If nValue >= 1 .And. nValue <= 10
    For nNum := 1 To 10
        cMsg += cValToChar(nValue * (nI + 1)) + " " + CRLF
        nI++
    Next nNum
    MsgInfo(cMsg)
EndIf
Return Nil
