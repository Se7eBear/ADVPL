#include "totvs.ch"

User Function ex01_L01()
    Local cEntrada := FWInputBox("Coloque um valor maior que Zero", "")
    Local nNbr := Val(cEntrada)

    if nNbr <= 0
        Return
    endif
    nNbr--
    MsgInfo("Antecessor do numero: " + cValToChar(nNbr), "Calculo de antecessor")
Return Nil
