program DibujarMatriz;
uses Crt;

const
  MIN = 1;
  FILAS = 8;
  COLUMNAS = 8;
  BLANCA = 'x';
  NEGRA = 'o';
  CANT_FICHAS = 12;
  C: array[1..9] of string = ('┐', '┌', '┘', '└', '─', '│', ' ', '┼', '░');

type
  matriz= array[1..FILAS, 1..COLUMNAS] of char;
  
var
  mat: matriz;

function FondoNegro(fila,col:integer):boolean;
// Retorna verdadero/falso dependiendo del fondo que tiene la celda (damero).
begin
    FondoNegro := (((fila+col) mod 2) = 1);
end;

function CantFichasEnTablero(mat:matriz; color:char):integer;
var cant, fila, columna:integer;
begin
    cant := 0;
    for fila := 1 to FILAS do
        for columna := 1 to COLUMNAS do
            if mat[fila,columna] = color then
                cant := cant + 1;
    CantFichasEnTablero := cant;
end;

procedure InicMatriz(var mat:matriz);
// Inicializa la matriz con las 64 celdas en blanco.
var
  i, j: integer;
begin
for i:=1 to FILAS do 
    for j:=1 to COLUMNAS do
        mat[i,j] := ' ';
end;

procedure CargarFichas(var mat:matriz; color:char; cantidad:integer);
// Carga la matriz con las 16 fichas en su posicion inicial.
var fila_inicial: integer;
    incremento:integer;
    fila, columna:integer;
    fichas: integer;
begin
    if color=NEGRA then begin
        fila_inicial := 1;
        incremento := 1;
        columna := 2;
    end else begin
        fila_inicial := FILAS;
        incremento := -1;
        columna := 1;
    end;
    fila := fila_inicial;
    for fichas:= 1 to CANT_FICHAS do begin
        if not(FondoNegro(fila, columna)) then
            columna := columna + 1;
        mat[fila, columna] := color;
        columna := columna + 2;
        if columna > COLUMNAS then begin
            columna := 1;
            fila := fila + incremento;
        end;
    end;
end;

procedure DibujarMatriz(mat:matriz);
// Muestra la matriz por pantalla.
var
  i, j: integer;
begin
    ClrScr;  // Blanquea la pantalla.
    write(' ',C[2]);
    for j:=1 to COLUMNAS do write(C[5],C[5],C[5]);
    writeln(C[1]);
    for i:=1 to FILAS do begin
        write(' ',C[6]);
        for j:=1 to COLUMNAS do begin
            if not(FondoNegro(i,j)) then
                write(C[9],C[9],C[9])
            else
                write(' ',mat[i,j],' ');
        end;
        writeln(C[6]);
    end;
    write(' ',C[4]);
    for j:=1 to COLUMNAS do write(C[5],C[5],C[5]);
    writeln(C[3]);
    for i := 1 to CANT_FICHAS - CantFichasEnTablero(mat,NEGRA) do write(NEGRA); writeln();
    for i := 1 to CANT_FICHAS - CantFichasEnTablero(mat,BLANCA) do write(BLANCA); writeln();
end;

procedure eliminarFicha(var mat:matriz; posFilaInic, posColInic:integer);
begin
    writeln('Ficha eliminada...');
    write('Fil ', posFilaInic);
    writeln('Col ', posColInic);
    mat[posFilaInic,posColInic]:= ' ';
end;

procedure moverFicha(var mat:matriz; posFilFicha, posColficha, posFilDest, posColDest:integer);
begin
    mat[posFilDest,posColDest]:= mat[posFilFicha, posColficha];
end;

function movimientoAdelante(posFilaInic, posFilaDest:integer; jugaActual:char):boolean;
var jugador:char;
begin
    jugador := jugaActual;
    movimientoAdelante:= true;
    if (jugador = BLANCA) and (posFilaInic < posfilaDest) then
        begin
            //writeln('BLANCO INVALIDO');
            movimientoAdelante:=false;
        end;
    if (jugador = NEGRA) and (posFilaInic > posfilaDest) then 
        movimientoAdelante:= false;
end;


function posDestinoVacia(posFilaDest, posColDest:integer; mat:matriz):boolean;
var posFila, posCol:integer;
begin
    posFila:= posFilaDest;
    posCol:= posColDest;
    posDestinoVacia:= true;
    if (mat[posFila,posCol] = ' ') then
        posDestinoVacia:= true
    else
        posDestinoVacia:= false;
end;

function fueraDerango(posFilaDest, posColDest:integer):boolean;
begin
    if (posfilaDest > FILAS) or (posColDest > COLUMNAS) or (posfilaDest < 1) or (posColDest < 1) then
        fueraDerango:= true
    else 
        fueraDerango:= false;
