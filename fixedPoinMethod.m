function [noIteration,root,err,time,msg] = fixedPoinMethod(g,maxItr,tol,p0)
msg=' ';
root=[];
err=[];
tic;
g=inline(g);
noIteration = 0 ;
for k=1:maxItr
noIteration = noIteration +1 ;    
p = g(p0);
relerr = abs(p-p0)/( abs(p)+eps );
root(k)=p;
err(k)=relerr;
if (relerr<tol)
%root = p;
%err=relerr;
time=toc;
msg='fixedpoint converged!';
return;
end
p0 = p;
end
root=p;
time=toc;
err=relerr;
msg='fixedpoint did not converge!';
end