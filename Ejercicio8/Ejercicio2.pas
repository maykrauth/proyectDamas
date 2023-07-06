Program ordenamientoArreglos;
{$INCLUDE/IntroProg/Estructu}
const
    inicio= 1;
    final= 10;
type T_Caracteres: array[inicio.. final] of char ;
var CaracteresArray: T_Caracteres;
function posicionCaracter(caracteresArray, var frontera:integer):integer;
var i, p:integer
begin
    i:=frontera
    for p:=frontera + 1 to final do 
    if caracteresArray[p] < caracteresArray[i] then i:=p;
    posicionCaracter:=i;
end;
procedure intercambiar(var caracteresArray:T_Caracteres;frontera: integer, posicionCaracter:integer );
var aux: integer
begin
    aux:= caracteresArray[frontera];
    caracteresArray[frontera]:= caracteresArray[posicionCaracter];
    caracteresArray[posicionCaracter]:= aux;
end; 
procedure ordenamientoPosicion(caracteresArray:T_Caracteres);
var frontera:integer;
begin
    frontera:=inicio;
    for frontera to final -1 do 
    intercambiar (caracteresArray, frontera, posicionCaracter(caracteresArray, frontera))
end;
