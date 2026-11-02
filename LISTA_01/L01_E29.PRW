#include "totvs.ch"
User Function ex29()
Local aArray1 := {}
Local aArray2 := {}
Local nCont := 0
Local nValue := 0
Local nNum := 0
Local cMsg := ""

For nCont := 1 To 10
    nValue := Val(FWInputBox("Coloque o numero " + cValToChar(nCont) + " de 10", ""))
    aAdd(aArray1, nValue)
Next nCont

nNum := Val(FWInputBox("Coloque o numero para multiplicar", ""))

For nCont := 1 To Len(aArray1)
    aAdd(aArray2, aArray1[nCont] * nNum)
    cMsg += cValToChar(aArray2[nCont]) + " "
Next nCont

MsgInfo("Vetor aArray2: " + cMsg, "Resultado")

Return Nil
