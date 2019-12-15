f=@(x) x^3 - 2; % f to find the root of
df=@(x) 3*x^2; % first derivative of f
ddf=@(x) 6*x; % second derivative of f

newton_iter=@(x) x - f(x) / df(x);
fixpoint_iter=@(x) x - (df(x) - sqrt(df(x)^2 - 2 * ddf(x) * f(x))) / ddf(x);

fixpoint = iteration(2, fixpoint_iter)
newton = iteration(2, newton_iter)
bisect = bisection(1, 2, f)

% iterates the function iter with start value x0
function x = iteration(x0, iter)
    x_old = x0;
    x = iter(x0);

    % no need to check number of iterations since
    % newton/fixpoint converge faster
    while 10e-8 < abs(x - x_old)
        x_old = x;
        x = iter(x);
    end
end

% runs bisection on [a;b]
function x = bisection(a, b, f)
    % no need to check accuracy since bisection converges slower
    for i = 1:30
        x = (a + b) / 2;
        if f(x) < 0, a = x; else, b = x; end
    end
end
