program recu2018;
const 
    MIN=1;
    MAXNUM=9;
    sinValor=-1;
type T_NUMEROS= Array[MIN .. MAXNUM] of integer;

procedure cargar(var numeros : T_NUMEROS);
var 
    valor, indice:integer;
begin
    valor := -1;
    writeln('Ingrese valores positivos entre 1 y 9');
    for indice:=MIN to MAXNUM do 
        begin
            write('Ingrese el valor del arreglo en la posicion ', indice,' : ');
            readln(valor);
            while(valor < 0) or (valor > 9) do
                begin
                writeln('Ingrese valores positivos entre 1 y 9');
                readln(valor);
                end;
            numeros[indice]:= valor;
        end;
end;

procedure imprimir(numeros: T_NUMEROS);
var indice : integer;
begin
    Writeln('El arreglo quedó cargado de la siguiente manera:');
    for indice := MIN to MAXNUM do
        begin
            write(numeros[indice]);
            if indice < MAXNUM then
                write(' , ');
        end;
    writeln();
end;

procedure buscarPosProxSuma(numeros: T_NUMEROS; inicial: integer; var final: integer; valor:integer);
var suma, auxIndice: integer;
begin
    suma := 0;
    auxIndice := inicial;
    final := -1;
    while ((auxIndice <= MAXNUM) and (suma < valor)) do
        begin
            suma := suma + numeros[auxIndice];
            if (suma = valor) then
                begin
                    final := auxIndice;
                end;
            auxIndice := auxIndice + 1;
        end;
end;

procedure corrimientoDerecha(var numeros: T_NUMEROS; pos:integer);
var indice:integer;
begin
    for indice:=pos downto MIN + 1 do
        numeros[indice] := numeros[indice - 1];
end;

procedure procesarValores(var numeros: T_NUMEROS; valor: integer);
var inicial, final, cantCorrimientos: integer;
begin
    inicial := MIN;
    final := -1;
    while (inicial <= MAXNUM) do
        begin
            buscarPosProxSuma(numeros,inicial,final,valor);
            if (final <> -1) then
                begin
                    //writeln('entra en <> -1 ', final);
                    numeros[inicial] := valor;
                    cantCorrimientos := final - inicial;
                    writeln('cantCorrimientos ', cantCorrimientos);
                    while (cantCorrimientos > 0) do
                        begin
                            corrimientoDerecha(numeros, final);
                            cantCorrimientos := cantCorrimientos - 1;
                            numeros[MIN] := 0;
                        end;
                    inicial := final + 1;
                end
            else
                inicial := inicial + 1;
        end;
end;


//.....programa principal.....//
var numeros : T_NUMEROS; valor: integer;
begin
    //cargar(numeros);
    {numeros[1] := 3;
    numeros[2] := 5;
    numeros[3] := 6;
    numeros[4] := 7;
    numeros[5] := 3;
    numeros[6] := 4;
    numeros[7] := 5;
    numeros[8] := 1;
    numeros[9] := 8;}
    numeros[1] := 1;
    numeros[2] := 2;
    numeros[3] := 3;
    numeros[4] := 5;
    numeros[5] := 6;
    numeros[6] := 2;
    numeros[7] := 7;
    numeros[8] := 9;
    numeros[9] := 9;
    imprimir(numeros);
    writeln('Ingrese un valor mayor a 10 ');
    readln(valor);
    while (valor < 10) do
        begin
            writeln('Ingrese un valor mayor a 10 ');
            readln(valor);
        end;
    procesarValores(numeros, valor);
    imprimir(numeros);

end.