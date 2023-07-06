program buscarLaPosicion;
const 
    inicio=1;
    final= 16;
    sinValor=-1;
type T_Elementos= Array[inicio .. final] of integer;
var Elementos : T_Elementos;

procedure inicializarArray(var elementos : T_Elementos);
var 
    indice:=integer;
begin
    indice= inicio;
    for indice to final do elementos[indice]:=sinValor;
end;
function BuscarPosicion(var elementos:T_Elementos; aux: integer):integer;
var
    indice: integer;
begin
    BuscarPosicion := -1; // NO ENCONTRADO
    indice:=inicio;
    encontrado:= false;
    while (indice <= final and not encontrado)  do 
        begin
            if elementos[indice] = aux then // ENCONTRADO
                begin
                    BuscarPosicion := indice;
                    encontrado := true;
                    indice:=indice +1;
                end
            else
                begin
                    indice:=indice +1;
                end;
        end

end;
