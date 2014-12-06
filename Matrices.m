%%%Programa de Matrices
clear;
clc;
%Autor: Daniel Guevara, Jose Jacome, Clinton Semanate
disp('~~~Programa de Matrices~~~');
disp('Por Daniel Guevara, José Jácome, Clinton Semanate');
while(1);
    disp('@@@INGRESO DE DATOS@@@');
    disp('###MATRIZ A###');
    %Numero de Filas de la Matriz
    m = input('Ingrese el numero de filas de la matriz: ');
    while m < 1;
        m = input('Ingrese un numero de filas mayor a uno: ');
    end
    %Numero de Columnas de la Matriz
    n = input('Ingrese el numero de columnas de la matriz: ');
    while n < 1;
        n = input('Ingrese un numero de columnas mayor a uno: ');
    end
    %Variable donde se aloja la matriz
    matriza = rand(m,n);
    %Elemento auxiliar
    elemento = 0;
    %Contador
    cont = 1;
    stringimpresora = '';
    for i = 1:m;
        for j = 1:n;
            stringimpresora = strcat('Elemento: ','[',num2str(i),']','[',num2str(j),']: ');
            elemento = input(stringimpresora);
            matriza(i,j) = elemento;
        end
    end
    disp('MATRIZ INGRESADA A');
    disp(matriza);
    disp('###MATRIZ B###');
    %Numero de Filas de la Matriz
    x = input('Ingrese el numero de filas de la matriz: ');
    while x < 1;
        x = input('Ingrese un numero de filas mayor a uno: ');
    end
    %Numero de Columnas de la Mtriz
    y = input('Ingrese el numero de columnas de la matriz: ');
    while y < 1;
        y = input('Ingrese un numero de columnas mayor a uno: ');
    end
    %Variable donde se aloja la matriz
    matrizb = rand(x,y);
    %Elemento auxiliar
    elemento = 0;
    %Contador
    cont = 1;
    stringimpresora = '';
    for i = 1:x;
        for j = 1:y;
            stringimpresora = strcat('Elemento: ','[',num2str(i),']','[',num2str(j),']: ');
            elemento = input(stringimpresora);
            matrizb(i,j) = elemento;
        end
    end
    disp('MATRIZ INGRESADA B');
    disp(matrizb);
    %Seleccionar operacion
    while(1);
        op = input('Ingrese la operacion deseada: \nSuma (1) \nResta(2) \nMultiplicacion(3) \nTranspuesta(4)\nMultiplicacion por escalar (5)\nPara salir (6)\n Ingrese la Elegida: ');
        while op ~= 1 & op ~= 2  & op ~= 3  & op ~= 4 & op ~= 5 & op ~= 6;
            op = input('Ingrese la operacion deseada: \nSuma (1) \nResta(2) \nMultiplicacion(3) \nTranspuesta(4)\nMultiplicacion por escalar (5)\nPara salir (6)\n Ingrese la Elegida: ');
        end
        switch(op);
            case 1
                %Suma
                disp('SUMA');
                if m == x & y == n;
                    matrizr = randn(x,y);
                    for i = 1:x;
                        for j = 1:y;
                             matrizr(i,j) = matriza(i,j) + matrizb(i,j);
                        end
                    end
                    disp('MATRIZ SUMADA A + B');
                    disp(matrizr)
                else
                    disp('La Suma no se puede efectuar;');
                end
            case 2
                %Resta
                disp('RESTA')
                if m == x & y == n;
                    matrizr = randn(x,y);
                    for i = 1:x;
                        for j = 1:y;
                            matrizr(i,j) = matriza(i,j) - matrizb(i,j);
                        end
                    end
                    disp('MATRIZ RESTADA A - B');
                    disp(matrizr)
                else
                    disp('La Resta no se puede efectuar;');
                end
            case 3
                %Multiplicacion
                if m == y && x == n;
                    matrizr = randn(m);
                    for i = 1:m;
                        for j =1: m;
                          acumulador = 0;
                          for k = 1: n;
                            acumulador = acumulador + matriza(i,k)*matrizb(k,j);
                          end
                          matrizr(i,j) = acumulador;		
                        end
                    end
                    fprintf('Matriz A multiplicada la Matriz B\n');
                    disp(matrizr);
                else
                    disp('Las Matrices ingresadas no pueden ser multiplicadas');
                end

            case 4
                %Matriz transpuesta
                disp('MATRIZ TRANSPUESTA');
                op = input('Ingrese 1 para Matriz A, 2 para Matriz B, 3 para Ambas Matrices: ');
                while op ~= 1 & op ~= 2 & op ~= 3;
                    op = input('Ingrese 1 para Matriz A, 2 para Matriz B, 3 para Ambas Matrices: ');
                end
                if op == 1;
                    matrizr = randn(n,m);
                    for i = 1:m;
                        for j = 1:n;
                            matrizr(j,i) = matriza(i,j);
                        end
                    end
                    disp('MATRIZ TRANSPUESTA A');
                    disp(matrizr);
                elseif op == 2;
                    matrizr = randn(y,x);
                    for i = 1:x;
                        for j = 1:y;
                            matrizr(j,i) = matrizb(i,j);
                        end
                    end
                    disp('MATRIZ TRANSPUESTA B');
                    disp(matrizr);
                else
                    disp('MATRIZ TRANSPUESTA A');
                    matrizra = randn(n,m);
                    for i = 1:m;
                        for j = 1:n;
                            matrizra(j,i) = matriza(i,j);
                        end
                    end
                    matrizrb = randn(y,x);
                    for i = 1:x;
                        for j = 1:y;
                            matrizrb(j,i) = matrizb(i,j);
                        end
                    end
                    disp(matrizra);
                    disp('MATRIZ TRANSPUESTA B');
                    disp(matrizrb);
                end
            case 5
                %Multipplicacion por escalar
                disp('Multiplicación por un escalar');
                escalar = input('Ingrese el Escalar: ');
                op = input('Ingrese 1 para multiplicar por: Matriz A, 2 para Matriz B, 3 para Ambas Matrices: ');
                while op ~= 1 & op ~= 2 & op ~= 3;
                    op = input('Ingrese 1 para multiplicar por: Matriz A, 2 para Matriz B, 3 para Ambas Matrices: ');
                end
                if op == 1;
                matrizr = randn(m,n);
                    for i = 1:m;
                        for j = 1:n;
                            matrizr(i,j) = escalar * matriza(i,j);
                        end
                    end
                    fprintf('Matriz A multiplicada por el escalar %f\n',escalar);
                    disp(matrizr);
                elseif op ==2;
                    matrizr = randn(x,y);
                    for i = 1:x;
                        for j = 1:y;
                            matrizr(i,j) = escalar * matrizb(i,j);
                        end
                    end
                    fprintf('Matriz B multiplicada por el escalar %f\n',escalar);
                    disp(matrizr);
                else
                    matrizra = randn(m,n);
                    matrizrb = randn(x,y);
                    for i = 1:m;
                        for j = 1:n;
                            matrizra(i,j) = escalar * matriza(i,j);
                        end
                    end
                    for i = 1:x;
                        for j = 1:y;
                            matrizrb(i,j) = escalar * matrizb(i,j);
                        end
                    end
                    fprintf('Matriz B multiplicada por el escalar %f\n',escalar);
                    disp(matrizrb);
                    fprintf('Matriz A multiplicada por el escalar %f\n',escalar);
                    disp(matrizra);
                end
            case 6
                break;
        end
        op = input('Desea continuar?: (6) para salir: ');
        if op == 6;
            disp('Operaciones Terminadas, Puede ingresar otra matriz');
            break;
        end
    end
    op = input('Desea Continuar? Si(1), No (0)');
    if op == 0;
        disp('Gracias por Ingresar al Programa de Matrices');
        break;
    end
end