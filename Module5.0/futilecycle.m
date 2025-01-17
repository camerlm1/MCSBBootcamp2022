
%%%d

% parameters
Kt = 1;
Pt = 1;
kaon = 10;
kaoff = 10;
kion = 10;
kioff = 10;
kicat = 10;
kacat = 100;

% model equations
dA=@(I,IK,A,AP) -(kaon)*(Pt - AP)*(A) + (kaoff)*(AP) + kacat*(IK);
dAP=@(I,IK,A,AP) (kaon)*(Pt - AP)*(A) - (kaoff)*(AP) - kicat*(AP);
dI=@(I,IK,A,AP) -(kion)*(Kt - IK)*(I) + (kioff)*(IK) + kicat*(AP);
dIK=@(I,IK,A,AP) (kion)*(Kt - IK)*(I) - (kioff)*(IK) - kacat*(IK);

dxdt = @(t,x)[dI(x(1),x(2),x(3),x(4));
              dIK(x(1),x(2),x(3),x(4));
              dA(x(1),x(2),x(3),x(4));
              dAP(x(1),x(2),x(3),x(4))];
              
             

[T, X] = ode45(dxdt, [0,0.6], [1,0,0,0] );

figure(1); hold on;
plot(T,X(:,1),'-r'); % I
plot(T,X(:,2),'-', 'color', [0.5 0 1]); % IK
plot(T,X(:,3),'-g'); % A
plot(T,X(:,4),'-b'); % AP
ylabel('Molecular concentration (micromolar)')
xlabel('Time')

%%%e/f

% parameters
Pt = 1;
kaon = 10;
kaoff = 10;
kion = 10;
kioff = 10;
kicat = 10;
kacat = 100;

KtArray = [10^-3,10^-2,10^-1,1,10,100];
Ans = zeros(6);

for ind=1:6
Kt = KtArray(ind);
% model equations
dA=@(I,IK,A,AP) -(kaon)*(Pt - AP)*(A) + (kaoff)*(AP) + kacat*(IK);
dAP=@(I,IK,A,AP) (kaon)*(Pt - AP)*(A) - (kaoff)*(AP) - kicat*(AP);
dI=@(I,IK,A,AP) -(kion)*(Kt - IK)*(I) + (kioff)*(IK) + kicat*(AP);
dIK=@(I,IK,A,AP) (kion)*(Kt - IK)*(I) - (kioff)*(IK) - kacat*(IK);

dxdt = @(t,x)[dI(x(1),x(2),x(3),x(4));
              dIK(x(1),x(2),x(3),x(4));
              dA(x(1),x(2),x(3),x(4));
              dAP(x(1),x(2),x(3),x(4))];
              
             

[T, X] = ode45(dxdt, [0,0.6], [1,0,0,0]); %change to 100 for f
Ans(ind) = X(end,3);
end
figure(2);
plot([-3,-2,-1,0,1,2],Ans(:,1),'-r'); 
ylabel('Molecular concentration (micromolar)')
xlabel('log Ktot')