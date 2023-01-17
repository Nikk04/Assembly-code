name "Operazione.asm"
;

org 100h      

jmp start  ; salto incondizionato

; ----------    zona dati ---------------------------------


MsgValori DB  13,10,"Inserisci un valore --> $"       

MsgSomma DB  13,10,"Risultato somma --> $"  

RISSOM DB  ?




; ----------    zona codice -------------------------------

start:  
        MOV CX,5        ; numero di iterazioni 
        MOV BL,0

CICLO:  MOV DX, Offset MsgValori ; In DX l'indirizzo del messaggio
        MOV AH,9        ; AH<--9 Funzione per visualizzare una stringa
        INT 21H         ; Richiama Interrupt 
                    
        MOV AH,1        ; AH<--1 Funzione per acquisire un crt 
        INT 21H         ; Interrupt con varie funzioni, specificate con AH
                        ; In AL codice Ascii del crt premuto      
        
        SUB AL,30h
        ADD BL,AL       ; DL funge da accumulatore dei 5 valori
        
        DEC CX          ; DECREMENTA CX
        CMP CX,0        ; SE non è ancora 0 salta a CICLO
        JNE CICLO       ; QUINDI salta se non uguale  
        
        MOV RISSOM,BL
            
        MOV DX, Offset MsgSomma ; In DX l'indirizzo del messaggio
        MOV AH,9        ; AH<--9 Funzione per visualizzare una stringa
        INT 21H         ; Richiama Interrupt 
        
        MOV DL, RISSOM  ; Prelevo il risultato
        ADD DL,30h      ; Aggiungo 30h per ottenere codice ASCII
        MOV AH, 2       ; AH<--2 Funzione per visualizzare un carattere
        INT 21H         ; Richiama Interrupt
        
ret

