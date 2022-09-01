lambda = 0.3552;
theta = 1.0384;
alpha = 2.2485;


%%%Part a,b

% model definition
N = @(n) lambda*n*(1 - (n/theta)^alpha);

dxdt =@ (t,x) [N(x(1))];

% solve!
[T,X] = ode45(dxdt,[0,9], 0.068);

Table = readmatrix("BacteriaGrowthData.xlsx");

exptime = Table(2:end,1);
experiment = Table(2:end,3);
control = Table(2:end,2);


%Sim
% figure(1); hold on;
% ylabel('N');
% xlabel('T');
% plot(X(:,1),'-r');

%Exp
figure(2); hold on;
plot(exptime,experiment,'-b');
plot(exptime,control,'-k');
plot(T,X(:),'-r');
ylabel('Bacteria OD');
xlabel('Time(minutes)');

%%% Part c,d
p = [lambda,theta,alpha];
sse = SSE(p);
display(sse)

%%%Part e
% x0 = [0.5,0.5,0.5];
% [x,fval] = fminsearch(@SSE,x0);
% display(x)
% display(fval)

function uValue = SSE(p)

% model definition
N = @(n) p(1)*n*(1 - (n/p(2))^p(3));

dxdt =@ (t,x) [N(x)];

Table = readmatrix("BacteriaGrowthData.xlsx");
exptime = Table(2:end,1);
experiment = Table(2:end,3);

% solve!
[T,X] = ode45(dxdt,exptime,0.068);
SSE = 0;

for i = 1:length(experiment)
SSE = SSE + (X(i)-experiment(i)).^2;
end
uValue = SSE;

end

