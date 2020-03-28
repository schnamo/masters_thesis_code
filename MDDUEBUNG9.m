%%%%%%%%%%%%%%%%%%%%%%% MDD UEBUNG 9 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aufgabe 1
% A)
% Matrix aus txt.-Datei auslesen
M = load('butan50.txt');

% Eigenwerte bestimmen
w = eig(M);

% Eigenvektoren spaltenweise in V, Eigenwerte auf der Diagonalen in D
[V,R] = eig(M);

% B)
% stationäre Verteilung bestimmen
[V2,D2] = eig(M');
for m = 1:length(M)
    for n = 1:length(M)
        if D2(m,n)==1
            eins=m;
        end
    end
end
v = V2(:,eins)';
v = v./sum(v); % normieren
D = diag(v); % Einträge müssen positiv sein

% führenden 3 Eigenvektoren orthonormalisieren bzgl. D
X = zeros(42,3);
for i = 1:3
 
    X(:,i) = V(:,i)/sqrt((V(:,i)'*D*V(:,i)));
  
end
F = X;
% C)

%erste Ecke finden
a = zeros(42,1);
for i = 1:42
 
    a(i) = norm(X(i,:));
  
end

[d1,i1] = max(a);
e1 = X(i1,:);

for i = 1:42
   
   X(i,:) = X(i,:)-e1;
   
end

Y = zeros(3,3);
Y(1,:) = e1;

%weitere Ecken finden
for i = 2:3
  
    for j = 1:42
      
        a(j) = norm(X(j,:));
       
    end
    [d1,k] = max(a);
    X=X./max(a);
    Y(i,:) = F(k,:);
    h=X(k,:);
    for l = 1:42
        X(l,:)=X(l,:)-h*X(l,:)'*h;
    end
   
end


% daraus A berechnen
A = inv(Y);

% Xi berechnen
Z = F*A;

F
A
Z

% Xi graphisch darstellen
plot(Z);

% Aufgabe 2

% ist M reversibel
revP=zeros(42,42);

for i = 1:42
  
    for j = 1:42
       
      revP(i,j)=v(i)*M(i,j)-v(j)*M(j,i);
 
    end

end

% ist die darstellende Matrix reversibel
R=diag(w(1:3));
N = Y*R*A;
% stationäre Verteilung bestimmen
[V3,D3] = eig(N');

for m = 1:length(N)
    for n = 1:length(N)
        if D3(m,n)==1
            eins=m;
        end
    end
end

w = V3(:,eins)';
w = w./sum(w); % normieren

revDM=zeros(3,3);

for i = 1:3
  
    for j = 1:3
       
      revDM(i,j)=w(i)*N(i,j)-w(j)*N(j,i);
 
    end

end








