User Function ex07()

Local cComprar := FWInputBox("Quantas macas quer comprar: ", "")
Local nPreco1 := 1.30
Local nPreco2 := 1
Local nComprar := Val(cComprar)
Local nTotal

If nComprar < 0
    Return
If nComprar >= 12
    nTotal := nComprar * nPreco2
    MsgInfo("Vc recebeu um desconto, vai pagar: " + cValToChar(nTotal) + " Reais")
Else
    nTotal := nComprar * nPreco1
    MsgInfo("Valor a cobrar: " + cValToChar(nTotal) + " Reais.")
endif
Return Nil