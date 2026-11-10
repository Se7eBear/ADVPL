#include "totvs.ch"

User Function ex27_L01()
    Local nPrimeiro := 0
    Local nNum := 0
    Local cMsg := ""

    For nPrimeiro := 1 To 10
        For nNum := 1 To 10
            cMsg += cValToChar(nNum) + " "
        Next nNum
        cMsg += "" + CRLF
    Next nPrimeiro
    MsgInfo(cMsg, "Sequencias")
Return Nil
