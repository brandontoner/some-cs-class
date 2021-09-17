function [ ] = GaussNewton( r, v, xi, eps )
    format long;
    [Dr] = BuildJacobian(r, v);
    x    = xi;
    dx   = Inf;

    while norm(dx) >= eps
        r_x  = double(subs(r,  v, x));
        Dr_x = double(subs(Dr, v, x));
        dx   = inv((transpose(Dr_x) * Dr_x)) * (transpose(Dr_x) * r_x);
        x    = x - dx
    end
end

function [Dr] = BuildJacobian( r, v )
    Dr = jacobian(r, v);
    Nv = length(v);
    H  = zeros(Nv, Nv);
    for j = 1 : length(r)
        H = H + r(j) * hessian(r(j), v);
    end
end
