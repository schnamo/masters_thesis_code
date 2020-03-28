function [ent1,ent2,ent3,diff]=Entropie(C)

Estimator=useCount(C);
imagesc(Estimator);
colormap(flipud(gray));
ent1=-sum(Estimator.*log(Estimator+eps));
ent1sum=sum(ent1);
[A, Dl, Dr]=sinkhorn(Estimator);
figure(2);
imagesc(A);
colormap(flipud(gray));
ent2=-sum(A.*log(A+eps));
ent2sum=sum(ent2);
[Arest, ~, lambda, Dl, Dr]=Birkhoff(Estimator,100);
figure(3);
imagesc(Estimator-Arest);
colormap(flipud(gray));
ent3=-sum((Estimator-Arest).*log((Estimator-Arest)+eps));
ent3sum=sum(ent3);
diff=ent2sum-ent1sum