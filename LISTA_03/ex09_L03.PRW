#include "totvs.ch"

User Function ex09_L03()
    Local cAlias   := GetNextAlias()
    Local cCod     := ""
    Local cPedidos := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    cCod := AllTrim(FWInputBox("Informe o codigo do produto", ""))

    If Empty(cCod)
        MsgAlert("Informe um codigo.", "Atencao")
        Return Nil
    EndIf

    BeginSql Alias cAlias
        SELECT DISTINCT C6_NUM
          FROM %table:SC6% SC6
         WHERE C6_FILIAL  = %xFilial:SC6%
           AND SC6.%NotDel%
           AND C6_PRODUTO = %exp:cCod%
         ORDER BY C6_NUM
    EndSql

    While !(cAlias)->(Eof())
        If !Empty(cPedidos)
            cPedidos += ", "
        EndIf
        cPedidos += AllTrim((cAlias)->C6_NUM)
        (cAlias)->(DbSkip())
    EndDo
    (cAlias)->(DbCloseArea())

    If Empty(cPedidos)
        MsgAlert("O produto " + cCod + " nao esta em nenhum pedido de venda.", "Atencao")
    Else
        MsgInfo("Pedidos: " + cPedidos, "Produto " + cCod)
    EndIf
Return Nil

// SELECT DISTINCT C6_NUM
//   FROM SC6990
//  WHERE D_E_L_E_T_ = ' '
//    AND C6_PRODUTO = 'CODIGO_AQUI'
//  ORDER BY C6_NUM
