%Programa de Runge-Kutta Cuarto Orden
clc;
disp('__________________________________________');
disp('###Programa de Runge-Kutta de 4to Orden###');
disp('__________________________________________');
disp('By Jose Jacome');
disp('Extra Credits Carlos Solis and Alex Porras');
disp('$$$INGRESO DE DATOS$$$');
disp('Problema de Valor Inicial');
disp('INGRESO DE LA ECUACION DIFERENCIAL ORDINARIA');
ecuacion = input('dy/dx = ','s');
fprintf('Ecuacion Ingresada: dy/dx = %s\n',ecuacion);
x0 = input('Ingrese el valor de x0: ');
y0 = input('Ingrese el valor de y0: ');
fprintf('Dato Ingresado: y(%f) = %f \n',x0,y0);
xf = input('Ingrese el Valor Requerido xf = ');
fprintf('Valor a hallar y(%f) = ? \n',xf);
n = input('Ingrese el numero de divisiones: ');
while n < 1
     n = input('Ingrese un numero de divisiones mayor a 1: ');
end
disp('$$$FIN DE INGRESO DE DATOS$$$');
%Calculo de Runge-Kutta
h  = (xf-x0)/n; %Intervalo para la suma de valores
%Realizar una variable simbolica, sirve para cualquier ecuación
syms x y;
f = symfun(sym(ecuacion),[x y]); %Realiza f(x,y) para evaluar
%Inicializacion de Variables
k1 = 0;
k2 = 0;
k3 = 0;
k4 = 0;
yf = y0;
x1 = x0;
i = 1;
while x1 < xf
     k1 = double(f(x1,yf)); %Para poder evaluar
     k2 = double(f(x1 + h/2,yf + (k1*h)/2));
     k3 = double(f(x1 + h/2,yf + (k2*h)/2));
     k4 = double(f(x1 + h,yf + (k3*h)));
     yf = yf + (k1+2*k2+2*k3+k4)*h/6;
     fprintf('Valor k1 = %f, k2 = %f, k3 = %f , k4 = %f\n', k1,k2,k3,k4);
     fprintf('Valor Parcial para y(%f)≈%f\n %d proceso\n',x1,yf,i);
     x1 = x1 + h;
     if abs(x1 - xf) < h
         x1 = xf;
     end
     i = i + 1;	     
     disp('__________________________________________');
end
disp('__________________________________________');
disp('Solución Runge-Kutta de 4to Orden');
disp('__________________________________________');
fprintf('El Valor Calculado para y(%f)≈%f\n',x0,yf);

