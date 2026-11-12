#include "totvs.ch"

User Function ex14_L02()
    Local nQtd := Val(FWInputBox("Quantidade de numeros", ""))
    Local cTipo := Upper(FWInputBox("Escolha par ou impar", ""))
    Local cPlural := ""
    Local nNum := 0
    Local nAtual := 0
    Local nSoma := 0

    If nQtd <= 0 .Or. (cTipo != "PAR" .And. cTipo != "IMPAR")
        MsgAlert("Informe uma quantidade positiva e escolha PAR ou IMPAR.", "Atencao")
        Return Nil
    EndIf
    If cTipo == "PAR"
        nAtual := 2
        cPlural := "pares"
    Else
        nAtual := 1
        cPlural := "impares"
    EndIf
    For nNum := 1 To nQtd
        nSoma += nAtual
        nAtual += 2
    Next nNum
    MsgInfo("Soma dos " + cValToChar(nQtd) + " primeiros numeros " + ;
    cPlural + ": " + cValToChar(nSoma), "Somatoria")
Return Nil
