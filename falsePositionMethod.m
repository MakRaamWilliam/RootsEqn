%    function falsePositionMethod
%    end
function[noIteration, rootApproximation, presecion,t,XuVector,XlVector] = falsePositionMethod(eqn, imax,epsilon,guess1, guess2)
%format long ; 
clc;
f=inline(eqn);
 
xl = guess1;
xu = guess2;
Es = epsilon;


if f(xu)*f(xl)<0
    XuVector(1)=xu;
    XlVector(1)=xl;
     tic;
     count = 1;
    for i=2:imax
        if (f(xu)-f(xl)) == 0
            'division by zero'
            noIteration = 0;
            rootApproximation = 0;
            presecion = 0;
            XuVector = 0;
            XlVector = 0;
            t = 0;
            return;
        end
        xr=((xl*f(xu))-(xu*f(xl)))/(f(xu)-f(xl));
        rootApproximation(count)=xr;
        if f(xr)<0
            xl=xr;
            XuVector(i)=xu;
            XlVector(i)=xl;
        elseif f(xr)>0
            xu=xr;
            XuVector(i)=xu;
            XlVector(i)=xl;
        end

        newX(1)=0;
        newX(i)=xr;
        vecFXr(1)=f(0);
        vecFXr(i)=f(xr);
        presecion(count)=abs(newX(i)-newX(i-1));
        if abs((newX(i)-newX(i-1)))<Es,break,end
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
    XuVector = 0;
    XlVector = 0;
    t = 0;
end

%     fprintf('The approximate root is : %f \n',xr);
end