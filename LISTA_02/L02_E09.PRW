User Function ex09()
Local nMes := Val(FWInputBox("Informe um numero de 1 a 12", ""))
Local aDias := {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

If nMes < 1 .Or. nMes > 12
    MsgAlert("O mes deve estar entre 1 e 12.", "Atencao")
    Return Nil
EndIf
MsgInfo("O mes tem " + cValToChar(aDias[nMes]) + " dias.", "Dias do mes")
Return Nil
