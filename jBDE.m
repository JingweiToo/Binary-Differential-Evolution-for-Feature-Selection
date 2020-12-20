function [sFeat,Sf,Nf,curve] = jBDE(feat,label,N,max_Iter,CR,HO)

fun = @jFitnessFunction; 
dim = size(feat,2); 
X   = zeros(N,dim); 
for i = 1:N
  for d = 1:dim
    if rand() > 0.5
      X(i,d) = 1;
    end
  end
end
fit  = zeros(1,N);
fitG = inf;
for i = 1:N
  fit(i) = fun(feat,label,X(i,:),HO); 
  if fit(i) < fitG
    fitG = fit(i); 
    Xgb  = X(i,:);
  end
end
MV   = zeros(N,dim);
Xnew = zeros(N,dim);

curve = inf; 
t = 1; 
%---Iterations start--------------------------------------------------
while t <= max_Iter
	for i = 1:N
    R     = randperm(N);  R(R == i) = [];
    r1    = R(1); 
    r2    = R(2); 
    r3    = R(3);
    for d = 1:dim
      if X(r1,d) == X(r2,d) 
        diffV = 0;
      else
        diffV = X(r1,d); 
      end
      if diffV == 1
        MV(i,d) = 1;
      else
        MV(i,d) = X(r3,d);
      end
    end
    jrand = randi([1,dim]); 
    for d = 1:dim
      if rand() <= CR  ||  d == jrand 
        Xnew(i,d) = MV(i,d);
      else
        Xnew(i,d) = X(i,d);
      end 
    end
  end
  for i = 1:N
    Fnew = fun(feat,label,Xnew(i,:),HO);
    if Fnew <= fit(i)
      X(i,:) = Xnew(i,:);
      fit(i) = Fnew;
    end
    if fit(i) < fitG
      fitG = fit(i); 
      Xgb  = X(i,:);
    end
  end
  curve(t) = fitG; 
  fprintf('\nIteration %d Best (BDE)= %f',t,curve(t))
  t = t + 1;
end
Pos   = 1:dim;
Sf    = Pos(Xgb == 1);
Nf    = length(Sf);
sFeat = feat(:,Sf);
end


