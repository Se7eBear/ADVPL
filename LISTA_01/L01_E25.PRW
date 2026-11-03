#include "totvs.ch"

User Function ex25()
Local nNum := 0
Local nValue := 0
Local nSoma := 0

For nNum := 1 To 10
    nValue := Val(FWInputBox("Coloque o numero " + cValToChar(nNum) + " de 10", ""))
    nSoma += nValue
Next nNum

MsgInfo("Soma total dos 10 numeros: " + cValToChar(nSoma), "Soma")

Return Nil
