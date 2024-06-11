% INTNUM  Numerically integrate using one of the available methods
% q = INTNUM (f, a, b, method) approximates the integral of a function f using one
% of the available methods specified by method:
%   - Midpoint rule     (mp)
%   - Trapezoidal rule  (trap)
%   - Cavalieri-Simspon (cs)
%
% q = INTNUM (f, a, b, method, m) one may also use the composite form of the available 
% methods simply by appending the letter 'c' to the name of the method. The
% parameter m indicates the number of intervals for the rule.
%
% Examples:
%       % Integrate f between 0 and pi using the Trapezoidal rule
%       q = INTNUM (@(x) sin(x), 0, pi, 'trap');
%
%       % Integrate f between 0 and pi with Cavalieri-Simpson's composite rule and 100 points
%       q = INTNUM (@(x) sin(x), 0, pi, 'ccs', 100);
function [q] = intnum (f, a, b, method, m)

    if (nargin < 5)
        m = 1;
    else
        H = (b - a)/m;
        x = linspace(a, b, m + 1);
    end
    
    switch method
        case 'mp'
            q = f((a+b)/2) * (b-a);
        case 'trap'
            q = (f(a)+f(b)) * ((b-a)/2);
        case 'cs'
            q = ((b-a)/6) * (f(a) + 4*f((a + b)/2) + f(b));
        case 'cmp'
            q = H * sum(f((x(1:m) + x(2:m+1))/2));
        case 'ctrap'
            q = H/2 * (f(a) + sum(f(x(2:m))) + f(b));
        case 'ccs'
            q = H/6 * sum(f(x(1:m)) + 4*f((x(1:m) + x(2:m+1))/2) + f(x(2:m+1)));
        
        otherwise
            error('Unsupported method provided')
    end
end

