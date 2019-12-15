function P = eval_lagrange_poly(X, Xi, Fi)
   n = length(Xi);
   m = length(X);
   M = ones(n, m);

   for i = 1:n
       temp = Xi(i) - Xi;
       temp = temp(temp ~= 0);
       nenner = prod(temp);

       for j = 1:n
           if j ~= i
               M(i,:) = M(i,:) .* (X - Xi(j));
           end
       end
       M(i,:) = M(i,:) / nenner;
   end

   P = Fi * M;
end
