#include "totvs.ch"

User Function ex05_L03()
    Local cAlias := GetNextAlias()
    Local cMsg   := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    BeginSql Alias cAlias
        SELECT B1_COD, B1_DESC
          FROM %table:SB1% SB1
         WHERE B1_FILIAL = %xFilial:SB1%
           AND SB1.%NotDel%
         ORDER BY B1_DESC DESC
    EndSql

    While !(cAlias)->(Eof())
        cMsg += AllTrim((cAlias)->B1_COD) + " - " + AllTrim((cAlias)->B1_DESC) + CRLF
        (cAlias)->(DbSkip())
    EndDo
    (cAlias)->(DbCloseArea())

    If Empty(cMsg)
        MsgAlert("Nenhum produto cadastrado.", "Atencao")
    Else
        MsgInfo(cMsg, "Produtos (Z-A)")
    EndIf
Return Nil

// SELECT B1_COD, B1_DESC
//   FROM SB1990
//  WHERE D_E_L_E_T_ = ' '
//  ORDER BY B1_DESC DESC
