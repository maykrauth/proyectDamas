Program ParOImpar;
{$INCLUDE/IntroProg/Estructu}
function esPar(numero: integer):boolean;
var modulo : integer;
begin
    modulo := numero mod 2;
    if (modulo = 0) then
        esPar := true
    else
        esPar := false;
end;
var Numero:Integer;
begin
    Readln(numero);
    if (esPar(numero)) then 
        writeln('el numero es par')
    else
        writeln('numero impar');
end;