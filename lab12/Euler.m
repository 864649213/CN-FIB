function [t,w] = Euler(f, a, b, h, alpha)    %Metode de Euler
t = [a:h:b];
N = length(t);
w(1) = alpha
for i=1:N-1
    w(i+1) = w(i)+h*f(t(i), w(i));
end
end