%Programa de Gauss-Seidel
%Por Jose Jacome
clc;
clear;
disp('###PROGRAMA DE GAUSS-SEIDEL###');
disp('______________________________');
disp('\nPor: Jos� J�come\n');
ecuaciones = input('Ingrese un numero de ecuaciones: ');
while ecuaciones < 1;
    ecuaciones = input('Ingrese un numero positivo de Ecuaciones: ');
end
for i = 1:ecuaciones;
    for j = 1:ecuaciones+1;
        if j == ecuaciones+1;
            strimpresora = strcat('Termino Independiente',num2str(i),'[',num2str(j),']: ');
        else
            strimpresora = strcat('Termino x',num2str(i),'[',num2str(j),']: ');
        end
        matrizecuaciones(i,j) = input(strimpresora);  
    end        
end
disp('$$$MATRIZ INGRESADA$$$');
disp(matrizecuaciones);

%Proceso de Ordenar la Matriz
x = 1;
y = 1;
while x < ecuaciones
    for i = y:ecuaciones;
        for j = y:ecuaciones;
            if abs(matrizecuaciones(i,x)) > abs(matrizecuaciones(j,x))
                for k = 1:ecuaciones;
                   aux = matrizecuaciones(i,k);
                   matrizecuaciones(i,k) = matrizecuaciones(j,k);
                   matrizecuaciones(j,k) = aux;
                end
            end
        end
    end
    x = x+1;
    y = y +1;
    if x == ecuaciones +1
        break
    end
end
disp('$$$MATRIZ ORDENADA$$$');
disp(matrizecuaciones);