#include "totvs.ch"

User Function ex19()
Local nNum := 10
Local cMsg := ""

While nNum >= 1
    cMsg += cValToChar(nNum) + " " + CRLF
    ConOut("[EX19]" + cValToChar(nNum))
    nNum--
EndDo

Return Nil
 