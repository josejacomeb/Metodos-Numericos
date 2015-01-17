%Programa de Gauss-Seidel
%Por Jose Jacome
clc;
clear;
disp('###PROGRAMA DE GAUSS-SEIDEL###');
disp('______________________________');
disp('<--Por: Jose Jacome-->');
ecuaciones = input('Ingrese un numero de ecuaciones: ');
while ecuaciones < 1;
    ecuaciones = input('Ingrese un numero positivo de Ecuaciones: ');
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

%Proceso de Ordenar la Matriz
x = 1;
y = 1;
while x < ecuaciones
    for i = y:ecuaciones;
        for j = y:ecuaciones;
            if abs(matrizecuaciones(i,x)) > abs(matrizecuaciones(j,x))
                for k = 1:ecuaciones + 1;
                   aux = matrizecuaciones(i,k);
                   matrizecuaciones(i,k) = matrizecuaciones(j,k);
                   matrizecuaciones(j,k) = aux;
                end
            end
        end
    end
    x = x+1;
    y = y +1;
end
disp('-----------------------------------------------------------');
disp('$$$MATRIZ ORDENADA$$$')
disp('-----------------------------------------------------------');
for i = 1: ecuaciones +1 ;
    if i == ecuaciones + 1
        fprintf(' Ind.  \n')
    else
        fprintf('   x%i  |',i);
    end
end

disp(matrizecuaciones);

control = 0;
%Gauss Seidel
opcion = input('Desea seguir? SI (1) NO (2)');
while opcion ~= 1
    opcion = input('Desea seguir? SI (1) NO (2)');
end
disp('-----------------------------------------------------------');
disp('###METODO DE GAUSS-SEIDEL')
disp('-----------------------------------------------------------');
%Valores xant
xant = [];
disp('Ingrese los terminos a tomar para realizar el metodo: ');
for i=1:ecuaciones
    strimpresora = strcat('Ingrese el valor para el Termino x',num2str(i),']: ');
    xant(i) = input(strimpresora);
end
%Vector de Resultado
resultadox = xant;
error = 0.1;
while (1)
    x = 1; 
    aux = 0;
    for i = 1: ecuaciones
        for j = 1: ecuaciones +1
            if j ~= x 
                if j == ecuaciones + 1;
                    aux = aux + matrizecuaciones(i,j)/matrizecuaciones(x,i);
                else
                    aux = aux - matrizecuaciones(i,j)*resultadox(j)/matrizecuaciones(x,i);
                end
                
            end
        end
        x = x + 1;
        resultadox(i) = aux;
        fprintf('x(%d) = %f ',i,resultadox(i));
        aux = 0;
    end
    fprintf('\n');
    for i = 1: ecuaciones
        if abs(resultadox(i)-xant(i)) < 1e-5
            aux = aux + 1;
        end
    end
    if aux == ecuaciones
        break;
    end
    xant = resultadox;
    control =  control + 1;
end
disp('-----------------------------------------------------------');
fprintf('###SOLUCIONES HALLADAS POR GAUSS SEIDEL A %d ITERACIONES###\n',control);
disp('-----------------------------------------------------------');
for i = 1: ecuaciones;
   stringimpresora = strcat('x',num2str(i),'= ',num2str(resultadox(i)));
   disp(stringimpresora)
end