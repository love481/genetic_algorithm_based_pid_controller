function out = crossover(chromo1,chromo2)
%CROSSOVER Summary of this function goes here
%   Detailed explanation goes here
out=crossoverTwoPoints(chromo1,chromo2);
%out=crossoverTwoPoints(chromo1,chromo2);
end
function out=crossoverOnePoint(chromo1,chromo2)
j=randsample(1:chromo1.n-1,1);
c1=GeneticAlgorithm(chromo1.n,chromo1.genes);
c2=GeneticAlgorithm(chromo2.n,chromo2.genes);
for i=1:j
    c1.genes(i)=chromo1.genes(i);
    c2.genes(i)=chromo2.genes(i);
end
for i =j:chromo1.n
    c1.genes(i)=chromo2.genes(i);
    c2.genes(i)=chromo1.genes(i);
end
out=[c1,c2];
end

function out=crossoverTwoPoints(chromo1,chromo2)
l=randsample(1:chromo1.n,2);
j1=min(l);
j2=max(l);
c1=GeneticAlgorithm(chromo1.n,chromo1.genes);
c2=GeneticAlgorithm(chromo2.n,chromo2.genes);
for i =1:j1
    c1.genes(i)=chromo1.genes(i);
    c2.genes(i)=chromo2.genes(i);
end
for i =j1:j2
    c1.genes(i)=chromo2.genes(i);
    c2.genes(i)=chromo1.genes(i);
end
for i=j2:chromo1.n
    c1.genes(i)=chromo1.genes(i);
    c2.genes(i)=chromo2.genes(i);
end
out=[c1,c2];
end


function out=crossoverUniform(chromo1,chromo2)
c1=GeneticAlgorithm(chromo1.n,chromo1.genes);
c2=GeneticAlgorithm(chromo2.n,chromo2.genes);
for i =1:chromo1.n
    if rand()<0.5
    c1.genes(i)=chromo2.genes(i);
    c2.genes(i)=chromo1.genes(i);
    else
    c1.genes(i)=chromo1.genes(i);
    c2.genes(i)=chromo2.genes(i);
    end
end
out=[c1,c2];
end

