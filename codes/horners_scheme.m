function div = horner_division(coeff, x0)
   n = length(coeff);
   div = [1 zeros(1, n-2)];
   div(2) = coeff(2) + x0;
   for i = 3:n-1
       div(i) = coeff(i) + x0 * div(i-1);
   end
end
