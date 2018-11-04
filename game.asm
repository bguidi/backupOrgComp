; Hello World - Escreve mensagem armazenada na memoria na tela
;não rodar variavel no meio do codigo!!!!
;loadi storei em vetor!
;sempre que vc precisar usar mais registradores, chame outra função
;nome da função dps underscore no caso de estar dentro de uma função


; ------- TABELA DE CORES -------
; adicione ao caracter para Selecionar a cor correspondente

; 0 branco							0000 0000\
; 256 marrom						0001 0000
; 512 verde							0010 0000
; 768 oliva							0011 0000
; 1024 azul marinho					0100 0000
; 1280 roxo							0101 0000
; 1536 teal							0110 0000
; 1792 prata						0111 0000
; 2048 cinza						1000 0000
; 2304 vermelho						1001 0000
; 2560 lima							1010 0000
; 2816 amarelo						1011 0000
; 3072 azul							1100 0000
; 3328 rosa							1101 0000
; 3584 aqua							1110 0000
; 3840 branco						1111 0000



jmp main

posNave: var #1
mensagem: var #21
static mensagem + #0, #'A'
static mensagem + #1, #'A'
static mensagem + #2, #'A'
static mensagem + #3, #'a'
static mensagem + #4, #'B'
static mensagem + #5, #'C'
static mensagem + #6, #'E'
static mensagem + #7, #'N'
static mensagem + #8, #'T'
static mensagem + #9, #'E'
static mensagem + #10, #'R'
static mensagem + #11, #' '
static mensagem + #12, #'T'
static mensagem + #13, #'O'
static mensagem + #14, #' '
static mensagem + #15, #'S'
static mensagem + #16, #'T'
static mensagem + #17, #'A'
static mensagem + #18, #'R'
static mensagem + #19, #'T'
static mensagem + #20, #'\0'

telalinha00 : string "      _____________________             "
telalinha01 : string "   ___                     ___          "
telalinha02 : string " _+                           +_        "
telalinha03 : string "|                               |       "
telalinha04 : string "|_                             _|       "
telalinha05 : string "  +___                     ___+         "
telalinha06 : string "      _____________________             "
telalinha07 : string "      -   |           |                 "
telalinha08 : string "   -      |           |    -            "
telalinha09 : string "          |           |                 "
telalinha10 : string "          |   -       |      -          "
telalinha11 : string "    -     |       -   |                 "
telalinha12 : string "          |           |        -        "
telalinha13 : string "          |           |                 "
telalinha14 : string "          |           |                 "
telalinha15 : string "          |           |         -       "
telalinha16 : string "     -    |           |    -       -    "
telalinha17 : string "  -   -   |           |         -       "
telalinha18 : string "                                        "
telalinha19 : string "                                        "
telalinha20 : string "                                        "
telalinha21 : string "                                        "
telalinha22 : string "                                        "
telalinha23 : string "                                        "
telalinha24 : string "                                        "
telalinha25 : string "                                        "
telalinha26 : string "                                        "
telalinha27 : string "                                        "
telalinha28 : string "                                        "
telalinha29 : string "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" ; \ não funciona :(


tela1linha00 : string "                                        "
tela1linha01 : string "                                        "
tela1linha02 : string "                                        "
tela1linha03 : string "                                        "
tela1linha04 : string "                                        "
tela1linha05 : string "                                        "
tela1linha06 : string "                                        "
tela1linha07 : string "                                        "
tela1linha08 : string "                                        "
tela1linha09 : string "                                        "
tela1linha10 : string "                                        "
tela1linha11 : string "                                        "
tela1linha12 : string "                                        "
tela1linha13 : string "                                        "
tela1linha14 : string "            0       0                   "
tela1linha15 : string "            |       |                   "
tela1linha16 : string "             |     |                    "
tela1linha17 : string "              |___|                     "
tela1linha18 : string "          WWW |   | WWW                 "
tela1linha19 : string "          | |( > < )| |                 "
tela1linha20 : string "          | | | - | | |                 "
tela1linha21 : string "          | |__| |__| |                 "
tela1linha22 : string "           |         |                  "
tela1linha23 : string "            |       |                   "
tela1linha24 : string "            |       |                   "
tela1linha25 : string "            |  ___  |                   "
tela1linha26 : string "            | |   | |                   "
tela1linha27 : string "           | |     | |                  "
tela1linha28 : string "          | |       | |                 "
tela1linha29 : string "                                        "

;jogo da nave tem td pronto
;---- Inicio do Programa Principal -----

main:
	call ApagaTela
	loadn r0, #35		; Posicao na tela onde a mensagem sera' escrita
	
	loadn r1, #tela1linha00	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #512		; Seleciona a COR da Mensagem
			
	call ImprimeTela
		
	loadn R1, #telalinha00	; Endereco onde comeca a primeira linha do cenario!!
	loadn R2, #512  			; cor branca!
	call ImprimeTela
	
	halt
	
;---- Fim do Programa Principal -----
	
;---- Inicio das Subrotinas -----

ApagaTela:
	push r0
	push r1
	
	loadn r0, #1200
	loadn r1, #' '
	
		ApagaTela_Loop:
			dec r0
			outchar r1, r0
			jnz ApagaTela_Loop
	pop r1
	pop r0
	rts
	
	;imprime tela: call imprimestr, adiciona posicao em 40, incrementa o ponteiro para o comeco da prox linha
	;compara com 1200 (r5)
	;jne imprimetelaloop
	;números randomicos: escrever string para usar
	
ImprimeTela:
	push r0 
	push r1 ;protege valores definidos no inicio
	push r2
	push r3
	push r4
	push r5
	
	loadn r0, #0
	loadn r3, #40
	loadn r4, #41
	loadn r5, #1200
	
	ImpremeTela_Loop:
		call Imprimestr
		add r0, r0, r3
		add r1, r1, r4
		cmp r0, r5
		jne ImpremeTela_Loop
	
	pop r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts
	
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

   ImprimeStr_Loop:	
		loadi r4, r1
		cmp r4, r3		; If (Char == \0)  vai Embora
		jeq ImprimeStr_Sai
		add r4, r2, r4	; Soma a Cor
		outchar r4, r0	; Imprime o caractere na tela
		inc r0			; Incrementa a posicao na tela
		inc r1			; Incrementa o ponteiro da String
		jmp ImprimeStr_Loop
	
   ImprimeStr_Sai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
	
	; push - alocar variaveis
	; pop desalocar
	;r2 cor ; ro pos ; r3 /0 r4 endereco
	;somar 41 para proxima string