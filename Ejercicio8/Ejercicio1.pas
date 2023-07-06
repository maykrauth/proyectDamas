program arrayIncluidoEnOtroArray;
{se necesitan dos array y ver si el aray esta includo en el primer array}
{$INCLUDE/IntroProg/Estructu}
const
    inicio = 1;
    MaxLet= 10;
    MaxMod= 3;
type T_Letras: array[inicio.. MaxLet] of char; 
type T_Modelo: array[inicio..MaxMod] of char;
var Letras:T_Letras;
    Modelo:T_Modelo;
procedure procesarArreglos(var letras:T_Letras; var modelo:T_Modelo);
var posIni, posFin:integer;
begin
    posIni:= -1;
    posFin:= -1;
    obtenerIndice(letras, modelo, posIni, posFin);
    if posIni <> -1 then
        begin
            desplazarArray(letras, posIni,posfin);
            insertarModelo(letras, modelo);
        end;
end;
procedure obtenerIndice(letras:T_Letras; modelo:T_Modelo; var posIni:integer; var posFin:integer);
var 
    indiLet:integer;
    indiDemo:integer;
begin
    indiDemo:=inicio;
    indilet:=inicio;
    while indilet <= MaxLet  and  letras[indiLet]<> modelo[indiDemo] do 
        begin
            indiLet:=indiLet + 1;
            if indiLet <= MaxLet and indiDemo <= MaxMod then
            begin
                if letras[indiLet] = modelo[indiDemo] then
                    begin
                        indiLet:=indiLet +1;
                        indiDemo:=indiDemo + 1;
                        if indiDemo > MaxMod then
                        begin
                            posFin:=indiLet - 1;
                            posIni:= posFin - (MaxMod -1);
                        end
                    end
                else 
                begin
                    indiLet:=indiLet + 1;
                    indiDemo:=inicio;
                end;
            end;
        end;
end;
procedure desplazarArray(var letras:T_Letras; posIni, posFin:integer);

begin
    while posFin <= MaxLet do 
    begin
        posFin:= posFin + 1;
        if posfin <= MaxLet then
        letras[posIni] = letras[posFin];
        posIni:= posIni +1;
    end;
end;
procedure insertarModelo (var letras:T_Letras; modelo:T_Modelo;);
var indiceMax: integer;
    indice:integer
begin
    indice:=inicio;
    indiceMax:= MaxLet - (MaxMod - 1);
    while (indiceMax <= MaxLet)  and (indice <= MaxMod) do 
    begin
        letras[indiceMax]:= modelo[indice];
        indiceMax:= indiceMax + 1;
        indice:= indice + 1;
    end;
end;
begin
    cargarArregloLetras(Letras)
    cargarArregloMod(Modelo)
    procesarArreglos (Letras, Modelo)
    imprimir (Letras);
end;