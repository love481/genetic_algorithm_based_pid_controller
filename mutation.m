function c = mutation(chromo)
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
c=mutationUniform(chromo);
end



function c = mutationSinglePoint(chromo)
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
k=randsample(1:chromo.n,1);
c=GeneticAlgorithm(chromo.n,chromo.genes);
for i=1:chromo.n
    if i==k
        c.genes(i)=~chromo.genes(i);
        continue
    end
    c.genes(i)=chromo.genes(i);
end
end



function c = mutationUniform(chromo)
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
c=GeneticAlgorithm(chromo.n,chromo.genes);
for i =1:chromo.n
        if rand()<0.05
            c.genes(i)=~chromo.genes(i);
        else
            c.genes(i)=chromo.genes(i);
        end
end
end



function c = mutationInversion(chromo)
l=randsample(1:chromo.n,2);
j1=min(l);
j2=max(l);
c=GeneticAlgorithm(chromo.n,chromo.genes);
for i =1:j1
    c.genes(i)=chromo.genes(i);
end
for i =j1:j2+1
    c.genes(i)=chromo.genes(j2-i+j1);
end
for i=j2+1:chromo.n
    c.genes(i)=chromo.genes(i);
end
end


