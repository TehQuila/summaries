function Q = simpsons_quadrature(f, n, a, b)
   l = b - a;
   index = linspace(a, b, n+1);
   Fi = f(index);

   w = repmat(l/(3*n), n+1, 1);
   w(2:2:n+1) = 4 * w(2:2:n+1);
   w(3:2:n) = 2 * w(3:2:n);
   Q = Fi * w;
end
