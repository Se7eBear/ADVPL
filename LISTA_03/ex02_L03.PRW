#include "totvs.ch"
#include "tbiconn.ch"

USER FUNCTION ex02_L03()

Local cAlias := GetNextAlias()
Local cMsg := ""

If Select("SX2") == 0
    RpcSetEnv("99", "01")
EndIf

BeginSql Alias cAlias
    SELECT C5_NUM, A1_NOME
    FROM %table:SC5% SC5
    INNER JOIN %table:SA1% SA1
    ON A1_FILIAL = %xFilial:SA1%
    AND A1_COD = C5_CLIENTE
    AND A1_LOJA = C5_LOJACLI
    AND SA1.%NotDel%
    WHERE C5_FILIAL = %xFilial:SC5%
    AND SC5.%NotDel%
    AND C5_NOTA = ' '
    ORDER BY C5_NUM
EndSql

While !(cAlias)->(eOF())
    cMsg += "Pedido: " + AllTrim((cAlias)->C5_NUM) + " - Cliente " + AllTrim((cAlias)->A1_NOME) + CRLF
    (cAlias)->(DbSkip())
EndDo
(cAlias)->(DbCloseArea())

If Empty(cMsg)
    MsgAlert("Nenhum pedido")
else
    MsgInfo(cMsg, "Pedidos Sem Notas")
EndIf
RETURN NIL
