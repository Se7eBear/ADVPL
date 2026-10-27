User Function ex13()

Local cName := FWInputBox("Qual nome do produto", "")
Local cQuantidade := FWInputBox("Quantas unidades quer deste produto", "")
Local cValue := FWInputBox("Preco unitario", "")
Local nQuantidade := Val(cQuantidade)
Local nValue := Val(cValue)
Local nSubtotal := nQuantidade * nValue
Local nPercen := 0
Local nTotal := 0

If nQuantidade <= 5
    nPercen := 2
ElseIf nQuantidade > 10
    nPercen := 5
Else
    nPercen := 10
EndIf

nTotal := nSubTotal - (nSubtotal * nPercen / 100)

MsgInfo("Total a pagar no item " + AllTrim(cName) + ;
": " + cValToChar(nTotal) + ;
" (desconto de: " + cValToChar(nPercen) + "%)", "Valor a pagar.")

Return Nil
