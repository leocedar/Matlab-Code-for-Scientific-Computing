function [x,n]=SOR(A,b,x0,w,eps,M)
if nargin==4
    eps= 1.0e-6;
    M  = 200;
elseif nargin<4
    error
    return
elseif nargin ==5
    M  = 200;
end  
if(w<=0 || w>=2)
    error;
    return;
end
D=diag(diag(A));    %��A�ĶԽǾ���
L=-tril(A,-1);      %��A����������
U=-triu(A,1);       %��A����������
B=inv(D-L*w)*((1-w)*D+w*U);
f=w*inv((D-L*w))*b;
x=B*x0+f;
n=1;                  %��������
while norm(x-x0)>=eps
    x0=x;
    x =B*x0+f;
    n=n+1;
    if(n>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
%����Ϊ����ʾ����(��ҪSOR�������)
%A=[5,2,1;-1,4,2;2,-3,10]
%b=[-12;20;3]
%x0=[0;0;0]
%w=0.9
%eps=0.0001
%M=200
%���룺[x,n]=SOR(A,b,x0,w,eps,M)
%�����x=[-4.0000,3.0000,2.0000]
%      n=8
%������������
%All rights reserved