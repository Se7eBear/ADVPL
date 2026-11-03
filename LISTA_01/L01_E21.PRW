#include "totvs.ch"

User Function ex21()
Local nValue := Val(FWInputBox("Coloque um inteiro", ""))
Local nNum := 0
Local cMsg := ""

If nValue > 0
    For nNum := 1 To nValue
        cMsg += cValToChar(nNum) + " " + CRLF
    Next nNum
    MsgInfo(cMsg)
EndIf
Return Nil
