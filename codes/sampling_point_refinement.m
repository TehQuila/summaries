% param a,b: intervall boundaries
% param max_num: maximal number of sampling points
% param f: function handle
% param alpha: control parameter
% return b: new newton coefficients
% return Xi: new sampling nodes
function [b, Xi] = sampl_point_refinement(a, b, max_num, f, alpha)
    Xi_old = a;
    Xi_new = [a,b];
    Xi_sorted = Xi_new;

    [b_old, B_old] = deal(f(Xi_old)); % b_j_old = B_old = f(a)
    [b_new, B_new] = newton_div_diff_adaptive(B_old, Xi_old, b, f(b));
    num = length(Xi_new);

    while num < max_num
        % compute the intervall centers
        M = (Xi_sorted(2:end) + Xi_sorted(1:end-1)) / 2;
        % compute value of p_{n-1} and p_{n-2}
        p_new = eval_newton_poly_adaptive(b_new, Xi_new, M);
        p_old = eval_newton_poly_adaptive(b_old, Xi_old, M);
        % compute distance between polynomials
        d = abs(p_new - p_old);
        dmax = max(d);
        index = (d >= alpha*dmax*ones(size(d)));
        Mi = M(index);

        Xi_old = Xi_new;
        b_old = b_new;
        Xi_new = [Xi_new, Mi];
        Xi_sorted = sort(Xi_new);

        % compute only new div. diff.
        B_old = B_new;
        [b_new, B_new] = newton_div_diff_adaptive(B_old, Xi_old, Mi, f(Mi));
        num = length(Xi_new);
    end
    b = b_new;
    Xi = Xi_new;
end

% param B: current newton coefficient matrix
% param Xi: current sampling nodes
% param Xi_add: added sampling nodes
% param Fi_add: added sampling values
% return b: new newton coefficients
% return B_new: new newton coefficiten matrix
function [b, B_new] = newton_div_diff_adaptive(B, Xi, Xi_add, Fi_add)
    n = length(Xi);
    m = length(Xi_add);
    Xi = [Xi, Xi_add];
    B_new = zeros(n+m);
    B_new(1:n,1:n) = B;
    B_new(n+1:n+m,1) = Fi_add;

    for i = 2:n+1+m
        if i <= n+1
            for j = n+1:n+m
                B_new(j,i)=(B_new(j,i-1)-B_new(j-1,i-1))/(Xi(j) - Xi(j-i+1));
            end
        else
            for j = i:n+m
                B_new(j,i)=(B_new(j,i-1)-B_new(j-1,i-1))/(Xi(j)-Xi(j-i+1));
            end
        end
    end

    b = diag(B_new);
end

% evaluates the newton polynomial at all values in X
% param B: newton coefficients
% param Xi: sampling nodes
function x = eval_newton_poly_adaptive(B, Xi, X)
    n = length(B);

    x = B(n);
    for k = n-1:-1:1
        x = B(k) + (X - Xi(k)) .* x;
    end
end
