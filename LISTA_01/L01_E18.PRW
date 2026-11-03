#include "totvs.ch"

User Function ex18()
Local nNum := 1
Local cMsg := ""

While nNum <= 10
    cMsg += cValToChar(nNum) + " " + CRLF
    ConOut("[EX18]" + cValToChar(nNum))
    nNum++
EndDo
MsgInfo(cMsg)
Return Nil
