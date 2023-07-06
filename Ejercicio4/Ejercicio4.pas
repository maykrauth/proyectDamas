Program DistribucionSocios;
{$INCLUDE/IntroProg/Estructu}
procedure CantElementos(FilaAnalizada:fila; Total:Integer);
var
    Aux:fila;
begin
    whilenot filaVacia(FilaAnalizada) do 
    begin
        agregar(Aux, extraer(FilaAnalizada));
        Total:=Total + 1;
    end;
end;
var
    cheques, socios:Fila;
    Personas, Importe:Integer;
    PlataSocial:Real;
begin
    Readfila(cheques);
    Readfila(socios);
    CantElementos(socios, Personas);
    CantElementos(cheques, Importe);
    PlataSocial:=Importe/Personas;
    writeln('La plata que recibira casa socio sera:', PlataSocial);
end.