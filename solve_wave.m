% solve_wave - Finds the roots of the eigenvalue relation with all three
% methods and plots them on the x axis
% Bisection finds the roots of f(x), the denominator
% Newton's method finds the roots of g(x), the numerator
% The secant method finds the roots of h(x), the full equation
%
% Run by typing solve_wave in the command window

% Tolerance for all three methods
tol = 1e-6;

% Find the roots using each method
bisection_roots = bisection_denominator(tol);
newton_roots = newton_numerator(tol);
secant_roots = secant_wave(tol);

% Set up the figure
figure;
hold on;
grid on;

% Plot the roots from each method
% Newton and secant are moved up and down slightly so they don't sit on top of each other
plot(bisection_roots, zeros(size(bisection_roots)), 'ro', 'MarkerFaceColor', 'r', 'LineWidth', 2, 'DisplayName', 'Bisection (denominator)');
plot(newton_roots, zeros(size(newton_roots)) + 0.1, 'gs', 'MarkerFaceColor', 'g', 'LineWidth', 2, 'DisplayName', 'Newton (numerator)');
plot(secant_roots, zeros(size(secant_roots)) - 0.1, 'bd', 'MarkerFaceColor', 'b', 'LineWidth', 2, 'DisplayName', 'Secant (full equation)');

hold off;

% Labels, title and legend
xlabel('x');
title('Roots of the Bessel Eigenvalue Relation');
legend('Location', 'best');
ylim([-1, 1]);
