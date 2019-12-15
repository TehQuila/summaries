% generates n chebyshev nodes on [a; b] where a < b
% param a: intervall start
% param b: intervall end
% param n: number of nodes
% return Xi: vector of nodes
function Xi = gen_chebyshev(a, b, n)
   i = 0:n;
   cosine = cos((2*i + 1) ./ (2 * (n+1)) * pi);
   if b == -a
       Xi = a * cosine
   else
       Xi = (1 + cosine ./ 2) * a + (1 - cosine ./ 2) * b
   end
end
