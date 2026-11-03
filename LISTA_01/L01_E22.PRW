#include "totvs.ch"

User Function ex22()
Local nValue := 0
Local nNum := 0
Local cMsg := ""

While nValue < 1 .Or. nValue > 10 .Or. nValue != Int(nValue)
    nValue := Val(FWInputBox("Coloque um inteiro de 1 a 10", ""))
EndDo

For nNum := 1 To 10
    cMsg += cValToChar(nValue) + " x " + cValToChar(nNum) + " = " + cValToChar(nValue * nNum) + CRLF
Next nNum
MsgInfo(cMsg, "Tabuada do " + cValToChar(nValue))

Return Nil
