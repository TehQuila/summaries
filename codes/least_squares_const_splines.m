f = @(x) 1./(1+25*x.^2); % function to be approximated
intf = @(x) 0.2 * (atan(5*x)); % integral of f
Xi = [-1,-0.4, 0 , 0.1,0.2,0.6,1];
n = length(Xi);

G = diag(diff(Xi));
r = intf(Xi(2:n)) - intf(Xi(1:n-1));
phi = G\r.'; % solve linear system

x = linspace(-1,1,1000);
y = zeros(1000,1);

for i = 1:n-1
    index = (Xi(i) <= x & x <= Xi(i+1));
    y(index) = phi(i);
end
plot(x, f(x), x, y)
