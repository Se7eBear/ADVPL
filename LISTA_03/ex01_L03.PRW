#include "totvs.ch"
#include "tbiconn.ch"

User Function ex01_L03()
    Local cAlias   := GetNextAlias()
    Local cMsg     := ""
    Local nCont    := 0

    BeginSql Alias cAlias
        SELECT DISTINCT C7_NUM
          FROM %table:SC7% SC7
         INNER JOIN %table:SA2% SA2
            ON A2_FILIAL = %xFilial:SA2%
           AND A2_COD    = C7_FORNECE
           AND A2_LOJA   = C7_LOJA
           AND SA2.%NotDel%
         WHERE C7_FILIAL = %xFilial:SC7%
           AND SC7.%NotDel%
           AND (UPPER(A2_NOME)   LIKE '%%SUPER CABOS%%'
             OR UPPER(A2_NREDUZ) LIKE '%%SUPER CABOS%%')
         ORDER BY C7_NUM
    EndSql

    While !(cAlias)->(Eof())
        nCont++
        cMsg += "Pedido " + cValToChar(nCont) + ": " + AllTrim((cAlias)->C7_NUM) + CRLF
        (cAlias)->(DbSkip())
    EndDo
    (cAlias)->(DbCloseArea())

    If Empty(cMsg)
        Alert("Nenhum pedido encontrado para o fornecedor Super Cabos.")
    Else
        MsgInfo(cMsg, "Pedidos - Super Cabos")
    EndIf

Return Nil
