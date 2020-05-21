% %  Bisection Method in MATLAB
%   function bisectionMethod
%   bisection('x^2-3', 50,0.01,1, 2)
%   end
function[noIteration, rootApproximation, presecion, t,XuVector,XlVector,iexpected] = bisectionMethod(eqn, imax,epsilon,guess1, guess2)
%format long ;
clc;
a = eqn;
f=inline(a);
 
xl = guess1;
xu = guess2;
Es = epsilon;

if f(xu)*f(xl)<0
    iexpected = ceil(log2((xu-xl)/Es));
    XuVector(1)=xu;
    XlVector(1)=xl;
     tic;
     count = 1;
    for i=2:imax

    rootApproximation(count)=(xu+xl)/2;
    test = f(xu)*f(rootApproximation(count));
    if test <0
        xl=rootApproximation(count);
        XuVector(i)=xu;
        XlVector(i)=xl;

    else
        xu=rootApproximation(count);
        XuVector(i)=xu;
        XlVector(i)=xl;
    end

    newx(1)=0;
    newx(i)=rootApproximation(count);
    FXr(1)=f(0);
    FXr(i)=f(rootApproximation(count));
    presecion(count)=abs((newx(i)-newx(i-1)));
    if abs((newx(i)-newx(i-1)))<Es,break,end
    count = count + 1;
    end
    noIteration = count;
    toc;
    t = toc;
else
    'the interval is wrong';
    noIteration = 0;
    rootApproximation = 0;
    presecion = 0;
    t = 0;
    iexpected = 0;
    XuVector = 0;
    XlVector = 0;
end
%    fprintf('The approximate root is : %f \n',approx_root);
end
