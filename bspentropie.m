%Entropie berechnen

%Metastabile Bereiche-bleiben sie erhalten? - Jeder Zustand kann einem metastabilem Bereich zugeordnet werden
Countmatrix=[100 210 10 20; 300 200 5 5; 10 10 200 200; 3 20 240 300];
Estimator=useCount(Countmatrix);
ent1=-sum(Estimator.*log(Estimator+eps));
ent1sum=sum(ent1);
[A, Dl, Dr]=sinkhorn(Estimator);
ent2=-sum(A.*log(A+eps));
ent2sum=sum(ent2);
[Arest, ~, lambda, Dl, Dr]=Birkhoff(Estimator,100);
ent3=-sum((Estimator-Arest).*log((Estimator-Arest)+eps));
ent3sum=sum(ent3);
diff1=ent2sum-ent1sum

%Metastabile Bereiche-bleiben sie erhalten? - Nicht jeder Zustand kann einem metastabilem Bereich zugeordnet werden
Countmatrix=[180 210 210 20 10 ; 300 200 245 10 10; 200 190 220 10 10; 10 10 10 10 15; 20 20 10 20 10];
Estimator=useCount(Countmatrix);
ent1=-sum(Estimator.*log(Estimator+eps));
ent1sum=sum(ent1);
[A, Dl, Dr]=sinkhorn(Estimator);
ent2=-sum(A.*log(A+eps));
ent2sum=sum(ent2);
[Arest, Pvec, lambda, Dl, Dr]=Birkhoff(Estimator,100);
ent3=-sum((Estimator-Arest).*log((Estimator-Arest)+eps));
ent3sum=sum(ent3);
diff2=ent2sum-ent1sum

%Ungünstiges Muster für Sinkhorn
