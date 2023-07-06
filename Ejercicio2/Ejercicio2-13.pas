Program AtencionClienteEstaOrdenada;
{$INCLUDE/IntroProg/Estructu}
var
    Atencion, Aux, AxuNo:Fila;
begin
    ReadFila(Atencion);
    InicFila(Aux, '');
    InicFila(AxuNo, '');
    agregar(Aux, extraer(Atencion));
    while not filaVacia(Atencion) do 
        begin
        {No cumpliria la Función de saber si esta ordenada porque siempre compara el primer elemento de Aux,
        cuando la pila esta ordenada funciona correctamente, pero cuando esta desordenada ahi produce un error}
            if Primero(Aux) < Primero(Atencion) then
                agregar(Aux, extraer(Atencion))
            else
                agregar(AxuNo, extraer(Atencion));
        end;
    if not FilaVacia(AxuNo) then
        writeln('La fila no esta ordenada')
    else
        writeln('La fila esta ordenada de menos a mayor ');
end;


Program Ejercicio13;
{Este Ejercicio cumple con la primera condición de saber si estan ordenados o no,
la que no cumple es la condicion de dejar los elementos en el mismo orden cuando estan desordenados}
{$INCLUDE/IntroProg/Estructu}
var
    Atencion, SI, NO, Resultado:Fila; 
var 
    Aux, Axu2:Pila;
begin
    ReadFila(Atencion);
    InicPila(Aux, '');
    InicPila(Axu2, '');
    InicFila(SI, '');
    InicFila(NO,'');
    InicFila (Resultado, '0');
    if not filaVacia(Atencion) then
        begin
            Apilar(Aux, extraer(Atencion));
            while not filaVacia(Atencion) and not (tope(Aux)>Primero(Atencion)) do
                Apilar(Aux, extraer(Atencion))
        end;
        
    if filaVacia(Atencion) then
        begin
            agregar(SI, extraer(Resultado));
            writeln('Esta ordenado de mayor a menos');
        end
    else
        begin
            agregar(NO, extraer(Resultado));
            writeln('No esta Ordenada')
        end;
    writeFila(SI);
    writeFila(NO);
    while not pilaVacia(Aux) do
        Apilar(Aux2, desapilar(Aux));
    while not pilaVacia(Aux2) do 
        agregar(Atencion, desapilar(Aux2));
    writeFila(Atencion);
end.



Program Ejercicio13C;
{Cumple con las dos premisas que tenia el ejercicio, Seguro que hay otra manera mejor pero aun no la he encontrado}
{$INCLUDE/IntroProg/Estructu}
var
    Atencion, Aux, Aux2,  Resultado:Fila; 

begin
    ReadFila(Atencion);
    InicFila(Aux, '');
    InicFila(Aux2, '');
    InicFila (Resultado, '');
    if not filaVacia(Atencion) then
        begin
            Agregar(Aux, extraer(Atencion));
            while not filaVacia(Atencion) and not (Primero(Aux)>Primero(Atencion)) do
                Agregar(Aux, extraer(Atencion))
        end;
    
    if filaVacia(Atencion) then
        
        writeln('Esta ordenado de mayor a menos')
    else
        writeln('No esta Ordenada');
    while not FilaVacia(Atencion)do 
        begin
            Agregar(Aux, extraer(Atencion));
        end;
    while not FilaVacia(Aux) do
        Agregar(Atencion,extraer(Aux));

    writeFila(Atencion);
end.