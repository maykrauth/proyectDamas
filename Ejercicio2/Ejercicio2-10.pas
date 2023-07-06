Program UbicarElementoDadaFila;
{Ubicar el primer elemento de la fila DADA detras del primer elemento 12 y los demas elementos en el mismo orden.
Se supone que al menos hay un elementocon valor 12}
{$INCLUDE/IntroProg/Estructu}

var 
    DADA, ElementoInicial, Primeros, Ultimos:fila;
begin
writeln('La fila DADA debe de tener al menos un elemento con valor de 12');
ReadFila(DADA);
InicFila(ElementoInicial, '');
InicFila(Primeros, '');
InicFila(Ultimos, '');

if (not filavacia(DADA)) and (primero(DADA) <> 12) then
    begin
        Agregar(ElementoInicial, extraer(DADA));
        while (not Filavacia(DADA)) and (primero(DADA) <> 12) do
            Agregar(Primeros, extraer(DADA));
        while (not Filavacia(DADA)) do
            Agregar(Ultimos, extraer(DADA));
        
        while(not filavacia(Primeros)) do
            Agregar(DADA, extraer(Primeros));
        while (not filavacia(ElementoInicial)) do
            Agregar(DADA, extraer(ElementoInicial));
        while (not filavacia(Ultimos)) do
            Agregar(DADA, extraer(Ultimos));
        
    end;
Writefila(DADA);
end.