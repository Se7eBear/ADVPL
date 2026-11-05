# Lista 01 — explicação dos fontes

Cada item abaixo explica o fluxo principal do arquivo `.PRW` correspondente. Os exercícios usam `FWInputBox` para receber dados e `MsgInfo`/`MsgAlert` para apresentar resultados ou avisos.

## Exercícios 01 a 10

- **`L01_E01.PRW` — Antecessor:** pede um valor, converte a entrada para número e encerra sem calcular se não for positivo. Para uma entrada válida, subtrai 1 e apresenta o antecessor.
- **`L01_E02.PRW` — Área do retângulo:** recebe base e altura, multiplica os dois valores e mostra a área calculada.
- **`L01_E03.PRW` — Idade em dias:** recebe anos, meses e dias. Converte anos usando 365 dias e meses usando 30, soma as parcelas e exibe o total estimado de dias.
- **`L01_E04.PRW` — Reajuste salarial:** solicita salário e percentual de reajuste. Calcula o valor do aumento e soma esse valor ao salário original.
- **`L01_E05.PRW` — Valor do carro:** recebe o valor inicial, calcula os acréscimos de 28% e 45% sobre esse valor e apresenta o total com ambos os percentuais somados.
- **`L01_E06.PRW` — Fahrenheit para Celsius:** recebe a temperatura em Fahrenheit e aplica a fórmula `(F - 32) / 1.8`.
- **`L01_E07.PRW` — Compra de maçãs:** pede a quantidade. Para 12 unidades ou mais, cobra R$ 1,00 por maçã; abaixo de 12, cobra R$ 1,30. Quantidade negativa encerra sem cálculo.
- **`L01_E08.PRW` — Salário com hora extra:** recebe horas trabalhadas e valor por hora. Até 160 horas, calcula o pagamento normal; acima disso, acrescenta adicional de 50% sobre as horas excedentes.
- **`L01_E09.PRW` — Sinal do número:** lê um valor e usa condições para informar se é positivo, negativo ou zero.
- **`L01_E10.PRW` — Ordenação de três valores:** lê três números e não continua se houver repetição. Caso sejam diferentes, compara e troca os valores necessários para exibi-los em ordem crescente.

## Exercícios 11 a 20

- **`L01_E11.PRW` — Formação de triângulo:** lê os três lados e verifica as três desigualdades do triângulo. Informa que há triângulo somente se cada lado for menor que a soma dos outros dois.
- **`L01_E12.PRW` — Resultado de partida:** recebe os nomes de dois times e seus gols; compara os placares e informa o vencedor ou empate.
- **`L01_E13.PRW` — Desconto por quantidade:** recebe produto, quantidade e preço unitário. Calcula subtotal e aplica desconto de 2% até 5 unidades, 3% de 6 a 10 e 5% acima de 10.
- **`L01_E14.PRW` — Divisão:** lê dividendo e divisor. Enquanto o divisor for zero, solicita outro valor; então divide e exibe o resultado.
- **`L01_E15.PRW` — Divisão com aviso:** também impede divisão por zero, mas apresenta um aviso explícito a cada tentativa inválida antes de pedir novamente o divisor.
- **`L01_E16.PRW` — Média de duas notas:** solicita duas notas, repetindo a entrada enquanto cada nota estiver fora do intervalo de 0 a 10. Depois calcula a média aritmética.
- **`L01_E17.PRW` — Médias em sequência:** calcula a média de duas notas válidas e pergunta se deve fazer novo cálculo. Repete enquanto a resposta for “S” ou “Sim”.
- **`L01_E18.PRW` — Contagem crescente:** usa `While` para contar de 1 a 10, juntando os números numa mensagem e também enviando cada um ao console com `ConOut`.
- **`L01_E19.PRW` — Contagem regressiva:** usa `While` para contar de 10 até 1 e envia cada número ao console. A variável de controle é decrementada a cada repetição.
- **`L01_E20.PRW` — Contagem com `For`:** percorre os valores de 101 a 110 e monta uma mensagem com a sequência.

## Exercícios 21 a 30

- **`L01_E21.PRW` — Contagem definida pelo usuário:** lê um inteiro positivo e mostra todos os números de 1 até ele usando `For`. Para valor não positivo, não apresenta a contagem.
- **`L01_E22.PRW` — Tabuada:** valida que o usuário informe um inteiro de 1 a 10 e, em seguida, exibe as multiplicações desse número por 1 até 10.
- **`L01_E23.PRW` — Contagem de negativos:** lê dez valores e incrementa um contador sempre que encontra um número menor que zero.
- **`L01_E24.PRW` — Valores dentro e fora do intervalo:** lê dez números e conta separadamente os que estão no intervalo inclusivo de 10 a 20 e os que estão fora dele.
- **`L01_E25.PRW` — Soma de dez valores:** solicita dez números, acumula cada um numa variável de soma e exibe o total.
- **`L01_E26.PRW` — Média de 15 a 100:** percorre todos os inteiros de 15 até 100, acumula a soma, conta os termos e divide a soma pela quantidade.
- **`L01_E27.PRW` — Sequências com dois contadores:** usa laços `For` aninhados para montar dez grupos. Cada grupo contém a sequência de 1 a 10.
- **`L01_E28.PRW` — Busca de nome:** armazena dez nomes em um array e pede um nome para procurar. A comparação ignora diferenças entre maiúsculas e minúsculas e espaços nas extremidades.
- **`L01_E29.PRW` — Multiplicação de vetor:** armazena dez números em um array, pede um multiplicador e cria outro array com cada valor multiplicado por ele.
- **`L01_E30.PRW` — Vetor em ordem inversa:** guarda dez números e percorre o array do último elemento ao primeiro para exibi-los na ordem inversa.

## Exercícios 31 a 40

- **`L01_E31.PRW` — Ordenação de vetor:** lê dez valores e ordena o array em ordem crescente, comparando pares vizinhos e trocando-os quando estão fora de ordem.
- **`L01_E32.PRW` — Comparação de vetores:** recebe dois arrays de 15 posições e conta quantas posições contêm o mesmo valor nos dois.
- **`L01_E33.PRW` — Valores repetidos:** lê 20 números e procura ocorrências repetidas. Exibe cada valor repetido e as posições em que aparece, evitando processar novamente posições já identificadas.
- **`L01_E34.PRW` — Idades e pesos:** recebe idade e peso de sete pessoas. Conta quantas pesam mais de 90 kg e calcula a média das idades.
- **`L01_E35.PRW` — Média até sentinela:** recebe idades até que seja digitado zero. Soma e conta apenas as idades positivas; se houver valores válidos, mostra a média.
- **`L01_E36.PRW` — Fatorial:** valida que a entrada seja um inteiro não negativo. Multiplica os inteiros de 2 até o valor informado; para zero, o resultado permanece 1.
- **`L01_E37.PRW` — Tabela de descontos:** percorre preços de R$ 500 a R$ 2.900 em intervalos de R$ 100. Para cada preço, calcula o percentual de desconto e o valor final.
- **`L01_E38.PRW` — Maiores de idade:** lê a idade de dez pessoas e conta quantas têm 18 anos ou mais.
- **`L01_E39.PRW` — Sorteio de nome:** monta uma lista fixa de cinco nomes, sorteia uma posição e apresenta o nome correspondente.
- **`L01_E40.PRW` — Folha de pagamento:** calcula o salário bruto por hora e horas trabalhadas. Define a faixa de IR conforme o bruto, calcula IR, INSS e FGTS, soma os descontos considerados e apresenta o salário líquido.
