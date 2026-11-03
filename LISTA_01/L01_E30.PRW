#include "totvs.ch"

User Function ex30()
Local aNumeros := {}
Local nNum := 0
Local nValue := 0
Local cMsg := ""

For nNum := 1 To 10
    nValue := Val(FWInputBox("Coloque o numero " + cValToChar(nNum) + " de 10", ""))
    aAdd(aNumeros, nValue)
Next nNum

For nNum := Len(aNumeros) To 1 Step -1
    cMsg += cValToChar(aNumeros[nNum]) + " "
Next nNum

MsgInfo("Numeros na ordem inversa: " + cMsg, "Ordem inversa")

Return Nil
