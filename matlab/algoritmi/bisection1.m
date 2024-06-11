%% BISECTION1 Find roots of a function in a range
% bisection(f,a,b,tol) finds the root of f given as function
% handle in the range a to b with tol referring to the
% tolerance accepted. This method uses recursion.
%
% Examples
%   f = @(x) sin(x);
%   [x] = bisection(f, 3, 4, 10^-10);
%
% See also BISECTION, SECANT, NEWTON
function [x] = bisection1(f, a, b, tol)

    % First midpoint
    x = (a + b) * 0.5; % (a+b)/2
    
    % If first midpoint is root
    if f(x) == 0
        return
    end

    % Check zero existence in specified interval
    if sign(f(a)) == sign(f(b)) % f(a) * f(b) > 0
        error('Interval does not satisfy the conditions.')
    end

    % Resiual criteria
    if abs(b - a) < tol
        return
    elseif sign(f(a)) == sign(f(x)) % Right side
        x = bisection(f, x, b, tol);
    elseif sign(f(b)) == sign(f(x)) % Left side
        x = bisection(f, a, x, tol);
    end

end