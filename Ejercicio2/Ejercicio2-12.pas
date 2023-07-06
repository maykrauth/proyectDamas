Program PilaIncuidaAOtraPila;
{Parte  de una pila uno esta incluidaen otra pila conservando el mismo orden}
{$INCLUDE/IntroProg/Estructu}

var Parte, Grande, Descarte, Aux1, Aux2:Pila;

begin
    ReadPila(Parte);
    writeln('La pila grande debe de tener los mismo elemento que la pila parte en el mismo orden');
    ReadPila(Grande);
    InicPila(Descarte, '');
    InicPila(Aux1, '');
    InicPila(Aux2, '');
    while (not PilaVacia(Parte)) and (not PilaVacia(Grande)) do
    begin
        if ((tope(Parte)) <> (tope(Grande)))   then
                Apilar(Descarte, desapilar(Grande))
        else
            begin
                Apilar(Aux1, desapilar(Parte));
                Apilar(Descarte, desapilar(Grande));
                if (not PilaVacia(Parte)) and (not PilaVacia(Grande)) and (tope(Parte) <> tope(Grande)) then
                    begin
                        while not pilaVacia(Aux1) do
                            Apilar(Parte, desapilar(Aux1));
                            
                    end;
            end;
        
    end;
    if PilaVacia(Parte) then
        writeln('La pila Parte esta incluida en Pila Grande')
    else
        writeln('La pila Parte No esta incluida en Pila Grande');
    while not PilaVacia(Descarte) do 
        Apilar(Grande, desapilar(Descarte));
    writePila(Grande);
    

end.