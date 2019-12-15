[R, y] = calc_qr_decomp(A, b, n);
x = solve_upper_tria_sys(R, y);

function [R, bn] = calc_qr_decomp(A, b, n)
   R = zeros(n);
   y = zeros(n, 1);
   for i = 1:n-1
      [u, beta] = calc_u_beta(A);

      PA = beta * u * (u' * A) - A;
      Pb = beta * u * (u' * b) - b;

      R(i, i:end) = PA(1,:);
      y(i) = Pb(1);
      A = PA(2:end, 2:end);
      b = Pb(2:end);
   end
   R(n,n) = -A;
   y(n) = -b;
end

function [u, beta] = calc_u_beta(A)
   u = A(:,1);
   beta = 1 / (norm(u) * (abs(u(1)) + norm(u)));

   if (u(1) == 0)
      sigma = -1;
   else
       sigma = u(1) / abs(u(1));
   end
   u(1) = u(1) + sigma * norm(u);
end
