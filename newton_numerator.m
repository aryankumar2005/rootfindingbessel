function newton_roots = newton_numerator(tol)

% newton_numerator - Finds roots of g(x) = J_6(x) + J_0(x) using Newton's method.
% Starting from initial guesses from -6 to 6, iteratively improves each
% guess using: x1 = x0 - g(x0) / g'(x0)
% The derivative g'(x) is computed explicitly using the Bessel recurrence relation.

% Input: tol - convergence tolerance (e.g. 1e-6)
% Output: newton_roots - vector of all roots found
% Initialise an empty array to store roots
newton_roots = [];

max_iter = 100;
% Loop over initial guesses from -6 to 6
for i = -6:6
    % Set the initial guess for Newton's method
    x0 = i;
    % Set maximum number of iterations
    for j = 1:max_iter
        % Calculate the next approximation using Newton's method formula
        x1 = x0 - (g(x0)/ g_prime(x0));

        % Check if the difference between x1 and x0 is within the tolerance
        if abs(x1-x0) < tol
            % Store the converged root
            newton_roots = [newton_roots, x1];
            % Exit the loop if convergence is reached
            break
        else
            % Update x0 for the next iteration if not converged
            x0 = x1;
        end
    end

end
% Remove duplicate roots (multiple initial guesses may converge to the same root)
newton_roots = unique(round(newton_roots, 4));
end

