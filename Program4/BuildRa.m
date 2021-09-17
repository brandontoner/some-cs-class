function [r, v] = buildRa()
    p  = [-1, 1,  0];
    q  = [ 1, 1, -1];
    syms  s1  s2;
    v  = [s1; s2];
    for j = 1 : length(p)
        r(j, 1) = sqrt((s1 - p(j))^2 + (s2 - q(j))^2) - 1;
    end
end

