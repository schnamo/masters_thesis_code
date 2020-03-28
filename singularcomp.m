function [M]=singularcomp(A,k)

[V,S,W]=svd(A);

M=V(:,1:k)*S(1:k,1:k)*W(:,1:k)'

imagesc(M);
colormap(flipud(gray));
%title('k='k);
