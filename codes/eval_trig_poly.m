function T = eval_trig_poly(N, fhat, t, x0)
   n = N / 2;

   Ahat = zeros(n, 1);
   Ahat(1) = real(fhat(1));
   Ahat(2:n) = 2 * real(fhat(2:n));
   Ahat(n+1) = real(fhat(n+1));

   Bhat = -2 * imag(fhat(2:n));

   d = pi/x0 * (t * (1:n-1)); % matrix of 2*pi*t*m/(b-a) (where b-a = 2*x0)
   T = Ahat(1) + cos(d)*Ahat(2:n) + sin(d)*Bhat + Ahat(n+1)*cos(pi*N*t/2*x0);
end
