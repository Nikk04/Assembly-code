name "somma"
;somma di due  valori di un byte
ORG  100h 
JMP start 
;---------zona dati-------------
Primo DB 10h
Secondo DB 20    
;-------------------------------
start:
MOV  AL, Primo
MOV  BL, Secondo                                 
                           
ADD  AL,BL
RET


                                           
                              