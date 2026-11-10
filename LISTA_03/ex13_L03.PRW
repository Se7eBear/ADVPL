#include "totvs.ch"

User Function ex13_L03()
    Local aDias := {"Doming", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sabado"}
    Local nNum := 0

    nNum := Val(FWInputBox("Digite um numero de 1 a 7", Space(2)))
    If nNum < 1 .OR. nNUm > 7
        FWAlertWarning("Valor nao aceito.")
    else
        FWAlertInfo(cValToChar(nNum) + " - " + aDias[nNum], "Dias da Semana")
    EndIf
Return Nil
