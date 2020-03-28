function [Unter] = svdapprox(M,k)

[U,S,V]=svd(M);

Mapp=U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
Unter=norm(M-Mapp);

image(1)
subplot(1,2,1)
imagesc(M)
title('A');
colormap(flipud(gray))

subplot(1,2,2)
imagesc(Mapp)
str=sprintf('Approximated A for k = %d',k);
title(str);
colormap(flipud(gray))



