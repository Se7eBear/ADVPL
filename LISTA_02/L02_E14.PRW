User Function ex14_L02()
Local nQtd := Val(FWInputBox("Quantidade de numeros", ""))
Local cTipo := Upper(FWInputBox("Escolha par ou impar", ""))
Local nNum := 0
Local nAtual := 0
Local nSoma := 0

If nQtd <= 0 .Or. (cTipo != "PAR" .And. cTipo != "IMPAR")
    MsgAlert("Informe uma quantidade positiva e escolha PAR ou IMPAR.", "Atencao")
    Return Nil
EndIf

If cTipo == "PAR"
    nAtual := 2
Else
    nAtual := 1
EndIf
For nNum := 1 To nQtd
    nSoma += nAtual
    nAtual += 2
Next nNum
MsgInfo("Soma dos " + cValToChar(nQtd) + " primeiros numeros " + ;
    Lower(cTipo) + "s: " + cValToChar(nSoma), "Somatoria")
Return Nil
