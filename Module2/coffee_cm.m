% How much caffeine is there in the jar?

% n - number of days
% x - fraction of caffeinated 

nMax = 20; % max number of days to simulate

N = 10; % number of scoops in each jar
x = zeros(1,nMax); % fraction caffeinated
x(1) = 1.0; % initial fraction caffeinated

for n=2:nMax
    
    x(n) = (1-1/N) * x(n-1);
    %x(n) = x(n-1) - 1/N*x(n-1);
    
end % finished loop through days

% THE MODEL ^
% ------------------------------------------
% THE BEHAVIOR / THE OUTPUT ? 

figure(1); 
plot(x,'-ok');
ylabel('fraction caffeinated')
xlabel('Days')



% a.

n1 = 22;
c = -.8;
d = 0.156;
x1 = zeros(1,n1);
y1 = zeros(1,n1);
x1(1) = 0.1;
y1(1) = 0.1;

for n=2:n1

    x1(n) = x1(n-1)^2 - y1(n-1)^2 + c;
    y1(n) = 2 * x1(n-1) * y1(n-1) + d;
end

% b.
figure(2);
plot(x1,'-ok')
xlabel("x(n)")
ylabel("x")

% c.
figure(3);
plot(x1,y1,'ok')
xlabel("y(n)")
ylabel("x(n)")

% d.

xStart = -2 + 4*rand(1,100);
yStart = -2 + 4*rand(1,100);
figure(4);
plot(xStart,yStart,'ok')
xlabel("xstart")
ylabel("ystart")

% e.

figure(5);
pairs = 100;
nMax = 22;

for n=1:pairs
    x2 = zeros(1,nMax);
    y2 = zeros(1,nMax);
    x2(1) = xStart(n);
    y2(1) = yStart(n);
    for j=2:nMax
        x2(j) = x2(j-1)^2 - y2(j-1)^2 + c;
        y2(j) = 2 * x2(j-1) * y2(j-1) + d;
        
    end

    if(((x2(nMax) < 2) && (x2(nMax) > -2)) && ((y2(nMax)< 2) && (y2(nMax) > -2)))
            plot(x2(1),y2(1),'ob')
            hold on 
        else 
            plot(x2(1),y2(1),'or')
            hold on
        end
end
xlabel("x")
ylabel("y")


%f

xStart = -2 + 4*rand(1,10^5);
yStart = -2 + 4*rand(1,10^5);

figure(6);
pairs = 10^5;
nMax = 22;

for n=1:pairs
    x2 = zeros(1,nMax);
    y2 = zeros(1,nMax);
    x2(1) = xStart(n);
    y2(1) = yStart(n);
    for j=2:nMax
        x2(j) = x2(j-1)^2 - y2(j-1)^2 + c;
        y2(j) = 2 * x2(j-1) * y2(j-1) + d;
        
    end

    if(((x2(nMax) < 2) && (x2(nMax) > -2)) && ((y2(nMax)< 2) && (y2(nMax) > -2)))
            plot(x2(1),y2(1),'ob')
            hold on 
        else 
            plot(x2(1),y2(1),'or')
            hold on
        end
end
xlabel("x")
ylabel("y")
