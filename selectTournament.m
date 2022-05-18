function out = selectTournament(pop, num, k,sign)
%SELECTTOURNAMENT Summary of this function goes here
if nargin<4
    k=3;
    sign='p';
end
out=[];
for i=1:num
    out=[out,selectionTourney(pop, k,sign)];
end
end

function out= selectionTourney(pop,k,sign)
    l=randsample(pop,k);
    out=l(1);
    for i=2:length(l)
        if l(i).getFitness(sign)>=out.getFitness(sign) && l(i).genes(1)>out.genes(1)
            out=l(i);
        end
    end
end
% function out= selectionALL(pop, num)
%     value=pop;
%     for i=1:length(pop)
%         value(i)=getFitness(pop(i));       
%     end
%     sortedIndex = sort(value, [],'ascend');
%     out=pop(sortedIndex(1:num));
% end
