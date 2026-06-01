function y = f(x)
% f - Denominator function: f(x) = J_4(x) - J_2(x)
% Roots of f(x) are poles of the eigenvalue relation h(x).

% Input: x - candidate eigenvalue
% Output: y - value of J_4(x) - J_2(x

y = besselj(4,x) - besselj(2,x);
end