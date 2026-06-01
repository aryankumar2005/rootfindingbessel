% solve_wave - Plots roots of the eigenvalue relation found by all three methods.
% Bisection finds roots of f(x) (denominator)
% Newton finds roots of g(x) (numerator)
% Secant finds roots of h(x) (full eigenvalue relation)

% Find roots using each method
tol = 1e-6;
bisection_roots = bisection_denominator(tol);
newton_roots    = newton_numerator(tol);
secant_roots    = secant_wave(tol);

% Plot all roots on the x-axis
figure;
hold on;
grid on;

% Offset vertically so overlapping roots remain visible
plot(bisection_roots, zeros(size(bisection_roots)), 'ro', 'MarkerFaceColor', 'r', 'LineWidth', 2, 'DisplayName', 'Bisection (denominator)');
plot(newton_roots,    zeros(size(newton_roots)) + 0.1,    'gs', 'MarkerFaceColor', 'g', 'LineWidth', 2, 'DisplayName', 'Newton (numerator)');
plot(secant_roots,    zeros(size(secant_roots)) - 0.1,    'bd', 'MarkerFaceColor', 'b', 'LineWidth', 2, 'DisplayName', 'Secant (full equation)');

hold off;
xlabel('x');
title('Roots of the Bessel Eigenvalue Relation');
legend('Location', 'best');
ylim([-1, 1]);
