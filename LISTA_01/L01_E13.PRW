User Function ex13()

Local cName := FWInputBox("Qual nome do produto", "")
Local cQuantidade := FWInputBox("Quantas unidades quer deste produto", "")
Local cValue := FWInputBox("Preco unitario", "")
Local nQuantidade := Val(cQuantidade)
Local nValue := Val(cValue)
Local nTotal

If nQuantidade <= 5
    nTotal := (nQuantidade * nValue) - 2 / 100
ElseIf nQuantidade > 5 .AND. nQuantidade <= 10
    nTotal := (nQuantidade * nValue) - 10 / 100
ElseIf nQuantidade > 10
    nTotal := (nQuantidade * nValue) - 5 / 100
EndIf

MsgInfo("Total a pagar no item " + cName + ": " + cValToChar(nTotal), "Valor a pagar.")

Return Nil



User Function ex13()

    Local cName       := FWInputBox("Qual nome do produto", "")
    Local cQuantidade := FWInputBox("Quantas unidades quer deste produto", "")
    Local cValue      := FWInputBox("Preco unitario", "")
    Local nQuantidade := Val(cQuantidade)
    Local nValue      := Val(cValue)
    Local nSubtotal   := nQuantidade * nValue
    Local nPercDesc   := 0
    Local nTotal      := 0

    If nQuantidade <= 5
        nPercDesc := 2
    ElseIf nQuantidade <= 10
        nPercDesc := 5
    Else
        nPercDesc := 10
    EndIf

    nTotal := nSubtotal - (nSubtotal * nPercDesc / 100)

    MsgInfo("Total a pagar no item " + AllTrim(cName) + ": R$ " + ;
            Transform(nTotal, "@E 999,999.99") + ;
            " (desconto de " + cValToChar(nPercDesc) + "%)", ;
            "Valor a pagar")

Return Nil