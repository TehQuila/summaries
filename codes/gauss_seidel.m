% param max_iter: maximum number of iterations
% param e: accuracy (epsilon)
function x1 = gauss_seidel(A, b, max_iter, e)
   n = length(b);
   x1 = zeros(n,1);
   x0 = ones(n,1);
   iter = 0; % iteration counter

   while ((norm(x0 - x1) > e) && (iter < max_iter))
       x0 = x1;
       for i = 1:n
           sum1 = 0;
           for j = 1:i-1
               sum1 = sum1 + A(i,j) * x1(j);
           end

           sum2 = 0;
           for j = i:n
               sum2 = sum2 + A(i,j) * x0(j);
           end

           x1(i) = x0(i) - (sum1 + sum2 - b(i)) / A(i,i);
       end
       iter = iter + 1;
   end
end
