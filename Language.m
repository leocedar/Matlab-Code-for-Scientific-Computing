function f = Language(x,y,x0)
syms t;
if(length(x) == length(y))
    n = length(x);    
else
    disp('x��y��ά������ȣ�');
    return;
end                                      %���
f = 0.0;
for(i = 1:n)
    l = y(i); 
    for(j = 1:i-1)
        l = l*(t-x(j))/(x(i)-x(j));      
    end;
    for(j = i+1:n)
        l = l*(t-x(j))/(x(i)-x(j));      %�����������ջ�����
    end;
    f = f + l;                           %�����������ղ�ֵ����      
    simplify(f);                         %����
    if(i==n)
        if(nargin == 3)
            f = subs(f,'t',x0);          %�����ֵ��ĺ���ֵ
        else
            f = collect(f);              %����ֵ����ʽչ��
            f = vpa(f,6);                %����ֵ����ʽ��ϵ������6λ���ȵ�С��
        end
    end
end
%����Ϊ����ʾ����(��ҪLanguage��ֵ��������)
%x=[1,2,3]
%y=[2,5,10]
%x0=4
%���룺f = Language(x,y)
%�����f = t^2 + 1.0
%���룺f = Language(x,y,x0)
%�����f = 17
%������������
%All rights reserved