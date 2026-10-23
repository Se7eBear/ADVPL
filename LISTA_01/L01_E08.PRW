User Function ex08()

Local cHoras := FWInput("Quantas horas trabalhou esse mes: ", "")
Local cValorh := FWInput("Quanto vc recebe por hora: ", "")
Local nHoras := Val(cHoras)
Local nValorh := Val(cValorh)
Local nTotal
Local nExtra
Local nMes := 160
If nHoras <= nMes
    nTotal := nHoras * nValorh
    MsgInfo("Vc vai receber: " + cValToChar(nTotal) + " esse mes.", "Total a pagar")
ElseIf nHoras > nMes
    nExtra := (nHoras - nMes)
    nTotal := (nHoras * nValorh) + (nValorh * nExtra * 50 / 100)
    MsgInfo("Vc vai receber: " + cValToChar(nTotal) + " esse mes.", "Total a pagar")
EndIf
Return Nil