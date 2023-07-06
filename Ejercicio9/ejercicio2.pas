Program matriz;
{$INCLUDE/IntroProg/Estrustu}
const
    inicioFila=1;
    finFila=5;
    inicioCol=1;
    finCol=5;
type t_matriz:array[inicioFila..finFila, inicioCol..finCol] of integer;
var matriz:t_matriz;

procedure cargarFila(var matriz:t_matriz fila:integer);
var colmun:integer;
begin
    for colmun:=1 to finCol do readln(matriz[fila,colmun]);
end;

procedure cargarMatriz(var matriz:t_matriz);
var fila:integer;
begin
    for fila:=1 to finFila do cargarFila(matriz,fila);
end;
