User Function ex13()
Local nMultiplo := Val(FWInputBox("Informe o numero para buscar os multiplos", ""))
Local nLimite := Val(FWInputBox("Informe o limite", ""))
Local nNum := 0
Local cMsg := ""

If nMultiplo <= 0 .Or. nLimite < 1
    MsgAlert("Informe valores positivos.", "Atencao")
    Return Nil
EndIf

For nNum := nMultiplo To nLimite Step nMultiplo
    cMsg += cValToChar(nNum) + " "
Next nNum
MsgInfo(cMsg, "Multiplos")
Return Nil
