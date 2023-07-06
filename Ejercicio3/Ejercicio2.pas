Program EliminarElementosRepetidos;
{Como lo Indica su nombre de una Pila DADA sacar del mismo todos los elementos que se repitan}
{$INCLUDE/IntroProg/Estructu}
var
    Dada, Descarte, Eliminar, Aux:Pila;
procedure BuscarElementosRepetidos(var Dada:Pila; var Aux:Pila;var Aux2:Pila; var Aux3:pila);
begin
    while not PilaVacia (Dada) do 
    begin
        apilar(Aux, desapilar(Dada));
        while not PilaVacia(Dada) and not PilaVacia(Aux) do
            begin
                if tope(Aux)= tope(Dada) then
                    begin
                    apilar(Aux2, desapilar(Dada));
                
                    end
                else 
                    apilar(Aux3, desapilar(Dada));
            end;
        while not PilaVacia(Aux3) do
            apilar(Dada, desapilar(Aux3));
    end;

end;
begin
    ReadPila(Dada);
    InicPila(Aux, '');
    InicPila(Descarte, '');
    InicPila(Eliminar, '');
    BuscarElementosRepetidos(Dada, Aux, Eliminar, Descarte);
    WritePila(Dada);
    writePila(Descarte);
    WritePila(Aux);
    writePila(Eliminar);
end.