%Polinomio
clc;
clear;
disp('Programa del Polinomio');
%Pide el grado del polinomio
grado=input('Ingrese el grado del polinomio: ');
while(1);
    if grado < 0;
        grado = input('El grado de polinomio no puede ser negativo, ingrese de nuevo: ');
    else;
        break;
    end
end
for i=1:grado+1;
    texto = strcat('Ingrese los coeficientes de x^',num2str(i-1),': ');  
    polinomio(i)= input(texto);
end
s ='';
for i = grado +1:-1:1;
    if polinomio(i) == 0;
        s = strcat(s);    
    elseif polinomio(i) < 0;
        if i==1;
            s = strcat(s,num2str(polinomio(i)));
        else;
            s = strcat(s,num2str(polinomio(i)),'*x^',num2str(i-1));
        end
    else;
        if i==1;
            s = strcat(s,'+',num2str(polinomio(i)));
        else;
             s = strcat(s,'+',num2str(polinomio(i)),'*x^',num2str(i-1));
        end
    end
end
disp('<--POLINOMIO INGRESADO-->');
disp(s);

coory=[];
coorx=[];
ecuacion=s;
%Introducimos los l�mites de la gr�fica
while (1),
    ini=input('Introduzca el valor inicial:  ');
    fin=input('Introduzca el valor final:  ');
    %Comprobamos que ini>=fin
    if ini>fin
       disp('El valor iniclal no puede ser mayor que el valor final.')
    elseif ini<=fin,
       break;
    end;
end;
while (1),
   h=input('Introduzca el incremento:  ');
   if h>0 && (abs(ini)+abs(fin))>h,
      break;
   end;
end;
%Calculamos la y para cada valor de x
for x=ini:h:fin,
    temp=inline(ecuacion);
    coory=[coory temp(x)];
end;
coorx=ini:h:fin;
%Introducimos los datos en una variable llamada funcion
funcion{length(coorx),2}=[];
funcion{1,1}='x';
funcion{1,2}='y(x)';
for i=1:length(coorx),
    funcion{i+1,1}=coorx(i);
end;
for i=1:length(coorx),
    funcion{i+1,2}=coory(i);
end;
%Mostramos la tabla de valores
disp(['y(x)=' ecuacion])
disp(' ');
disp(funcion);
%Error Permitido
error = input('Ingrese el error permitido: ');
while(1);
    if error < 0;
        error = input('Ingrese el error permitido (Debe ser positivo): ');
    else
        break;
    end
end
fprintf('El error a usar es de %f \n',error);
disp('<<Buscando los puntos donde se encuentra la raiz>>');
raices = [];
for i=1:length(coorx);
    if i < length(coorx);
        if coory(i) == 0;
            fprintf('Raiz encontrada en x = %f \n',coorx(i))
        elseif coory(i)*coory(i+1) < 0;
            a = coorx(i);
            c = coorx(i+1);
            Fa = coory(i);
            Fc = coory(i+1);
            b = (a + c)/2;
            x = b;
            Fb = eval(ecuacion);
            while abs(Fb) >= error ;
                b = (a+c)/2;
                x = b;
                Fb = eval(ecuacion);
                if Fa*Fb <= 0;
                    c=b;
                    Fc=Fb;
                else
                    a=b;
                    Fa=Fb;
                end
                x = b;
            end
            fprintf('Raiz encontrada en x = %f\n',x);
        end        
    end
end
%Verificacion de las raices
cont = 0;