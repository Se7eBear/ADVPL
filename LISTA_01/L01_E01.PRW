User Function ex01()

Local cEntrada := FWInputBox("Coloque um valor maior que Zero", "")
Local nNbr := Val(cEntrada)
if nNbr <= 0
    return
endif
nNbr--
MsgInfo("Antecessor do numero: " + cValToChar(nNbr), "Calculo de antecessor")
return nil
