#include "totvs.ch"

User Function ex36_L01()
    Local nValue := Val(FWInputBox("Coloque um inteiro para calcular o fatorial", ""))
    Local nNum := 0
    Local nFat := 1

    If nValue < 0 .Or. nValue != Int(nValue)
        MsgAlert("Coloque um inteiro maior ou igual a zero.", "Atencao")
        Return Nil
    EndIf
    For nNum := 2 To nValue
        nFat *= nNum
    Next nNum
    MsgInfo(cValToChar(nValue) + "! = " + cValToChar(nFat), "Fatorial")
Return Nil
