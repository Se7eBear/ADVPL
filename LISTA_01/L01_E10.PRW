User Function ex10()

Local cVal1 := FWInputBox("Escreva um Numero", "")
Local cVal2 := FWInputBox("Escreva um Numero sem repetir.", "")
Local cVal3 := FWInputBox("Escreva um Numero e nao repita...", "")
Local nVal1 := Val(cVal1)
Local nVal2 := Val(cVal2)
Local nVal3 := Val(cVal3)
If nVal1 == nVal2 .Or. nVal1 == nVal3 .OR. nVal3 == nVal2
    return
EndIf
If nVal1 < nVal2 .AND. nVal1 < nVal3
    MsgInfo("Ordenado: " + nVal1 + nVal2 + nVal3, "")
EndIf
Return Nil
