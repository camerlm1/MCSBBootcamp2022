% %%%Part 1-3
% 
% % model parameters
% eps = 0.08;
% a = 1;
% b = 0.2;
% I0 = 1.0;
% tStart = 40;
% tStop = 47;
% 
% % model definition
% I = @(t) I0*(t>tStart).*(t<tStop);
% f = @(v,w,t) v - 1/3*v.^3 - w + I(t);
% g = @(v,w) eps*(v + a -b*w);
% 
% 
% %% single cell
% dxdt =@ (t,x) [f(x(1),x(2),t); g(x(1),x(2));];
% 
% % solve!
% [T,X] = ode45(dxdt,[0,100], [-1.12982,-0.649085]);
% 
% figure(4); hold on;
% %set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
% ylabel('X');
% xlabel('T');
% 
% %uArray = linspace(-2.5, 2.5,32);
% %wArray = linspace(-2.5, 2.52,32);
% 
% %[uMesh,wMesh] = meshgrid(uArray, wArray);
% 
% % the Matlab plot command for a field of arrows is:
% %quiver(uMesh, wMesh, f(uMesh, wMesh), g(uMesh,wMesh), 0.5)
% 
% plot(X(:,1),'.r')
% plot(X(:,2),'.b')
%plot(X(end,1),X(end,2), 'or')


%%%Part 4 a and b

% model parameters
eps = 0.08;
a = 1;
b = 0.2;
I0 = 1.0;
D = 0.9;
tStart = 40;
tStop = 47;


I = @(t) I0*(t>tStart).*(t<tStop);
% model definition
%1
f1 = @(v1,w1,t,v10,v2) v1 - 1/3*v1.^3 - w1 + D*(v10 - (2*v1) + v2);
g1 = @(v1,w1) eps*(v1 + a -b*w1);

%2
f2 = @(v2,w2,t,v1,v3) v2 - 1/3*v2.^3 - w2 + D*(v1 - (2*v2) + v3);
g2 = @(v2,w2) eps*(v2 + a -b*w2);


%3
f3 = @(v3,w3,t,v2,v4) v3 - 1/3*v3.^3 - w3 + D*(v2 - (2*v3) + v4);
g3 = @(v3,w3) eps*(v3 + a -b*w3);


%4 %Current induced
f4 = @(v4,w4,t,v3,v5) v4 - 1/3*v4.^3 - w4 + I(t) + D*(v3 - (2*v4) + v5);
g4 = @(v4,w4) eps*(v4 + a -b*w4);


%5
f5 = @(v5,w5,t,v4,v6) v5 - 1/3*v5.^3 - w5 + D*(v4 - (2*v5) + v6);
g5 = @(v5,w5) eps*(v5 + a -b*w5);


%6
f6 = @(v6,w6,t,v5,v7) v6 - 1/3*v6.^3 - w6 + D*(v5 - (2*v6) + v7);
g6 = @(v6,w6) eps*(v6 + a -b*w6);


%7
f7 = @(v7,w7,t,v6,v8) v7 - 1/3*v7.^3 - w7 + D*(v6 - (2*v7) + v8);
g7 = @(v7,w7) eps*(v7 + a -b*w7);


%8
f8 = @(v8,w8,t,v7,v9) v8 - 1/3*v8.^3 - w8 + D*(v7 - (2*v8) + v9);
g8 = @(v8,w8) eps*(v8 + a -b*w8);


%9
f9 = @(v9,w9,t,v8,v10) v9 - 1/3*v9.^3 - w9 + D*(v8 - (2*v9) + v10);
g9 = @(v9,w9) eps*(v9 + a -b*w9);


%10
f10 = @(v10,w10,t,v9,v1) v10 - 1/3*v10.^3 - w10 + D*(v9 - (2*v10) + v1);
g10 = @(v10,w10) eps*(v10 + a -b*w10);



dxdt =@ (t,x) [f1(x(1),x(2),t,x(19),x(3)); g1(x(1),x(2));
               f2(x(3),x(4),t,x(1),x(5)); g2(x(3),x(4));
               f3(x(5),x(6),t,x(3),x(7)); g3(x(5),x(6));
               f4(x(7),x(8),t,x(5),x(9)); g4(x(7),x(8));
               f5(x(9),x(10),t,x(7),x(11)); g5(x(9),x(10));
               f6(x(11),x(12),t,x(9),x(13)); g6(x(11),x(12));
               f7(x(13),x(14),t,x(11),x(15)); g7(x(13),x(14));
               f8(x(15),x(16),t,x(13),x(17)); g8(x(15),x(16));
               f9(x(17),x(18),t,x(15),x(19)); g9(x(17),x(18));
               f10(x(19),x(20),t,x(17),x(1)); g10(x(19),x(20));];

% solve!
[T,X] = ode45(dxdt,[0,100], [-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,-1.12982,-0.649085,]);

figure(6); hold on;
%set(gca, 'xlim', [-2.5, 2.5], 'ylim', [-2.5,2.5])
ylabel('X');
xlabel('T')

%uArray = linspace(-2.5, 2.5,32);
%wArray = linspace(-2.5, 2.52,32);

%[uMesh,wMesh] = meshgrid(uArray, wArray);

% the Matlab plot command for a field of arrows is:
%quiver(uMesh, wMesh, f(uMesh, wMesh), g(uMesh,wMesh), 0.5)

% plot(X(:,1),'-r')
% plot(X(:,2),'-b')
% plot(X(:,3),'-r')
% plot(X(:,4),'-b')
% plot(X(:,5),'-r')
% plot(X(:,6),'-b')
% plot(X(:,7),'k')
% plot(X(:,8),'k')
% plot(X(:,9),'-r')
% plot(X(:,10),'-b')
% plot(X(:,11),'-r')
% plot(X(:,12),'-b')
% plot(X(:,13),'-r')
% plot(X(:,14),'-b')
% plot(X(:,15),'-r')
% plot(X(:,16),'-b')
% plot(X(:,17),'-r')
% plot(X(:,18),'-b')
% plot(X(:,19),'-r')
% plot(X(:,20),'-b')

for nt=1:numel(T)
              figure(5); clf; hold on; box on;
              plot(X(nt,1:10));
              set(gca,'ylim', [-2.5,2.5])
              xlabel('Cell');
              ylabel('Voltage')
              drawnow;
end
