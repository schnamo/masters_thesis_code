Countmatrix=[100 210 10 20; 300 200 5 5; 10 10 200 200; 3 20 240 300]
Estimator=useCount(Countmatrix)
[A, Dl, Dr]=sinkhorn(Estimator);
DoubleStochastic=A

[Arest, Pvec, lambda, Dl, Dr]=Birkhoff(A,100);

image(1)
subplot(1,2,1)
imagesc(DoubleStochastic-Arest);
colormap(flipud(gray));

subplot(1,2,2)
imagesc(Estimator);
colormap(flipud(gray));