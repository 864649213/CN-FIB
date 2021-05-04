function [zero ,res ,niter ]= bisection(fun ,a,b,tol, nmax ,varargin)
%BISECTION Hallar ceros de funciones.
% ZERO=BISECTION(FUN ,A,B,TOL ,NMAX ) trata de hallar
% un cero ZERO de la fucion continua FUN en el
% intervalo [A,B] usando el metodo de biseccion.
% FUN acepta escalares reales x y devuelve un escalar
% real. Si la busqueda falla se muestra un mensaje de
% error . FUN puede ser tambien un objeto inline.
% ZERO=BISECTION(FUN ,A,B,TOL ,NMAX ,P1 ,P2 ,...) pasa
% los parametros P1 ,P2 ,.. a la funcion FUN(X,P1 ,P2 ,..).
% [ZERO ,RES ,NITER ]= BISECTION(FUN ,..) devuelve el valor
% del residuo en ZERO y el numero de iteraciones en
% las que ZERO fue calculado.
x = [a, (a+b)*0.5 , b]; fx = feval(fun ,x,varargin {:});
if fx (1)* fx(3) > 0
error ([' El signo de la funcion en los ' ,...
'extremos del intervalo debe ser diferente ']);
elseif fx (1) == 0
zero = a; res = 0; niter = 0; return
elseif fx (3) == 0
zero = b; res = 0; niter = 0; return
end
niter = 0;
I = (b - a)*0.5;
while(I >= tol && niter < nmax)
niter = niter + 1;
if fx (1)* fx(2) < 0
x(3) = x(2); x(2) = x(1)+(x(3)-x(1))*0.5;
fx = feval(fun ,x,varargin {:}); I = (x(3)-x(1))*0.5;
elseif fx (2)* fx(3) < 0
x(1) = x(2); x(2) = x(1)+(x(3)-x(1))*0.5;
fx = feval(fun ,x,varargin {:}); I = (x(3)-x(1))*0.5;
else
x(2) = x(fx ==0); I = 0;
end
end
if niter > nmax
fprintf (['la biseccion se paro sin converger ' ,...
'a la tolerancia deseada porque ' ,...
'se alcanzo el numero maximo ' ,...
'de iteraciones\n']);
end
zero = x(2); x = x(2); res = feval(fun ,x,varargin {:});
return
