# ADVPL para quem já sabe C e Python

Guia rápido de sintaxe para resolver listas de exercícios. Não é a referência completa da linguagem, é o suficiente para você sair do zero.

## 1. Visão geral

- ADVPL é a linguagem do ERP Protheus (TOTVS). Ela descende do Clipper/xBase.
- **Não diferencia maiúsculas de minúsculas**: `Local`, `LOCAL` e `local` são iguais, e `nX` e `NX` são a mesma variável.
- **Tipagem dinâmica** (como Python): você não declara tipo, e a variável pode mudar de tipo.
- **Índices começam em 1**, não em 0.
- Não existe `;` no fim da linha. Cada comando ocupa uma linha.
- Blocos terminam com palavra-chave (`EndIf`, `Next`, `EndDo`), não com `{ }` nem indentação.
- A indentação é só estética, mas capriche.

## 2. Comentários

```advpl
// comentário de uma linha
/* comentário
   de várias linhas */
```

## 3. Estrutura básica de um programa

```advpl
#Include "TOTVS.CH"

User Function MeuProg()
    Local nA := 10
    Local nB := 20

    ConOut("Soma: " + cValToChar(nA + nB))
Return
```

Pontos importantes:

- `#Include "TOTVS.CH"` (ou `"Protheus.ch"`) é o equivalente ao `#include` do C. Traz definições e comandos úteis.
- `User Function Nome()` declara uma função de usuário. Internamente ela vira `U_NOME`, e é assim que você a chama de fora.
- `Return` encerra a função (com ou sem valor).
- **Declare as variáveis `Local` no começo da função**, antes de qualquer comando executável. Declarar no meio costuma dar erro de compilação.
- Evite nomes muito longos. Historicamente só os 10 primeiros caracteres eram considerados no nome da função.

## 4. Tipos de função

| Declaração | Uso |
| --- | --- |
| `User Function Nome()` | Função pública de usuário. É a que você usa nos exercícios. |
| `Static Function Nome()` | Visível só dentro do próprio arquivo (como `static` em C). |
| `Function Nome()` | Reservada para funções padrão da TOTVS. Não use. |

### Parâmetros e retorno

```advpl
User Function Soma(nA, nB)
Return nA + nB

User Function Teste()
    Local nRes := U_Soma(3, 4)
    ConOut(cValToChar(nRes))   // 7
Return
```

- Parâmetros de tipos simples (número, texto, lógico, data) vão por **valor**.
- Arrays e objetos vão por **referência**.
- Para passar uma variável simples por referência, use `@` na chamada: `U_Func(@nX)`.
- Dentro do mesmo arquivo, chame `Static Function` direto pelo nome. Chame `User Function` com o prefixo `U_`.

## 5. Variáveis e escopo

| Palavra-chave | Escopo |
| --- | --- |
| `Local` | Só dentro da função onde foi declarada. **Use esta na maioria dos casos.** |
| `Static` | Vive durante toda a execução, visível no arquivo. |
| `Private` | Visível na função e em tudo que ela chamar. |
| `Public` | Global. Evite. |

```advpl
Local nIdade := 25
Local cNome  := "Maria"
Local lOk    := .T.
Local dHoje  := Date()
Local aLista := {1, 2, 3}
Local xAny              // sem valor, vale NIL
```

### Notação húngara (convenção)

O primeiro caractere do nome indica o tipo. Não é obrigatório, mas **todo código ADVPL segue isso**, e é bom você seguir também:

| Prefixo | Tipo | Exemplo |
| --- | --- | --- |
| `n` | Numérico (int e float são o mesmo tipo) | `nTotal` |
| `c` | Caractere (string) | `cNome` |
| `l` | Lógico | `lAtivo` |
| `d` | Data | `dNasc` |
| `a` | Array | `aItens` |
| `o` | Objeto | `oObj` |
| `b` | Bloco de código | `bCalc` |
| `x` | Indefinido (qualquer tipo) | `xValor` |

O tipo `Numeric` não separa int de float. `5` e `5.5` são ambos `N`. Divisão com `/` sempre pode dar casas decimais, então use `Int()` quando quiser truncar.

## 6. Operadores

### Atribuição

