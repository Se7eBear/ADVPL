User Function ex05()

Local cCarro := FWInputBox("Valor do Carro", "")
Local nCarro := Val(cCarro)
Local nPercen1
Local nPercen2
Local nTotal

nPercen1 := nCarro * 28 / 100
nPercen2 := nCarro * 45 / 100
nTotal :=  nCarro + nPercen1 + nPercen2

MsgInfo("Valor total a pagar no carro: " + cValToChar(nTotal), "Valor aplicado")
Return Nil
