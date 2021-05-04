function [t,w] = EulerMill(f, a, b, h, alpha)    %Metode de Euler Millorat (RK2)
t = [a:h:b];
N = length(t);
w(1) = alpha
for i=1:N-1
    k1 = h*f(t(i), w(i));
    k2 = h*f(t(i+1), w(i)+k1);
    w(i+1) = w(i)+(k1+k2)/2;
end
end