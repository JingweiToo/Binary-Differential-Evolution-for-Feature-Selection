# Binary Differential Evolution for Feature Selection

[![View Binary Differential Evolution for Feature Selection on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/71515-binary-differential-evolution-for-feature-selection)
[![License](https://img.shields.io/badge/license-BSD_3-yellow.svg)](https://github.com/JingweiToo/Binary-Differential-Evolution-for-Feature-Selection/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/badge/release-1.3-green.svg)](https://github.com/JingweiToo/Binary-Differential-Evolution-for-Feature-Selection)

![Wheel](https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/f2a7eded-0f65-4980-bf79-dcb027c792a0/f1b6049d-781a-4216-91b7-c4e36c746b9f/images/screenshot.PNG)


## Introduction
* This toolbox offers Binary Differential Evolution ( BDE ) method  
* The `Main` file illustrates the example of how BDE can solve the feature selection problem using benchmark data-set.

## Input
* *`feat`*     : feature vector ( Instances *x* Features )
* *`label`*    : label vector ( Instances *x* 1 )
* *`N`*        : number of solutions
* *`max_Iter`* : maximum number of iterations
* *`CR`*       : crossover rate


## Output
* *`sFeat`*    : selected features
* *`Sf`*       : selected feature index
* *`Nf`*       : number of selected features
* *`curve`*    : convergence curve


### Example
```code
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho);

% Parameter setting
N        = 10; 
max_Iter = 100; 
CR       = 0.9;
% Binary Differential Evolution
[sFeat,Sf,Nf,curve] = jBDE(feat,label,N,max_Iter,CR,HO);

% Plot convergence curve
plot(1:max_Iter,curve);
xlabel('Number of generations');
ylabel('Fitness Value'); 
title('BDE'); grid on;
```


## Requirement
* MATLAB 2014 or above
* Statistics and Machine Learning Toolbox


## Cite As
```code
@article{too2019hybrid,
  title={Hybrid Binary Particle Swarm Optimization Differential Evolution-Based Feature Selection for EMG Signals Classification},
  author={Too, Jingwei and Abdullah, Abdul Rahim and Mohd Saad, Norhashimah},
  journal={Axioms},
  volume={8},
  number={3},
  pages={79},
  year={2019},
  publisher={Multidisciplinary Digital Publishing Institute}
}


@article{too2019emg,
  title={EMG feature selection and classification using a Pbest-guide binary particle swarm optimization},
  author={Too, Jingwei and Abdullah, Abdul Rahim and Mohd Saad, Norhashimah and Tee, Weihown},
  journal={Computation},
  volume={7},
  number={1},
  pages={12},
  year={2019},
  publisher={Multidisciplinary Digital Publishing Institute}
}
```
