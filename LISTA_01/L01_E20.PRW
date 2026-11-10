#include "totvs.ch"

User Function ex20_L01()
    Local nNum := 0
    Local cMsg := ""

    For nNum := 101 To 110
        cMsg += cValToChar(nNum) + " " + CRLF
    Next nNum
    MsgInfo(cMsg)
Return Nil
