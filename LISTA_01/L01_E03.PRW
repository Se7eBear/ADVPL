User Function ex03()

Local cAnos := FWInputBox("Quantos Anos voce tem: ", "")
Local cMeses := FWInputBox("E quantos meses voce tem: ", "")
Local cDias := FWInputBox("E quantos Dias voce tem: ", "")
Local nAnos := Val(cAnos)
Local nMeses := Val(cMeses)
Local nDias := Val(cDias)
Local nTotal

nTotal := (nAnos * 365) + (nMeses * 30) + nDias

MsgInfo("Voce tem: " + cValToChar(nTotal) + " de dias de vida", "total de dias")
Return Nil
