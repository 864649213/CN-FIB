function [er_abs, er_rel, d, t] = funerror(x, xa)
%FUNERROR calcula error absolut, relatiu, decimals correctes i xifres significatives
%   x:: valor exacte
%   xa:: valor aproximat
er_abs = abs(x-xa)
er_rel = er_abs./x
d = fix(-log10(2*er_abs))
t = fix(-log10(2*er_rel))
end