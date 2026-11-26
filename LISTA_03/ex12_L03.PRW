#include "totvs.ch"

User Function ex12_L03()
    Local cAliasMax := GetNextAlias()
    Local cAliasMin := GetNextAlias()
    Local cMsg      := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    BeginSql Alias cAliasMax
        SELECT TOP 1 B1_COD, B1_DESC, B1_PRV1
          FROM %table:SB1% SB1
         WHERE B1_FILIAL = %xFilial:SB1%
           AND SB1.%NotDel%
         ORDER BY B1_PRV1 DESC
    EndSql

    BeginSql Alias cAliasMin
        SELECT TOP 1 B1_COD, B1_DESC, B1_PRV1
          FROM %table:SB1% SB1
         WHERE B1_FILIAL = %xFilial:SB1%
           AND SB1.%NotDel%
         ORDER BY B1_PRV1 ASC
    EndSql

    If (cAliasMax)->(Eof())
        MsgAlert("Nenhum produto cadastrado.", "Atencao")
    Else
        cMsg := "Mais caro: " + AllTrim((cAliasMax)->B1_COD) + " - " + AllTrim((cAliasMax)->B1_DESC) + ;
                " (R$ " + Transform((cAliasMax)->B1_PRV1, "@E 999,999.99") + ")" + CRLF
        cMsg += "Mais barato: " + AllTrim((cAliasMin)->B1_COD) + " - " + AllTrim((cAliasMin)->B1_DESC) + ;
                " (R$ " + Transform((cAliasMin)->B1_PRV1, "@E 999,999.99") + ")"
        MsgInfo(cMsg, "Preco de venda")
    EndIf

    (cAliasMax)->(DbCloseArea())
    (cAliasMin)->(DbCloseArea())
Return Nil

// -- mais caro
// SELECT TOP 1 B1_COD, B1_DESC, B1_PRV1
//   FROM SB1990
//  WHERE D_E_L_E_T_ = ' '
//  ORDER BY B1_PRV1 DESC

// -- mais barato
// SELECT TOP 1 B1_COD, B1_DESC, B1_PRV1
//   FROM SB1990
//  WHERE D_E_L_E_T_ = ' '
//  ORDER BY B1_PRV1 ASC
