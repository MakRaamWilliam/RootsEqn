function [noIteration, Xof, presecion, t,convergence] = newtonRaphasonMethod(equation , maxIter, epsilon, xiguess)
format long
clc;
syms x;
func = inline(equation);
d1func = inline(diff(func(x)));
iter = 1;
Xof(iter) = xiguess;
f(1) = func(Xof(iter));
% RATE OF CONVERGENCE
dfdx(1) = d1func(Xof(iter));
tic;
for i = 2:maxIter
    if(dfdx(i-1)==0)
        convergence = 'diverges';
% 		disp('newton Method has diverged');
    end
    Xof(i) = Xof(i-1) - (f(i-1)/dfdx(i-1));
    presecion(i) = abs(Xof(i)-Xof(i-1));
    f(i) = func(Xof(i));
    dfdx(i) = d1func(Xof(i));	
    if abs(Xof(i)-Xof(i-1)) < epsilon
        convergence = 'converges';
        break;
    end
    iter = i;

end
noIteration = iter;
if iter >= maxIter
    convergence = 'diverges';
    Xof = 0;
    presecion = 0;
end
toc;
t = toc;
end