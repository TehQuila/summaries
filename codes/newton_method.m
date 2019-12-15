% param f: function handle
% param df: function handle for f'(x)
function [x, nb_iters] = newton_method(f, df, x0, epsilon)
   x = x0;
   iter_x = x - f(x) / df(x);
   nb_iters = 1; % number of iterations
   while abs(x - iter_x) > epsilon
       x = iter_x;
       iter_x = x - f(x) / df(x);
       nb_iters = nb_iters + 1;
   end
end
