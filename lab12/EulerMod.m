function [t,w] = EulerMod(f, a, b, h, alpha)    %Metode de Euler Modificat
t = [a:h:b];
N = length(t);
w(1) = alpha
for i=1:N-1
    k1 = w(i) + h*f(t(i), w(i))/2;
    w(i+1) = w(i)+h*f(t(i)+h/2, k1);
end
end