function secant_roots = secant_wave(tol)
% secant_wave - Finds roots of h(x) = g(x)/f(x) using the Secant method.
% The secant method approximates the derivative using two points,
% avoiding the need to compute h'(x) explicitly.
% Formula: x2 = x1 - h(x1) * (x1 - x0) / (h(x1) - h(x0))
% Input: tol - convergence tolerance (e.g. 1e-6)
% Output: secant_roots - vector of all roots found

secant_roots = [];
max_iter = 100;

for i = -6:6
    x0 = i;
    x1 = i + 1;

    for iter = 1:max_iter
        hx0 = h(x0);
        hx1 = h(x1);
        % Skip if h is undefined at either point (pole of h where f(x)=0)
        if isinf(hx0) || isnan(hx0) || isinf(hx1) || isnan(hx1)
            break;
        end
        % Guard against divide-by-zero
        if abs(hx1 - hx0) < 1e-10
            break;
        end
        x2  = x1 - hx1 * (x1 - x0) / (hx1 - hx0);

        if abs(x2 - x1) < tol
            % Only store if h(x2) is actually close to zero (not a pole)
            if abs(h(x2)) < 0.1
                secant_roots = [secant_roots, x2];
            end
            break;
        end

        x0 = x1;
        x1 = x2;
    end
end

secant_roots = unique(round(secant_roots, 4));
end