% Plots cubic spline

function splineplot()
    [x, y] = nodepoint();
    n = length(x);
    coeff = splinecoeff()
    clf;
    hold on;
    for i = 1 : n - 1
        % create an array of points evenly distributed in x(i) and x(i + 1)
        x0 = linspace(x(i), x(i + 1), 100);
        dx = x0 - x(i);
        y0 = coeff(i, 1) + coeff(i, 2) * dx + coeff(i, 3) * dx .* dx + coeff(i, 4) * dx .* dx .* dx;
        plot([x(i), x(i + 1)], [y(i), y(i + 1)], 'o', x0, y0)
    end
    hold off;
end
