#include "totvs.ch"

User Function ex07_L02()
    Local nInicio := Val(FWInputBox("Hora de inicio (0 a 23)", ""))
    Local nFim := Val(FWInputBox("Hora de fim (0 a 23)", ""))
    Local nDuracao := 0

    If nInicio < 0 .Or. nInicio > 23 .Or. nFim < 0 .Or. nFim > 23
        MsgAlert("Informe horas entre 0 e 23.", "Atencao")
        Return Nil
    EndIf
    nDuracao := nFim - nInicio
    If nDuracao < 0
        nDuracao += 24
    EndIf
    MsgInfo("Duracao do jogo: " + cValToChar(nDuracao) + " hora(s)", "Jogo")
Return Nil
