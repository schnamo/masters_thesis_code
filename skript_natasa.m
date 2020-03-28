clear
load Example.mat
Ar = A +0.0001*ones(21,21);
P=sinkhorn(Ar);
[Prest, Pvec, lambda, Dl, Dr]=Birkhoff(P, 50) %24 mal Birkhoff

cl=7; 

figure(1);
image(A*40);
Pges=zeros(21,21);
for i=1:cl
    figure(i+1);
    Pm=zeros(21,21);
    for j=1:21
        Pm(j, Pvec(j,i))=1;
    end
    image(Pm*40);
    Pges=max(Pges,Pm);
end
figure(2)
image(Pges*100);

