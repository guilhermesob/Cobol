       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRUD-EXAMPLE.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILE-NAME ASSIGN TO "dados.txt".
       
       DATA DIVISION.
       FILE SECTION.
       FD FILE-NAME.
       01 FILE-RECORD.
           05 ID-NUMBER      PIC 9(5).
           05 NAME           PIC X(30).
           05 AGE            PIC 9(3).
       WORKING-STORAGE SECTION.
       01 CHOICE          PIC X.
       01 RECORD-FOUND    PIC X VALUE 'N'.
       01 EOF-SWITCH      PIC X VALUE 'N'.
       01 TEMP-RECORD.
           05 TEMP-ID-NUMBER PIC 9(5).
           05 TEMP-NAME      PIC X(30).
           05 TEMP-AGE       PIC 9(3).
       
       PROCEDURE DIVISION.
       MAIN-PARAGRAPH.
           DISPLAY "Escolha uma operação (C/R/U/D/Q): ".
           ACCEPT CHOICE.
           PERFORM PROCESS-COMMAND UNTIL CHOICE = 'Q'.
           
       PROCESS-COMMAND.
           EVALUATE CHOICE
               WHEN 'C' PERFORM CREATE-RECORD
               WHEN 'R' PERFORM READ-RECORD
               WHEN 'U' PERFORM UPDATE-RECORD
               WHEN 'D' PERFORM DELETE-RECORD
               WHEN OTHER DISPLAY "Comando inválido!" END-EVALUATE.
       
       CREATE-RECORD.
           DISPLAY "Digite o número de ID: ".
           ACCEPT TEMP-ID-NUMBER.
           DISPLAY "Digite o nome: ".
           ACCEPT TEMP-NAME.
           DISPLAY "Digite a idade: ".
           ACCEPT TEMP-AGE.
           MOVE TEMP-ID-NUMBER TO ID-NUMBER.
           MOVE TEMP-NAME TO NAME.
           MOVE TEMP-AGE TO AGE.
           WRITE FILE-RECORD.
           DISPLAY "Registro criado!".
       
       READ-RECORD.
           DISPLAY "Digite o número de ID a ser lido: ".
           ACCEPT TEMP-ID-NUMBER.
           MOVE TEMP-ID-NUMBER TO ID-NUMBER.
           READ FILE-RECORD AT END DISPLAY "Registro não encontrado!" NOT AT END DISPLAY "Registro encontrado:" ID-NUMBER NAME AGE
           END-READ.
       
       UPDATE-RECORD.
           DISPLAY "Digite o número de ID a ser atualizado: ".
           ACCEPT TEMP-ID-NUMBER.
           MOVE TEMP-ID-NUMBER TO ID-NUMBER.
           READ FILE-RECORD AT END DISPLAY "Registro não encontrado!" NOT AT END
               DISPLAY "Digite o novo nome: ".
               ACCEPT TEMP-NAME.
               DISPLAY "Digite a nova idade: ".
               ACCEPT TEMP-AGE.
               MOVE TEMP-NAME TO NAME.
               MOVE TEMP-AGE TO AGE.
               REWRITE FILE-RECORD.
               DISPLAY "Registro atualizado!".
       
       DELETE-RECORD.
           DISPLAY "Digite o número de ID a ser excluído: ".
           ACCEPT TEMP-ID-NUMBER.
           MOVE TEMP-ID-NUMBER TO ID-NUMBER.
           READ FILE-RECORD AT END DISPLAY "Registro não encontrado!" NOT AT END
               DELETE FILE-RECORD.
               DISPLAY "Registro excluído!".
       
       QUIT-PARAGRAPH.
           CLOSE FILE-NAME.
           STOP RUN.
