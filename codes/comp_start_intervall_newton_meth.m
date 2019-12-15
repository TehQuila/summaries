a = -2; b = 2; % determined by looking at the plot of f

f=@(x) x - cos(x) + sin(x); % function to find root of
df=@(x) 1 + sin(x) + cos(x); % first derivative of f
ddf=@(x) cos(x) - sin(x); % second derivative of f
t=@(x) 2 * df(x);

% run bisection to determine startvalue x for newton method
while true
    x = (a + b) / 2;
    d = x - a; % delta

    X = linspace(x - 3*d, x + 3*d, 100);
    D = arrayfun(@(x) ddf(x), X);
    T = arrayfun(@(x) t(x), X);

    if 4 * d * max(abs(D ./ T)) < 1
        % now we know newton method converges for any x0 in [a; b]
        break;
    else
        if f(x) < 0, a = x; else, b = x; end
    end
end

% run newton method to determine root x of f
for i = 0:3
    x = x - f(x) / df(x);
end
