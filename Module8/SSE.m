function uValue = SSE(l,t,a)

% model definition
N = @(n) l*n*(1 - (n/t)^a);

dxdt =@ (t,x) [N(x(1))];

% solve!
[T,X] = ode45(dxdt,[0,200], 0.070);

Table = readmatrix("BacteriaGrowthData.xlsx");

experiment = Table(2:end,2);

SSE = 0;
for i = 1:length(experiment)
SSE = SSE + (X(i)-experiment(i))^2;
end
uValue = SSE;

end

