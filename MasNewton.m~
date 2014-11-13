%Raices de Polinomio mas metodo de Newton
clc;
clear;
disp('<~~~Programa del Polinomio con Metodo de Biseccion y Newton~~~>');
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
%Strings almacenadoras del valor y valor derivado
stringpoli ='';
stringderiva = '';
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
%Introducimos el Incremento
while (1),
   h=input('Introduzca el incremento:  ');
   if h>0 && (abs(ini)+abs(fin))>h,
      break;
   end;
end;
%Calculamos la y para cada valor de x
k = 1; %Posicion del Polinomio
for j = ini:h:fin;
    a = 0;
    coorx(k) = j;
    for i = 1:length(polinomio);
       a = a + polinomio(i)*(j)^(i-1);        
    end
    coory(k) = a;
    k = k+1;
end
%Mostramos la tabla de valores
fprintf(' x  \t  | \t f(x) \n');
fprintf('-------------------------\n')
for i = 1:length(coorx);
    fprintf('%f  | %f\n',coorx(i),coory(i));
end
%Error Permitido
error = input('Ingrese el error permitido: ');
while(1);
    if error < 0;
        error = input('Ingrese el error permitido (Debe ser positivo): ');
    else
        break;
    end
end
%Vector donde se almacenan las raices
raices  = [];
numeroraices = 0;
rexactas = [];
nexactas = 0;
%Proceso de verificar cruces con X
for i=1:length(coory);
    if coory(i) == 0;
        numeroraices = numeroraices +1;
        nexactas = nexactas +1;
        raices(numeroraices) = coorx(i);
        rexactas(nexactas) = coorx(i);
    end
end
%Metodo usado
metodo = '';
%Decision del User por el Metodo de Newton o de Biseccion
opcion  = input('Ingrese la opción a usar: N (Método de Newton) o B (Método de Bisección): ','s');
%validacion
if opcion == 'B';
    metodo = 'Biseccion';
else
    metodo = 'Newton';
end
switch (opcion) 
	case 'N'
        %Código Método de Newton
        for i =2 : length(polinomio);
            polinomioderivado(i-1) = (i-1)*polinomio(i);
        end
        for i = length(polinomioderivado):-1:1;
            if polinomioderivado(i) == 0;
                stringderiva = strcat(stringderiva);    
            elseif polinomioderivado(i) < 0;
                if i==1;
                    stringderiva = strcat(stringderiva,num2str(polinomioderivado(i)));
                else
                    stringderiva = strcat(stringderiva,num2str(polinomioderivado(i)),'*x^',num2str(i-1));
                end
            else
                if i==1;
                    stringderiva = strcat(stringderiva,'+',num2str(polinomioderivado(i)));
                else
                    stringderiva = strcat(stringderiva,'+',num2str(polinomioderivado(i)),'*x^',num2str(i-1));
                end
            end
        end
        disp('<--POLINOMIO DERIVADO-->');
        %Muestro el Polinomio Derivado
        disp(stringderiva);
        %Busco las raíces e inicializo x0 e x1
        %Evaluo en el Polinomio y en el derivado
        %veo donde hay una raiz
        for i=2:length(coorx);
            if coory(i)*coory(i-1) < 0;
                x0 = coorx(i-1);
                x1 = 1 ;
                Fx0 = 1;
                while abs(Fx0) > error;
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
                for i = 1:numeroraices;
                    if x1 == raices(i)
                        contiguales = contiguales + 1;                   
                    end
                end
                if contiguales == 0
                    numeroraices = numeroraices +1;
                    raices(numeroraices) = x1;
                end
            end
        end
	case 'B'
        %Codigo de Biseccion
         for i=2:length(coorx);
            if coory(i-1)*coory(i) < 0;
                a = coorx(i-1);
                c = coorx(i);
                Fa = coory(i-1);
                Fc = coory(i);
                b = (a + c)/2;
                Fb = 0;
                for i = 1:length(polinomio);
                    Fb = Fb + polinomio(i)*(b)^(i-1);
                end
                while abs(Fb) >= error ;
                    b = (a+c)/2;
                    Fb = 0;
                    for i = 1:length(polinomio);
                        Fb = Fb + polinomio(i)*(b)^(i-1); 
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
                    if b == raices(i)
                        contiguales = contiguales + 1;                   
                    end
                end
                if contiguales == 0;
                    numeroraices = numeroraices +1;
                    raices(numeroraices) = b;
                end
            end
         end
end
%Numero de Iteraciones
iteraciones = 0;
if numeroraices>0;
    %Aqui me imprime las racies        
    for i = 1:length(raices);
        j = 0;
        contadorexactas = 0;
        while j<nexactas;
            j = j +1;
            if rexactas(j) == raices(i);
                fprintf('Raiz EXACTA encontrada en x  = %f \n',raices(i));
                contadorexactas = contadorexactas + 1;
            end
        end
        if contadorexactas == 0;
            fprintf('Raiz Mediante el Metodo de %s encontrada en x  = %f \n',metodo,raices(i));
        end
    end
else
fprintf('No se encontraron raices, ingresando a iterar \n');
ingresaiteraciones = input('Ingrese el Numero de iteraciones a realizar: ');    
    while iteraciones < ingresaiteraciones;
        h = h/2;
        k = 1; %Posicion del Polinomio
        for j = ini:h:fin;
            a = 0;
            coorx(k) = j;
            for i = 1:length(polinomio);
             a = a + polinomio(i)*(j)^(i-1);        
            end
            coory(k) = a;
            k = k+1;
        end
        if metodo == 'N';
            for i=2:length(coorx);
                if coory(i)*coory(i-1) < 0;
                    x0 = coorx(i-1);
                    x1 = 1 ;
                    Fx0 = 1;
                    while abs(Fx0) > error;
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
                    for i = 1:numeroraices;
                        if x1 == raices(i)
                            contiguales = contiguales + 1;                   
                        end
                    end
                    if contiguales == 0
                        numeroraices = numeroraices +1;
                        raices(numeroraices) = x1;
                    end
                end
            end
        else
            %Codigo de Biseccion
         for i=2:length(coorx);
            if coory(i-1)*coory(i) < 0;
                a = coorx(i-1);
                c = coorx(i);
                Fa = coory(i-1);
                Fc = coory(i);
                b = (a + c)/2;
                Fb = 0;
                for i = 1:length(polinomio);
                    Fb = Fb + polinomio(i)*(b)^(i-1);
                end
                while abs(Fb) >= error ;
                    b = (a+c)/2;
                    Fb = 0;
                    for i = 1:length(polinomio);
                        Fb = Fb + polinomio(i)*(b)^(i-1); 
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
                    if b == raices(i)
                        contiguales = contiguales + 1;                   
                    end
                end
                if contiguales == 0;
                    numeroraices = numeroraices +1;
                    raices(numeroraices) = b;
                end
            end
         end
        end
        iteraciones = iteraciones + 1;
    end
    %Aqui me imprime las racies        
    for i = 1:length(raices);
        j = 0;
        while j<nexactas;
            j = j +1;
            if rexactas(j) == raices(i);
                fprintf('Raiz EXACTA encontrada en x  = %f \n',raices(i));
            end
        end
        fprintf('Raiz Mediante el Metodo de %s encontrada en x  = %f \n',metodo,raices(i));
    end
end 
