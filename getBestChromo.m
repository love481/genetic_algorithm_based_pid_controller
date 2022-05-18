function [outIndex,outValue] = getBestChromo(pop)
    max=-inf;
    for i=1:length(pop)
        value=pop(i).getFitness();
        if value>max
            max=value;
            outIndex=i;
        end
        
    end
    outValue=max;
end

