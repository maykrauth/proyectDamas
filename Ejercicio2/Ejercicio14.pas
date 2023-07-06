program ;
{$INCLUDE /IntroProg/Estructu}
var origen, descarte, auxiliar: pila;
begin
    readpila(origen);
    inicpila(auxiliar, '');
    inicpila(descarte, '');
    while not pilaVacia(origen) do 
        begin {Aca esta escrito con minuscula pilaVacia, pero no creo que este sea el error}
            if tope(origen) = 2 then
                begin
                    apilar(descarte, desapilar(origen));
                    apilar(auxiliar, 0);
                end
            else
                begin
                    apilar(auxiliar, desapilar(origen));
                end;
        end;
    while not pilavacia(auxiliar) do
        begin
            apilar(origen, desapilar(auxiliar));
        end
    writePila(origen);
end.
