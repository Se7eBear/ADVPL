#include "totvs.ch"

User Function ex02_L01()
    Local cBase := FWInputBox("Base de um retangulo", "")
    Local cAltura := FWInputBox("Altura de um retangulo", "")
    Local nBase := Val(cBase)
    Local nAltura := Val(cAltura)
    Local nArea := 0

    nArea := nBase * nAltura
    MsgInfo("Area do Retangulo: " + cValToChar(nArea), "Area")
Return Nil
