# Lista 02 — explicação dos fontes

Este arquivo explica o objetivo e o fluxo principal de cada fonte da lista. Os programas seguem o estilo usado na Lista 01: recebem dados com `FWInputBox` e apresentam resultados com `MsgInfo` ou avisos com `MsgAlert`.

## Exercícios 01 a 06

- **`L02_E01.PRW` — Operações com dois números:** solicita dois números positivos e valida que ambos sejam maiores que zero. Depois apresenta soma, diferença (primeiro menos segundo), produto e quociente.
- **`L02_E02.PRW` — Consumo de viagem:** recebe tempo em horas e velocidade média em km/h. Multiplica os valores para obter a distância e divide por 12 para estimar os litros usados.
- **`L02_E03.PRW` — Consumo configurável:** repete o cálculo de distância do exercício anterior, mas também solicita o consumo do veículo em km/L. Valida que o consumo seja maior que zero antes de dividir a distância por ele.
- **`L02_E04.PRW` — Quadrado da diferença:** lê os inteiros A e B, calcula `(A - B)²` e mostra o resultado.
- **`L02_E05.PRW` — Conversão de dólar:** solicita a cotação do dólar em reais e a quantia disponível em dólares; multiplica os valores para obter o total em reais.
- **`L02_E06.PRW` — Divisibilidade por 2 e 3:** lê quatro inteiros. Para cada um, testa se o resto da divisão por 2 e por 3 é zero; exibe os que atendem às duas condições. Se nenhum atender, informa isso ao usuário.

## Exercícios 07 a 12

- **`L02_E07.PRW` — Duração do jogo:** solicita hora de início e de fim entre 0 e 23. Calcula fim menos início; se o resultado for negativo, soma 24 para considerar que o jogo terminou no dia seguinte.
- **`L02_E08.PRW` — Verificação de login:** compara o username informado com o valor fixo `admin`. Só quando o nome coincide verifica a senha fixa `advpl123`. Para qualquer falha, mostra a mesma mensagem genérica de usuário ou senha inválido.
- **`L02_E09.PRW` — Dias do mês:** recebe um mês de 1 a 12 e consulta um array com a quantidade de dias de cada mês. Fevereiro é considerado com 28 dias; entradas fora do intervalo são recusadas.
- **`L02_E10.PRW` — Menor e maior de cinco valores:** lê cinco inteiros. Inicializa menor e maior com o primeiro valor e atualiza cada um conforme os próximos valores são lidos.
- **`L02_E11.PRW` — Valores aleatórios:** gera e exibe 50 valores entre 10 e 99 com um laço `For`; em seguida faz uma segunda geração de 50 valores usando `While`.
- **`L02_E12.PRW` — Múltiplos de 3:** percorre os valores de 3 a 99 em passos de 3 e apresenta a sequência dos múltiplos existentes entre 1 e 100.

## Exercícios 13 a 18

- **`L02_E13.PRW` — Múltiplos até um limite:** solicita o número cujos múltiplos serão listados e o limite superior. Valida que os dois valores sejam positivos e usa um `For` com incremento igual ao número para percorrer os múltiplos até o limite.
- **`L02_E14.PRW` — Soma de pares ou ímpares:** recebe a quantidade de termos e a escolha `PAR` ou `IMPAR`. Começa em 2 ou 1, respectivamente, soma cada termo e avança de dois em dois.
- **`L02_E15.PRW` — Série de Fibonacci:** solicita quantos termos exibir. Começa pelos valores 0 e 1; a cada repetição mostra o termo atual e prepara o próximo somando os dois anteriores.
- **`L02_E16.PRW` — Cadastro de usuário e senha:** pede username, senha e confirmação. Verifica username com mais de cinco caracteres, senhas iguais, no mínimo seis caracteres e presença de maiúscula, dígito e símbolo antes de confirmar o cadastro.
- **`L02_E17.PRW` — Adivinhe o número, primeira parte:** sorteia um número de 0 a 100 e recebe um único palpite. Informa se o sorteado é maior, menor ou igual ao palpite.
- **`L02_E18.PRW` — Adivinhe o número completo:** sorteia um número de 0 a 100 e continua pedindo palpites até acertar, indicando a cada tentativa se o número é maior ou menor. Ao final, informa o total de tentativas e a classificação correspondente.
