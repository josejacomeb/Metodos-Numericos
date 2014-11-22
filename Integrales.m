%Raices de Polinomio mas metodo de Newton
clc;
clear;
disp('<~~~Integración Por Regla Trapecio y Simpson~~~>');
%Pide el grado del polinomio
grado=input('Ingrese el grado del polinomio: ');
%Variables donde se alojan los coeficientes del Polinomio
polinomio = [];
polinomioderivado = []; 
while(1);
    if grado < 0;
        grado = input('El grado de polinomio no puede ser negativo o cero, ingrese de nuevo: ');
    else
        break;
    end
end
%Código para ingresar los valores en el polinomio
for i=1:grado+1;
    coef = strcat('Ingrese los coeficientes de x^',num2str(i-1),': ');  
    polinomio(i)= input(coef);
end
%Strings almacenadoras del valor
stringpoli ='';
%Código para mostrar el Polinomio como una String
for i = grado +1:-1:1;
    if polinomio(i) == 0;
        stringpoli = strcat(stringpoli);    
    elseif polinomio(i) < 0;
        if i==1;
            stringpoli = strcat(stringpoli,num2str(polinomio(i)));
        else
            stringpoli = strcat(stringpoli,num2str(polinomio(i)),'*x^',num2str(i-1));
        end
    else
        if i==1;
            stringpoli = strcat(stringpoli,'+',num2str(polinomio(i)));
        else
            stringpoli = strcat(stringpoli,'+',num2str(polinomio(i)),'*x^',num2str(i-1));
        end
    end
end

disp('<--POLINOMIO INGRESADO-->');
disp(stringpoli);
%Vectores donde se almacenan los valores x e y del polinomio dentro del intervalo
coory=[];
coorx=[];
%Introducimos los limites del polinomio
disp('###Calculo de la Integral###');
disp('-->Ingrese los limites de la integral');
while (1),
    ini=input('Introduzca el limite inferior:  ');
    fin=input('Introduzca el limite superior:  ');
    %Comprobamos que ini>=fin
    if ini>fin
       disp('El valor inicial no puede ser mayor que el valor final.')
    elseif ini<=fin,
       break;
    end;
end;
%incremento inicial de 1
h = 1;
k = 1;
for j = ini:h:fin;
    a = 0;
    coorx(k) = j;
    for i = 0:length(polinomio)-1;
       a = a + polinomio(i+1)*(j)^(i);        
    end
    coory(k) = a;
    k = k+1;
end
%Vector donde se almacenan las raices
raices  = [];
numeroraices = 0;
%Proceso de verificar cruces con X
for i=1:length(coory);
    if coory(i) == 0;
        numeroraices = numeroraices +1;
        raices(numeroraices) = coorx(i);
    end
end
%Código Método de Newton
for i =2 : length(polinomio);
    polinomioderivado(i-1) = (i-1)*polinomio(i);
end
%Busco las raíces e inicializo x0 e x1
%Evaluo en el Polinomio y en el derivado
%veo donde hay una raiz
iteraciones = 0;
while numeroraices < grado;
    iteraciones  = iteraciones + 1;
    fprintf('Intento de busqueda de raices %f\n',iteraciones);
    h = h/3;
    k = 1;
    for j = ini:h:fin;
        a = 0;
        coorx(k) = j;
        for i = 1:length(polinomio);
            a = a + polinomio(i)*(j)^(i-1);        
        end
        coory(k) = a;
        k = k+1;
    end
    for i=2:length(coorx);
        if coory(i)*coory(i-1) < 0;
            x0 = coorx(i-1);
            x1 = 1 ;
            Fx0 = 1;
            while abs(Fx0) > 0.00000001;
                f0 = 0;
                fp0 = 0;
                Fx0 = 0;
                for i = 1:length(polinomio);
                    f0 = f0 + polinomio(i)*(x0)^(i-1) ;
                end
                for i = 1:length(polinomioderivado);
                    fp0 = fp0 + polinomioderivado(i)*(x0)^(i-1) ;
                end
                x1 = x0 - f0/fp0;
                for i = 1:length(polinomio);
                    Fx0 = Fx0 + polinomio(i)*(x0)^(i-1) ;
                end
                x0 = x1;
            end
            %Contador de iguales para no usar lo mismo
            contiguales = 0;
            %Uso la condicion abs(raices(i)-x0) para evitar errores por
            %decimales
            for i = 1:numeroraices;
                if abs(raices(i) - x0) < 0.000001;
                    contiguales = contiguales + 1;                   
                end
            end
            if contiguales == 0;
                numeroraices = numeroraices +1;
                raices(numeroraices) = x1;
            end
        end
    end
    if iteraciones == 10;
        break;
    end
