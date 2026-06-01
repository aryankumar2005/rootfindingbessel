function bisection_roots = bisection_denominator(tol)
% bisection_denominator - Finds roots of f(x) = J_4(x) - J_2(x) using bisection.
% Searches for sign changes across unit intervals from -6 to 5,
% then bisects each interval until the root is within tolerance.

% Input: tol - convergence tolerance (e.g. 1e-6)
% Output: bisection_roots - vector of all roots found

bisection_roots = [];

for i = -6:5
    a = i;
    b = i + 1;

    % Check for sign change — guarantees a root exists in [a,b]
    if f(a) * f(b) < 0

        % Bisect interval until width is within tolerance
        while (b - a) / 2 > tol
            c = (a + b) / 2;

            if f(c) == 0
                % Exact root found
                break;
            elseif f(a) * f(c) < 0
                % Root lies in left half
                b = c;
            else
                % Root lies in right half
                a = c;
            end
        end

        % Midpoint is our best approximation of the root
        bisection_roots = [bisection_roots, (a+b)/2];
    end
end
% Remove duplicate roots (multiple initial guesses may converge to the same root)
bisection_roots = unique(round(bisection_roots, 4));
end