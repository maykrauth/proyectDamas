Program DeclaracionDeParametros;
{a) Comparar el tamaño de las dos pilas
b)saber si una pila esta contenia en otra
c)Dada dos pilas, concatenarlas en una nueva pila 
d)Devolver en pila alreves los elementos de dada invertidos}
{$INCLUDE/IntroProg/Estructu}
var Aux1, Aux2, Pila1, Pila2, Igual, Mayor, Menor:pila;
procedure CompararDosPilas(Pila, Pila2, Aux1, Aux2: pila; var Igual, Mayor, Menor:Pila );
begin
    while not pilaVacia(Pila) and not pilaVacia(Pila2) do
        begin
            Apilar(Aux1, desapilar(Pila));
            Apilar(Aux2, desapilar(Pila2));
        end;
    if pilaVacia(Pila) and PilaVacia(Pila2) then
        Apilar(Igual, 0)
    else
        begin
            writePila(Pila);
            if PilaVacia(Pila) then
                begin
                    Apilar(Menor, 1);
                    Apilar(Mayor, 2);
                end
            else
                begin
                    Apilar(Mayor, 1);
                    Apilar(Menor, 2);
                end;
        end;
end;
procedure (params);
begin
    
end;
begin
    ReadPila(Pila1);
    ReadPila(Pila2);
    InicPila(Igual, '');
    InicPila(Mayor, '');
    InicPila(Menor, '');
    InicPila(Aux1, '');
    InicPila(Aux2, '');
    CompararDosPilas(Pila1, Pila2,Aux1, Aux2, Igual, Mayor, Menor);
    If not pilaVacia(Igual) and (tope(Igual) = 0) then
        writeln('Las pilas son Iguales')
    else 
        begin
            if not pilaVacia(Menor) and (tope(Menor) = 1) then
                writeLn('La pila1 es menor que la pila2')
            else
                writeLn('La pila1 es mayor que la pila2');
        end;
end.