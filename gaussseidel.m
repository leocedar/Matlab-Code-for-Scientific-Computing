function [x,n]=gaussseidel(A,b,x0,eps,M)
if nargin==3
    eps= 1.0e-6;
    M  = 200;
elseif nargin == 4
    M  = 200;
elseif nargin<3
    error
    return;
end      
D=diag(diag(A));    %��A�ĶԽǾ���
L=-tril(A,-1);      %��A����������
U=-triu(A,1);       %��A����������
G=(D-L)\U
f=(D-L)\b;
x=G*x0+f;
n=1;                  %��������
while norm(x-x0)>=eps
    x0=x;
    x=G*x0+f;
    n=n+1;
    if(n>=M)
        disp('Warning: ��������̫�࣬���ܲ�������');
        return;
    end
end
%����Ϊ����ʾ����(��Ҫgauss-seidel�������)
%A=[5,2,1;-1,4,2;2,-3,10]
%b=[-12;20;3]
%x0=[0;0;0]
%eps=0.0001
%M=200
%���룺[x,n]=gaussseidel(A,b,x0,eps,M)
%�����x=[-4.0000,3.0000,2.0000]
%      n=9
%������������
%All rights reserved