end
%Display de Informacion
fprintf('Numero de Raices encontradas en el intervalo [%.2f,%.2f] = %d\n',ini,fin,numeroraices);
%Display de Integrales
stringintegral = strcat('int(',stringpoli,')[',num2str(fin),' , ',num2str(ini),']dx' ,' = ');
auxraiz = 0;
 if length(raices) == 1;
        stringintegral = strcat(stringintegral,' Integral [',num2str(ini),',',num2str(raices(1)),']dx',' + ',' Integral [',num2str(raices(1)),',',num2str(fin),']dx');
 elseif length(raices) == 0;
     stringintegral = strcat(stringintegral,' Integral [',num2str(ini),',',num2str(fin),']dx');
 else
    for i = 0:length(raices);
        if i == 0;
            stringintegral = strcat(stringintegral,' Integral [',num2str(ini),',',num2str(raices(i+1)),']dx',' + '); 
            auxraiz = raices(i+1);
        elseif i == length(raices);
            stringintegral = strcat(stringintegral,' Integral [',num2str(raices(i)),',',num2str(fin),']dx'); 
        else 
            stringintegral = strcat(stringintegral,' Integral [',num2str(auxraiz),',',num2str(raices(i+1)),']dx + ');
            auxraiz = raices(i+1);
        end
    end
 end
%Intervalo de Integracion
disp('$$$INTERVALO DE INTEGRACION$$$');
disp(stringintegral);
%Inicio de los metodos
ndivisiones = input('Ingrese el numero de divisiones a efectuar la funcion: ');
while mod(ndivisiones,2) > 0;
    ndivisiones = input('Ingrese un numero de divisiones para continuar: ');
end
%Metodo del trapecio
disp('Metodo del Trapecio');
h = (fin - ini)/ndivisiones;
xn = ini;
fxn = [];
contador = 1;
while fin+h >= xn;
    acumulador = 0;
    for i = 0:length(polinomio)-1;
       acumulador = acumulador + polinomio(i+1)*(xn)^(i);        
    end
    fxn(contador) = acumulador; 
    contador = contador + 1;
    xn = xn + h;
end
acumulador = 0;
for i = 1:length(fxn);
    if i == 1;
        acumulador = acumulador + fxn(i);
    elseif i == length(fxn);
        acumulador = acumulador + fxn(i);
    else
        acumulador = acumulador + 2*fxn(i);
    end
end
%Codigo Regla del Trapecio
f1xdx = acumulador * h/2;
fprintf('La integral calculada fue: %f \n',f1xdx);
%Codigo de Regla de Simpson
disp('Metodo de Simpson');
acumulador = 0;
for i = 1:length(fxn);
    if i == 1;
        acumulador = acumulador + fxn(i);
    elseif i == length(fxn);
        acumulador = acumulador + fxn(i);
    else
        if mod(i,2) == 0;
            acumulador = acumulador + 4 * fxn(i);
        else
            acumulador = acumulador + 2 * fxn(i);
        end
    end
end
f2xdx = acumulador*h/3;
fprintf('La integral calculada fue: %f \n',f2xdx);
