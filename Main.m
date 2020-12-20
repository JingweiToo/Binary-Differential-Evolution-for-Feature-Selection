%-------------------------------------------------------------------%
%  Binary Differential Evolution (BDE) demo version                 %
%-------------------------------------------------------------------%


%---Input------------------------------------------------------------
% feat     : feature vector (instances x features)
% label    : label vector (instances x 1)
% N        : Number of solutions
% max_Iter : Maximum number of iterations
% CR       : Crossover rate

%---Output-----------------------------------------------------------
% sFeat    : Selected features (instances x features)
% Sf       : Selected feature index
% Nf       : Number of selected features
% curve    : Convergence curve
%--------------------------------------------------------------------


%% Binary Differential Evolution
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 

% Set 20% data as validation set
ho = 0.2; 
% Hold-out method
HO = cvpartition(label,'HoldOut',ho,'Stratify',false);

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



