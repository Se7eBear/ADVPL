#include "totvs.ch"

User Function ex37()
Local nValor := 0
Local nPercen := 0
Local nFinal := 0
Local cMsg := "Valor da compra - desconto - valor final" + CRLF

For nValor := 500 To 2900 Step 100
    nPercen := ((nValor - 500) / 100) + 1
    nFinal := nValor - (nValor * nPercen / 100)
    cMsg += "R$ " + Transform(nValor, "@E 9,999.99") + " - " + cValToChar(nPercen) + "% - R$ " + Transform(nFinal, "@E 9,999.99") + CRLF
Next nValor

MsgInfo(cMsg, "Tabela de descontos")

Return Nil
