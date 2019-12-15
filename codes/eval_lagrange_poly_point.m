function p = eval_lagrange_poly(x, Xi, Fi)
    n = length(Xi);
    L = zeros(n, 1); % vector of lagrange basis elements

    for i = 1:n
        T = Xi(i) - Xi(1:end ~= i); % vector of x_i - x_j for all j != i
        S = x - Xi(1:end ~= i); % vector of x - x_j forall j != i
        L(i) = prod(S) / prod(T);
    end

    p = Fi * L;
end
