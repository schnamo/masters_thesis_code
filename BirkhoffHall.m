function [Arest, Pvec, lambda, Dl, Dr]=BirkhoffHall(A, n)
%A stochastische matrix mit support, n-1 Anzahl der maximalen Iterationen
%Output ist sortiert nach lambdas, also nicht
%verwechseln mit oneStepBirkoffHall

Z=A;
[A, Dl, Dr]=sinkhorn(A);
A
Y=A;
[A,P,l]=oneStepBirkoff(A);
[on vec]=max(P');
Pvec=vec';
lambda=l;
lold=1;
cnt =1;

while (l < 1-1e-10 && cnt < n)
    lold=lold*(1-l);
    [A,P,l]=oneStepBirkoffHall(A);
    A=sinkhorn(abs(A)); %kritisch wegen der 0-Eintr�ge
    [on vec]=max(P');
    Pvec=[Pvec,vec'];
    lambda=[lambda, lold*l];
    cnt=cnt+1;
end
Arest = (1-l)*lold*A;
Arest = diag(1./Dl)*Arest*diag(1./Dr);
[vv ind]=sort(-lambda);
lambda=lambda(ind); %hier beachten, dass die Lambdas sortiert werden
Pvec=Pvec(:,ind); %hier stehen spaltenweise die Diagonaldaten

image(1)
subplot(1,2,1)
imagesc(Z)
title('A');
colormap(flipud(gray))

subplot(1,2,2)
imagesc(Y-Arest)
str=sprintf('Approximated A for k = %d',n);
title(str);
colormap(flipud(gray))