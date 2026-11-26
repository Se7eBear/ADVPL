#include "totvs.ch"

User Function ex11_L03()
    Local cAlias := GetNextAlias()
    Local cMsg   := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf

    BeginSql Alias cAlias
        SELECT A2_COD, A2_LOJA, A2_NOME
          FROM %table:SA2% SA2
         WHERE A2_FILIAL = %xFilial:SA2%
           AND SA2.%NotDel%
           AND A2_EST    = 'SP'
         ORDER BY A2_NOME
    EndSql

    While !(cAlias)->(Eof())
        cMsg += AllTrim((cAlias)->A2_COD) + "/" + AllTrim((cAlias)->A2_LOJA) + " - " + ;
                AllTrim((cAlias)->A2_NOME) + CRLF
        (cAlias)->(DbSkip())
    EndDo
    (cAlias)->(DbCloseArea())

    If Empty(cMsg)
        MsgAlert("Nenhum fornecedor encontrado em SP.", "Atencao")
    Else
        MsgInfo(cMsg, "Fornecedores de SP")
    EndIf
Return cMsg

// SELECT A2_COD, A2_LOJA, A2_NOME, A2_EST
//   FROM SA2990
//  WHERE D_E_L_E_T_ = ' '
//    AND A2_EST = 'SP'
//  ORDER BY A2_NOME
