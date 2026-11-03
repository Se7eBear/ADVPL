User Function ex12()
Local cTime1 := FWInputBox("Coloque o nome do primeiro time", "")
Local cTime2 := FWInputBox("Coloque o nome do segundo time", "")
Local cGolst1 := FWInputBox("Quantos gols o time 1 fez", "")
Local cGolst2 := FWInputBox("Quantos gols o time 2 fez", "")
Local nGolst1 := Val(cGolst1)
Local nGolst2 := Val(cGolst2)

If nGolst1 > nGolst2
    MsgInfo("O time " + cTime1 + " Ganhou!", "Time vencedor é...")
ElseIf nGolst2 > nGolst1
    MsgInfo("O time " + cTime2 + " Ganhou!", "Time vencedor é...")
Else
    MsgInfo("EMPATE!", "Time vencedor é...")
EndIf
Return Nil