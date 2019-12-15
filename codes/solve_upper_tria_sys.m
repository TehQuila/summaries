function x = solve_upper_tria_sys(U, b)
   n = length(U);
   x = zeros(n,1);

   for i = n:-1:1
      x(i) = (b(i) - U(i, i+1:n) * x(i+1:n)) / U(i,i);
   end
end
