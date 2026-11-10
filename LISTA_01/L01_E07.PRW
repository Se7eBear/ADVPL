#include "totvs.ch"

User Function ex07_L01()
    Local cComprar := FWInputBox("Quantas macas quer comprar: ", "")
    Local nPreco1 := 1.30
    Local nPreco2 := 1
    Local nComprar := Val(cComprar)
    Local nTotal

    If nComprar < 0
        Return
    EndIf
    If nComprar >= 12
        nTotal := nComprar * nPreco2
        MsgInfo("Vc recebeu um desconto, vai pagar: " + cValToChar(nTotal) + " Reais", "Maças a pagar")
    Else
        nTotal := nComprar * nPreco1
        MsgInfo("Valor a cobrar: " + cValToChar(nTotal) + " Reais.", "Maças a pagar")
    endif
Return Nil
