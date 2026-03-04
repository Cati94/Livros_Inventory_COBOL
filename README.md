# Sistema de Catálogo de Livros (COBOL)

![Logo](https://github.com/Cati94/Livros_Inventory_COBOL/blob/main/book.png)


Aplicação de gestão de livros com armazenamento persistente em ficheiro
sequencial.

------------------------------------------------------------------------

## 1. Objetivo

Implementar um sistema de registo e consulta de livros utilizando:

-   Ficheiros sequenciais
-   Estruturas de registo
-   Controlo procedural modular

------------------------------------------------------------------------

## 2. Arquitetura

Estrutura COBOL:

    IDENTIFICATION DIVISION
    ENVIRONMENT DIVISION
    DATA DIVISION
    PROCEDURE DIVISION

------------------------------------------------------------------------

## 3. Estrutura de Dados

    FD LivroFile.
    01 LivroRecord.
       05 CodigoLivro     PIC 9(5).
       05 Titulo          PIC X(50).
       05 Autor           PIC X(40).
       05 Ano             PIC 9(4).

  Campo         Tipo       Tamanho   Função
  ------------- ---------- --------- ----------------
  CodigoLivro   Numérico   5         Identificador
  Titulo        Texto      50        Nome do livro
  Autor         Texto      40        Autor
  Ano           Numérico   4         Ano publicação

------------------------------------------------------------------------

## 4. Fluxo Operacional

Menu típico:

1.  Adicionar livro
2.  Listar livros
3.  Verificar existência
4.  Sair

Estrutura:

    PERFORM UNTIL Opcao = 0
        PERFORM MostrarMenu
        EVALUATE Opcao
            WHEN 1 PERFORM AdicionarLivro
            WHEN 2 PERFORM ListarLivros
            WHEN 3 PERFORM VerificarLivro
        END-EVALUATE
    END-PERFORM.

------------------------------------------------------------------------

## 5. Persistência

Ficheiro: `livros.dat`

Características:

-   Acesso sequencial
-   Complexidade O(n) para pesquisa
-   Sem indexação

------------------------------------------------------------------------

## 6. Compilação

Requisitos: - GNUCobol 3.x ou superior

Compilar:

    cobc -x livros.cob -o livros

Executar:

    ./livros

------------------------------------------------------------------------

## 7. Limitações

-   Sem remoção
-   Sem edição
-   Sem chave única garantida
-   Escalabilidade limitada

------------------------------------------------------------------------

## 8. Evolução Técnica Recomendada

-   Migração para ficheiro INDEXED
-   Definição de chave primária
-   Implementação de remoção lógica
-   Validação estruturada de input
-   Separação de lógica de negócio

------------------------------------------------------------------------

## 9. Finalidade

Projeto académico focado em:

-   Sintaxe COBOL
-   Modelação de registos
-   Persistência em ficheiro
-   Controlo de fluxo estruturado
