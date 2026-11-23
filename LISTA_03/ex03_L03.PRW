#include "totvs.ch"

User Function ex03_L03()
    Local cAlias := GetNextAlias()
    Local cMsg   := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    BeginSql Alias cAlias
        SELECT C6_PRODUTO, C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_VALOR
          FROM %table:SC6% SC6
         WHERE C6_FILIAL = %xFilial:SC6%
           AND SC6.%NotDel%
           AND C6_NUM    = 'PV0008'
         ORDER BY C6_ITEM
    EndSql

    While !(cAlias)->(Eof())
        cMsg += AllTrim((cAlias)->C6_PRODUTO) + " - " + ;
                AllTrim((cAlias)->C6_DESCRI)  + " - " + ;
                cValToChar((cAlias)->C6_QTDVEN) + " - " + ;
                Transform((cAlias)->C6_PRCVEN, "@E 999,999.99") + " - " + ;
                Transform((cAlias)->C6_VALOR,  "@E 999,999.99") + CRLF
        (cAlias)->(DbSkip())
    EndDo
    (cAlias)->(DbCloseArea())

    If Empty(cMsg)
        MsgAlert("Nenhum item encontrado para o pedido PV0008.", "Atencao")
    Else
        MsgInfo("Codigo - Descricao - Qtd - Vl. Unit - Vl Total" + CRLF + CRLF + cMsg, "Itens do PV0008")
    EndIf
Return Nil

// SELECT C6_PRODUTO, C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_VALOR
//   FROM SC6990
//  WHERE D_E_L_E_T_ = ' '
//    AND C6_NUM = 'PV0008'
//  ORDER BY C6_ITEM
