% evaluates the newton polynomial
% param x: point at which to evaluate the polynomial
% param Xi: vector of sampling point nodes
% param B: vector of coefficients of the polynomial
% return p: value of newton polynomial at x
function p = eval_newton_poly(x, Xi, B)
   p = B(1);
   for i = 2:length(B)
      % evaluate sampling point polynomial at x
      w = prod(x - Xi(1:i-1));
      p = p + B(i) * w;
   end
end
