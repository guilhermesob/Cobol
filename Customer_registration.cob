IDENTIFICATION DIVISION.
PROGRAM-ID. SCRIPT-AVANCADO.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 NOME-CLIENTE PIC X(50).
01 ENDERECO-CLIENTE PIC X(100).
01 TELEFONE-CLIENTE PIC X(15).
01 EMAIL-CLIENTE PIC X(50).

PROCEDURE DIVISION.

MAIN-PROCEDURE.

* Obtenha o nome do cliente.

ACCEPT NOME-CLIENTE FROM STDIN.

* Obtenha o endereço do cliente.

ACCEPT ENDERECO-CLIENTE FROM STDIN.

* Obtenha o telefone do cliente.

ACCEPT TELEFONE-CLIENTE FROM STDIN.

* Obtenha o e-mail do cliente.

ACCEPT EMAIL-CLIENTE FROM STDIN.

* Salve as informações do cliente em um arquivo.

OPEN OUTPUT FILE FILE-CLIENTES.

WRITE RECORD TO FILE-CLIENTES.

CLOSE FILE-CLIENTES.

* Imprima uma mensagem de confirmação.

DISPLAY "Informações do cliente salvas com sucesso.".

END-PROCEDURE.

FILE SECTION.

FD FILE-CLIENTES.
01 RECORD-CLIENTE.
02 NOME-CLIENTE PIC X(50).
02 ENDERECO-CLIENTE PIC X(100).
02 TELEFONE-CLIENTE PIC X(15).
02 EMAIL-CLIENTE PIC X(50).
