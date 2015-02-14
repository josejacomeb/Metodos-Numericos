%Programa de Regresion Polinomial
%Por Jose Jacome
clc;
clear;
disp('###PROGRAMA REGRESIÓN POLINOMIAL###');
disp('______________________________________');
disp('<--Por: Jose Jacome-->');
disp('$$$INGRESO DE DATOS%%%');
ndatos = input('Ingrese el numero de datos que tiene: ');
while ndatos < 2;
    ndatos = input('Ingrese un numero de datos mayor a 2: ');
end
grado = input('Ingrese el grado maximo de la ecuacion a ajustar a la mejor: ');
while grado < 1
    grado = input('Ingrese un grado mayor que 1');
end
x = zeros(1,ndatos);
y = zeros(1,ndatos);
disp('Inicio de Ingreso de datos');
disp('__________________________');
mostrar = '';
for i = 1: ndatos
    mostrar = strcat('Valor de',' x[',num2str(i),']: ');
    x(i) = input(mostrar);
    mostrar = strcat('Valor de',' y[',num2str(i),']: ');
    y(i) = input(mostrar);
end
disp('Final de Ingreso de datos');
disp('__________________________');
disp('$$$CALCULO DE REGRESION$$$');
matrizacumuladora = zeros(2*grado,2);
%Acumulador de x
for i = 1: 2*grado
    acum = 0;
    for j = 1 : ndatos
        acum = acum + x(j)^i;
    end
    matrizacumuladora(i,1) = acum;
end
%Acumulador de y
for i = 1: grado + 1
    acum = 0;
    for j = 1 : ndatos
        acum = acum + x(j)^(i-1)*y(j);
    end
    matrizacumuladora(i,2) = acum;
end
minimoscuadrados = zeros(grado);
matrizresultados = zeros(grado);
%Ingreso de datos x a la matriz 
for j = 1:grado + 1
    for i = 1: grado + 1
        if i==1 && j==1
            minimoscuadrados(i,j) = ndatos;
        else
            minimoscuadrados(i,j) = matrizacumuladora(i+j-2,1);
        end
    end 
end
%Ingreso de datos y y xy a la matriz
for j = 1:grado + 1
    minimoscuadrados(j,grado+2) = matrizacumuladora(j,2);
end
%Haciendo numero de grado procesos para ver cual es el mejor ajuste
for conteoregresion  = 1: grado
    ecuaciones = conteoregresion + 1;
    fprintf('CALCULANDO LA REGRESION PARA ECUACION GRADO: %d\n',conteoregresion);
    disp('_______________________');
    for i = 1:ecuaciones
        for j = 1: ecuaciones + 1 
            if j == ecuaciones + 1
                matrizecuaciones(i,j) = minimoscuadrados(i,grado+2);
            else
                matrizecuaciones(i,j) = minimoscuadrados(i,j);
            end
        end
    end
    disp(matrizecuaciones);
    %Triangulo Inferior
    for i = 1 : ecuaciones
        for k = i+1 : ecuaciones
            for j  = ecuaciones + 1 : -1 : 1
                aux = 0;
                if matrizecuaciones(i,i) == 0;
                   aux = matrizecuaciones(i,j);
                   matrizecuaciones(i,j) = matrizecuaciones(k,j);
                   matrizecuaciones(k,j) = aux;  
                else
                    matrizecuaciones(k,j)  = matrizecuaciones(i,i)*matrizecuaciones(k,j) - matrizecuaciones(k,i)*matrizecuaciones(i,j);
                end 
            end
            if matrizecuaciones(i,i) == 0
                k = k -1 ;
            end
        end
    end
    %Hacer unos las primeras filas
    for i = ecuaciones:-1:1 
        for j = ecuaciones + 1:-1:i
            matrizecuaciones(i,j) = matrizecuaciones(i,j)/matrizecuaciones(i,i);
        end
    end
    %Triangulo Superior
    for i = ecuaciones:-1:2
     for k = i-1:-1:1 
        for j  = ecuaciones + 1: -1 : i        
            matrizecuaciones(k,j)  = matrizecuaciones(i,i)*matrizecuaciones(k,j) - matrizecuaciones(k,i)*matrizecuaciones(i,j);
        end
     end
    end
    %Guarda los resultados
    for i = 1:ecuaciones
        matrizresultados(i,conteoregresion) = matrizecuaciones(i,ecuaciones + 1);
    end
