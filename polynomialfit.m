function [cc,error] = polynomialfit(x,y,n)
cc=polyfit(x,y,n)                   %��Ϻ����ĸ�����ϵ��
xx=x(1):0.01:x(length(x));
yy=polyval(cc,xx);
plot(xx,yy,'r');
hold on;
plot(x,y,'x');
xlabel('x');
ylabel('y');
xx=x;
yy=polyval(cc,xx);
error=sum((yy-y).^2);
error=vpa(error,6)                   %���
end
%����Ϊ����ʾ����(��Ҫ����ʽ�����������)
%x=[0.0 0.1 0.2 0.3 0.5 0.8 1.0]
%y=[1.0 0.41 0.50 0.61 0.91 2.02 2.46]
%n=3
%���룺[cc,error] = polynomialfit(x,y,n)
%�����cc=[-6.6221,12.8147,-4.6591,0.9266](����y=-6.6221x^3+12.8147x^2-4.6591x+0.9266)
%      error=0.0525501
%������������
%All rights reserved