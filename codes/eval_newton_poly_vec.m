function P = eval_newton_poly(X, Xi, B)
   n = length(B);
   P = B(n);
   for i = n-1:-1:1
      P = B(i) + (X - Xi(i)) .* P;
   end
end
