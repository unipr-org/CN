% CHECKDIAGONALDOMINANCE  Check wether a square matrix is diagonally dominant
% A square matrix is considered to be diagonally dominant if, for every
% row of the matrix, the magnitude of the diagonal entry in a row is
% greater than or equal to the sum of the magnitudes of all other entries
% in that row. The sum of the diagonals is represented by 
% sum(abs(A(i, :))) - abs(A(i, i)). This function returns true if the matrix
% A is diagonally dominat, returns 0 otherwise.
%
% Examples:
%       A = [3 -2 1 ; 1 3 2 ; -1 2 4]; % Weakly diagonally dominant
%       B = [-2 2 1 ; 1 3 2 ; 1 -2 0]; % Not diagonally dominant
%       C = [-4 2 1 ; 1 6 2 ; 1 -2 5]; % Stricly diagonally dominant
%       checkDiagonalDominance(A); % 1
function isDiagonallyDominant = checkDiagonalDominance(A)
    % Find size of square matrix
    [n, ~] = size(A);

    % Set flag to true
    isDiagonallyDominant = true;

    % Sum each element in the rows and diagonals
    for i = 1:n
        sumOffDiagonal = sum(abs(A(i, :))) - abs(A(i, i));

        if sumOffDiagonal > abs(A(i, i))
            isDiagonallyDominant = false;
            break;
        end
    end
end
