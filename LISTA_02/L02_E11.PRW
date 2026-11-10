User Function ex11_L02()
Local nNum := 0
Local cMsgFor := ""
Local cMsgWhile := ""

For nNum := 1 To 50
    cMsgFor += cValToChar(Random(10, 99)) + " "
Next nNum
MsgInfo(cMsgFor, "50 valores aleatorios - For")

nNum := 1
While nNum <= 50
    cMsgWhile += cValToChar(Random(10, 99)) + " "
    nNum++
EndDo
MsgInfo(cMsgWhile, "50 valores aleatorios - While")
Return Nil
