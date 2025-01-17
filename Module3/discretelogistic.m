% c

nMax = 100;
nPop = 6;
xStart = [0.1,0.2,0.3,0.4,0.5,0.6];
K = 0.6;
r = 0.1;
y = 1:1:nMax;

figure(1);
for j=1:nPop
x = zeros(1,nMax);
x(1) = xStart(j);
for n=2:nMax
    x(n) = x(n-1) + (r * (1 - (x(n-1)/K))) * (x(n-1));
end


plot(x,'-k')
hold on
xlabel("month")
ylabel("population(thousands)")
end

% d
K = 0.6;
r = 2.1;
y = 1:1:nMax;

figure(2);
for j=1:nPop
x = zeros(1,nMax);
x(1) = xStart(j);
for n=2:nMax
    x(n) = x(n-1) + (r * (1 - (x(n-1)/K))) * (x(n-1));
end


plot(x,'-k')
hold on
xlabel("month")
ylabel("population(thousands)")
end

% e
K = 0.6;
r = 2.5;
y = 1:1:nMax;

figure(3);
for j=1:nPop
x = zeros(1,nMax);
x(1) = xStart(j);
for n=2:nMax
    x(n) = x(n-1) + (r * (1 - (x(n-1)/K))) * (x(n-1));
end


plot(x,'-k')
hold on
xlabel("month")
ylabel("population(thousands)")
end

% f (optional)

% g

nMaxG = 1000;
K = 0.6;
rs = 0:0.1:3.0;
pops = [];
figure(4);

for j=1:length(rs)
x = zeros(1,nMaxG);
x(1) = 0.1;
pops = [];
for n=2:nMaxG
    x(n) = x(n-1) + (rs(j) * (1 - (x(n-1)/K))) * (x(n-1));
    if n > 500
        pops = [pops, x(n)];
    end

end
plot(rs(j),pops,'ok')
hold on
end

xlabel("r")
ylabel("population")


