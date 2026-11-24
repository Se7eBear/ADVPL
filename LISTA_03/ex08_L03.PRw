#include "totvs.ch"

User Function ex08_L03()
    Local cAlias := GetNextAlias()
    Local cMsg   := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    BeginSql Alias cAlias
        SELECT TOP 1 C6_PRODUTO, C6_DESCRI, C6_PRCVEN, C6_VALOR
          FROM %table:SC6% SC6
         WHERE C6_FILIAL = %xFilial:SC6%
           AND SC6.%NotDel%
         ORDER BY C6_VALOR DESC
    EndSql

    If !(cAlias)->(Eof())
        cMsg := "Codigo: " + AllTrim((cAlias)->C6_PRODUTO) + CRLF
        cMsg += "Descricao: " + AllTrim((cAlias)->C6_DESCRI) + CRLF
        cMsg += "Valor unitario: " + Transform((cAlias)->C6_PRCVEN, "@E 999,999.99") + CRLF
        cMsg += "Valor total: " + Transform((cAlias)->C6_VALOR, "@E 999,999.99")
        MsgInfo(cMsg, "Produto de maior valor")
    Else
        MsgAlert("Nao ha itens em pedidos de venda.", "Atencao")
    EndIf

    (cAlias)->(DbCloseArea())
Return Nil

// SELECT TOP 1 C6_PRODUTO, C6_DESCRI, C6_PRCVEN, C6_VALOR
//   FROM SC6990
//  WHERE D_E_L_E_T_ = ' '
//  ORDER BY C6_VALOR DESC
