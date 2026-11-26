#include "totvs.ch"

User Function desafio_L03()
    Local nAtualizados := 0
    Local nTotal       := 0

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))
    SB1->(DbSeek(xFilial("SB1")))

    While !SB1->(Eof()) .And. SB1->B1_FILIAL == xFilial("SB1")
        nTotal++

        If Empty(SB1->B1_ZZGRP)
            RecLock("SB1", .F.)
                SB1->B1_ZZGRP := U_ex20_L03(SB1->B1_TIPO)
            SB1->(MsUnlock())
            nAtualizados++
        EndIf

        SB1->(DbSkip())
    EndDo

    MsgInfo("Produtos percorridos: " + cValToChar(nTotal) + CRLF + ;
            "Produtos atualizados: " + cValToChar(nAtualizados), "Fim")
Return Nil

// SELECT B1_COD, B1_DESC, B1_TIPO, B1_ZZGRP
//   FROM SB1990
//  WHERE D_E_L_E_T_ = ' '