end;

function existeFichaRival(jugaActual:char; posFilRival, posColRival: integer; mat:matriz):boolean;
begin
    if (mat[posFilRival,posColRival] <> jugaActual) then
        existeFichaRival:= true
    else
        existeFichaRival:=false;
    if mat[posFilRival,posColRival] = ' ' then
        existeFichaRival:= false;
end;


function movimientoValido(posFilaInic, posColInic, posFilaDest, posColDest:integer; jugaActual:char; mat:matriz):boolean;
var distanciaFil, distanciaCol, posFilaRival, posColRival:integer;
begin
    movimientoValido:= true;
    distanciaFil:= abs(posFilaDest - posFilaInic);
    distanciaCol:= abs(posColDest - posColInic);
    posFilaRival:= (posFilaDest + posFilaInic) div 2;
    posColRival:= (posColDest + posColInic) div 2;
    
    if (distanciaFil <> distanciaCol ) or (fueraDerango(posFilaDest, posColDest)) or ((distanciaFil <> 1) and (distanciaFil <> 2)) or ((distanciaCol <> 1) and (distanciaCol <> 2)) then
        begin
            //writeln('DENTRO DEL PRIMER IF DE MOVIMIENTO VALIDO');
            movimientoValido:= false;
        end
    else
        begin
            if ((distanciaFil = 1) and (distanciaCol = 1)) then
                begin
                    //writeln('((distanciaFil = 1) and (distanciaCol = 1))');
                    if ( not movimientoAdelante(posFilaInic, posfilaDest, jugaActual) ) then
                        movimientoValido:= false
                    else 
                        begin
                            if posDestinoVacia(posFilaDest, posColDest, mat) = true then
                                movimientoValido:= true;
                        end;
                end;
            if (distanciaFil = 2) and (distanciaCol = 2) then
                begin
                    {writeln('distanciaFil = 2) and (distanciaCol = 2');
                    writeln('posFilaInic ', posFilaInic);
                     writeln('posColInic ', posColInic);
                    writeln('posFilaDest ', posFilaDest);
                    writeln('posColDest ', posColDest);
                    writeln('posFilaRival ', posFilaRival);
                    writeln('posColRival ', posColRival);}
                    if (not existeFichaRival(jugaActual, posFilaRival, posColRival, mat)) then
                        movimientoValido:=false
                    else
                    begin
                        if posDestinoVacia(posFilaDest, posColDest, mat) = true then
                            movimientoValido:= true
                        else
                            movimientoValido:= false;
                    end;
                end;
        end;
end;


function posColorValida(posFilaFicha, posColFicha:integer; mat:matriz; jugaActual:char):boolean;
begin
    if not fueraDerango(posFilaFicha, posColFicha) then 
    begin
        if (mat[posFilaFicha, posColFicha] = jugaActual) then 
            posColorValida:= true
        else
            posColorValida:= false;
    end;
end;

function hayMovimientoDestino(fil, col:integer; mat:matriz; jugaActual:char):boolean;
var filDest, colDest:integer;
begin

    hayMovimientoDestino:= false;
    for filDest:=MIN to FILAS do 
        for colDest:=MIN to COLUMNAS do 
            if movimientoValido(fil, col, filDest, colDest, jugaActual, mat) then
                hayMovimientoDestino:=true;
end;

function movimientosValidos(mat:matriz; jugaActual:char):boolean;
var fil, col:integer;
begin
    movimientosValidos:= false;
    for fil :=MIN to FILAS do 
        for col:=MIN to COLUMNAS do 
            if (mat[fil, col]= jugaActual) and (FondoNegro(fil, col)) then
            begin
                if (hayMovimientoDestino(fil, col, mat, jugaActual)) then 
                    movimientosValidos:= true;
            end;
end;


function perdioJugador(mat:matriz; jugaActual:char):boolean;
begin
    if (CantFichasEnTablero(mat, jugaActual) = 0) or (not movimientosValidos(mat,jugaActual)) then
        perdiojugador:= true
    else
        perdiojugador:= false;
end;

procedure cargarPosicionesDestino(var posFilaDest, posColDest:integer);
begin
    write ('Ingrese la fila destino a la cual quiere mover la ficha : ');
    readln (posFilaDest);
    write('Ingrese la columna destino a la cual quiere mover la ficha : ');
    readln(posColDest);
end;

