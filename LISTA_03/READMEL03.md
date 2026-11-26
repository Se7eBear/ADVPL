# Guia de Estudo e Revisão ADVPL — Lista 03

Este material reúne e explica todas as **funções nativas, comandos de banco de dados e recursos de linguagem** utilizados nos fontes da **Lista 03** (do `carga_L03` até o `desafio_L03`). O objetivo é servir como consulta rápida para estudos e revisões futuras.

---

## 1. Ambiente, Filiais e Controle de Áreas (Tabelas)

| Função / Comando | O que faz | Exemplo de uso na Lista |
| :--- | :--- | :--- |
| **`Select("SX2")`** | Verifica se uma área/tabela já está aberta na memória (retorna `0` se não estiver). Muito usada para checar se o ambiente Protheus já foi inicializado antes de rodar rotinas via VS Code/Debug. | `If Select("SX2") == 0` |
| **`RpcSetEnv(cEmp, cFil)`** | Inicializa o ambiente do Protheus (dicionário de dados, conexão com banco, variáveis públicas) sem precisar abrir o SmartClient. | `RpcSetEnv("99", "01")` |
| **`DbSelectArea(cAlias)`** | Seleciona a área de trabalho (tabela) que passará a ser a área ativa para os comandos seguintes. | `DbSelectArea("SB1")` |
| **`DbSetOrder(nOrdem)`** | Define qual índice (definido na `SIX`) será usado para buscas e ordenação na tabela selecionada. | `SB1->(DbSetOrder(1))` |
| **`xFilial(cAlias)`** | Retorna o código da filial correta para a tabela informada, respeitando o modo de compartilhamento (Exclusivo ou Compartilhado) definido na `SX2`. | `xFilial("SB1")` |
| **`DbSeek(cChave)`** | Posiciona o ponteiro da tabela no primeiro registro que corresponda exatamente à chave informada (baseada no índice ativo). Retorna `.T.` se encontrar. | `SB1->(DbSeek(xFilial("SB1")))` |
| **`Eof()`** | *End of File* — retorna `.T.` quando o ponteiro ultrapassa o último registro da tabela ou consulta. Usado como condição de parada em laços `While`. | `While !SB1->(Eof())` |
| **`DbSkip()`** | Avança o ponteiro para o próximo registro da tabela ou resultado SQL. Sem ele, um laço `While !Eof()` entra em loop infinito. | `(cAlias)->(DbSkip())` |
| **`DbCloseArea()`** | Fecha a área de trabalho temporária (alias de consulta SQL) e libera a memória utilizada. | `(cAlias)->(DbCloseArea())` |
| **`RecLock(cAlias, lInclui)`** | Trava o registro para gravação no banco. Use `.T.` para **incluir** um novo registro (`APPEND`) e `.F.` para **alterar** o registro atual (`LOCK`). | `RecLock("SB1", .F.)` |
| **`MsUnlock()`** | Libera a trava feita pelo `RecLock` e efetiva a gravação dos dados no banco. | `SB1->(MsUnlock())` |
| **`TamSX3(cCampo)`** | Consulta o dicionário de dados (`SX3`) e retorna um array com `{Tamanho, Decimais, Tipo}` do campo informado. | `TamSX3("A2_COD")[1]` |

---

## 2. Consultas SQL Embebido (`BeginSql`)

No ADVPL, o bloco `BeginSql ... EndSql` executa queries diretamente no banco de dados (via DBAccess) e retorna o resultado em uma área temporária.

