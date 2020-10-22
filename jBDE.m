function [sFeat,Sf,Nf,curve]=jBDE(feat,label,N,T,CR,HO)

fun=@jFitnessFunction; 
D=size(feat,2); X=zeros(N,D); 
for i=1:N
  for d=1:D
    if rand() > 0.5
      X(i,d)=1;
    end
  end
end
fit=zeros(1,N); fitG=inf;
for i=1:N
  fit(i)=fun(feat,label,X(i,:),HO); 
  if fit(i) < fitG
    fitG=fit(i); Xgb=X(i,:);
  end
end
curve=inf; fitG=inf; Xnew=zeros(N,D); t=1; 
%---Iterations start-------------------------------------------------------
while t <= T
	for i=1:N
    R=randperm(N); R(R==i)=[];
    r1=R(1); r2=R(2); r3=R(3);
    jrand=randi([1,D]); 
    for d=1:D
      if X(r1,d)==X(r2,d) 
        diffV=0;
      else
        diffV=X(r1,d); 
      end
      if diffV==1
        MV=1;
      else
        MV=X(r3,d);
      end
      if d==jrand || rand() <= CR
        Xnew(i,d)=MV;
      else
        Xnew(i,d)=X(i,d);
      end 
    end
  end
  for i=1:N
    Fnew=fun(feat,label,Xnew(i,:),HO);
    if Fnew <= fit(i)
      X(i,:)=Xnew(i,:); fit(i)=Fnew;
    end
    if fit(i) < fitG
      fitG=fit(i); Xgb=X(i,:);
    end
  end
  curve(t)=fitG; 
  fprintf('\nIteration %d Best (BDE)= %f',t,curve(t))
  t=t+1;
end
Pos=1:D; Sf=Pos(Xgb==1); Nf=length(Sf); sFeat=feat(:,Sf);
end


