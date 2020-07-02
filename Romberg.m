function  [s,err]=Romberg(f,a,b,n)
%fΪ�����ֺ���
%a��b�ǻ���������
%n+1��T���������
%T��ʾT����
%s���������ֵ
m=1;
h=b-a;
err=1;J=0;
T=zeros(n,n);%����T���ʼֵ
T(1,1)=h*(feval(f,a)+feval(f,b))/2;
while (J<n)
    J=J+1;
    h=h/2;
    s=0;
    for k=1:m
        x=a+h*(2*k-1);
        s=s+feval(f,x);
    end
    T(J+1,1)=T(J,1)/2+h*s;
    m=2*m;
    for i=1:J
        T(J+1,i+1)=T(J+1,i)+(T(J+1,i)-T(J,i))/(4^i-1);
    end
    err=abs(T(J,J)-T(J+1,i+1));
end
format long
s=T(J+1,J+1);
T
%����Ϊ����ʾ����(��Ҫ�����������)
%f=@(x) sqrt(x).*log(x)
%a=0.0001
%b=1
%n=16
%���룺[s,err]=Romberg(f,a,b,n)
%�����s=-0.444437859772903
%      err=1.445721320436633e-11
%������������
%All rights reserved