User Function ex02()

Local cBase := FWInputBox("Base de um retangulo", "")
Local cAltura := FWInputBox("Altura de um retangulo", "")
Local nBase := Val(cBase)
Local nAltura := Val(cAltura)
Local nArea

nArea := nBase * nAltura

MsgInfo("Area do Retangulo: " + cValToChar(nArea), "Area")

Return Nil
