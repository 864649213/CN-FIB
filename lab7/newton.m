function [x,F,iter ] = newton(Ffun ,Jfun ,x0 ,tol, nmax , varargin)
%NEWTONSYS halla un cero de un sistema no lineal.
% [ZERO ,F,ITER ]= NEWTONSYS(FFUN ,JFUN ,X0 ,TOL ,NMAX)
% trata de hallar el vector ZERO , cero de un sistema
% no lineal definido en FFUN con matriz jacobiana
% definida en la function JFUN , mas cercano al vector
% X0.
iter = 0; err = tol + 1; x = x0;
while err > tol && iter < nmax
J = feval(Jfun ,x,varargin {:});
F = feval(Ffun ,x,varargin {:});
delta = - J\F;
x = x + delta;
err = norm(delta );
iter = iter + 1;
end
F = norm(feval(Ffun ,x,varargin {:}));
if iter >= nmax
fprintf(' No converge en el numero maximo ' ,' de iteraciones \n ');
fprintf(' El iterante devuelto tiene un residuo ' ,' relativo %e\n',F);
else
fprintf(' El metodo convergio en la iteracion ' , '%i con un residuo %e\n',iter ,F);
end
return