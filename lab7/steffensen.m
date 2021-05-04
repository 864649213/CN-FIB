function [res] = steffensen(x0, x1, x2)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
res = x0-((x1-x0)^2)/(x2-2*x1+x0);
end

