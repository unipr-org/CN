%% BISECTION  Find roots of a function using the bisection method
% BISECTION (f, a, b, tol, max_iter) finds the roots of a function in a
% range from a to b using tol as the tolerance and max_iter as the maximum
% number of iterations allowed. This function returns 3 values: v the
% vector containing the approximations, y the vector containing the
% residues and iter the number of iterations.
%
% Examples:
%       f = @(x) sin(x);
%       % Find a root for f in range 3 to 4
%       [v, y, iter] = bisection1(f, 3, 4, 10^-10, 100);
%   
% See also BISECTION1, SECANT, NEWTON
function [v, y, iter] = bisection(f, a, b, tol, max_iter)
    if sign(f(a)) == sign(f(b))
        error('Interval does not satisfy the conditions.')
    end

    % Number of iterations
    iter = 0;

    % Preallocate for speed
    v = zeros(1, max_iter);
    y = zeros(1, max_iter);

    % Check number of iterations
    while iter < max_iter
        iter = iter + 1;

        % First midpoint
        x = (a + b) * 0.5;

        % Store in column vector
        v(iter) = x;            % Midpoints
        y(iter) = abs(f(x));    % Residual

        % Tolerance check
        if abs(b-a) < tol % abs(f(a)) < tol
            % Truncate unused elements
            v = v(1:iter)';
            y = y(1:iter)';
            return
        end
    
        % f(a)*f(x)>0
        if sign(f(a)) == sign(f(x)) % Root on right side
            a = x;
        elseif f(x) == 0 || f(a) == 0
            disp('Found root')
            disp(x)
            return
        % f(a)*f(b)<0
        else % Root on left side
            b = x;
        end
    end

    % Truncate vectors to max_iter
    warning('Maximum number of iterations reached.')
    v = v(1:max_iter)';
    y = y(1:max_iter)';
end