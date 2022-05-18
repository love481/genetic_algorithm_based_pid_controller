function [out] = singleIteration(population,SIZE_POP,SIZE_ELITE,SIZE_SELECTION)
l=[];
check=population(1:end);
for i =1:SIZE_ELITE
    [index,Fitness]=getBestChromo(check);
    l=[l,check(index)];
    
    check(index)=[];
end

s=selectTournament(population,SIZE_SELECTION,3);
c=[];
for i=1:2:length(s)
    c =[c,crossover(s(i),s(i+1))];
end

m=selectTournament(population,SIZE_POP-SIZE_ELITE-SIZE_SELECTION,3,'n');
for i = 1:length(m)
    m(i)=mutation(m(i));
end
out=[l c m];
end

