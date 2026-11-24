#include "totvs.ch"

User Function ex07_L03()
    Local cAlias := GetNextAlias()
    Local cMsg   := ""
    Local dIni   := CToD("")
    Local dFim   := CToD("")
    Local cIni   := ""
    Local cFim   := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    dIni := CToD(FWInputBox("Data inicio (dd/mm/aaaa)", ""))
    dFim := CToD(FWInputBox("Data fim (dd/mm/aaaa)", ""))

    If Empty(dIni) .Or. Empty(dFim)
        MsgAlert("Informe as duas datas no formato dd/mm/aaaa.", "Atencao")
        Return Nil
    EndIf
    If dIni > dFim
        MsgAlert("A data inicio nao pode ser maior que a data fim.", "Atencao")
        Return Nil
    EndIf

    cIni := DToS(dIni)
    cFim := DToS(dFim)

    BeginSql Alias cAlias
        SELECT C5_NUM, C5_EMISSAO
          FROM %table:SC5% SC5
         WHERE C5_FILIAL = %xFilial:SC5%
           AND SC5.%NotDel%
           AND C5_EMISSAO BETWEEN %exp:cIni% AND %exp:cFim%
         ORDER BY C5_EMISSAO, C5_NUM
    EndSql

    While !(cAlias)->(Eof())
        cMsg += "Pedido: " + AllTrim((cAlias)->C5_NUM) + " - Emissao: " + ;
                DToC(SToD((cAlias)->C5_EMISSAO)) + CRLF
        (cAlias)->(DbSkip())
    EndDo
    (cAlias)->(DbCloseArea())

    If Empty(cMsg)
        MsgAlert("Nenhum pedido no periodo informado.", "Atencao")
    Else
        MsgInfo(cMsg, "Pedidos de venda")
    EndIf
Return Nil

// SELECT C5_NUM, C5_EMISSAO
//   FROM SC5990
//  WHERE D_E_L_E_T_ = ' '
//    AND C5_EMISSAO BETWEEN '20260101' AND '20261231'
//  ORDER BY C5_EMISSAO, C5_NUM
