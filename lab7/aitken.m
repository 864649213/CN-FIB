function [res] = aitken(x, x1, x2)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
res = (x2*x-(x1^2))/(x2-2*x1+x);
end

