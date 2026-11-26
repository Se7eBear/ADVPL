#include "totvs.ch"

User Function ex20_L03(cTipo)
    Local cGrupo := ""

    If AllTrim(cTipo) == "MP"
        cGrupo := "Materia Prima Producao"
    ElseIf AllTrim(cTipo) == "PA"
        cGrupo := "Produto para Comercializacao"
    Else
        cGrupo := "Outros Produtos"
    EndIf
Return cGrupo
