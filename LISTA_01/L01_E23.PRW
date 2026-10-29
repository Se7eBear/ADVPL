User Function ex23()

Local nCont := 1
Local nNegativo := 0
Local cValor := ""
Local nValor := 0

While nCont <= 10
    nValor := Val(FWInputBox("Digite o valor " + cValToChar(nCont) + " de 10", ""))

    If nValor < 0
        nNegativo++
    EndIf

    nCont++
EndDo

MsgInfo("Quantidade de valores negativos: " + cValToChar(nNegativo), "Resultado")

Return Nil
