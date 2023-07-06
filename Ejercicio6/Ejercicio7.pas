Program invertirArray;
const 
    inicio=1;
    final=10;
    sinValor=-1;
type T_Number: Array[inicio .. final] of integer;
var Number:T_Number;
procedure inicializarArray(var number:T_Number);
var indice: integer;
begin
    indice:= inicio;
    for indice do final of number[indice]:=sinValor
end;
procedure invertirArray(var number:T_Number);
var extraernum:integer;
    indice:integer;
    final:integer;
begin
    indice:=inicio;
    max:=final;
    while indice <= maxInd do 
    begin
        aux:=number[maxInd];
        number[final]:=number[indice];
        number[indice]:=aux;
        indice:=indice +1;
        maxInd:= maxInd -1;
    end;
end;