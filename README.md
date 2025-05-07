# Cadeia de Markov - A3 UNIFACS

### Informações do Projeto

- Curso: Ciência da Computação
- Semestre: 5º semestre (2025.1)
- Integrantes: [Edioelson Júnior A. B. Teixeira](https://github.com/DeveloperEdd), [Gabriel Silva Magalhães](https://github.com/Gabrielsilvamagalhaes) e [Hanspeter Dietiker](https://github.com/hanspeterdietiker)
- Disciplina: Estruturas Matemáticas
- Orientador: Wellington Lacerda
- Universidade: UNIFACS

Este projeto foi desenvolvido como parte de um trabalho acadêmico da disciplina de **Estruturas Matemáticas**, no curso de Ciência da Computação da Universidade Salvador (**UNIFACS**). O objetivo é implementar uma **Cadeia de Markov** utilizando a linguagem **Julia**.

#### Sumário

- [Descrição](#-descrição)
- [Tecnologias](#️-tecnologias)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Como executar](#️-como-executar)

## Descrição

Este projeto utiliza o conceito de Cadeias de Markov para modelar a progressão de uma doença ao longo do tempo. Uma cadeia de Markov é um **modelo matemático** que descreve um processo estocástico com a propriedade de memória limitada: o **próximo estado** do sistema depende apenas do **estado atual**, e não da sequência de eventos anteriores.

### Objetivo

A aplicação simula a evolução de uma população de pacientes entre diferentes estados de saúde, como:

- Saudável
- Infectado
- Recuperado

Com base em uma **matriz de transição** de probabilidades, o código:

- Representa os estados e suas transições probabilísticas;
- Calcula a distribuição de indivíduos entre os estados ao longo de n passos;
- Simula a evolução do sistema com gráficos e visualizações;
- Determina a distribuição estacionária, se houver, indicando o comportamento de longo prazo.

## Tecnologias

- **Linguagem**: [Julia](https://julialang.org/)
- **Versão utilizada**: 1.11.5

## Estrutura do Projeto

```bash

cadeia-de-markov-unifacs/
├── src/
│   ├── main.jl            # Arquivo principal
│   └── markov.jl          # Funções relacionadas à cadeia de Markov
├── Manifest.toml          # Versões dos pacotes
├── Project.toml           # Configuração do projeto
└── README.md              # Documentação do projeto
```

## Como executar

1. Certifique-se de ter o Julia instalado em sua máquina.
2. Clone este repositório:
   ```
   git clone git@github.com:DeveloperEdd/markov-chain-julia-cc.git
   ```
3. Ative o ambiente e instale as dependências:
   ```
   using Pkg
    Pkg.activate(".")
    Pkg.instantiate()
   ```
4. Execute o projeto:
   ```
   include("src/main.jl")
   ```

[Voltar para o topo](#informações-do-projeto)
