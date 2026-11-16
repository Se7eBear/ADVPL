#include "totvs.ch"

User Function carga_L03()
    Local aProd  := {}
    Local nI     := 0
    Local cFor   := "008"
    Local cLoja  := "08"

    If Select("SX2") == 0
        RpcSetEnv("99", "01")
    EndIf
    // --- 1. Pega 3 produtos reais da SB1 ---
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))
    SB1->(DbSeek(xFilial("SB1")))
    While !SB1->(Eof()) .And. Len(aProd) < 3
        aAdd(aProd, {SB1->B1_COD, SB1->B1_DESC, SB1->B1_UM})
        SB1->(DbSkip())
    EndDo

    If Len(aProd) < 3
        MsgAlert("Preciso de pelo menos 3 produtos na SB1.", "Atencao")
        Return Nil
    EndIf

    // --- 2. Fornecedor Super Cabos (se nao existir) ---
    DbSelectArea("SA2")
    SA2->(DbSetOrder(1))   // filial + cod + loja
    If !SA2->(DbSeek(xFilial("SA2") + PadR(cFor, TamSX3("A2_COD")[1]) + PadR(cLoja, TamSX3("A2_LOJA")[1])))
        RecLock("SA2", .T.)        // .T. = inclusao
            SA2->A2_FILIAL  := xFilial("SA2")
            SA2->A2_COD     := cFor
            SA2->A2_LOJA    := cLoja
            SA2->A2_NOME    := "SUPER CABOS LTDA"
            SA2->A2_NREDUZ  := "SUPER CABOS"
            SA2->A2_EST     := "SP"
        SA2->(MsUnlock())
    EndIf

    // --- 3. Pedidos de compra (se ainda nao existirem) ---
    DbSelectArea("SC7")
    SC7->(DbSetOrder(1))   // filial + num + item + sequen
    If SC7->(DbSeek(xFilial("SC7") + PadR("PC0001", TamSX3("C7_NUM")[1])))
        MsgAlert("A carga ja foi feita (PC0001 existe).", "Atencao")
        Return Nil
    EndIf

    // PC0001: 3 itens | PC0002: 1 item (ambos Super Cabos)
    For nI := 1 To 3
        GravaSC7("PC0001", nI, aProd[nI], cFor, cLoja)
    Next nI
    GravaSC7("PC0002", 1, aProd[1], cFor, cLoja)

    // PC0003: de outro fornecedor, para provar que o filtro exclui
    GravaSC7("PC0003", 1, aProd[2], "001", "01")

    MsgInfo("Carga concluida: PC0001 (3 itens), PC0002 (1 item) e PC0003 (outro fornecedor).", "Carga")
Return Nil

Static Function GravaSC7(cNum, nItem, aProd, cFor, cLoja)
    RecLock("SC7", .T.)
        SC7->C7_FILIAL  := xFilial("SC7")
        SC7->C7_NUM     := cNum
        SC7->C7_ITEM    := StrZero(nItem, TamSX3("C7_ITEM")[1])
        SC7->C7_PRODUTO := aProd[1]
        SC7->C7_DESCRI  := aProd[2]
        SC7->C7_UM      := aProd[3]
        SC7->C7_QUANT   := 1
        SC7->C7_PRECO   := 10
        SC7->C7_TOTAL   := 10
        SC7->C7_FORNECE := cFor
        SC7->C7_LOJA    := cLoja
        SC7->C7_EMISSAO := dDataBase
    SC7->(MsUnlock())
Return Nil
