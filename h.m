function y = h(x)

% h - Full eigenvalue relation: h(x) = g(x) / f(x)
% h(x) = (J_6(x) + J_0(x)) / (J_4(x) - J_2(x))
% A real root of h(x) that is not x=0 indicates a special elastic wave exists.

% Input: x - candidate eigenvalue
% Output: y - value of h(x)

y = (besselj(6,x) + besselj(0,x)) / (besselj(4,x) - besselj(2,x));
end