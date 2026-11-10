#include "totvs.ch"

User Function ex04_L01()
    Local cSalario := FWInputBox("Salario do Funcionario", "")
    Local cPercentual := FWInputBox("Percentual de reajuste", "")
    Local nSalario := Val(cSalario)
    Local nPercentual := Val(cPercentual)
    Local nNew := 0
    Local nReajuste := 0

    nReajuste := nSalario * (nPercentual / 100)
    nNew := nSalario + nReajuste
    MsgInfo("Salario ajustado para: " + cValToChar(nNew), "Salario.")
Return Nil
