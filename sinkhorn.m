
function [A, Dl, Dr]=sinkhorn(A)

th=1; 
Dl=ones(size(A,1),1);
Dr=ones(size(A,1),1);

while (th > 1e-12)
    D=diag(1./sum(A,2)); %Zeilensumme
    A_new=D*A;
    Dl=D*Dl;
    D=diag(1./sum(A_new)); %Spaltensumme
    A_new=A_new*D;
    Dr = D*Dr;
    th=norm(A_new-A,'inf'); %Zeiger, wieviel sich ändert
    A=A_new;
end
 