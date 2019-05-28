function y=asymIndex(nmat)
% asymTotal Asymmetry index
%
% y=asymTotal(nmat)
%
% It calculates the asymmetry index of the notematrix nmat.
%
% INPUT
% nmat: Notematrix
%       
% OUTPUT
% y: Asymmetry index
%
% Authors: Manel Vila-Vidal & Ana Clemente (2019)

pitch=nmat(:,4);
onset =nmat(:,1);

j=1;
k=1;
step=0.01;
for t=0:step:onset(end)-step
    if t>=onset(j+1)
        j=j+1;
    end
    normal(k)=pitch(j);
    k=k+1;
end
j=j+1;
for t=onset(end):step:(onset(end)+onset(2)-onset(1)-step)
    normal(k)=pitch(j);
    k=k+1;
end

asym=abs(normal-fliplr(normal));

y=sum(asym>0)/size(asym,2);
end