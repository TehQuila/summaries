% param f: function handle
% param n: number of subintervalls
function Q = trapezoidal_quadrature(f, n, a, b)
   Xi = linspace(a, b, n+1);
   Fi = f(Xi);
   % create column vector filled with h
   w = repmat((b-a)/n, n+1, 1);
   w(1) = 0.5 * w(1);
   w(n+1) = 0.5 * w(n+1);

   Q = Fi * w;
end
