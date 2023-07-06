Program InsertarElementos;

{La fila Dada se inicializa de forma ordenada y el tope  de una pila debe insertarse en la fila Dada de forma tan que siga ordenada}

{$INCLUDE/IntroProg/Estructu}

var 
    DADA, ORDENADA:fila;
    ELEMENTOS:pila;


begin
    writeln ('La fila DADA deben estar ordenados de menor a mayor');
    ReadFila(DADA);
    writeln('La pila de ELEMENTOS debe tener al menos un número');
    ReadPila(ELEMENTOS);
    InicFila(ORDENADA,'');
    
    while not FilaVacia(DADA) do
        begin
            if not PilaVacia(ELEMENTOS) then
                begin
                    if Tope(ELEMENTOS) <= Primero(DADA) then
                        agregar(ORDENADA, desapilar(ELEMENTOS))
                    else
                        agregar(ORDENADA, extraer(DADA))
                end
            else
                begin
                    agregar(ORDENADA, extraer(DADA));
                end;
        end;
    {En el caso que el tope sea el mayor elemento se utilizara este if}
    if not PilaVacia(ELEMENTOS) then 
        agregar(ORDENADA, desapilar (ELEMENTOS));
    
    writeln('Fila auxiliar ordenada');
    writeFila(ORDENADA);
    
    while not filaVacia(ORDENADA) do
        begin
            agregar(DADA, extraer(Ordenada));
        end;
    writeln('Fila DADA');
    WriteFila(DADA);
end.