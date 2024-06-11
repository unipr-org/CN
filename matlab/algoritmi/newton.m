%% NEWTON  Find roots of a function using Newton's method
% newton (f, df, x0, tol, max_iter) finds a root of the function f using the
% derivative of that function and a starting point x0. tol is the accepted
% tolerance and max_iter the maximum number of iterations allowed.
%
% Examples:
%       f = @(x) sin(x);
%       df = @(x) cos(x);
%       x = 3;
%       % Finds a root of f using 3 as starting point
%       [v, y, num_iter] = newton(f, df, x, 10^-5, 100);
%
% See also BISECTION, BISECTION1, SECANT
function [v, y, iter] = newton(f, df, x0, tol, max_iter)
    % Number of iterations
    iter = 0;

    % Preallocate for speed
    v = zeros(1,max_iter);
    y = zeros(1,max_iter);
    
    % Check number of iterations
    while iter < max_iter
        iter = iter + 1;

        % Intersection with x-axis
        x = x0 - (f(x0) / df(x0));
        
        v(iter) = x;
        y(iter) = abs(f(x));

        %criteria = abs(x - x0); % Increment
        %criteria = abs(f(x)); % Residual

        % Tolerance check
        if abs(f(x)) < tol
            v = v(1:iter)';
            y = y(1:iter)';
            return
        end

        x0 = x;
    end
    
    % Truncate to maximum number of iterations
    warning('Maximum number of iterations reached.')
    v = v(1:max_iter)';
    y = y(1:max_iter)';
end
    