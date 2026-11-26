#include "totvs.ch"

User Function ex10_L03(cCod)
    Local cAliasP := GetNextAlias()
    Local cAliasM := GetNextAlias()
    Local cMsg    := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    If ValType(cCod) != "C" .Or. Empty(cCod)
        cCod := FWInputBox("Informe o codigo do produto", "")
    EndIf
    cCod := AllTrim(cCod)

    If Empty(cCod)
        MsgAlert("Informe um codigo.", "Atencao")
        Return Nil
    EndIf

    BeginSql Alias cAliasP
        SELECT B1_COD, B1_DESC
          FROM %table:SB1% SB1
         WHERE B1_FILIAL = %xFilial:SB1%
           AND SB1.%NotDel%
           AND B1_COD    = %exp:cCod%
    EndSql

    If (cAliasP)->(Eof())
        (cAliasP)->(DbCloseArea())
        MsgAlert("O produto " + cCod + " nao existe.", "Atencao")
        Return Nil
    EndIf
    cMsg := AllTrim((cAliasP)->B1_DESC)
    (cAliasP)->(DbCloseArea())

    BeginSql Alias cAliasM
        SELECT AVG(C6_QTDVEN) AS MEDIA, COUNT(*) AS QTD
          FROM %table:SC6% SC6
         WHERE C6_FILIAL  = %xFilial:SC6%
           AND SC6.%NotDel%
           AND C6_PRODUTO = %exp:cCod%
    EndSql

    If (cAliasM)->QTD == 0
        MsgAlert("O produto " + cMsg + " nao esta em nenhum pedido de venda.", "Atencao")
    Else
        MsgInfo("Produto: " + cMsg + CRLF + ;
                "Media de quantidade: " + cValToChar(Round((cAliasM)->MEDIA, 2)), "Media")
    EndIf
    (cAliasM)->(DbCloseArea())
Return Nil


// -- passo 1: o produto existe?
// SELECT B1_COD, B1_DESC
//  FROM SB1990
// WHERE D_E_L_E_T_ = ' '
//   AND B1_COD = 'CODIGO_AQUI'

// -- passo 2: média de quantidade nos pedidos de venda
// SELECT AVG(C6_QTDVEN) AS MEDIA, COUNT(*) AS QTD
// FROM SC6990
// WHERE D_E_L_E_T_ = ' '
// AND C6_PRODUTO = 'CODIGO_AQUI'
