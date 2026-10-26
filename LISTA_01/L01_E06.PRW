User Function ex06()

Local cFahren := FWInputBox("Coloque um valor em Fahrenheit: ", "")
Local nFahren := Val(cFahren)
Local nCelsius

nCelsius := (nFahren - 32) / 1.8
MsgInfo("Valor foi convertido para Celsius: " + cValToChar(nCelsius), "Conversor")
Return Nil
