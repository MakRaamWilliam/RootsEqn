function[noIteration, approx_root , presecion, t,convergence] = secantMethod(eqn, imax, epsilon, guess1, guess2)
format long ; 
clc;
syms x;
f = inline(eqn); % this makes function f with independent variable x, f(x)
x0 = guess1;
x1 = guess2;
tic;
i = 1;
while (i <= imax)
    f0=f(x0); %Calculating the value of function at x0
    f1=f(x1); %Calculating the value of function at x1
    if f1-f0 == 0
        convergence = 'diverges';
        noIteration = 0;
        approx_root = 0;  
        presecion = 0;
        t = 0;
        return;
    end
    approx_root(i) = x1 - (f1)*(x1 - x0)/(f1 - f0); % The Secant Formula
    presecion(i)=abs((approx_root(i)-x1));
    if (presecion(i) <= epsilon || f1 == 0) %checking the amount of error at each iteration
        convergence = 'converges';
        break
    end   
    x0 = x1;
    x1 = approx_root(i);
    i = i + 1;
    noIteration = i;
end
toc;
t = toc;
disp(approx_root)
disp(presecion)
disp(convergence)
end


