User Function ex17_L02()
Local nSorteado := Random(0, 100)
Local nChute := Val(FWInputBox("Adivinhe o numero sorteado entre 0 e 100", ""))

If nSorteado > nChute
    MsgInfo("O numero sorteado e maior.", "Resultado")
ElseIf nSorteado < nChute
    MsgInfo("O numero sorteado e menor.", "Resultado")
Else
    MsgInfo("Voce acertou!", "Resultado")
EndIf
Return Nil
