%-------------------------------------------------------------------------%
%  Binary Differential Evolution (BDE) source codes demo version          %
%                                                                         %
%  Programmer: Jingwei Too                                                %
%                                                                         %
%  E-Mail: jamesjames868@gmail.com                                        %
%-------------------------------------------------------------------------%


%---Input------------------------------------------------------------------
% feat:  feature vector (instances x features)
% label: labelling
% N:     Number of vectors
% T:     Maximum number of generations
% CR:    Crossover rate
% *Note: k-value of KNN & hold-out setting can be modified in jFitnessFunction.m
%---Output-----------------------------------------------------------------
% sFeat: Selected features (instances x features)
% Sf:    Selected feature index
% Nf:    Number of selected features
% curve: Convergence curve
%--------------------------------------------------------------------------

%% Binary Differential Evolution
clc, clear, close 
% Benchmark data set 
load ionosphere.mat; 
% Parameter setting
N=10; T=100; CR=0.9;
% Binary Differential Evolution
[sFeat,Sf,Nf,curve]=jBDE(feat,label,N,T,CR);
% Plot convergence curve
figure(); plot(1:T,curve); xlabel('Number of generations');
ylabel('Fitness Value'); title('BDE'); grid on;






