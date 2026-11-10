User Function ex05_L02()
Local nCotacao := Val(FWInputBox("Cotacao do dolar em reais", ""))
Local nDolares := Val(FWInputBox("Quantidade de dolares", ""))
Local nReais := nCotacao * nDolares

MsgInfo("Valor em reais: R$ " + cValToChar(nReais), "Conversao")
Return Nil