| Função / Macro | O que faz | Exemplo de uso na Lista |
| :--- | :--- | :--- |
| **`GetNextAlias()`** | Gera um nome de alias temporário único (ex: `SC00001`) para evitar conflito com tabelas já abertas. | `Local cAlias := GetNextAlias()` |
| **`BeginSql Alias cAlias`** | Inicia o bloco de consulta SQL que será associado ao alias informado. Encerra com `EndSql`. | `BeginSql Alias cAlias` |
| **`%table:XXX%`** | Macro SQL que traduz o alias lógico do Protheus para o nome físico da tabela no banco (ex: `SB1` $\rightarrow$ `SB1990`). | `FROM %table:SB1% SB1` |
| **`%xFilial:XXX%`** | Macro SQL equivalente à função `xFilial()`, inserindo o código da filial já formatado como string na query. | `WHERE B1_FILIAL = %xFilial:SB1%` |
| **`%NotDel%`** | Macro SQL que filtra apenas registros ativos, traduzindo para `D_E_L_E_T_ = ' '`. | `AND SB1.%NotDel%` |
| **`%exp:variavel%`** | Injeta o conteúdo de uma variável ADVPL dentro da query SQL de forma segura (tratando aspas e tipos). | `AND B1_COD = %exp:cCod%` |

---

## 3. Interface com o Usuário (Entrada e Saída)

| Função | O que faz | Exemplo de uso na Lista |
| :--- | :--- | :--- |
| **`FWInputBox(cTexto, cPadrao)`** | Abre uma janela simples com uma caixa de texto para o usuário digitar um valor. Sempre retorna uma `String` (`C`). | `FWInputBox("Informe o codigo", "")` |
| **`MsgInfo(cMsg, cTitulo)`** | Exibe uma caixa de mensagem informativa tradicional com botão "OK". | `MsgInfo(cMsg, "Pedidos")` |
| **`MsgAlert(cMsg, cTitulo)`** / **`Alert()`** | Exibe uma caixa de alerta/aviso tradicional (com ícone de exclamação amarela). | `MsgAlert("Nenhum pedido", "Atencao")` |
| **`FWAlertInfo(cMsg, cTitulo)`** | Versão mais moderna (framework FW) da janela informativa. | `FWAlertInfo(cMsg, "Dias da Semana")` |
| **`FWAlertWarning(cMsg, cTitulo)`** | Versão mais moderna (framework FW) da janela de alerta/atenção. | `FWAlertWarning("Valor nao aceito.")` |

---

## 4. Manipulação de Strings (Textos)

| Função | O que faz | Exemplo de uso na Lista |
| :--- | :--- | :--- |
| **`AllTrim(cTexto)`** | Remove todos os espaços em branco à esquerda e à direita de uma string. Essencial ao ler campos do banco (que vêm preenchidos com espaços até o tamanho total). | `AllTrim((cAlias)->B1_DESC)` |
| **`PadR(cTexto, nTam)`** | Preenche uma string com espaços à direita até atingir o tamanho `nTam`. Muito usada para montar chaves exatas para `DbSeek()`. | `PadR("PC0001", TamSX3("C7_NUM")[1])` |
| **`Upper(cTexto)`** | Converte todos os caracteres da string para letras maiúsculas. | `Upper(AllTrim(cNome))` |
| **`FwNoAccent(cTexto)`** | Remove acentos e cedilhas de uma string (ex: `"São Paulo"` $\rightarrow$ `"Sao Paulo"`). | `Upper(FwNoAccent(cFrase))` |
| **`SubStr(cTexto, nIni, nQtd)`** | Extrai um pedaço da string a partir da posição `nIni` (no ADVPL, índices começam em `1`), pegando `nQtd` caracteres. | `SubStr(cNome, nI, 1)` |
| **`At(cBusca, cTexto)`** | Procura `cBusca` dentro de `cTexto` e retorna a posição inicial onde encontrou (ou `0` se não existir). | `At(cLetra, "AEIOU")` |
| **`Len(xValor)`** | Retorna o tamanho (quantidade de caracteres) de uma string ou a quantidade de elementos de um array. | `Len(cNome)` / `Len(aTemp)` |
| **`Space(nTam)`** | Cria uma string composta apenas por `nTam` espaços em branco. | `Space(50)` |
| **`StrZero(nNum, nTam)`** | Converte um número para string preenchendo com zeros à esquerda até atingir `nTam` (ex: `1` $\rightarrow$ `"0001"`). | `StrZero(nItem, 4)` |
| **`Transform(xVal, cMascara)`** | Formata números, datas ou textos usando uma máscara (`Picture`). | `Transform(nVal, "@E 999,999.99")` |
| **`CRLF`** | Constante do `totvs.ch` que representa uma quebra de linha (`Chr(13) + Chr(10)`). | `cMsg += "Linha 1" + CRLF` |

