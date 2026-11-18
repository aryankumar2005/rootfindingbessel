function y = g(x)
% g - Numerator of the eigenvalue relation, g(x) = J_6(x) + J_0(x)
% The roots of g(x) are the roots of h(x).
%
% Inputs
% x - value to evaluate g at
%
% Output
% y - value of g(x)
%
% Example: y = g(2)

y = besselj(6,x) + besselj(0,x);
end
