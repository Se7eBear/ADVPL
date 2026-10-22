User Function ex02()

Local cJbase := FWInputBox("Base de um retangulo", "" ,"0")
Local cJaltura := FWInputBox("Altura de um retangulo", "" ,"0")
Local nBase := Val(cJbase)
Local nAltura := Val(nAltura)
Local nArea

nArea := nBase * nAltura

MsgInfo("Area do Retangulo: " + cValToChar(nArea), "Janela")

Return Nil