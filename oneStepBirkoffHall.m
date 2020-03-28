function [A, P, lambda]=oneStepBirkoffHall(A)

p=bghungar(A);
P=zeros(length(p));
for i=1:length(p);
   P(i,p(i))=1;
end
ind=find(P==1); % geht spaltenweise P durch und zaehlt die Eintraege 1-n
lambda = min(A(ind));
A=(A-lambda*P)/(1-lambda);