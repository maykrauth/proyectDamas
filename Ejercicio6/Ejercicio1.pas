Program cargarCaracteres;
{$INCLUDE/IntroProg/Estructu}
const 
    inicio = 1;
    fin = 50;
    sinValor= '*';
procedure inicializarArray (var elementos:Array of char);
var
    indice: integer;
begin
    indice:= 1;
    while indice <= fin do 
    begin
        elementos[indice]:= '*';
        write(elementos[indice]);
        indice:= indice + 1;
    end;
end;
procedure cargarElemento(var elementos:Array of char);
var
    aux:char;
    indice:integer;
begin
    aux:= 'a';
    indice:=inicio;
    while (indice <= fin) and (aux <> '*') do
        begin
            writeln('Ingrese un caracter');
            readLn(aux);
            elementos[indice] := aux;
            write(elementos[indice]);
            indice:= indice +1;
        end;
end;
var elementos : Array[inicio..fin] of char;
begin
    writeln('inicializar array... ');
    inicializarArray(elementos);
    writeln('Mostrar el numero Array ');
    cargarElemento(elementos);
end.