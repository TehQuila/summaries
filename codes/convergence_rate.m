figure;
% plot actual error graph
plot(degrees, log(errors));
hold on

% approximating slope of error graph
beta = mean(diff(log(errors))./diff(degrees))
% set by hand, then adjust according to plot
C1_log = -2;

% plot error graph approximation
e = @(x) C1_log + beta * x;
fplot(e, [0 10]);
C1 = exp(C1_log)
