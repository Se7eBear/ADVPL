#include "totvs.ch"

User Function ex35_L01()
    Local nIdade := -1
    Local nSoma := 0
    Local nQtd := 0
    Local nMedia := 0

    While nIdade != 0
        nIdade := Val(FWInputBox("Coloque uma idade (0 para finalizar)", ""))
        If nIdade > 0
            nSoma += nIdade
            nQtd++
        EndIf
    EndDo
    If nQtd > 0
        nMedia := nSoma / nQtd
        MsgInfo("Media das idades digitadas: " + cValToChar(nMedia), "Media")
    Else
        MsgInfo("Nenhuma idade foi digitada.", "Media")
    EndIf
Return Nil
