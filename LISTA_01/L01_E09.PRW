User Function ex09()

Local cNbr := FWInputBox("Escreva um numero para verificar", "")
Local nNbr := Val(cNbr)

If nNbr % 2 == 0
    MsgInfo("Numero PAR: " + cValToChar(nNbr), "Seu numero e par")
elseif nNbr % 2 != 0
    MsgInfo("Numero IMPAR: " + cValToChar(nNbr), "Seu numero e impar")
else
    MsgInfo("Numero ZERO: " + cValToChar(nNbr), "Seu numero e zero")
EndIf

Return Nil
