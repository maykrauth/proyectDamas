Program SumaDePosiciones;
{$INCLUDE/IntroProg/Estructu}
{Dada la Fila de Datos y dos variables Posición y Valor debe implementar un procedimiento que actualice 
la fila de Datos de manera que al numero existente en la posicion lo incremente con valor}
procedure pasarFila(Valores, Posiciones:Fila; var Valor:Integer; var Posicion:Integer);
begin
    if not filaVacia(Valores) and not filaVacia(Posiciones) then 
        begin
            Valor:=extraer(Valores);
            Posicion:= extraer(Posiciones);
        end;
end;
procedure longitudValor(Valor, Posicion:Integer; Var Datos:Fila);
var contador:Integer;
    Aux:Fila;
    nuevoValor:Integer;
begin
    InicFila(Aux, '');
    nuevoValor:=0;
    contador := 0;
    while not filaVacia(Datos) do 
        begin
            contador:= contador + 1;
            if (contador = Posicion) then
                begin
                    nuevoValor := (extraer(Datos) + valor);
                    agregar(Aux, nuevoValor);
                end
            else
                agregar(Aux, extraer(Datos));
        end;
    while not filaVacia(Aux) do 
        agregar(Datos, extraer(Aux));
end;

var Valor, Posicion :Integer;
    Valores, Posiciones, Datos:Fila;
begin
    Readfila(Datos);
    Readfila(Posiciones);
    Readfila(Valores);
    
    while(aca no se que poner) do 
    begin
        pasarFila(Valores, Posiciones, valor, posicion);
        writeln(Valor);
        writeln(Posicion);
        longitudValor(Valor, Posicion, Datos);
    end;
    writeln('nueva Fila');
    writeFila(Datos);
end.