function capturaValida(fil, col:integer; mat:matriz; jugaActual:char):boolean;
begin
    if (movimientoValido(fil, col, fil - 2, col - 2, jugaActual, mat)) or
       (movimientoValido(fil, col, fil - 2, col + 2, jugaActual, mat)) or
       (movimientoValido(fil, col, fil + 2, col - 2, jugaActual, mat)) or
       (movimientoValido(fil, col, fil + 2, col + 2, jugaActual, mat)) then
        capturaValida:=true
    else
        capturaValida:=false;
end;

procedure gestionarMovimiento(var mat:matriz; jugaActual:char; var posFilFicha, posColFicha:integer; var turnoTerminado, seguirJugando:boolean);
var posFilaDest, posColDest, posfilaRival, posColRival, distanciaFil, distanciaCol:integer; continuar: char;
begin
    seguirJugando:=false;
    cargarPosicionesDestino(posFilaDest,posColDest);
    while (not movimientoValido(posFilFicha, posColFicha, posFilaDest, posColDest, jugaActual, mat)) do 
        begin
            cargarPosicionesDestino(posFilaDest, posColDest);
        end;
    distanciaFil:= abs(posFilaDest - posFilFicha);
    distanciaCol:= abs(posColDest - posColFicha);
    if (distanciaFil = 1) and (distanciaCol = 1) then
        begin
            moverFicha(mat, posFilFicha, posColFicha, posFilaDest, posColDest);
            eliminarFicha(mat, posFilFicha, posColFicha);
            turnoTerminado:= true;
        end;
    if (distanciaFil = 2) and (distanciaCol= 2) then
        begin
            continuar := ' ';
            posFilaRival:= (posFilaDest + posFilFicha) div 2;
            posColRival:= (posColDest + posColFicha) div 2;
            moverFicha(mat, posFilFicha, posColFicha, posFilaDest, posColDest);
            eliminarFicha(mat, posFilFicha, posColFicha);
            eliminarFicha(mat, posFilaRival, posColRival);
            DibujarMatriz(mat);
            writeln('va a comer otra ficha con la que está jugando ? Ingrese S de lo contrario presione cualquier tecla ');
            readln(continuar);
            if ((continuar = 's') or (continuar = 'S')) then
                begin
                    if (capturaValida(posFilaDest, posColDest, mat, jugaActual)) then
                        begin
                            posFilFicha := posFilaDest;
                            posColFicha := posColDest;
                            turnoTerminado:= false;
                            seguirJugando:=true;
                        end
                    else
                        begin
                            writeln('No existen capturas validas. Presione cualquier tecla');
                            readln();
                            turnoTerminado:= true;
                        end;
                end
            else
                begin
                    turnoTerminado:= true;
                end;
        end;
end;

procedure validarPosicionesFicha(var posFilFicha, posColFicha:integer; mat:matriz; jugaActual:char);
begin
    write('Ingrese una fila valida : ');
    readln(posFilFicha);
    write('Ingrese una columna valida : ');
    readln(posColFicha);
    while ((not posColorValida(posFilFicha, posColFicha, mat, jugaActual)) or (not hayMovimientoDestino(posFilFicha,posColFicha,mat,jugaActual))) do
        begin
            write('Ingrese una fila valida : ');
            readln(posFilFicha);
            write('Ingrese una columna valida : ');
            readln(posColFicha);
        end;
end;

procedure gestionarTurno(var mat:matriz; jugaActual:char);
var posFilFicha, posColFicha:integer; turnoTerminado, seguirJugando:boolean;
begin
    turnoTerminado:= false;
    seguirJugando := false;
    while (not turnoterminado) do 
    begin
        if (not seguirJugando) then
            validarPosicionesFicha(posFilFicha, posColFicha, mat, jugaActual);
        gestionarMovimiento(mat, jugaActual, posFilFicha, posColFicha, turnoterminado, seguirJugando);
    end;
end;

procedure iniciarJuego(var mat:matriz);
var jugaActual, play_1, play_2:char;
begin
    play_1:= BLANCA;
    play_2:= NEGRA;
    jugaActual:= play_1;
    while (not perdiojugador(mat, jugaActual)) do 
        begin
            writeln('Jugador actual : ', jugaActual);
            gestionarTurno(mat, jugaActual);
            DibujarMatriz(mat);
            if (jugaActual = play_1) then
                jugaActual:= play_2
            else
                begin
                    if (jugaActual = play_2) then
                        jugaActual:= play_1;
                end;
        end;
end;


begin
    InicMatriz(mat);
    CargarFichas(mat, BLANCA, CANT_FICHAS);
    CargarFichas(mat, NEGRA, CANT_FICHAS);
    DibujarMatriz(mat);
    iniciarJuego(mat);
    DibujarMatriz(mat);
end.