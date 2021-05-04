function [zero ,res ,niter ]= secante(fun ,a,b,tol, nmax ,varargin)
%SECANTE Hallar ceros de funciones.
% ZERO=BISECTION(FUN ,A,B,TOL ,NMAX ) trata de hallar
% un cero ZERO de la fucion continua FUN en el
% intervalo [A,B] usando el metodo de la secante.
% FUN acepta escalares reales x y devuelve un escalar
% real. Si la busqueda falla se muestra un mensaje de
% error . FUN puede ser tambien un objeto inline.
% ZERO=SECANTE(FUN ,A,B,TOL ,NMAX ,P1 ,P2 ,...) pasa
% los parametros P1 ,P2 ,.. a la funcion FUN(X,P1 ,P2 ,..).
% [ZERO ,RES ,NITER ]= SECANTE(FUN ,..) devuelve el valor
% del residuo en ZERO y el numero de iteraciones en
% las que ZERO fue calculado.
x(1) = a;
x(2) = b;
f = fun;
%fx = feval(fun ,x,varargin {:});

% si a o b son las raices
if f(x(1)) == 0
zero = a; res = 0; niter = 0; return
elseif f(x(2)) == 0
zero = b; res = 0; niter = 0; return
end

I = min(abs(f(x(1))),abs(f(x(2))));
niter = 0;
while(I >= tol && niter < nmax)
niter = niter + 1;
i = niter+2;
x(i) = x(i-1) - f(x(i-1))*(x(i-1)-x(i-2))/(f(x(i-1))-f(x(i-2)));
I = abs(f(x(i)));
end
if niter > nmax
fprintf (['la biseccion se paro sin converger ' ,...
'a la tolerancia deseada porque ' ,...
'se alcanzo el numero maximo ' ,...
'de iteraciones\n']);
end
zero = x(niter+2); x = x(niter+2); res = f(x);
return
