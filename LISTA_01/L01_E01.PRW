user Function ex01()

Local cEntrada := FWInputBox("Cadastro", "informe um numero maior que Zero:", "0")
Local nNbr := Val(cEntrada)
if nNbr <= 0
    return

nNbr--
MsgInfo("Antecessor do numero: " + cValToChar(nNbr))
return nil
