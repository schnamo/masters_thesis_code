function [Diff, EntO, EntS]=EntropyMeasure(C)
%Entropie nur zeilenweise
Estimator=C+eps; %eps weil log(0) nicht definiert
EntO=-sum(Estimator.*log(Estimator));

[A, Dl, Dr]=sinkhorn(Estimator);
A
A=A+eps; %weil log(0) nicht definiert
EntS=-sum(A.*log(A));

%[Arest, ~, lambda, Dl, Dr]=Birkhoff(Estimator,100);
%EntB=-sum((Estimator-Arest).*log((Estimator-Arest)+eps));


Diff=sum(abs(EntO-EntS))%man muss den Unterscheid zeilenweise betrachten
image(1)
subplot(1,2,1)
imagesc(Estimator)
%str = sprintf('Before Sinkhorn, Entropy: %f', EntO);
title('Before Sinkhorn');
colormap(flipud(gray))

subplot(1,2,2)
imagesc(A)
%str = sprintf('After Sinkhorn, Entropy: %f', EntS);
title('After Sinkhorn');
colormap(flipud(gray))

v=ones(length(C),1)/(length(C));

Vmax=-sum(v.*log(v))

diffdurch = abs(EntO-EntS)

