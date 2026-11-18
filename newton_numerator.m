function newton_roots = newton_numerator(tol)
% newton_numerator - Finds the roots of g(x) = J_6(x) + J_0(x) using
% Newton's method
% Starts from each initial guess from -6 to 6 and uses
% x1 = x0 - g(x0) / g'(x0) until the change is smaller than the tolerance.
%
% Inputs
% tol - tolerance (e.g. 1e-6)
%
% Output
% newton_roots - all the roots found
%
% Example: newton_roots = newton_numerator(1e-6)

% Initialise an empty array to store the roots
newton_roots = [];

% Maximum number of iterations for each initial guess
max_iter = 100;

% Loop over the initial guesses from -6 to 6
for i = -6:6
    % Set the initial guess
    x0 = i;
    % Keep track of whether this guess has converged
    converged = false;

    for j = 1:max_iter
        % Calculate the next approximation using Newton's method
        x1 = x0 - g(x0) / g_prime(x0);

        % Check if the change is smaller than the tolerance
        if abs(x1 - x0) < tol
            % Store the root
            newton_roots = [newton_roots, x1];
            converged = true;
            % Stop iterating for this guess
            break
        else
            % Otherwise use x1 as the next guess
            x0 = x1;
        end
    end

    % Warn if this guess never converged (this happens at x0 = 0, where g'(0) = 0)
    if converged == false
        warning('Newton''s method did not converge from initial guess x0 = %d', i);
    end
end

% Round the roots and remove any repeats (different guesses can find the same root)
newton_roots = unique(round(newton_roots, 4));
end
