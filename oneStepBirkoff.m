function [A, P, lambda]=oneStepBirkoff(A)

P=findDiagonal(A);
ind=find(P==1); % geht spaltenweise P durch und zaehlt die Eintraege 1-n
lambda = min(A(ind));
A=(A-lambda*P)/(1-lambda);
