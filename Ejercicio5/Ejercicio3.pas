program CalcularSuma;
{$INCLUDE/IntroProg/Estructu}
function sumaElementosPila(PilaDada:Pila):integer;
var resultadoParcial : integer;
begin
    resultadoParcial := 0;
    while not PilaVacia (PilaDada) do 
        resultadoParcial:= resultadoParcial + desapilar(PilaDada);
    sumaElementosPila:=resultadoParcial;
end;
var PilaDada:Pila;
begin
    ReadPila(PilaDada);
    writeln('la suma de los elementos de la pila es: ', sumaElementosPila(PilaDada));
end.