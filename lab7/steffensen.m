function [res] = steffensen(x0, x1, x2)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
res = x0-((x1-x0)^2)/(x2-2*x1+x0);
end

