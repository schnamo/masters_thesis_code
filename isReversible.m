function [revDM]=isReversible(P)

l = length(P);

% stationäre Verteilung bestimmen
eins=0;
[V,D] = eig(P');
[on vec]=max(max(D))
w = V(:,vec)';
w = w/sum(w); % normieren

revDM=zeros(l,l);

for i = 1:l
  
    for j = 1:l
       
      revDM(i,j)=w(i)*P(i,j)-w(j)*P(j,i);
 
    end

end