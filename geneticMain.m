%% initialize population
population=[];
rng(40);
SIZE_POP=40;
SIZE_ELITE=8;
SIZE_SELECTION=16;
gene_size=27;
no_of_iter=20;
for i=1:SIZE_POP
   population=[population,GeneticAlgorithm(gene_size)];
end
figure;
outputV=[];
for i=1:no_of_iter
    [index,fitness] = getBestChromo(population);
    population=singleIteration(population,SIZE_POP,SIZE_ELITE,SIZE_SELECTION);
    chromo=population(index);
    outputV=[outputV,-fitness];
    fprintf('Kp Ki Kd is %2.2f & %2.2f & %2.2f\n',chromo.kp,chromo.ki,chromo.kd);
    plot(1:i,outputV,'ro');
    title('genetic algorithm');
    xlabel('iteration');
    ylabel('fitness');
    xlim([0 no_of_iter+1]);
    ylim([-2 2]);
    drawnow;
end
    figure;
    C = pid(chromo.kp,chromo.ki,chromo.kd);
    s = tf('s');
    P = 1/(s^2 + 10*s + 20);
    T = feedback(C*P,1);
    t = 0:0.01:2;
    step(T,t)
