# genetic_algorithm_based_pid_controller
Genetic algorithm is a optimization method involving selection, crossover and mutation steps to evolve the individuals to adapt in given environment.

## Project Description
 genetic algorithm-based PID controller is adapted to optimize the response of a simple mass-spring-damper system.It is based upon the principle of natural evolution aiming at minimizing the integral of time-weighted absolute error(ITAE) as the fitness function to improve the system response.
 Fitness function needs to be reduces over a time to get optimal result.

## Requirements:
* matlab or octave


## Installation
Run this command on command prompt to clone the repository


`git clone https://github.com/love481/genetic_algorithm_based_pid_controller.git`

## Running code
To simulate the response, run on command line

`geneticMain.m`

## Code Structure
* `geneticMain.m` --> initialize the total population, gene size, ellite_size and iteratation involving evolution process
* `GeneticAlgorithm.m` --> Class implementation of algorithm contains fitness function, binary to float conversion and pid controller
* `getBestChromo.m` --> select chromosome having smallest fitness function
* `selctTournament.m` --> Involves game tournament between two or more chromosomes to find the fittest individuals
* `crossover.m` --> Crossing between two chromosomes.
* `mutation.m` --> mutation process seen on the gene of the chromosomes to ensure diversity
* `singleIteration` --> single iteration of evolution(selection, crossover, mutation)


## Results
### step response
![step_response](https://user-images.githubusercontent.com/54012619/169113628-f460c514-fa6a-48a6-a97c-849a59d16fac.png)

### fitness function
![fitness_graph](https://user-images.githubusercontent.com/54012619/169113653-711aebd1-07b2-4b11-b4af-83440ad05b80.png)

## Contact Information
Please feel free to contact me if any help needed

Email: *075bei016.love@pcampus.edu.np*


