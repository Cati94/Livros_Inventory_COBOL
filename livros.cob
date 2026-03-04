       IDENTIFICATION DIVISION.
       PROGRAM-ID. LivroManager.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT LivrosFile ASSIGN TO 'livros.dat'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  LivrosFile.
       01  LivroRegistro.
           05 Titulo PIC X(50).
           05 Autor  PIC X(30).
           05 Ano    PIC 9(4).
           05 ISBN   PIC X(13).

       WORKING-STORAGE SECTION.
       01 Opcao        PIC 9.
       01 FimPrograma  PIC X VALUE 'N'.
           88 Fim VALUE 'S'.
       01 BuscaTitulo  PIC X(50).
       01 Encontrado   PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MainLoop.
           PERFORM UNTIL Fim
               DISPLAY "1 - Adicionar"
               DISPLAY "2 - Listar"
               DISPLAY "3 - Verificar"
               DISPLAY "4 - Sair"
               ACCEPT Opcao

               EVALUATE Opcao
                   WHEN 1 PERFORM AdicionarLivro
                   WHEN 2 PERFORM ListarLivros
                   WHEN 3 PERFORM VerificarLivro
                   WHEN 4 MOVE 'S' TO FimPrograma
               END-EVALUATE
           END-PERFORM
           STOP RUN.

       AdicionarLivro.
           OPEN EXTEND LivrosFile
           DISPLAY "Titulo:"
           ACCEPT Titulo
           DISPLAY "Autor:"
           ACCEPT Autor
           DISPLAY "Ano:"
           ACCEPT Ano
           DISPLAY "ISBN:"
           ACCEPT ISBN
           WRITE LivroRegistro
           CLOSE LivrosFile
           DISPLAY "Guardado."
           .

       ListarLivros.
           OPEN INPUT LivrosFile
           MOVE 'N' TO FimPrograma
           PERFORM UNTIL FimPrograma = 'S'
               READ LivrosFile
                   AT END MOVE 'S' TO FimPrograma
                   NOT AT END
                       DISPLAY Titulo " - " Autor " (" Ano ")"
               END-READ
           END-PERFORM
           CLOSE LivrosFile
           .

       VerificarLivro.
           DISPLAY "Titulo a verificar:"
           ACCEPT BuscaTitulo
           MOVE 'N' TO Encontrado
           OPEN INPUT LivrosFile
           MOVE 'N' TO FimPrograma
           PERFORM UNTIL FimPrograma = 'S'
               READ LivrosFile
                   AT END MOVE 'S' TO FimPrograma
                   NOT AT END
                       IF Titulo = BuscaTitulo
                           MOVE 'S' TO Encontrado
                           DISPLAY "Ja existe."
                       END-IF
               END-READ
           END-PERFORM
           CLOSE LivrosFile
           IF Encontrado = 'N'
               DISPLAY "Nao encontrado."
           END-IF
           .
