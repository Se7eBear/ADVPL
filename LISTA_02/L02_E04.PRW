#include "totvs.ch"

User Function ex04_L02()
    Local nA := Val(FWInputBox("Informe o inteiro A", ""))
    Local nB := Val(FWInputBox("Informe o inteiro B", ""))
    Local nResultado := (nA - nB) ^ 2

    MsgInfo("Quadrado da diferenca: " + cValToChar(nResultado), "Resultado")
Return Nil
