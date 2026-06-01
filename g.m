function y = g(x)
% g - Numerator function: g(x) = J_6(x) + J_0(x)
% Roots of g(x) are roots of the eigenvalue relation h(x).

% Input: x - candidate eigenvalue
% Output: y - value of J_6(x) + J_0(x)
y = besselj(6,x) + besselj(0,x);
end