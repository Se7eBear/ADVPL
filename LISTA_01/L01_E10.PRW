User Function ex010()
Local cVal1 := FWInputBox("Primeiro Valor", "")
Local cVal2 := FWInputBox("Segundo Valor", "")
Local cVal3 := FWInputBox("Terceiro Valor", "")
Local nVal1 := Val(cVal1)
Local nVal2 := Val(cVal2)
Local nVal3 := Val(cVal3)
Local nTemp := 0
Local cMsg := ""

If nVal1 == nVal2 .Or. nVal1 == nVal3 .OR. nVal3 == nVal2
    MsgInfo("Nao pode ter numero repetido.", "")
    return
EndIf

If nVal1 > nVal2
    nTemp := nVal1
    nVal1 := nVal2
    nVal2 := nTemp
EndIf

If nVal1 > nVal3
    nTemp := nVal1
    nVal1 := nVal3
    nVal3 := nTemp
EndIf

If nVal2 > nVal3
    nTemp := nVal2
    nVal2 := nVal3
    nVal3 := nTemp
EndIf
cMsg := "Foi ordenado! 1°Valor:" + cValToChar(nVal1) + " | 2°Valor:" + cValToChar(nVal2) + " | 3°Valor:" + cValToChar(nVal3)
MsgInfo(cMsg, "Numeros Ordenados")

Return Nil
