#include "totvs.ch"
User Function ex26()
Local nNum := 0
Local nSoma := 0
Local nQtd := 0
Local nMedia := 0

For nNum := 15 To 100
    nSoma += nNum
    nQtd++
Next nNum

nMedia := nSoma / nQtd

MsgInfo("Media dos inteiros entre 15 e 100: " + cValToChar(nMedia), "Media")

Return Nil
