Program OrdenarFilaCreciente;
{Intercalar dos Fila Ordenadas de forma creciente, dejando el resultado en una fila tambien ordenada creciente}
{$INCLUDE/IntroProg/Estructu}
var 
    Ordenada1, Ordenada2, OrdenadaFinal:fila;
procedure IntercalarFilas(var PrimeraFila:Fila; var SegundaFila:fila; var UltimaFila:fila);
begin
    while not FilaVacia(PrimeraFila) and not FilaVacia(SegundaFila) do
    begin
        if primero(PrimeraFila) >= Primero(SegundaFila) then
            agregar(UltimaFila, extraer(PrimeraFila))
        else
            agregar(UltimaFila, extraer(SegundaFila));
    end;
    while not FilaVacia(PrimeraFila) do
    agregar(UltimaFila, extraer(PrimeraFila));
end;

begin
    writeln('la fila debe estar ordenada de forma creciente');
    ReadFila(Ordenada1);
    ReadFila(ordenada2);
    InicFila(OrdenadaFinal, '');
    IntercalarFilas(Ordenada1, Ordenada2, OrdenadaFinal);
    IntercalarFilas(Ordenada2, Ordenada1, OrdenadaFinal);
    writeFila(Ordenada1);
    writeFila(Ordenada2);
    writeFila(OrdenadaFinal);
end.