```advpl
nX := 10        // atribuição usa :=
nX += 5         // também existem -=, *=, /=, %=, ^=
nX++            // incremento (também nX--)
```

### Aritméticos

| Operador | Significado |
| --- | --- |
| `+ - * /` | Básicos |
| `%` | Resto da divisão (também existe a função `Mod(a, b)`) |
| `**` ou `^` | Potência |

### Comparação

| Operador | Significado |
| --- | --- |
| `==` | Igual (exato) |
| `!=`, `<>`, `#` | Diferente |
| `<  >  <=  >=` | Relacionais |
| `$` | "Está contido em": `"ab" $ "abc"` retorna `.T.` |

**Cuidado com `=` e `==`** em strings:

- `"abc" == "abc"` compara exatamente.
- `"abc" = "abcdef"` pode retornar `.T.`, pois o `=` compara só até o tamanho da string da direita.
- Para comparar texto, **use sempre `==`**.

### Lógicos

| ADVPL | Equivalente em C |
| --- | --- |
| `.T.` / `.F.` | `true` / `false` |
| `.And.` | `&&` |
| `.Or.` | `\\|\\|` |
| `.Not.` ou `!` | `!` |

Os literais lógicos levam os pontos: `.T.` e `.F.`.

```advpl
If nIdade >= 18 .And. lAtivo
    ConOut("Maior e ativo")
EndIf
```

### Strings

```advpl
cNome := "Joao" + " " + "Silva"   // concatenação com +
```

O operador `-` também concatena, removendo os espaços finais da primeira string antes de juntar.

## 7. Saída e entrada de dados

Não existe `printf`/`print` nem `scanf`/`input` padrão. O que você usa:

```advpl
ConOut("texto no console do AppServer")
MsgInfo("janela de aviso", "Titulo")     // precisa de interface (SmartClient)
Alert("outra janela de aviso")
```

- `ConOut` escreve no console/log do AppServer. É o mais simples para testar.
- `ConOut` e `MsgInfo` só aceitam **texto**. Converta antes:

```advpl
ConOut("Valor: " + cValToChar(nValor))   // cValToChar converte qualquer tipo
```

- Para **ler dados do usuário**, uma opção simples é `FWInputBox("Titulo", cValorPadrao)`, que abre uma janelinha e devolve **string**. Depois você converte com `Val()`. Confirme se existe na sua versão do ambiente.
- Em listas de exercícios, é comum simplesmente **fixar os valores em variáveis** no início da função.

## 8. Conversões

| Função | O que faz |
| --- | --- |
| `cValToChar(x)` | Converte qualquer tipo para texto |
| `Val(c)` | Texto para número |
| `Str(n, tam, dec)` | Número para texto com tamanho fixo (com espaços à esquerda) |
| `Transform(n, "@E 999,999.99")` | Formata com máscara |
| `Int(n)` | Trunca a parte decimal |
| `Round(n, dec)` | Arredonda |
| `ValType(x)` | Devolve o tipo: `"N"`, `"C"`, `"L"`, `"D"`, `"A"`, `"O"`, `"B"`, `"U"` (indefinido) |
| `Empty(x)` | `.T.` se vazio (`""`, `0`, `NIL`, array vazio, etc.) |

## 9. Condicionais

### If / ElseIf / Else

```advpl
If nNota >= 7
    ConOut("Aprovado")
ElseIf nNota >= 5
    ConOut("Recuperacao")
Else
    ConOut("Reprovado")
EndIf
```

Sem parênteses obrigatórios e sem `then`.

### Do Case (equivalente ao switch)

```advpl
Do Case
    Case nOp == 1
        ConOut("Um")
    Case nOp == 2
        ConOut("Dois")
    Otherwise
        ConOut("Outro")
EndCase
```

Cada `Case` recebe uma **condição completa** (não só um valor), e não existe `break`: o primeiro `Case` verdadeiro roda e sai.

### IIf (operador ternário)

```advpl
cTxt := IIf(nIdade >= 18, "Adulto", "Menor")
```

## 10. Laços (loops)

### For ... Next

```advpl
For nI := 1 To 10
    ConOut(cValToChar(nI))
Next nI

For nI := 10 To 1 Step -1      // contagem regressiva
    ConOut(cValToChar(nI))
Next
```

