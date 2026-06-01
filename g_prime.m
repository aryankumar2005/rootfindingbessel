function y = g_prime(x)
% g_prime - Derivative of the numerator function g(x).
% Used explicitly in Newton's method to compute the next iteration.
% Computed using the Bessel function recurrence relation:
% J_n'(x) = (J_{n-1}(x) - J_{n+1}(x)) / 2

% Input: x - candidate eigenvalue
% Output: y - value of g'(x)

y = (besselj(5,x) - besselj(7,x))/2 + (besselj(-1,x) - besselj(1,x))/2;
end