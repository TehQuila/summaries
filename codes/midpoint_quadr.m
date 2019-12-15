% param f: function handle to f
% param n: number of subintervalls
function Q = midpoint_quadr(f, n, a, b)
   h = (b - a) / n;
   % compute midpoints
   M = linspace(a + h/2, b - h/2, n-1);
   Q = h * sum(f(M));
end
