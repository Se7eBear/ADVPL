user Function ex01()

Local cEntrada := FWInputBox("Coloque um valor maior que 0", "", "0")
Local nNbr := Val(cEntrada)
if nNbr <= 0
    return
endif
nNbr--
MsgInfo("Antecessor do numero: " + cValToChar(nNbr), "Janela")
return nil
