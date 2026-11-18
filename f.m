function y = f(x)
% f - Denominator of the eigenvalue relation, f(x) = J_4(x) - J_2(x)
% The roots of f(x) are where h(x) is undefined (its poles).
%
% Inputs
% x - value to evaluate f at
%
% Output
% y - value of f(x)
%
% Example: y = f(2)

y = besselj(4,x) - besselj(2,x);
end
