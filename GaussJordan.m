%Programa de Eliminacion de Gauss
%Por Jose Jacome
clc;
clear;
disp('###PROGRAMA DE GAUSS JORDAN###');
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
%Matriz Identidad
for i = 1: ecuaciones
    for j = ecuaciones + 2:2*ecuaciones + 1
        if i == j-(ecuaciones + 1)
            matrizecuaciones(i,j) = 1;
        else
            matrizecuaciones(i,j) = 0;
        end
    end
end
disp('-----------------------------------------------------------');
disp('$$$MATRIZ INGRESADA$$$');
disp('-----------------------------------------------------------');
disp(matrizecuaciones);
%Calculo del Determinante
determinante = 0;
cont = 1;
y = 1;
aux = 1;
while cont <= ecuaciones
    for x = 1 : ecuaciones
        if x == 1
            aux = matrizecuaciones(x,y); 
        else
            aux = aux*matrizecuaciones(x,y);
        end  
        if y == ecuaciones
            y = 1;
        else
            y = y + 1;
        end
    end  
    if y == ecuaciones
        y = 1;
    else 
        y = y + 1;
    end
    y = y + 1;
    cont = cont + 1;
    determinante = determinante + aux;
end
contador  = 0;
disp('$$$Calculando el Triangulo Inferior');
%Triangulo Inferior
for i = 1 : ecuaciones - 1
    for k = i+1 : ecuaciones
        for j  = 2*ecuaciones + 1 : -1 : 1
            aux = 0;
            if matrizecuaciones(i,i) == 0;
               aux = matrizecuaciones(i,j);
               matrizecuaciones(i,j) = matrizecuaciones(k,j);
               matrizecuaciones(k,j) = aux;  
               contador = contador + 1;
            else
                matrizecuaciones(k,j)  = matrizecuaciones(i,i)*matrizecuaciones(k,j) - matrizecuaciones(k,i)*matrizecuaciones(i,j);
            end 
        end
        if matrizecuaciones(i,i) == 0
            k = k -1 ;
        end
        disp(matrizecuaciones);
    end
end
disp('$$$Desarrollando la Matriz Identidad');
%Hacer unos las primeras filas
for i = ecuaciones:-1:1 
    for j = 2*ecuaciones + 1:-1:i
        matrizecuaciones(i,j) = matrizecuaciones(i,j)/matrizecuaciones(i,i);
    end
end
disp(matrizecuaciones);
disp('$$$Calculando el triangulo Superior$$$');
%Triangulo Superior
disp('Triangulo Superior');
for i = ecuaciones:-1:2
     for k = i-1:-1:1 
        for j  = 2*ecuaciones + 1: -1 : i        
            matrizecuaciones(k,j)  = matrizecuaciones(i,i)*matrizecuaciones(k,j) - matrizecuaciones(k,i)*matrizecuaciones(i,j);
        end
        disp(matrizecuaciones);
     end
end
%Respuestas

disp('-----------------------------------------------------------');
fprintf('###SOLUCIONES HALLADAS POR GAUSS-JORDAN\n');
disp('-----------------------------------------------------------');
for i = 1: ecuaciones;
   stringimpresora = strcat('x',num2str(i),'= ',num2str(matrizecuaciones(i, ecuaciones + 1)));
   disp(stringimpresora)
end
disp('-----------------------------------------------------------');
fprintf('###MATRIZ INVERSA\n');
disp('-----------------------------------------------------------');
for j = 1 : ecuaciones
  for i = ecuaciones + 2: 2*ecuaciones + 1
    fprintf('%f \t\t',matrizecuaciones(j,i));
  end
  fprintf('\n');
end
disp('-----------------------------------------------------------');
fprintf('###DETERMINANTE DE LA MATRIZ\n');
disp('-----------------------------------------------------------');
if mod(contador,2) == 0
    fprintf('Valor Determinante = %f',determinante);
else
    fprintf('Valor Determinante = %f',-determinante);
end
