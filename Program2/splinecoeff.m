% Calculates coefficients of cubic spline
% Output: matrix of coefficients [ak bk ck dk]

function coeff=splinecoeff()
    [x, y] = nodepoint();
    n      = length(x);
    A      = zeros(n, n);
    r      = zeros(n, 1);
    dx     = zeros(n, 1);
    dy     = zeros(n, 1);
    % verify x and y are the same size
    assert(length(x) == length(y), 'x and y must have same size');
    % define dx and dy
    for i = 1 : n - 1
        dx(i) = x(i + 1) - x(i);
        dy(i) = y(i + 1) - y(i);
    end
    % Calculate A and r
    for i = 2 : n - 1
        A(i, i - 1 : i + 1) = [dx(i - 1), 2 * (dx(i - 1) + dx(i)), dx(i)];
        r(i)                = 3 * (dy(i) / dx(i) - dy(i - 1) / dx(i - 1));
    end

    % Set endpoint conditions
    A(1, 1)     = 1;
    A(n, n)     = 1;
    coeff       = zeros(n, 4);
    coeff(:, 1) = y;
    coeff(:, 3) = A \ r;
    for i = 1 : n - 1
        coeff(i, 4) = (coeff(i + 1, 3) - coeff(i, 3)) / (3 * dx(i));
        coeff(i, 2) = dy(i) / dx(i) - dx(i) * (2 * coeff(i, 3) + coeff(i + 1, 3)) / 3;
    end
    coeff = coeff(1 : n - 1, 1 : 4);
end



