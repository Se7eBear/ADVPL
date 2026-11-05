User Function ex10()
Local nNum := 0
Local nValor := 0
Local nMenor := 0
Local nMaior := 0

For nNum := 1 To 5
    nValor := Val(FWInputBox("Informe o valor inteiro " + cValToChar(nNum), ""))
    If nNum == 1
        nMenor := nValor
        nMaior := nValor
    Else
        If nValor < nMenor
            nMenor := nValor
        EndIf
        If nValor > nMaior
            nMaior := nValor
        EndIf
    EndIf
Next nNum

MsgInfo("Menor valor: " + cValToChar(nMenor) + CRLF + ;
    "Maior valor: " + cValToChar(nMaior), "Valores")
Return Nil
