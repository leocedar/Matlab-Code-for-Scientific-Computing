function s=Comtrapezium(f,a,b,n)
%fΪ�����ֺ���
%a��b�ǻ���������
%n�����������
%s�ǻ���ֵ
h=(b-a)/n;
s=0;
for k=1:(n-1)
    x=a+h*k;
    s=s+feval(f,x);
end
format long
s=h*(feval(f,a)+feval(f,b))/2+h*s;
%����Ϊ����ʾ����(��Ҫ�ø������ι�ʽ���㶨����)
%f=@(x) sqrt(x).*log(x)
%a=0.0001
%b=1
%n=32
%���룺s=Comtrapezium(f,a,b,n)
%�����s=-0.439775629434779
%������������
%All rights reserved