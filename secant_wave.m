function secant_roots = secant_wave(tol)
% secant_wave - Finds the roots of h(x) = g(x) / f(x) using the secant method
% Like Newton's method, but estimates the derivative from the last two
% points, so h'(x) isn't needed:
% x2 = x1 - h(x1) * (x1 - x0) / (h(x1) - h(x0))
%
% Inputs
% tol - tolerance (e.g. 1e-6)
%
% Output
% secant_roots - all the roots found
%
% Example: secant_roots = secant_wave(1e-6)

% Initialise an empty array to store the roots
secant_roots = [];

% Maximum number of iterations for each pair of initial guesses
max_iter = 100;

% Loop over the initial guesses from -6 to 6
for i = -6:6
    % Set the two initial guesses
    x0 = i;
    x1 = i + 1;

    for iter = 1:max_iter
        % Evaluate h at both points
        hx0 = h(x0);
        hx1 = h(x1);

        % If h is undefined at either point (where f(x) = 0) skip these guesses
        if isinf(hx0) || isnan(hx0) || isinf(hx1) || isnan(hx1)
            warning('Secant method skipped initial guesses %d and %d because h is undefined there', i, i + 1);
            break;
        end

        % Stop if h(x1) and h(x0) are equal, to avoid dividing by zero
        if abs(hx1 - hx0) < 1e-10
            break;
        end

        % Calculate the next approximation using the secant formula
        x2 = x1 - hx1 * (x1 - x0) / (hx1 - hx0);

        % Check if the change is smaller than the tolerance
        if abs(x2 - x1) < tol
            % Only store it if h(x2) is close to zero, so it's a root and not a pole
            if abs(h(x2)) < 0.1
                secant_roots = [secant_roots, x2];
            end
            break;
        end

        % Move on to the next pair of points
        x0 = x1;
        x1 = x2;
    end
end

% Round the roots and remove any repeats
secant_roots = unique(round(secant_roots, 4));
end
