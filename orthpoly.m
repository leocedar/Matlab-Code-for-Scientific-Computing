function g=orthpoly(rho,a,b,n)
syms x % ������ű���x
g=sym(zeros(n+1,1));
g(1)=1;
alpha(1)=inprod(rho,x*g(1),g(1),a,b)/inprod(rho,g(1),g(1),a,b);
g(2)=x-alpha(1);
for i=3:n+1
    alpha(i-1)=inprod(rho,x*g(i-1),g(i-1),a,b)/inprod(rho,g(i-1),g(i-1),a,b);
    beta(i-2)=inprod(rho,g(i-1),g(i-1),a,b)/inprod(rho,g(i-2),g(i-2),a,b);
    g(i)=(x-alpha(i-1))*g(i-1)-beta(i-2)*g(i-2);
end
g=expand(g);
%g=vpa(g,6);
function ip=inprod(rho,f,g,a,b)
% ���㺯��f��g����Ȩrho֮�µ��ڻ�
ip=int(rho*f*g,a,b);

%����Ϊ����ʾ����(��Ҫ��������ϵ��Ϊ1����������ʽ)
%rho=@(x) abs(x) % ����Ȩ����
%a=-1 % �����������
%b=1  % �����������
%n=4  % ����ǰ5����������ʽ
%���룺g=orthpoly(rho,a,b,n)  % ���ú���������������ʽ
%�������ӦȨ������ϵ��Ϊ1����������ʽ(��5��)
%������������
%All rights reserved