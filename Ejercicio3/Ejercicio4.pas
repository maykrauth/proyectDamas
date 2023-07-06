Program ModularizandoEj12Pco2;
{Indicar si la Parte  de una pila uno esta incluidaen otra pila conservando el mismo orden}
var 
    Parte, Grande, Descarte, Eliminar:Pila;
procedure ElementosIncuidos(var Pila1:Pila; Pila2, Descarte, Aux1:Pila);
begin
    while not PilaVacia(Pila1) and not PilaVacia(Pila2) do 
    begin
        if ((tope(Pila1)) <> (tope(Pila2)))   then
            Apilar(Descarte, desapilar(Pila2))
        else
            begin
                Apilar(Aux1, desapilar(Pila1));
                Apilar(Descarte, desapilar(Pila2));
            end;
    end;
    while not PilaVacia(Descarte) do 
        Apilar(Pila2, desapilar(Descarte));
end;
begin
    ReadPila(Parte);
    writeln('La pila grande debe de tener los mismo elemento que la pila parte en el mismo orden');
    ReadPila(Grande);
    InicPila(Descarte, '');
    InicPila(Eliminar, '');
    ElementosIncuidos(Parte,Grande, Descarte, Eliminar);
    writePila(Parte);
    writePila(Grande);
    writePila(Eliminar);
end.
