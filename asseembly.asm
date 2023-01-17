name "Operazione.asm"
;

org 100h      

jmp start  ; salto incondizionato

; ----------    zona dati ---------------------------------


MsgUno DB  "Inserisci primo valore $"       
MsgDue DB  13,10,"Inserisci secondo valore $"     
MsgRis DB  13,10,"Risultato somma --> $"    
MsgDif DB  13,10,"Risultato differenza --> $"
Uno    DB  ?                                          
Due    DB  ?  
RISSOM DB  ?
RISDIF DB  ?



; ----------    zona codice -------------------------------

start: 
    
    MOV DX, Offset MsgUno ; In DX l'indirizzo del messaggio
    MOV AH,9        ; AH<--9 Funzione per visualizzare una stringa
    INT 21H         ; Richiama Interrupt 
    
    MOV AH,1        ; AH<--1 Funzione per acquisire un crt 
    INT 21H         ; Interrupt con varie funzioni, specificate con AH
                    ; In AL codice Ascii del crt premuto
    SUB AL, 30h     ; Sottraggo il codice ASCII dell 0
    MOV Uno, AL     ; Memorizzo il dato in memoria    
    
    
    MOV DX, Offset MsgDue ; In DX l'indirizzo del messaggio
    MOV AH,9        ; AH<--9 Funzione per visualizzare una stringa
    INT 21H         ; Richiama Interrupt 
    
    MOV AH,1        ; AH<--1 Funzione per acquisire un crt 
    INT 21H         ; Interrupt con varie funzioni, specificate con AH
                    ; In AL codice Ascii del crt premuto
    SUB AL, 30h     ; Sottraggo il codice ASCII dell 0
    MOV Due, AL     ; Memorizzo il dato in memoria
    
    MOV AL,Uno      ; AL destinazione    
    MOV BL, Due
    ADD AL,BL       ; AL <- AL+BL   
    MOV RISSOM,AL   ; salvo risultato     
    
    MOV DX, Offset MsgRis ; In DX l'indirizzo del messaggio
    MOV AH,9        ; AH<--9 Funzione per visualizzare una stringa
    INT 21H         ; Richiama Interrupt 
    
    MOV DL, RISSOM  ; Prelevo il risultato
    ADD DL,30h      ; Aggiungo 30h per ottenere codice ASCII
    MOV AH, 2       ; AH<--2 Funzione per visualizzare un carattere
    INT 21H         ; 
      
    MOV AL,Uno
    MOV BL, Due
    SUB AL,BL       ; AL <- AL-BL 
    MOV RISDIF,AL  
    
    MOV DX, Offset MsgDif ; In DX l'indirizzo del messaggio
    MOV AH,9        ; AH<--9 Funzione per visualizzare una stringa
    INT 21H         ; Richiama Interrupt 
    
    MOV DL, RISDIF  ; Prelevo il risultato
    ADD DL,30h      ; Aggiungo 30h per ottenere codice ASCII
    MOV AH, 2       ; AH<--2 Funzione per visualizzare un carattere
    INT 21H      

ret

