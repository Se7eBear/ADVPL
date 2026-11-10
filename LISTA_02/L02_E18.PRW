#include "totvs.ch"

User Function ex18_L02()
    Local nSorteado := Random(0, 100)
    Local nChute := -1
    Local nTentativas := 0
    Local cMsg := ""

    While nChute != nSorteado
        nChute := Val(FWInputBox("Adivinhe o numero entre 0 e 100", ""))
        nTentativas++
        If nChute > nSorteado
            MsgInfo("O numero sorteado e menor.", "Dica")
        ElseIf nChute < nSorteado
            MsgInfo("O numero sorteado e maior.", "Dica")
        EndIf
    EndDo
    If nTentativas < 5
        cMsg := "Voce e muito bom, acertou em "
    ElseIf nTentativas > 5 .And. nTentativas < 9
        cMsg := "Voce e bom, acertou em "
    ElseIf nTentativas > 9 .And. nTentativas < 13
        cMsg := "Voce e mediano, acertou em "
    ElseIf nTentativas > 13
        cMsg := "Voce e muito fraco, acertou em "
    Else
        cMsg := "Voce acertou em "
    EndIf
    cMsg += cValToChar(nTentativas) + " tentativas."
    MsgInfo(cMsg, "Fim de jogo")
Return Nil
