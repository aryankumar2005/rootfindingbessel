function y = h(x)
% h - The eigenvalue relation, h(x) = g(x) / f(x)
% h(x) = (J_6(x) + J_0(x)) / (J_4(x) - J_2(x))
% A real root of h(x) that isn't x = 0 means the special elastic wave exists.
%
% Inputs
% x - value to evaluate h at
%
% Output
% y - value of h(x)
%
% Example: y = h(2)

% ./ so that it also works if x is a vector
y = (besselj(6,x) + besselj(0,x)) ./ (besselj(4,x) - besselj(2,x));
end
