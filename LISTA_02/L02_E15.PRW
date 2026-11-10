#include "totvs.ch"

User Function ex15_L02()
    Local nQtd := Val(FWInputBox("Quantos numeros de Fibonacci deseja ver?", ""))
    Local nNum := 0
    Local nAnterior := 0
    Local nAtual := 1
    Local nProximo := 0
    Local cMsg := ""

    If nQtd <= 0
        MsgAlert("Informe uma quantidade maior que zero.", "Atencao")
        Return Nil
    EndIf
    For nNum := 1 To nQtd
        cMsg += cValToChar(nAnterior) + " "
        nProximo := nAnterior + nAtual
        nAnterior := nAtual
        nAtual := nProximo
    Next nNum
    MsgInfo(cMsg, "Serie de Fibonacci")
Return Nil
