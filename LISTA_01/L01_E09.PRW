User Function ex09()

Local cNbr := FWInputBox("Escreva um numero para verificar", "")
Local nNbr := Val(cNbr)

If nNbr > 0
    MsgInfo("Numero Positivo: " + cValToChar(nNbr), "Seu numero e Positivo")
elseif nNbr < 0
    MsgInfo("Numero Negativo: " + cValToChar(nNbr), "Seu numero e Negativo")
else
    MsgInfo("Numero ZERO: " + cValToChar(nNbr), "Seu numero e zero")
EndIf

Return Nil
