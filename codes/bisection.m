% param f: function handle
% param e: epsilon (accuracy)
function x = bisection(f, a, b, e)
   % calculate how many steps are necessary
   n = ceil(log2((b-a)/e));
   s = 1
   if f(a) < 0
      s = -1;
   end

   for i = 1:n
      x = (a + b) / 2;
      if s * f(x) < 0
         a = x;
      else
         b = x;
      end
   end
end
