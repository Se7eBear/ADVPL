#include "topconn.ch"
#include "totvs.ch"
user function ex04_L03()

    LOCAL cAlias := GetNextAlias() 
    LOCAL cMsg := ""

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf
    
    BeginSql Alias cAlias
        SELECT B1_DESC
        FROM %table:SB1% SB1
        INNER JOIN %table:SBM% SBM
            ON BM_FILIAL = %xFilial:SBM%
            AND BM_GRUPO = B1_GRUPO
            AND SBM.%NotDel%
            WHERE B1_FILIAL = %xFilial:SB1%
            AND B1_GRUPO = '08'
            AND SB1.%NoteDel%
            ORDER BY B1_DESC
        EndSql
    
    while !(cAlias)->(EOF())
        cMsg += CRLF + Alltrim((cAlias)->B1_DESC)
        (cAlias)->(DbSkip())
    end
    (cAlias)->(DbCloseArea())

    If !Empty(cMsg) 
        FwAlertInfo(cMsg, "Produtos - Películas") 
    Else 
        FwAlertInfo("Nenhum produto encontrado no grupo Películas.", "Atenção") 
    Endif
Return Nil
