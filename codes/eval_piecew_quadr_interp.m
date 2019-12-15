% evaluates a quadratic newton polynomial on a subintervall at x
% param a: intervall start
% param b: intervall end
% param N: number of subintervalls
% param x: point at which to evaluate interpolation piece
% return y: value of newton polynomial at x
function y = eval_piecew_quadr_interp(a, b, N, x)
   n = 2*N + 1;
   xi = linspace(a, b, n);
   fi = arrayfun(@(x)f(x), xi);

   for i = 1:2:n-2
      if xi(i) <= x && x <= xi(i+2)
         b = calc_newton_div_diff(xi(i:i+2), fi(i:i+2));
         y = eval_newton_poly(x, xi(i:i+2), b);
      end
   end
end
