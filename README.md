# Simulador de Cadeia de Markov - Projeto A3 UNIFACS

### Informações do Projeto

- **Curso**: Ciência da Computação
- **Semestre**: 5º semestre (2025.1)
- **Integrantes**:
  - [Edioelson Júnior A. B. Teixeira](https://github.com/edd-araujo)
  - [Gabriel Silva Magalhães](https://github.com/Gabrielsilvamagalhaes)
  - [Hanspeter Dietiker](https://github.com/hanspeterdietiker)
- **Disciplina**: Estruturas Matemáticas
- **Orientador**: Wellington Lacerda
- **Universidade**: Universidade Salvador - UNIFACS

Este projeto foi desenvolvido como parte de um trabalho acadêmico da disciplina de **Estruturas Matemáticas**, no curso de Ciência da Computação da Universidade Salvador - **UNIFACS**. O objetivo é implementar uma **Cadeia de Markov** utilizando a linguagem **Julia**.

#### Sumário

- [Descrição do Projeto](#descrição-do-projeto)
- [Modelos Implementados](#modelos-implementados)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Instruções de Instalação e Execução](#instruções-de-instalação-e-execução)

## Descrição do Projeto

Este projeto consiste em um simulador de Cadeia de Markov com duas funcionalidades principais:

1.  **Modelo de Progressão de Doença (Gripe/Influenza):** Simula a progressão da gripe/influenza em uma população, analisando a dinâmica da doença ao longo do tempo.
2.  **Modelo Personalizado (NxN):** Permite ao usuário criar e simular uma Cadeia de Markov genérica de tamanho NxN, definindo todos os parâmetros da simulação.

Uma cadeia de Markov é um **modelo matemático** que descreve um processo estocástico com a propriedade de memória limitada: o **próximo estado** do sistema depende apenas do **estado atual**, e não da sequência de eventos anteriores.

## Modelos Implementados

### 1. Modelo de Progressão de Doença (Gripe/Influenza)

Este modelo simula a progressão da gripe/influenza em uma população de 1000 indivíduos, com o objetivo de analisar a dinâmica da doença ao longo do tempo. A simulação é realizada por um período de 30 dias, com relatórios apresentados a cada 5 dias para acompanhar a evolução da doença.

O modelo considera quatro estados possíveis:

- **Suscetível (S):** Indivíduos que ainda não foram infectados pelo vírus.
- **Infectado (I):** Indivíduos que estão atualmente infectados com a gripe.
- **Recuperado (R):** Indivíduos que se recuperaram da gripe.
- **Complicações (C):** Indivíduos que desenvolveram alguma complicação decorrente da doença.

### 2. Modelo Personalizado (NxN)

Este modelo permite que o usuário crie e simule uma Cadeia de Markov genérica de tamanho NxN, onde N é o número de estados. O usuário tem controle total sobre:

- **Matriz de Transição:** Define o número de estados (N) para a matriz de transição NxN.
- **Probabilidade de Transição:** Especifica as probabilidades de transição entre cada par de estados.
- **Número de Iterações:** Define o número de passos na simulação.
- **Número de Entidades:** Define quantas entidades serão simuladas simultaneamente.

## Tecnologias Utilizadas

- **Linguagem:** [Julia](https://julialang.org/)
- **Versão Utilizada:** 1.11.5
- **Pacotes:**
  - Distributions.jl
  - LinearAlgebra
  - Printf
  - StatsBase
  - Documenter

## Estrutura do Projeto

```bash
markov-chain-julia-cc/
├── src/
│   ├── main.jl                       # Arquivo principal
│   ├── influenza_model.jl            # Modelo de progressão da gripe/influenza
│   ├── custom_markov_chain_model.jl  # Modelo personalizado (NxN)
│   └── simulation.jl                 # Funções de simulação
├── LICENSE                           # Licensa MIT
├── Manifest.toml                     # Versões dos pacotes
├── Project.toml                      # Configuração do projeto
└── README.md                         # Documentação do projeto
```

## Instruções de Instalação e Execução

1. **Pré-requisitos:**
   - [Julia 1.11.5](https://julialang.org/install/) instalado.
   - [Git](https://git-scm.com/downloads) instalado.
2. **Clone o repositório**:

   ```bash
   git clone git@github.com:edd-araujo/markov-chain-julia-cc.git
   cd markov-chain-julia-cc
   ```

3. **Instale as dependências:**

   ```bash
   julia --project
   ```

   No REPL do Julia, pressione `]` para entrar no modo de gerenciamento de pacotes e execute:

   ```bash
   instatiate
   ```

   Se o comando acima não funcionar, adicione as dependências manualmente:

   ```bash
   add Distributions Documenter LinearAlgebra Printf StatsBase
   ```

4. **Execute o projeto:**

   ```bash
   julia src/main.jl
   ```

   Ou se ainda estiver no REPL do Julia:

   ```bash
   include("src/main.jl")
   ```

[Voltar para o topo](#simulador-de-cadeia-de-markov---projeto-a3-unifacs)
