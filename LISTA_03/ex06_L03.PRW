#include "totvs.ch"

User Function ex06_L03()
    Local cAlias := GetNextAlias()
    Local cCod   := ""
    Local cMsg   := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    cCod := AllTrim(FWInputBox("Informe o codigo do produto", ""))

    If Empty(cCod)
        MsgAlert("Informe um codigo.", "Atencao")
        Return Nil
    EndIf

    BeginSql Alias cAlias
        SELECT B1_COD, B1_DESC, B1_PRV1
          FROM %table:SB1% SB1
         WHERE B1_FILIAL = %xFilial:SB1%
           AND SB1.%NotDel%
           AND B1_COD    = %exp:cCod%
    EndSql

    If !(cAlias)->(Eof())
        cMsg := "Codigo: " + AllTrim((cAlias)->B1_COD) + CRLF
        cMsg += "Descricao: " + AllTrim((cAlias)->B1_DESC) + CRLF
        cMsg += "Preco de venda: " + Transform((cAlias)->B1_PRV1, "@E 999,999.99")
        MsgInfo(cMsg, "Produto encontrado")
    Else
        MsgAlert("O produto " + cCod + " nao existe no sistema.", "Atencao")
    EndIf

    (cAlias)->(DbCloseArea())
Return Nil

// SELECT B1_COD, B1_DESC, B1_PRV1
//   FROM SB1990
//  WHERE D_E_L_E_T_ = ' '

// SELECT B1_COD, B1_DESC, B1_PRV1
//   FROM SB1990
//  WHERE D_E_L_E_T_ = ' '
//    AND B1_COD = 'CODIGO_AQUI'
