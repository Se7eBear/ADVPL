#include "totvs.ch"
User Function ex40()
Local nValorh := Val(FWInputBox("Valor da sua hora", ""))
Local nHoras := Val(FWInputBox("Quantidade de horas trabalhadas no mes", ""))
Local nBruto := nValorh * nHoras
Local nPercenIR := 0
Local nIR := 0
Local nINSS := 0
Local nFGTS := 0
Local nDescontos := 0
Local nLiquido := 0
Local cMsg := ""

If nBruto <= 1200
    nPercenIR := 0
ElseIf nBruto <= 1800
    nPercenIR := 5
ElseIf nBruto <= 2500
    nPercenIR := 10
Else
    nPercenIR := 20
EndIf

nIR := nBruto * nPercenIR / 100
nINSS := nBruto * 10 / 100
nFGTS := nBruto * 11 / 100
nDescontos := nIR + nINSS
nLiquido := nBruto - nDescontos

cMsg += "Salario bruto (" + cValToChar(nValorh) + " * " + cValToChar(nHoras) + "): R$ " + Transform(nBruto, "@E 999,999.99") + CRLF
cMsg += "(-) IR (" + cValToChar(nPercenIR) + "%): R$ " + Transform(nIR, "@E 999,999.99") + CRLF
cMsg += "(-) INSS (10%): R$ " + Transform(nINSS, "@E 999,999.99") + CRLF
cMsg += "FGTS (11%): R$ " + Transform(nFGTS, "@E 999,999.99") + CRLF
cMsg += "Total de descontos: R$ " + Transform(nDescontos, "@E 999,999.99") + CRLF
cMsg += "Salario Liquido: R$ " + Transform(nLiquido, "@E 999,999.99")

MsgInfo(cMsg, "Folha de pagamento")

Return Nil
