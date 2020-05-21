function[itmax, approx_root,presecion,t, convergence] = Bierge_vieta(eqn, imax,epsilon,guess1)

syms x;
f = inline(eqn); a = sym2poly(f(x)); 
m = length(a);
b = zeros(1,m);c = zeros(1,m-1);
b(1) = a(1);c(1) = a(1);
x0 = guess1;
tic;
for i=1:imax
    for j=2:m
        b(j) = a(j) + x0* b(j-1);
    end
    for j=2:m-1
        c(j) = b(j) + x0* c(j-1);
    end
    if c(m-1) == 0
        convergence = 'diverges';
        itmax = 0;
        approx_root = 0;
        presecion = 0;
%         disp('Method diverges')
        break;
    end 
    approx_root(i) = x0 - b(m)/c(m-1);
    presecion(i)=abs((approx_root(i)-x0));
    if (presecion(i)<=epsilon || b(m) == 0)
        break
    end
%     fprintf('%d     %.6f     %.6f     %.6f     %.6f     %.6f     \n',i,x0,x1,b(m),c(m-1),presecion);
    x0 = approx_root(i);
    itmax = i;
end
t = toc;
if c(m-1) == 0 || i > imax
    convergence = 'diverges';
    t = 0;
else
    convergence = 'converges';
end
%x^2-3*x+2
end