---

## 5. Conversão de Tipos, Datas e Matemática

| Função | O que faz | Exemplo de uso na Lista |
| :--- | :--- | :--- |
| **`Val(cTexto)`** | Converte uma string numérica para o tipo Numérico (`N`). Muito usada após o `FWInputBox()`. | `Val(FWInputBox("Digite um numero", ""))` |
| **`cValToChar(xValor)`** | Converte qualquer tipo de dado (número, data, lógico) para String (`C`) de forma prática para concatenação. | `cValToChar(nTotal)` |
| **`ValType(xVar)`** | Retorna uma letra indicando o tipo atual da variável (`"C"` = Caractere, `"N"` = Numérico, `"D"` = Data, `"L"` = Lógico, `"A"` = Array, `"U"` = Indefinido/Nil). | `ValType(cCod) != "C"` |
| **`Empty(xValor)`** | Verifica se uma variável está vazia (string vazia/só espaços, número `0`, data em branco `  /  /  `, array vazio ou `Nil`). | `If Empty(cMsg)` |
| **`CToD(cData)`** | *Character to Date* — converte uma string no formato `"dd/mm/aaaa"` para o tipo Data (`D`). | `CToD("01/01/2026")` |
| **`DToS(dData)`** | *Date to String* — converte uma data para o formato de banco `"AAAAMMDD"` (ideal para comparações e `BETWEEN` no SQL). | `DToS(dIni)` |
| **`SToD(cDataSQL)`** | *String to Date* — faz o inverso da `DToS`, convertendo `"AAAAMMDD"` vindo do SQL de volta para o tipo Data (`D`). | `SToD((cAlias)->C5_EMISSAO)` |
| **`DToC(dData)`** | *Date to Character* — converte uma data (`D`) para string legível no formato `"dd/mm/aaaa"`. | `DToC(SToD(cData))` |
| **`Round(nNum, nDec)`** | Arredonda um número para a quantidade de casas decimais especificada. | `Round((cAliasM)->MEDIA, 2)` |
| **`dDataBase`** | Variável pública do Protheus que guarda a data-base atual do sistema. | `SC7->C7_EMISSAO := dDataBase` |

---

## 6. Manipulação de Arrays e Estruturas Auxiliares

| Função / Recurso | O que faz | Exemplo de uso na Lista |
| :--- | :--- | :--- |
| **`aAdd(aArray, xItem)`** | Adiciona um novo elemento ao final de um array, aumentando seu tamanho dinamicamente. | `aAdd(aNums, nValor)` |
| **`If(lCond, xVerd, xFalso)`** | *If inline* (ternário) — avalia a condição em uma única linha e retorna o segundo parâmetro se `.T.` ou o terceiro se `.F.`. | `If(nI < Len(aNums), ", ", "")` |
| **`U_NomeFuncao()`** | Prefixo obrigatório para invocar uma `User Function` compilada no RPO a partir de outro fonte ou pelo SmartClient. | `U_ex20_L03(SB1->B1_TIPO)` |

---

## 7. Resumo Rápido: Quando usar cada abordagem no Protheus?

1. **Precisa apenas ler/consultar dados (relatórios, buscas, totalizadores)?**
   - Prefira **`BeginSql ... EndSql`**. É muito mais rápido porque o filtro, a ordenação (`ORDER BY`) e os cálculos (`AVG`, `COUNT`, `TOP 1`) acontecem direto no banco de dados.
2. **Precisa incluir, alterar ou excluir registros no banco?**
   - Use **`DbSelectArea()` + `DbSetOrder()` + `DbSeek()`** acompanhados de **`RecLock()`** e **`MsUnlock()`**, pois essa abordagem respeita a integridade e o controle de concorrência do Protheus.