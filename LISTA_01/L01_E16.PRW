User Function ex16()
Local cNota1 := ""
Local cNota2 := ""
Local nNota1 := -1
Local nNota2 := -1
Local nMedia := 0
while nNota1 < 0 .Or. nNota1 > 10
    cNota1 := FWInputBox("Nota da primeira avaliacao (0 a 10)", "")
    nNota1 := Val(cNota1)
end
while nNota2 < 0 .Or. nNota2 > 10
    cNota2 := FWInputBox("Nota da segunda avaliacao (0 a 10)", "")
    nNota2 := Val(cNota2)
end

nMedia := (nNota1 + nNota2) / 2
MsgInfo("Media do aluno: " + cValToChar(nMedia), "Media final")
Return Nil

