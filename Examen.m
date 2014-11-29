%Examen de Unidad Métodos
clear;
clc;
disp('Programa por Jose Jacome, josejacomeb@openmailbox.org');
%%%AUTOR: JOSÉ JÁCOME%%%
funciont = -1; %0 para sen, 1 para tg
%Programa de Seleccion de las componentes de la funcion
funciont =input('Ingrese las componentes del Polinomio para seno (0) para tangente (1): ');
while(1);
    if funciont == 0 || funciont == 1;
        break;
    end
    funciont = input('Ingrese para seno (0) para tangente (1): ');
end
%Programa para ingresar el grado
grado = input('Ingrese el grado del Polinomio(Maximo 7): ');
while(1);
    if grado < 0 | grado >7;
        grado = input('Error, ingreses nuevamente el grado del Polinomio(Maximo 7): ');
    else
        break;
    end
end
%termino ingresado en string
stringfunciont = '';
%Programa para ingresar en desorden el Polinomio
if funciont == 0;
    fprintf('Usted escogio un Polinomio con Terminos Senos\n');
    stringfunciont = 'sen(x)';
else
    fprintf('Usted escogio un Polinomio con Terminos Tangentes\n');
    stringfunciont = 'tg(x)';
end
%Variables para almacenar el grado y el coeficiente
polinomiocoef = [];
polinomiogrado = [];
%Muestra cuantos coeficientes a ingresado
mostrariteracion = '';
%Ingreso en desorden
for i = 1:grado+1;
    mostrariteracion = strcat('%%%Elemento (',num2str(i-1),')%%%');
    disp(mostrariteracion);
    polinomiocoef(i) = input('Ingrese el Coeficiente del Polinomio: ');
    polinomiogrado(i) = input('Ingrese el grado del Polinomio:  ');
    while polinomiogrado(i) < 0 || polinomiogrado(i) > grado;
        polinomiogrado(i) = input('Ingrese un grado del Polinomio Positivo y menor al grado general del polinomio: ');
    end
    while(1);
        %Contador iguales
         contiguales = 0;
        for j = 1:length(polinomiogrado);
            if polinomiogrado(i)  == polinomiogrado(j);
                contiguales = contiguales + 1;
            end
        end
        if contiguales == 1;
            break;
        end
        while contiguales > 1;
            fprintf('Termino encontrado con grado %d \n',polinomiogrado(j));
            polinomiogrado(i) = input('Ingrese de nuevo el grado: ');
            contiguales = 0;
            for j = 1:length(polinomiogrado);
                if polinomiogrado(i)  == polinomiogrado(j);
                    contaiguales = contiguales + 1;
                end
            end
        end
    end
end
%Programa para ordenar el Polinomio
for i = 1:grado;
    %Variables auxiliares para ordenar el grado
    auxcoef = 0;
    auxgrado = 0;
    for j = 1:grado;
        if polinomiogrado(i) > polinomiogrado(j);
            auxgrado = polinomiogrado(i);
            auxcoef = polinomiocoef(i);
            polinomiogrado(i) = polinomiogrado(j);
            polinomiocoef(i) = polinomiocoef(j);
            polinomiogrado(j) = auxgrado;
            polinomiocoef(j) = auxcoef;  
        end

    end
end
%Strings almacenadoras del valor
stringpoli ='';
%Código para mostrar el Polinomio como una String
for i = 1:grado; 
    if polinomiocoef(i) < 0;
        if polinomiogrado(i)==0;
            stringpoli = strcat(stringpoli,num2str(polinomiocoef(i)));
        else
            stringpoli = strcat(stringpoli,num2str(polinomiocoef(i)),'*','(',stringfunciont,')','^',num2str(polinomiogrado(i)));
        end
    else
        if polinomiogrado(i)==0;
            stringpoli = strcat(stringpoli,'+',num2str(polinomiocoef(i)));
        else
            stringpoli = strcat(stringpoli,'+',num2str(polinomiocoef(i)),'*','(',stringfunciont,')','^',num2str(polinomiogrado(i)));
        end
    end
end
disp('###POLINOMIO INGRESADO###');
disp(stringpoli);
%Codigo para buscar raices
disp('@@@BUSQUEDA DE RAICES@@@');

%Valores Iniciales
ini = 0;
fin = 2*pi;
h = pi /12;
coorx = [];
coory = [];
fprintf('En el intervalo [%f,%f]\n',ini,fin);
%inicializar vector
k = 1;
for j = ini:h:fin;
    a = 0;
    coorx(k) = j;
    if funciont == 0;
        for i = 1:length(polinomiocoef);
           a = a + polinomiocoef(i)*tan(j)^(polinomiogrado(i));        
        end
    else
        for i = 1:length(polinomiocoef);
           a = a + polinomiocoef(i)*sin(j)^(polinomiogrado(i));        
        end
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
%Error permitido
error = 0.001;
%Codigo de Biseccion
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
        if funciont == 0;
            for i = 1:length(polinomiocoef);
               a = a + polinomiocoef(i)*tan(j)^(polinomiogrado(i));        
            end
        else
            for i = 1:length(polinomiocoef);
               a = a + polinomiocoef(i)*sin(j)^(polinomiogrado(i));        
            end
        end
        coory(k) = a;
        k = k+1;
    end
    for i=2:length(coorx);
        if coory(i-1)*coory(i) < 0;
            a = coorx(i-1);
            c = coorx(i);
            Fa = coory(i-1);
            Fc = coory(i);
            b = (a + c)/2;
            Fb = 0;
            if funciont == 0;
                for i = 1:length(polinomiocoef);
                   Fb = Fb + polinomiocoef(i)*tan(b)^(polinomiogrado(i));      
                end
            else
                for i = 1:length(polinomiocoef);
                   Fb = Fb + polinomiocoef(i)*sin(b)^(polinomiogrado(i));        
                end
            end
            while abs(Fb) > error ;
                b = (a+c)/2;
                Fb = 0;
                if funciont == 0;
                    for i = 1:length(polinomiocoef);
                       Fb = Fb + polinomiocoef(i)*tan(b)^(polinomiogrado(i));    
                    end
                else
                    for i = 1:length(polinomiocoef);
                       Fb = Fb + polinomiocoef(i)*sin(b)^(polinomiogrado(i));        
                    end
                end
                if Fa*Fb <= 0;
                    c=b;
                    Fc=Fb;
                else
                    a=b;
                    Fa=Fb;
                end
            end
            %Contador de iguales para no usar lo mismo
            contiguales = 0;
            for i = 1:numeroraices;
                if abs(b - raices(i)) < 0.0000001;
                    contiguales = contiguales + 1;
                end
            end
            if contiguales == 0;
                numeroraices = numeroraices +1;
                raices(numeroraices) = b;
            end
        end
    end
    if iteraciones == 10;
        break;
    end
end
auxraiz = 0;
for i=1:length(raices);
    auxraiz = raices(i);
    for j=1:length(raices); 
        if auxraiz <= raices(j);
            auxraiz = raices(i);
            raices(i) = raices(j);
            raices(j)= auxraiz;
        end
    end
end
for i = 1: length(raices);
    fprintf('Raiz encontrada en x = %f \n',raices(i));
end