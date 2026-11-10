User Function ex16()
Local cUsuario := FWInputBox("Escolha um username com mais de 5 caracteres", "")
Local cSenhaUsuario := FWInputBox("Escolha uma senha", "")
Local cConfirma := FWInputBox("Digite a senha novamente", "")
Local nPos := 0
Local lMaiuscula := .F.
Local lNumero := .F.
Local lSimbolo := .F.
Local cCaractere := ""

If Len(cUsuario) <= 5
    MsgAlert("O username deve possuir mais de 5 caracteres.", "Cadastro")
    Return Nil
EndIf
If cSenhaUsuario != cConfirma
    MsgAlert("A senha e a confirmacao devem ser iguais.", "Cadastro")
    Return Nil
EndIf
If Len(cSenhaUsuario) < 6
    MsgAlert("A senha deve possuir ao menos 6 caracteres.", "Cadastro")
    Return Nil
EndIf

For nPos := 1 To Len(cSenhaUsuario)
    cCaractere := SubStr(cSenhaUsuario, nPos, 1)
    If cCaractere >= "A" .And. cCaractere <= "Z"
        lMaiuscula := .T.
    ElseIf cCaractere >= "0" .And. cCaractere <= "9"
        lNumero := .T.
    ElseIf !(cCaractere >= "a" .And. cCaractere <= "z")
        lSimbolo := .T.
    EndIf
Next nPos

If lMaiuscula .And. lNumero .And. lSimbolo
    MsgInfo("Usuario cadastrado com sucesso.", "Cadastro")
Else
    MsgAlert("A senha deve conter uma maiuscula, um numero e um simbolo.", "Cadastro")
EndIf
Return Nil
