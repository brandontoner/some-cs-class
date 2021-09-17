function [] = hmwk1()
    % Get x and y from nodepoint()
    [x, y] = nodepoint();
    % Make sure x and y are the same length
    assert(length(x) == length(y), 'x and y must have same size');
    % Get number of points
    n   = length(x);
    % Allocate matrix for  Newton's Divided Difference Interpolation Method
    mat = zeros(n, n + 1);
    % Copy x and y to the first and second column of mat
    mat(1 : n, 1) = x;
    mat(1 : n, 2) = y;
    % Perform Newton's Divided Difference Interpolation Method
    for j = 3:n + 1
        for i = 1 : n - j + 2
            mat(i, j) = (mat(i, j - 1) - mat(i + 1, j - 1)) / (mat(i, 1) - mat(i+j-2, 1));
        end
    end
    mat(1, 2 : n + 1)
end

function [x, y] = nodepoint()
    x = [1.00,   1.05,   1.10,   1.15  ];
    y = [0.1924, 0.2414, 0.2933, 0.3492];
    % x = [0.698,  0.733,  0.768,  0.803,  0.902 ];
    % y = [0.7661, 0.7432, 0.7193, 0.6946, 0.6210];
end

