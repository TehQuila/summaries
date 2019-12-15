% evaluates the sampling point polynomial
% param x: point at which to evalute the polynomial
% param Xi: vector of sampling point nodes
% return o: value of the sampling point polynomial at x
function o = eval_sampl_point_poly(x, Xi)
   o = prod(x - Xi);
end
