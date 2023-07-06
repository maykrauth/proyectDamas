Program IgualdadElementoFila;
{Vamos a tener una fila ORIGEN y una fila MODELO, tal que si existe un elemento igual al del modelo se lo ubique al princio de la estructura}

{$INCLUDE/IntroProg/Estructu}

var
    ORIGEN, MODELO, Auxiliar, Descarte: Fila;
    
begin
ReadFila(ORIGEN);
writeln('La fila MODELO debe inicializarse con un solo elemento');
ReadFila(MODELO);
InicFila(Auxiliar, '');
InicFila(Descarte, '');
while not Filavacia(ORIGEN)  do
    begin
        if not Filavacia(MODELO) then
            begin
                if Primero(ORIGEN) = Primero(MODELO) then
                    agregar(Auxiliar, extraer(MODELO))
                else
                    agregar(Descarte, extraer(ORIGEN));
            end
        else
            agregar(Descarte, extraer(ORIGEN));
    end;
if not filaVacia(Auxiliar) then
        agregar(ORIGEN, extraer(Auxiliar));
while not filaVacia(Descarte) do
    agregar(ORIGEN, extraer(Descarte));
writeFila(ORIGEN);
end.