function [P]=useCount(C)

P=ones(length(C),length(C));
for i=1:length(P)
   
    P(i,:)=C(i,:)/sum(C(i,:));
    
end

%imagesc(A);            %# Create a colored plot of the matrix values
%colormap(flipud(gray)); %# Change the colormap to gray (so higher values are
                         %#   black and lower values are white)