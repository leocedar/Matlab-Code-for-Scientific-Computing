function  Cubicspline(x,y,flag,y1_deri,yn_deri)
if nargin==3
    y1_deri=0;
    yn_deri=0;
elseif nargin<3
    error
    return
end  
n = length(x);
for i = 1 : n-1
    h(i) = x(i+1) -  x(i);
end
fprintf('���� h ���Ϊ:\n');
h
if flag~=3 
for i = 2 : n-1
    u(i-1) = h(i-1) / (h(i-1) + h(i));      
    lambda(i) = h(i) / (h(i-1) + h(i));     
end
if flag == 1
    u(n-1) = 1;
    lambda(1) = 1;
elseif flag == 2
    u(n-1) = 0;
    lambda(1) = 0;
end
end
if flag == 3 
for i = 1 : n-1
    u(i) = h(1) / (h(i) + h(1));      
    lambda(i) = h(i) / (h(i) + h(1));
end
end
fprintf('���� �� ���Ϊ: \n');
u
fprintf('���� �� ���Ϊ��\n');
lambda
if flag~=3 
for i = 2 : n-1
    d(i) = 6 * ((y(i+1)-y(i))/(x(i+1)-x(i)) - (y(i) - y(i-1))/( x(i) - x(i-1)))/(h(i-1)+h(i));
end
if flag == 1
    d(1) = 6 / h(1) * (( y(2)-y(1) )/( x(2) - x(1) ) - y1_deri);
    d(n) = 6 / h(n-1) * (yn_deri - ((y(n) - y(n-1)) / ( x(n) - x(n-1))));
elseif flag == 2
    d(1) = 2 * y1_deri;
    d(n) = 2 * yn_deri;
end
end
if flag == 3 
for i = 1 : n-1
    d(i) = 6 * ((y(2)-y(1))/(x(2)-x(1)) - (y(i+1) - y(i))/( x(i+1) - x(i)))/(h(1)+h(i));
end
end
fprintf('���� d ���Ϊ��\n');
d
if flag~=3 
matrix1 = zeros(n,n);
for i = 1 : n-1
    matrix1(i,i) = 2;
    matrix1(i,i+1) = lambda(i);
    matrix1(i+1,i) = u(i);
end
matrix1(n,n) = 2;
end

if flag==3 
matrix1 = zeros(n-1,n-1);
for i = 1 : n-2
    matrix1(i,i) = 2;
    matrix1(i,i+1) = lambda(i);
    matrix1(i+1,i) = u(i+1);
end
matrix1(n-1,n-1) = 2;
matrix1(1,n-1) = u(1);
matrix1(n-1,1) = lambda(n-1);
end
fprintf('���� matrix1 ���Ϊ:\n');
matrix1
fprintf('���� M ���Ϊ:\n');
M = matrix1\d'
if flag==3 
M = [M(n-1);M]
end
for i = 1 : n-1
    clear S
    syms t
    k = x(i):0.001:x(i+1);
    fprintf('����Ϊ[ %.3f , %.3f]\n',x(i),x(i+1));
    S = M(i)*(x(i+1)-t)^3/ (6*h(i)) + M(i+1)*(t - x(i))^3/(6*h(i))+(y(i) - M(i)*h(i)^2/6)*(x(i+1) - t)/h(i) + (y(i+1) - M(i+1)*h(i)^2/6)*(t - x(i))/h(i); 
    S = collect(S);
    S = vpa(S,4)
%    s = M(i)*(x(i+1)-k).^3/ (6*h(i)) + M(i+1)*(k - x(i)).^3/(6*h(i))+(y(i) - M(i)*h(i)^2/6)*(x(i+1) - k)/h(i) + (y(i+1) - M(i+1)*h(i)^2/6)*(k - x(i))/h(i);
%    hold on;
%    plot(k,s);                     %���Ҫ��ͼ��ȡ��ע��
end
%����Ϊ����ʾ����(��Ҫ����������ֵ��������)
%x =[1,4,9,16,25,36,49,64]         %��������꣬��ʽ:[x1 x2 ���� xn]
%y =[1,2,3,4,5,6,7,8]              %���������꣬��ʽ:[y1 y2 ���� yn]
%flag =1                           %ѡ��߽�����������֪����һ�׵���ֵ������֪���˶��׵���ֵ  �������Ա߽�����
%y1_deri = 0.5                     %(x1,y1) ���һ�׵���ֵ���߶��׵���ֵ���߿�
%yn_deri = 0.0625                  %(xn,yn) ���һ�׵���ֵ���߶��׵���ֵ���߿�
%���룺Cubicspline(x,y,flag,y1_deri,yn_deri)
%�����......
%������������
%All rights reserved