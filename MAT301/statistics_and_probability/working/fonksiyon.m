function p = makeParabola(a,b,c)
p = @parabola;

   function y = parabola(x)
   y = a*x.^2 + b*x + c;
   end

end

p(9) = makeParabola(1.3,.2,30);

X = 25;
Y = p(X)