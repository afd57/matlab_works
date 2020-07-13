clear

A=[1 5 2 4];
i=[1 3 5 7];
B(i) = A(:)
clear i
i=[2 4 5];
B(i)= (A(1:3)+A(2:4))/2
