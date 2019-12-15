function x1 = richardson(A, b, omega, max_iter, e)
   n = length(b);
   x1 = zeros(n,1);
   x0 = ones(n,1);
   iter = 0;

   while ((norm(x0 - x1) > e) && (iter < max_iter))
       x0 = x1;
       x1 = x1 - omega * (A * x1 - b);
       iter = iter + 1;
   end
end
