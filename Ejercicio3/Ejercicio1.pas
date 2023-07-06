Program TrabajandoConProcedu;
{Codificar un procedimiento del ejercicio 10 del practico 1 Eliminar segun tope de modelo}
{$INCLUDE/IntroProg/Estructu}
var
    Dada, Modelo, Aux ,Aux2:Pila;
Procedure VerificarTope(var Dada:Pila; Modelo:Pila; Aux:Pila; var Aux2:Pila);
begin
    while not PilaVacia(Dada) and not PilaVacia(Modelo) do
        if tope(Dada) = tope(Modelo) then
            apilar(Aux, desapilar(Dada))
        else
        begin
            apilar(Aux2, desapilar(Dada));
        end;
end;
Procedure PasaPila(PilaUno:pila; var PilaDos:Pila);
begin
    while not PilaVacia(PilaUno) do
        apilar(PilaDos, desapilar(PilaUno));
end;
begin
    ReadPila (Dada);
    ReadPila(Modelo);
    InicPila(Aux, '');
    InicPila(Aux2, '');
    VerificarTope (Dada,Modelo, Aux, Aux2);
    PasaPila(Aux2,Dada);
    writePila(Dada);
    WritePila(Modelo);
    
end.