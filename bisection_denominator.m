function bisection_roots = bisection_denominator(tol)
% bisection_denominator - Finds the roots of f(x) = J_4(x) - J_2(x) using
% the bisection method
% Checks each interval of width 1 from -6 to 6 for a sign change, then
% halves the interval until it is smaller than the tolerance.
%
% Inputs
% tol - tolerance (e.g. 1e-6)
%
% Output
% bisection_roots - all the roots found
%
% Example: bisection_roots = bisection_denominator(1e-6)

% Initialise an empty array to store the roots
bisection_roots = [];

% Loop through the intervals [-6,-5], [-5,-4], ..., [5,6]
for i = -6:5
    % Set the start of the interval
    a = i;
    % Set the end of the interval
    b = i + 1;

    % If f changes sign over [a,b] there must be a root in between
    if f(a) * f(b) < 0

        % Keep halving the interval until it is smaller than the tolerance
        while (b - a) / 2 > tol
            % Calculate the midpoint
            c = (a + b) / 2;

            if f(c) == 0
                % c is exactly the root
                break;
            elseif f(a) * f(c) < 0
                % The sign changes in [a,c], so the root is in the left half
                b = c;
            else
                % Otherwise the root is in the right half [c,b]
                a = c;
            end
        end

        % Store the midpoint as the approximate root
        bisection_roots = [bisection_roots, (a + b) / 2];
    end
end

% Round the roots and remove any repeats
bisection_roots = unique(round(bisection_roots, 4));
end
