function y = g_prime(x)
% g_prime - Derivative of g(x), used in Newton's method
% Uses the Bessel function relation J_n'(x) = (J_{n-1}(x) - J_{n+1}(x)) / 2
% so g'(x) = J_6'(x) + J_0'(x) = (J_5 - J_7)/2 + (J_-1 - J_1)/2
%
% Inputs
% x - value to evaluate g' at
%
% Output
% y - value of g'(x)
%
% Example: y = g_prime(2)

y = (besselj(5,x) - besselj(7,x))/2 + (besselj(-1,x) - besselj(1,x))/2;
end
