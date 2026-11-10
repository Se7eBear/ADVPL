#include "totvs.ch"

User Function ex02_L02()
    Local nTempo := Val(FWInputBox("Tempo gasto na viagem (horas)", ""))
    Local nVeloc := Val(FWInputBox("Velocidade media (km/h)", ""))
    Local nDist := nTempo * nVeloc
    Local nLitros := nDist / 12
    Local cMsg := ""

    cMsg := "Velocidade media: " + cValToChar(nVeloc) + " km/h" + CRLF
    cMsg += "Tempo gasto: " + cValToChar(nTempo) + " horas" + CRLF
    cMsg += "Distancia percorrida: " + cValToChar(nDist) + " km" + CRLF
    cMsg += "Combustivel utilizado: " + cValToChar(nLitros) + " litros"
    MsgInfo(cMsg, "Consumo da viagem")
Return Nil
