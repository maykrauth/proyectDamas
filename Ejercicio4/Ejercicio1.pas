Program TrabajandoConVariables;
{Realizar un procedimiento para intercambiar los valos de dos variables enteras
y cuales serua kas diferencias si las variablkes fueran de tipo caracter}
{$INCLUDE/IntroProg/Estructu}
var EdadManuel, EdadJosefina:Integer;
{Si fuera de tipo char o caracter se deveria hacer como tipo pregunta utilizando los dos tipos ya que solo se permite un caracter}
begin
    EdadManuel:= 20;
    EdadJosefina:=19;
    EdadJosefina:= EdadJosefina + 1;
    EdadManuel := EdadJosefina + EdadManuel;
    writeln(EdadJosefina);
    writeln(EdadManuel);
end;
Program CargarNumeros;
{$INCLUDE/IntroProg/Estructu}

Procedure CargarEdad(var Jugador:Integer);
    var cargarNumero:char;
        Juego:integer;
    begin
        cargarNumero := 's';
        while (cargarNumero='s') do
            begin
                writeln('Ingresar su edad:');
                readln(Juego);
                Jugador:= Juego;
                if (Jugador >= 18 ) then
                    writeLn('Podes jugar')
                else
                begin
                    writeln('No tenes la edad suficiente para jugar');
                    writeln('¿Desea cambiar la Edad asignada(Ingrese s para si)?');
                    readln(cargarNumero)
                end;
            end;
    end;
var
    Jugador: Integer;
begin

    Jugador:= 0;
    CargarEdad(Jugador);
    writeln(Jugador);

end.