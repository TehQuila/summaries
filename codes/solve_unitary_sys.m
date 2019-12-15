% simply by doing
x = Q' * b;

% which is the same as
function x = solve_unitary_sys(Q, b)
   n = length(b);
   x = zeros(n,1);

   for i = 1:n
       for j = 1:n
           x(i) = x(i) + Q(j,i)' * b(j);
       end
   end
end
