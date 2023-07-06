Program CalcularDFactorial;
{$INCLUDE/IntroProg/Estructu}
function calculoFactorial(numero:integer):integer;
var resultadoParcial:integer;
begin
    resultadoParcial := numero;
    while(numero > 1) do
        begin
            numero := numero - 1;
            resultadoParcial := resultadoParcial * numero;
        end;
    calculoFactorial := resultadoParcial;
end;
var test, numero:integer;
begin
    numero := 0;
    while (numero < 1) do
        begin
            writeln('Ingrese un numero entero mayor a 0');
            readln(numero);
        end;
    writeln('El factorial del ', numero);
    test := calculoFactorial(numero);
    writeln('ES : ',test);
end.