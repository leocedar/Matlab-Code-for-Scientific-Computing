function  s=Comsimpson(f,a,b,n)
%fΪ�����ֺ���
%a��b�ǻ���������
%n�����������
%s�ǻ���ֵ
h=(b-a)/(2*n);
s1=0;s2=0;
for k=1:n
    x=a+h*(2*k-1);
    s1=s1+feval(f,x);
end
 for k=1:(n-1)
     x=a+h*2*k;
     s2=s2+feval(f,x);
 end
 format long
 s=h*(feval(f,a)+feval(f,b)+4*s1+2*s2)/3;
%����Ϊ����ʾ����(��Ҫ�ø���Simpson��ʽ���㶨����)
%f=@(x) sqrt(x).*log(x)
%a=0.0001
%b=1
%n=32
%���룺s=Comsimpson(f,a,b,n)
%�����s=-0.443683060926222
%������������
%All rights reserved