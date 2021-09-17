function [ ] = GaussNewton( xi, eps )
    format long;
    x = xi;
    dx = Inf;
    while norm(dx) >= eps
        [r, Dr, H] = sub2(x); % sub1(x);
        dx = inv((transpose(Dr) * Dr) + H)*(transpose(Dr)*r);
        x = x - dx
    end
end

function [r, Dr, H] = sub1( x )
    p  = [-1, 1,  0];
    q  = [ 1, 1, -1];
    n  = length(p);
    r  = zeros(n, 1);
    Dr = zeros(n, 2);
    H  = zeros(2, 2);
    for j = 1 : n
        s         = sqrt((x(1) - p(j))^2 + (x(2) - q(j))^2);
        r(j)      = s - 1;
        Dr(j, : ) = [(x(1) - p(j)) / s, (x(2) - q(j)) / s];
        h = [(q(j)-x(2))^2,           (x(1)-p(j))*(q(j)-x(2))
             (x(1)-p(j))*(q(j)-x(2)), (p(j)-x(1))^2          ] / (s^3);
        H = H + r(j) * h;
    end
end

function [r, Dr, H] = sub2( x )
    t  = [    1,     6,    11,     16,     21,     26,     31];
    y  = [53.05, 73.04, 98.31, 139.78, 193.48, 260.20, 320.39];
    n  = length(t);
    r  = zeros(n, 1);
    Dr = zeros(n, 3);
    H  = zeros(3, 3);
    for j = 1 : length(t)
        r(j)      = x(1) + x(2) * exp(x(3) * t(j)) - y(j);
        Dr(j, : ) = [1, exp(x(3) * t(j)), x(2) * t(j) * exp(x(3) * t(j))];
        h         = [0,                       0,                                0;
                     0,                       0,          t(j) * exp(x(3) * t(j));
                     0, t(j) * exp(x(3) * t(j)), x(2) * t(j)^2 * exp(x(3) * t(j))];
        H         = H + r(j) * h;
    end
end

