function [P]=findDiagonal(A)

P=A;
ind=find(P>1e-10 & P<1-1e-10); %Spaltenweise durchgezählt bis n*n
if (length(ind)==0) % wenn die Matrix nur 0- und Nahe-bei-0-EintrÃ¤ge hat, wird sie nur gerundet 
    P=round(P); %zurueckgegeben.
    return;
end

stpp=0;
xyz=1;
doof=1;

while (length(ind)>0)
    [mi vi]=max(P); %mi maximum jeder Spalte, vi Zeilen-Positionen
    js=find(mi<1-1e-10); 
    j=js(1); %Spalte des ersten Maximum < 1-1e-10
    i=vi(j); %Zeile des ersten Maximum < 1-1e-10
    path_i=[i]; 
    path_j=[j];
    v=[P(i,j)]; %erstes Maximum je Spalte, das < 1-1e-10
    lcount=0; 
    stpp=0;
    while(stpp==0)
        if (lcount==1)
            ind=find(P(i,:)>0); %alle positiven Eintraege in der Zeile des Max
            ind = setdiff(ind, [j]); %neuer ind hat das Maximum nicht mehr
            [mj j]=max(P(i,ind)); %naechstes maximum
            j = ind(j);
            lcount=0;
            if (ismember(j, path_j))
                stpp=1;
                strt= max(find(path_j==j));
            end
        else
            ind=find(P(:,j)>0);
            ind = setdiff(ind, [i]);
            [mi i]=max(P(ind, j));
            i = ind(i);
            lcount=1;
            if (ismember(i, path_i))
                stpp=1;
                strt= max(find(path_i==i));
            end
        end
        path_i=[path_i, i];
        path_j=[path_j, j];
        v=[v,P(i,j)];
    end
    path_i=path_i(strt:length(path_i)); %damit Kreis entsteht 
    path_j=path_j(strt:length(path_j)); %wird hier der Anfang abgeschnitten
    v=v(strt:length(v));
    xyz=xyz+1;
    [lambda,t]= min(v); %minimaler Wert
    for k=1:length(path_i)
        P(path_i(k), path_j(k)) = P(path_i(k), path_j(k)) + (-1)^(k+t-1)*lambda; %k=t => 2t-1 muss ungerade sein, damit abgezogen wird
    end
    ind=find(P>1e-10 & P<1-1e-10);
end
P=round(P);

%P=[0 0.5 0 0.5 0; 0.8 0 0 0.2 0; 0 0.5 0.2 0 0.3; 0.2 0 0.3 0 0.5; 0 0 0.5 0.3 0.2];
