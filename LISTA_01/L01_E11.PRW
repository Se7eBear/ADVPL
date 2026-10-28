User Function ex11()
Local cA := FWInputBox("Coloque o valor do Lado A", "")
Local cB := FWInputBox("Coloque o valor do Lado B", "")
Local cC := FWInputBox("Coloque o valor do Lado C", "")
Local nA := Val(cA)
Local nB := Val(cB)
Local nC := Val(cC)
Local nTrue := 0

If nA < nB + nC
    nTrue++
EndIf

If nB < nA + nC
    nTrue++
EndIf

If nC < nB + nA
    nTrue++
EndIf

If nTrue == 3
    MsgInfo("Triangulo formado!", "")
Else
    MsgInfo("Nao formou um triangulo.", "")
EndIf

Return Nil
