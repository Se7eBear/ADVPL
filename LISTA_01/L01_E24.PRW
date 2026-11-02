#include "totvs.ch"
User Function ex24()
Local nNum := 0
Local nValue := 0
Local nDentro := 0
Local nFora := 0

For nNum := 1 To 10
    nValue := Val(FWInputBox("Coloque o valor " + cValToChar(nNum) + " de 10", ""))
    If nValue >= 10 .And. nValue <= 20
        nDentro++
    Else
        nFora++
    EndIf
Next nNum

MsgInfo("Dentro do intervalo [10, 20]: " + cValToChar(nDentro) + CRLF + ;
"Fora do intervalo: " + cValToChar(nFora), "Intervalo")

Return Nil
