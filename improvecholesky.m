function [L,D,y,x]=improvecholesky(A,b)    %�øĽ�ƽ���������Ax=b
n=length(b);
L=zeros(n,n);                                %LΪn*n����
D=diag(n,0);                                 %DΪn*n�����ԽǾ���
S=L*D;
for i=1:n                                    %L�����Խ�Ԫ�ؾ�Ϊ1
    L(i,i)=1;
end
D(1,1)=A(1,1);                               %��A�ֽ�ʹ��A=LDLT
for i=2:n
   for j=1:i-1
       S(i,j)=A(i,j)-sum(S(i,1:j-1)*L(j,1:j-1)');
       L(i,1:i-1)=S(i,1:i-1)/D(1:i-1,1:i-1);
   end  
   D(i,i)=A(i,i)-sum(S(i,1:i-1)*L(i,1:i-1)');
end
y=zeros(n,1);                                % x, yΪn*1�׾���
x=zeros(n,1);
for i=1:n
   y(i)=(b(i)-sum(L(i,1:i-1)*D(1:i-1,1:i-1)*y(1:i-1)))/D(i,i);  
   %ͨ�� LDy=b���y��ֵ
end
for i=n:-1:1  
    x(i)=y(i)-sum(L(i+1:n,i)'*x(i+1:n));                       
   %ͨ��LTx=y���x��ֵ
end
%����Ϊ����ʾ����(��Ҫ�øĽ���ƽ������������Է�����)
%A=[2,-1,1;-1,-2,3;1,3,1]     
%b=[4;5;6]
%���룺[L,D,y,x]=improvecholesky(A,b)
%�����L=.....,D=.....
%      y =[2.0000;-2.8000;2.5556]
%      x =[1.1111;0.7778;2.5556]
%������������
%All rights reserved