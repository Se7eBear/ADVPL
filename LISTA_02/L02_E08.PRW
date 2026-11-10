#include "totvs.ch"

User Function ex08_L02()
    Local cUsuario := FWInputBox("Nome de usuario", "")
    Local cSenha := FWInputBox("Senha", "")
    Local cUsuarioOk := "admin"
    Local cSenhaOk := "advpl123"
    Local lUsuarioOk := (cUsuario == cUsuarioOk)
    Local lAcesso := .F.

    If lUsuarioOk
        lAcesso := (cSenha == cSenhaOk)
    EndIf
    If lAcesso
        MsgInfo("Acesso permitido", "Login")
    Else
        MsgInfo("Usuario ou senha invalido", "Login")
    EndIf
Return Nil
