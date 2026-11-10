#include "totvs.ch"

User Function ex12_L02()
    Local nNum := 0
    Local cMsg := ""

    For nNum := 3 To 100 Step 3
        cMsg += cValToChar(nNum) + " "
    Next nNum
    MsgInfo(cMsg, "Multiplos de 3")
Return Nil
