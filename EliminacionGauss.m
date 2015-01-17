%Programa de Eliminacion de Gauss
%Por Jose Jacome
clc;
clear;
disp('###PROGRAMA DE ELIMINACION DE GAUSS###');
disp('______________________________________');
disp('<--Por: Jose Jacome-->');
ecuaciones = input('Ingrese un numero de ecuaciones: ');
while ecuaciones < 1;
    ecuaciones = input('Ingrese un numero positivo de Ecuaciones: ');
end
while ecuaciones > 10 
    ecuaciones = input('Ingrese un numero de ecuaciones menor a 10: ');
end
for i = 1:ecuaciones;
    for j = 1:ecuaciones+1;
        if j == ecuaciones+1;
            strimpresora = strcat('Termino Independiente',num2str(i),': ');
        else
            strimpresora = strcat('Termino x',num2str(j),'[',num2str(i),']: ');
        end
        matrizecuaciones(i,j) = input(strimpresora);  
    end 
end
disp('-----------------------------------------------------------');
disp('$$$MATRIZ INGRESADA$$$');
disp('-----------------------------------------------------------');
disp(matrizecuaciones);
for i = 1 : ecuaciones - 1
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
        fprintf('%d Pasada\n',i*k);
        disp(matrizecuaciones)
    end
end
%Respuestas
resultado = zeros(1,ecuaciones);
disp('---------------------------------------------');
disp('###HALLANDO SOLUCIONES PARA LAS ECUACIONES###');
disp('---------------------------------------------');
for i = ecuaciones:-1:1
    aux = 0;
    for j = 1 : ecuaciones + 1
        if j == ecuaciones + 1
            aux = aux + matrizecuaciones(i,j)/matrizecuaciones(i,i);
        else
            aux = aux - resultado(j)*matrizecuaciones(i,j)/matrizecuaciones(i,i);
        end 
    end
    fprintf('La solucion de x%d = %f\n',i,aux);
        resultado(i) = aux ;
end

disp('-----------------------------------------------------------');
fprintf('###SOLUCIONES HALLADAS POR ELIMINACION DE GAUSS\n');
disp('-----------------------------------------------------------');
for i = 1: ecuaciones;
   stringimpresora = strcat('x',num2str(i),'= ',num2str(resultado(i)));
   disp(stringimpresora)
end