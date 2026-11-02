#include "totvs.ch"
User Function ex28()
Local aNomes := {}
Local cNome := ""
Local cBusca := ""
Local nNum := 0
Local nPos := 0

For nNum := 1 To 10
    cNome := FWInputBox("Coloque o nome da pessoa " + cValToChar(nNum) + " de 10", "")
    aAdd(aNomes, AllTrim(cNome))
Next nNum

cBusca := FWInputBox("Qual nome deseja procurar", "")
nPos := aScan(aNomes, {|x| Upper(x) == Upper(AllTrim(cBusca))})

If nPos > 0
    MsgInfo("ACHEI", "Resultado da busca")
Else
    MsgInfo("NAO ACHEI", "Resultado da busca")
EndIf

Return Nil
