User Function ex06()
Local nNum := 0
Local nValor := 0
Local cMsg := ""

For nNum := 1 To 4
    nValor := Val(FWInputBox("Informe o inteiro " + cValToChar(nNum), ""))
    If nValor % 2 == 0 .And. nValor % 3 == 0
        cMsg += cValToChar(nValor) + CRLF
    EndIf
Next nNum

If Empty(cMsg)
    cMsg := "Nenhum numero e divisivel por 2 e 3."
EndIf
MsgInfo(cMsg, "Numeros divisiveis por 2 e 3")
Return Nil