- O limite é **inclusivo** (`1 To 10` vai até 10).
- A variável de controle precisa ser declarada antes com `Local nI`.
- `Step` define o passo, e o padrão é 1.

### While ... EndDo

```advpl
Local nI := 1

While nI <= 5
    ConOut(cValToChar(nI))
    nI++
EndDo
```

`Do While ... EndDo` também é aceito e equivale ao `While`.

### Controle de fluxo

| Comando | Equivale a |
| --- | --- |
| `Exit` | `break` |
| `Loop` | `continue` |

```advpl
For nI := 1 To 10
    If nI % 2 == 0
        Loop            // pula os pares
    EndIf
    If nI > 7
        Exit            // sai do laço
    EndIf
    ConOut(cValToChar(nI))
Next
```

Não existe `do { } while ()` com teste no final. Se precisar, simule com `While .T.` e um `Exit` dentro.

## 11. Arrays

Arrays são dinâmicos (parecidos com listas de Python) e **começam em 1**.

```advpl
Local aNums := {10, 20, 30}
Local aVazio := {}
Local aFixo := Array(5)                 // 5 posições com NIL
Local aMat := {{1, 2}, {3, 4}}          // matriz (array de arrays)

aAdd(aVazio, 99)                        // adiciona ao final
ConOut(cValToChar(aNums[1]))            // 10
ConOut(cValToChar(Len(aNums)))          // 3
ConOut(cValToChar(aMat[2][1]))          // 3
aNums[2] := 25                          // altera
```

| Função | O que faz |
| --- | --- |
| `Len(a)` | Quantidade de elementos |
| `aAdd(a, x)` | Adiciona ao final |
| `aDel(a, n)` | Remove o elemento n e **desloca**, mas o tamanho do array continua igual (a última posição fica NIL) |
| `aSize(a, n)` | Redimensiona (use depois do `aDel` para realmente encolher) |
| `aIns(a, n)` | Insere uma posição vazia em n |
| `aScan(a, x)` | Procura e devolve a posição (0 se não achar) |
| `aSort(a)` | Ordena (pode receber um bloco de código para o critério) |
| `aClone(a)` | Cópia independente |
| `aEval(a, bBloco)` | Executa um bloco de código para cada elemento |

Cuidado: atribuir `aB := aA` **não copia**, as duas variáveis apontam para o mesmo array. Para copiar, use `aClone`.

## 12. Funções de texto

| Função | O que faz |
| --- | --- |
| `Len(c)` | Tamanho |
| `SubStr(c, ini, qtd)` | Substring (ini começa em 1) |
| `Left(c, n)` / `Right(c, n)` | Primeiros/últimos n caracteres |
| `Upper(c)` / `Lower(c)` | Maiúsculas/minúsculas |
| `AllTrim(c)` | Remove espaços dos dois lados (`LTrim` e `RTrim` fazem um lado só) |
| `At(sub, c)` | Posição de `sub` em `c` (0 se não achar) |
| `StrTran(c, de, para)` | Substitui ocorrências |
| `Replicate(c, n)` | Repete o texto n vezes |
| `Space(n)` | String com n espaços |
| `PadL / PadR / PadC(c, tam, preenche)` | Alinha preenchendo |
| `Chr(n)` / `Asc(c)` | Código ASCII para caractere e o inverso |

Strings **não** se indexam com `[ ]`. Para pegar um caractere, use `SubStr(cTxt, nI, 1)`.

```advpl
Local cTxt := "Banana"
Local nI, nCont := 0

For nI := 1 To Len(cTxt)
    If Upper(SubStr(cTxt, nI, 1)) == "A"
        nCont++
    EndIf
Next
ConOut("Letras A: " + cValToChar(nCont))   // 3
```

## 13. Funções matemáticas

`Abs(n)`, `Sqrt(n)`, `Int(n)`, `Round(n, dec)`, `Mod(a, b)`, `Max(a, b)`, `Min(a, b)`, `Exp(n)`, `Log(n)`. Potência: `nX ** 2` ou `nX ^ 2`.

## 14. Datas

Datas são um tipo próprio (`D`).

```advpl
Local dHoje := Date()                     // data do sistema
Local dFim  := CToD("31/12/2026")         // texto para data
Local nDias := dFim - dHoje               // subtração dá número de dias
ConOut(DToC(dHoje))                       // data para texto
ConOut(cValToChar(Year(dHoje)))           // também Month(), Day()
```

