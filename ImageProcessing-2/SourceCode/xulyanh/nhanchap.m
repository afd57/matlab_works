function Y = nhanchap(X,H)
%X la ma tran anh
%H la ma tran nhan chap
m = size(X); %Lay kich co cua ma tran X 
n = size(H,1);
for i=1:m(1)
    for j=1:m(2)
        sum=0;
        t=floor((n+1)/2);
        for k=1:n
            for l=1:n
                sohang=i-k+t;
                socot=j-l+t;
                if (sohang~=0)&(sohang<=m(1))
                    if(socot~=0)&(socot<=m(2))
                        sum=sum+X(sohang,socot)*H(k,l);
                    end
                end
            end
            Y(i,j)=sum;
        end
    end
end
