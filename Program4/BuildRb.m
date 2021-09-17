function [r, v] = buildRb()
    t  = [    1,     6,    11,     16,     21,     26,     31];
    y  = [53.05, 73.04, 98.31, 139.78, 193.48, 260.20, 320.39];
    syms  s1  s2  s3;
    v  = [s1; s2; s3];
    for j = 1 : length(t)
        r(j, 1) = s1 + s2 * exp(s3 * t(j)) - y(j);
    end
end
