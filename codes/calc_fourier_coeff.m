function fhat = calc_fourier_coeff(N, f)
    sk = (0:N-1)' * (0:N-1); % matrix of s*k
    d = -1i * 2*pi/N;  % = -i * 2*pi/(b-a) * (b-a)/N
    fhat = exp(d * sk) * f / N;
end
