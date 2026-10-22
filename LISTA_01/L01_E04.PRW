User Function ex04()

Local cSalario := FWInputBox("Salario do Funcionario", "")
Local cPercentual := FWInputBox("Percentual de reajuste", "")
Local nSalario := Val(cSalario)
Local nPercentual := Val(cPercentual)
Local nNew
Local nReajuste

nReajuste := nSalario * (nPercentual / 100)
nNew := nSalario + nReajuste

MsgInfo("Salario ajustado para: " + cValToChar(nNew), "Salario.")

Return Nil