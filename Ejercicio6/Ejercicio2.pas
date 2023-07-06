program SumaElementos;
{$INCLUDE/IntroProg/Estructu}
const
inicio= 1;
fin= 100;
sinValor= 0;
procedure inicializarArray(var elementosArray:arrayReales);
var indice:integer;
begin
    indice:= inicio;
    for indice to fin do 
        elementosArray[inicio]:=sinValor;
end;
procedure agregarElementos(var frontera:integer; var elementosArray:arrayReales);
var indice:integer;

begin
    indice:=inicio;
    while indice <= fin and variable <> 0 do
    begin
        readLn(variable)
        elementosArray[indice] := variable
        //readLn(elementosArray[indice]);
        indice:= indice + 1 ;
        frontera := frontera + 1;
    end;
    for frontera:= 1 to indice do 
        write(elementosArray[frontera])
end;
procedure SumaElementos(frontera:integer; var elementosArray:agregarElementos);
var indice:integer;
    resultadoParcial:real;
begin
    indice:= inicio;
    while indice <= frontera do
    resultadoParcial:=0 + elementosArray[indice];


end;

type
arrayReales = elementos:Array[inicio..Fin] of real;  