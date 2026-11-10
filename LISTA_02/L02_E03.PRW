User Function ex03_L02()
Local nTempo := Val(FWInputBox("Tempo gasto na viagem (horas)", ""))
Local nVeloc := Val(FWInputBox("Velocidade media (km/h)", ""))
Local nConsumo := Val(FWInputBox("Consumo do veiculo (km por litro)", ""))
Local nDist := nTempo * nVeloc
Local nLitros := 0
Local cMsg := ""

If nConsumo <= 0
    MsgAlert("O consumo deve ser maior que zero.", "Atencao")
    Return Nil
EndIf

nLitros := nDist / nConsumo
cMsg := "Velocidade media: " + cValToChar(nVeloc) + " km/h" + CRLF
cMsg += "Tempo gasto: " + cValToChar(nTempo) + " horas" + CRLF
cMsg += "Distancia percorrida: " + cValToChar(nDist) + " km" + CRLF
cMsg += "Combustivel utilizado: " + cValToChar(nLitros) + " litros"
MsgInfo(cMsg, "Consumo da viagem")
Return Nil
