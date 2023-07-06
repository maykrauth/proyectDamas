Program ConcatenarDosPilas;
{Concatenar2 pilas de modo, que el que posea menos elementos quede abajo}
{$INCLUDE/IntroProg/Estructu}
var 
    PrimerPila, SegundaPila, Pila1, Pila2, Resultado: pila;
begin
    ReadPila(PrimerPila);
    ReadPila(SegundaPila);
    InicPila(Resultado, '');
    InicPila(Pila1, '');
    InicPila(Pila2, '');
    while (not PilaVacia(PrimerPila)) and (not PilaVacia(SegundaPila)) do
        begin
            Apilar(Pila1, desapilar(PrimerPila));
            Apilar(Pila2, desapilar(SegundaPila));
        end;
    if PilaVacia(PrimerPila) then
        begin
            while not PilaVacia (Pila1) do 
                Apilar(Resultado, desapilar(Pila1));
            while not PilaVacia(SegundaPila) do
                Apilar(Pila2, desapilar(SegundaPila));
            while not PilaVacia(Pila2) do
                Apilar(Resultado, desapilar(Pila2));
        end
    else
        begin
            while not PilaVacia (Pila2) do 
                Apilar(Resultado, desapilar(Pila2));
            while not PilaVacia(PrimerPila) do
                Apilar(Pila1, desapilar(PrimerPila));
            while not PilaVacia(Pila1) do
                Apilar(Resultado, desapilar(Pila1));
        end;
    writePila(Resultado);
end.