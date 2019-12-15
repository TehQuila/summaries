% calculates newton divided differences
% param Xi: vector of sampling point nodes
% param Fi: vector of sampling point values
% return B: vector of newton polynomial coefficients
function B = calc_newton_div_diff(Xi, Fi)
   n = length(Xi);
   B = Fi;
   for col = 2:n
      for row = n:-1:i
         B(row) = (B(row) - B(row-1)) / (Xi(row) - Xi(row-col+1));
      end
   end
end
