classdef GeneticAlgorithm < handle
    %GENETICALGORITHM Summary of this class goes here
    %   Detailed explanation goes here
    
     properties
        n=0;
        genes=[];
        kp=0;
        ki=0;
        kd=0;
        output=0;
    end
    
    methods
        function obj = GeneticAlgorithm(number_of_genes, genes)
            %GENETICALGORITHM Construct an instance of this class
            obj.n = number_of_genes;
            if nargin<2
                obj.genes=zeros(1,obj.n);
                for i=1:obj.n
                    if rand()<0.5
                       obj.genes(i)=true;
                    else
                       obj.genes(i)=false;
                    end
                end
            else
                obj.genes=genes;
            end
             obj.kp=obj.decodeFloat(obj.genes(1:9),0.0,400.0);
             obj.ki=obj.decodeFloat(obj.genes(9:18),0.0,350.0);
             obj.kd=obj.decodeFloat(obj.genes(18:27),0.0,100.0);
        end
        function out = getFitness(obj,sign,target)
                %GETFITNESS Summary of this function goes here
                %   Detailed explanation goes here
                if nargin<2
                    target=31;
                    sign='p';
                end
                s = tf('s');
                P = 1/(s^2 + 10*s + 20);
                obj.kp=obj.decodeFloat(obj.genes(1:9),0.0,500.0);
                obj.ki=obj.decodeFloat(obj.genes(9:18),0.0,500.0);
                obj.kd=obj.decodeFloat(obj.genes(18:27),0.0,100.0);
                C=pid(obj.kp,obj.ki,obj.kd);
                T = feedback(C*P,1);
                t=0:0.01:2;
                [T,t]=step(T,t);
                setpoint=ones(1,length(t));
                itae=0;
                Ts=0.01;
                for i=1:length(t)
                        x=setpoint(i)-T(i);
                        itae = itae+(abs(x)*(i*Ts));
                end
                overshoot=((max(T)-setpoint(end))/setpoint(end))*100;
                if sign=='p'
                    out=-(overshoot+itae);
                else
                    out=overshoot+itae;
                end
                obj.output=itae;
        end
                function out = decodeFloat(obj,gene,f_min, f_max)
                %DECODEFLOAT Summary of this function goes here
                %   Detailed explanation goes here
                if nargin<3
                    f_min=0.0;
                    f_max=100.0;
                end
                
                x=bi2de(gene)/(2^length(gene)-1);
                out=f_min+x*(f_max-f_min);
                end
    end
end

