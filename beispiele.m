%2x2 Beispiel
disp('2x2 Beispiel');
Countmatrix=[40 85; 30 50]
Estimator=useCount(Countmatrix)
[A, Dl, Dr]=sinkhorn(Estimator);
DoubleStochastic=A
subplot(1,2,1);
imagesc(Estimator);
colormap(flipud(gray));
title('2x2 Beispiel')
subplot(1,2,2);
imagesc(A);            
colormap(flipud(gray));
title('Doppelt Stochastisch')
%Difference=Estimator-A
[Arest, Pvec, lambda, Dl, Dr]=Birkhoff(A,10);
Diagonal=Pvec
Lambda=lambda
EstimateRev=isReversible(Estimator)
DoubleStoRev=isReversible(A)

%Metastabile Bereiche-bleiben sie erhalten? - Jeder Zustand kann einem metastabilem Bereich zugeordnet werden
disp('Metastabile Bereiche-bleiben sie erhalten? - Jeder Zustand kann einem metastabilem Bereich zugeordnet werden');
Countmatrix=[100 210 10 20; 300 200 5 5; 10 10 200 200; 3 20 240 300]
Estimator=useCount(Countmatrix)
[A, Dl, Dr]=sinkhorn(Estimator);
DoubleStochastic=A
figure(2)
subplot(1,2,1);
imagesc(Estimator);
colormap(flipud(gray));
title('metastabil mit jedem Zustand')
subplot(1,2,2);
imagesc(A);
colormap(flipud(gray));
title('Doppelt Stochastisch')
%Difference=Estimator-A
[Arest, Pvec, lambda, Dl, Dr]=Birkhoff(A,100);
Diagonal=Pvec
Lambda=lambda
EstimateRev=isReversible(Estimator)
DoubleStoRev=isReversible(A)



%Metastabile Bereiche-bleiben sie erhalten? - Nicht jeder Zustand kann einem metastabilem Bereich zugeordnet werden
disp('Metastabile Bereiche-bleiben sie erhalten? - Nicht jeder Zustand kann einem metastabilem Bereich zugeordnet werden');
Countmatrix=[180 210 210 20 10 ; 300 200 245 10 10; 200 190 220 10 10; 10 10 10 10 15; 20 20 10 20 10]
Estimator=useCount(Countmatrix)
[A, Dl, Dr]=sinkhorn(Estimator);
DoubleStochastic=A
figure(3)
subplot(1,2,1);
imagesc(Estimator);
colormap(flipud(gray));
title('metastabil mit nicht jedem Zustand')
subplot(1,2,2);
imagesc(A);
colormap(flipud(gray));
title('Doppelt Stochastisch')
%Difference=Estimator-A
[Arest, Pvec, lambda, Dl, Dr]=Birkhoff(A,100);
Diagonal=Pvec
Lambda=lambda
EstimateRev=isReversible(Estimator)
DoubleStoRev=isReversible(A)


%Zufällige Matrix 10x10
disp('Zufaellige Matrix 10x10');
Countmatrix=rand(10,10);
Estimator=useCount(Countmatrix)
[A, Dl, Dr]=sinkhorn(Estimator);
DoubleStochastic=A
figure(4)
subplot(1,2,1);
imagesc(Estimator);
colormap(flipud(gray));
title('Zufällige Matrix 10x10')
subplot(1,2,2);
imagesc(A);
colormap(flipud(gray));
title('Doppelt Stochastisch')
%Difference=Estimator-A
[Arest, Pvec, lambda, Dl, Dr]=Birkhoff(A,100);
Diagonal=Pvec
Lambda=lambda
EstimateRev=isReversible(Estimator)
DoubleStoRev=isReversible(A)