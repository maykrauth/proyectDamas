Program PosicionVariables;
procedure PosicionDeUnaVariable( Origen:fila; var contador:Integer);
var Posicion:Fila;
    
begin
InicFila(Posicion, '');
    while not filaVacia(Origen) do 
    begin
        agregar(Posicion, extraer(Origen));
        contador:= contador + 1;
    end;
end;
var Origen:fila;
    contador:Integer;
begin
    Readfila(Origen);
    contador:= 0;
    PosicionDeUnaVariable(Origen, contador);
    writeln('longitud de una Variable es:', Origen);

end.
