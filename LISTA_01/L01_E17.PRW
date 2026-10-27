User Function ex17()
Local cNota1 := ""
Local cNota2 := ""
Local nNota1 := -1
Local nNota2 := -1
Local nMedia := 0
Local cRepeat := "Sim"
While cRepeat == "Sim" .Or. cRepeat == "S" .Or. cRepeat ==  "sim" .Or. cRepeat == "s"
nNota1 := -1
nNota2 := -1
    while nNota1 < 0 .Or. nNota1 > 10
        cNota1 := FWInputBox("Nota da primeira avaliacao (0 a 10)", "")
        nNota1 := Val(cNota1)
    EndDo
    while nNota2 < 0 .Or. nNota2 > 10
        cNota2 := FWInputBox("Nota da segunda avaliacao (0 a 10)", "")
        nNota2 := Val(cNota2)
    EndDo

    nMedia := (nNota1 + nNota2) / 2
    MsgInfo("Media do aluno: " + cValToChar(nMedia), "Media final")
cRepeat := FWInputBox("NOVO CALCULO? (S/N)", "")
EndDo
Return Nil
