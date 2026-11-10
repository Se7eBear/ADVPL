User Function ex01_L02()
Local nNum1 := Val(FWInputBox("Primeiro numero positivo", ""))
Local nNum2 := Val(FWInputBox("Segundo numero positivo", ""))
Local cMsg := ""

If nNum1 <= 0 .Or. nNum2 <= 0
    MsgAlert("Os dois numeros devem ser positivos.", "Atencao")
    Return Nil
EndIf

cMsg := "Soma: " + cValToChar(nNum1 + nNum2) + CRLF
cMsg += "Diferenca: " + cValToChar(nNum1 - nNum2) + CRLF
cMsg += "Produto: " + cValToChar(nNum1 * nNum2) + CRLF
cMsg += "Quociente: " + cValToChar(nNum1 / nNum2)
MsgInfo(cMsg, "Operacoes")
Return Nil
