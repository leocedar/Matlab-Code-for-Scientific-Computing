function [L,U,y,x]=doolittle(A,b)
n=length(A);     %����A�����ά��
for i=1:n        %�ж�A�����˳������ʽ�Ƿ�Ϊ����
    w=det(A(1:i,1:i));
    if(w==0)
        error('Matrix must be positive!');
        return;
    end
end
U(1,1:n)=A(1,1:n);     %����U�ĵ�һ��Ԫ��
L(2:n,1)=A(2:n,1)/U(1,1);  %����L�ĵ�һ��Ԫ��
for i=1:n              %����L�ĶԽ�Ԫ��
    L(i,i)=1;
end
for k=2:n
    for j=k:n 
        sum=0;
        for s=1:(k-1)
            sum=sum+L(k,s)*U(s,j);
        end
        U(k,j)=A(k,j)-sum;    %����U������Ԫ��
    end
    for i=(k+1):n
        sum=0;
        for s=1:(k-1)
            sum=sum+L(i,s)*U(s,k);
        end
        L(i,k)=(A(i,k)-sum)/U(k,k);    %����L������Ԫ��
    end
end
y(1,1)=b(1);      %����y�ĵ�һ��Ԫ��
for i=2:n
    sumy=0;
    for j=1:i-1
        sumy=sumy+L(i,j)*y(j,1);
    end
    y(i,1)=b(i)-sumy;     %����y������Ԫ��
end
x(n,1)=y(n,1)/U(n,n);     %����x�����һ��Ԫ��
for i=(n-1):(-1):1
    sumx=0;
    for j=i+1:n
        sumx=sumx+U(i,j)*x(j,1);
    end
    x(i,1)=(y(i,1)-sumx)/U(i,i);    %����x������Ԫ��
end
%����Ϊ����ʾ����(��Ҫ��doolittle�ֽ�(ֱ�����Ƿֽ�)������Է�����)
%A=[1/4,1/5,1/6;1/3,1/4,1/5;1/2,1,2]         
%b=[9;8;8]
%���룺[L,U,y,x]=doolittle(A,b)
%�����L=.....,U=.....
%      y =[9.0000;-4.0000;-154.0000]
%      x =[-227.0769;476.9231;-177.6923]
%������������
%All rights reserved