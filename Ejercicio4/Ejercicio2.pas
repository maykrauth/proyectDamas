Program LaSumaDeDosNumeros;
{$INCLUDE/IntroProg/Estructu}

procedure SumaNumerosNaturales(var SumaNumeros: Integer);
var Sumatoria:char;
    Numero, Numero2:integer;

begin
    Numero:=0;
    Numero2:=0;
    sumatoria := 's';
    while(sumatoria = 's') do 
    begin
        writeln('ingrese el primer numero que quiera sumar?');
        readln(Numero);
        writeln('ingresse el segundo termino al cual quiere sumas?');
        readln(Numero2);
        SumaNumeros:= sumaNumeros + Numero + Numero2 ;
        writeln('Para seguir sumando vuelva apretar s');
        readln(sumatoria);
    end;

end;
var SumaNumeros: Integer;
begin
    SumaNumeros:=0;
    SumaNumerosNaturales(SumaNumeros);
    writeln('La sema de los numeros es:', SumaNumeros);
end.
