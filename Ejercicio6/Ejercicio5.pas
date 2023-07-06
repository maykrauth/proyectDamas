Program retornarMaximoNumero;
const
    inicio=1;
    Final=10;
    sinValor= -1;
type T_Numeros: array[inicio..final] of integer;
var Numeros: T_Numeros;
procedure inicializarArray(var numero: T_Numeros);
var indice:integer;
begin
    indice:=inicio;
    for indice do final of numeros[indice]:=sinValor
end;

function retorneUnValor(numero:T_Numeros):integer;
var 
    aux:integer;
    indice:integer;
begin
    aux:=inicio;
    indice:=inicio + 1;
    while indice <= final do 
        begin
            if elemento[indice] < aux then // ELEMENTO MENOR
            indice:=indice + 1
            else // MAYOR O IGUAL
                begin
                    aux:= elemento[indice];
                    indice:=indice +1;
                end
        
        end;
    retorneUnValor:=aux;
end;