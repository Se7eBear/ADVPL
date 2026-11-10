#include "totvs.ch"

User Function ex13_L01()
    Local cName := FWInputBox("Qual nome do produto", "")
    Local cQuantidade := FWInputBox("Quantas unidades quer deste produto", "")
    Local cValue := FWInputBox("Preco unitario", "")
    Local nQuantidade := Val(cQuantidade)
    Local nValue := Val(cValue)
    Local nSubtotal := nQuantidade * nValue
    Local nPercen := 0
    Local nDesconto := 0
    Local nTotal := 0

    If nQuantidade <= 5
        nPercen := 2
    ElseIf nQuantidade > 5 .and. nQuantidade <= 10
        nPercen := 3
    Else
        nPercen := 5
    EndIf
    nDesconto := nSubtotal * nPercen / 100
    nTotal := nSubTotal - (nSubtotal * nPercen / 100)
    MsgInfo("Produto: " + AllTrim(cName) + CRLF + ;
    "Total: " + cValToChar(nSubtotal) + CRLF + ;
    "Desconto (" + cValToChar(nPercen) + "%): " + cValToChar(nDesconto) + CRLF + ;
    "Total a pagar: " + cValToChar(nTotal), "Valor a pagar.")
Return Nil