Também existem `DToS`/`SToD` (formato AAAAMMDD) e `Time()` (hora atual como texto).

## 15. Blocos de código (lambdas)

Pense nas lambdas do Python.

```advpl
Local bDobro := {|x| x * 2}
ConOut(cValToChar(Eval(bDobro, 5)))    // 10

Local aNums := {3, 1, 2}
aSort(aNums,,, {|a, b| a > b})         // ordem decrescente
```

## 16. Exemplos completos

### Par ou ímpar

```advpl
#Include "TOTVS.CH"

User Function ParImpar()
    Local nNum := 7

    If nNum % 2 == 0
        ConOut(cValToChar(nNum) + " e par")
    Else
        ConOut(cValToChar(nNum) + " e impar")
    EndIf
Return
```

### Fatorial

```advpl
#Include "TOTVS.CH"

User Function Fatorial(nN)
    Local nI
    Local nRes := 1

    For nI := 2 To nN
        nRes *= nI
    Next
Return nRes

User Function TestFat()
    ConOut("5! = " + cValToChar(U_Fatorial(5)))   // 120
Return
```

### Maior valor de um array

```advpl
#Include "TOTVS.CH"

User Function MaiorVal()
    Local aNums := {4, 17, 9, 23, 1}
    Local nMaior := aNums[1]
    Local nI

    For nI := 2 To Len(aNums)
        If aNums[nI] > nMaior
            nMaior := aNums[nI]
        EndIf
    Next

    ConOut("Maior: " + cValToChar(nMaior))
Return
```

## 17. Tabela de equivalência rápida

| Conceito | C | Python | ADVPL |
| --- | --- | --- | --- |
| Atribuir | `x = 1;` | `x = 1` | `nX := 1` |
| Igual | `==` | `==` | `==` |
| Diferente | `!=` | `!=` | `!=` ou `<>` |
| E / Ou / Não | `&&`, `\\|\\|`, `!` | `and or not` | `.And. .Or. .Not.` |
| Verdadeiro/falso | `1 / 0` | `True / False` | `.T. / .F.` |
| Nulo | `NULL` | `None` | `NIL` |
| Imprimir | `printf` | `print` | `ConOut` |
| Função | `int f(int a)` | `def f(a):` | `User Function F(nA)` |
| for | `for(i=0;i<n;i++)` | `for i in range(n)` | `For nI := 1 To n ... Next` |
| while | `while(c){}` | `while c:` | `While c ... EndDo` |
| break / continue | `break / continue` | `break / continue` | `Exit / Loop` |
| Ternário | `c ? a : b` | `a if c else b` | `IIf(c, a, b)` |
| switch | `switch` | `match` | `Do Case ... EndCase` |
| Tamanho | `strlen` | `len` | `Len` |
| Primeiro índice | 0 | 0 | **1** |

## 18. Erros comuns de quem vem de C/Python

1. Esquecer o `:=` e usar `=` na atribuição.
2. Declarar `Local` depois de comandos executáveis.
3. Concatenar número com texto sem `cValToChar()`. Dá erro de tipo.
4. Usar índice 0 em array.
5. Comparar string com `=` em vez de `==`.
6. Esquecer o `Next`, `EndIf`, `EndDo` ou `Return`.
7. Achar que `aB := aA` copia o array.
8. Esquecer os pontos em `.T.`, `.F.`, `.And.`, `.Or.`.

## 19. Como compilar e rodar

Você precisa de um **AppServer** do Protheus (ambiente de desenvolvimento) e de uma IDE:

- **TOTVS Developer Studio (TDS)** ou a extensão **TOTVS para VS Code**.
- Você compila o `.prw` (a extensão padrão dos fontes ADVPL) no AppServer e executa a função pelo SmartClient, informando `U_NomeDaFuncao` como programa inicial. A saída do `ConOut` aparece no console do AppServer.
- Confira com seu professor ou com a documentação da faculdade qual ambiente você deve usar. Os detalhes de configuração variam bastante.

Documentação oficial: **tdn.totvs.com**, onde você encontra a referência de cada função (busque pelo nome da função mais "ADVPL").