end
%Busqueda del Mejor ajuste
matrizajuste = zeros(grado,2);
acumerror = 0;
acumy = 0;
for i = 1: grado
    for j = 1: ndatos
        for k = 1: i+1
            acumy = acumy + x(j)^(k-1)*matrizresultados(k,i);
        end 
        acumerror = acumerror + (y(j)-acumy)^2;   
        acumy = 0;
    end
    matrizajuste(i,1) = acumerror;
    matrizajuste(i,2) = i;
    acumerror = 0;
end
%Display de Resultados
for i = 1 : grado
    fprintf('Solucion %d: \n',i);
    mostrar = '';
    for j =1 : i + 1
        if j == 1
            if matrizresultados(j,i) == 0
                mostrar = strcat(mostrar);
            elseif matrizresultados(j,i) < 0
                mostrar = strcat(mostrar,num2str(matrizresultados(j,i)));
            elseif matrizresultados(j,i) > 0
                mostrar = strcat(mostrar,' + ',num2str(matrizresultados(j,i)));
            end
        elseif j == 2
            if matrizresultados(j,i) == 0
                mostrar = strcat(mostrar);
            elseif matrizresultados(j,i) < 0
                mostrar = strcat(mostrar,num2str(matrizresultados(j,i)),'x');
            elseif matrizresultados(j,i) > 0
                mostrar = strcat(mostrar,' + ',num2str(matrizresultados(j,i)),'x');
            end
        else
            if matrizresultados(j,i) == 0
                mostrar = strcat(mostrar);
            elseif matrizresultados(j,i) < 0
                mostrar = strcat(mostrar,num2str(matrizresultados(j,i)),'x^',num2str(j-1));
            elseif matrizresultados(j,i) > 0
                mostrar = strcat(mostrar,' + ',num2str(matrizresultados(j,i)),'x^',num2str(j-1));
            end
        end
    end
    disp(mostrar);
    fprintf('Error cuadratico total = %f\n',matrizajuste(i,1));
end
%Ordenacion de los valores para escoger el menor error
for i = 1: grado
    for j = 1: grado 
        aux1 = 0;
        aux2 = 0;
        if matrizajuste(i,1) < matrizajuste(j,1)
            aux1 = matrizajuste(i,1);
            aux2 = matrizajuste(i,2);
            matrizajuste(i,1) = matrizajuste(j,1);
            matrizajuste(i,2) = matrizajuste(j,2);
            matrizajuste(j,1) = aux1;
            matrizajuste(j,2) = aux2;
        end
    end
end
disp('^^^^^^^^^^^^^^^^^^^^^');
disp('///MEJOR RESULTADO///');
disp('^^^^^^^^^^^^^^^^^^^^^');
mostrar = '';
for j = 1 : matrizajuste(1,2)+1
    if j == 1
        if matrizresultados(j,matrizajuste(1,2)) == 0
                mostrar = strcat(mostrar);
        elseif matrizresultados(j,matrizajuste(1,2)) < 0
            mostrar = strcat(mostrar,num2str(matrizresultados(j,matrizajuste(1,2))));
        elseif matrizresultados(j,matrizajuste(1,2)) > 0
            mostrar = strcat(mostrar,' + ',num2str(matrizresultados(j,matrizajuste(1,2))));
    end
    elseif j == 2
        if matrizresultados(j,matrizajuste(1,2)) == 0
            mostrar = strcat(mostrar);
        elseif matrizresultados(j,matrizajuste(1,2)) < 0
            mostrar = strcat(mostrar,num2str(matrizresultados(j,matrizajuste(1,2))),'x');
        elseif matrizresultados(j,matrizajuste(1,2)) > 0
            mostrar = strcat(mostrar,' + ',num2str(matrizresultados(j,matrizajuste(1,2))),'x');
        end
    else
         if matrizresultados(j,matrizajuste(1,2)) == 0
            mostrar = strcat(mostrar);
         elseif matrizresultados(j,matrizajuste(1,2)) < 0
            mostrar = strcat(mostrar,num2str(matrizresultados(j,matrizajuste(1,2))),'x^',num2str(j-1));
         elseif matrizresultados(j,matrizajuste(1,2)) > 0
            mostrar = strcat(mostrar,' + ',num2str(matrizresultados(j,matrizajuste(1,2))),'x^',num2str(j-1));
         end    
    end
end
disp(mostrar)
