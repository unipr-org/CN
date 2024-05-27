%% BISECTION1 Find roots of a function in a range using max iterations
% bisection1(f,a,b,tol,max_iter) works similarly to bisection but takes as
% additional argument max_iter indicating the maximum number of iterations
% allowed to find a root.
%
% Examples:
%   f = @(x) sin(x);
%   [v, y, iter] = bisection1(f, 3, 4, 10^-10, 100);
%   
% See also BISECTION
function [v, y, iter] = bisection1(f, a, b, tol, max_iter)

    if sign(f(a)) == sign(f(b))
        error('Interval does not satisfy the conditions.')
    end

    % Number of iterations
    iter = 0;

    % Preallocate for speed
    v = zeros(1, iter);
    y = zeros(1, iter);

    % Check error and number of iterations
    while (abs(b-a) > tol) && (iter < max_iter)
        iter = iter + 1;

        % First midpoint
        x = (a + b) * 0.5;

        % Store in column vector
        v(iter) = x;            % Midpoints
        y(iter) = abs(f(x));    % Residual

        if sign(f(a)) == sign(f(x)) % Right side f(a)*f(x)>0
            a = x;
        elseif f(x) == 0 || f(a) == 0
            disp('Found root')
            disp(x)
            return
        else % Left side
            b = x;
        end
    end

    % Truncate unused elements
    v = v(1:iter)';
    y = y(1:iter)';

end