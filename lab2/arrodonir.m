function y=arrodonir(x, t) 
%ARRODONIR calcula el valor redondeado de un n¨²mero con decimales
%   x:: valor a redondear
%   t:: cifras decimales a redondear
if (x==0 || t <= 0)
    y=0;
    return;
end
aux = x;
for i=1:t+1
    aux = aux*10;
end
if (mod(aux,10) >= 5) %redondear haciar arriba en caso de 5
    aux = aux/10+1;
else
    aux = aux/10;
end
aux = fix(aux); %eliminar parte decimal fuera del redondeo
y = aux*10^(-t); %volver a obtener decimales

    
    