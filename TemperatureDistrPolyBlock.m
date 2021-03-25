clc,clear,close all;

% Scott Stinson

% This program shows in table form, the temperature distribution
% of a polyurethane block used as insulation for a heat sink.
% This model is a two dimensional-steady state summation developed using
% separation of variables. Boundary conditions of the block are:
% Top temperature is 60 C, 3 sides(right, left, bottom) are 20 C.

a1=6.1; b1=20; % cm  dimensions of the block for case 1
a2=12.8; b2=15; % cm dimensions of the block for case 2
Tt=60; % top temperature Celsius
Tb=20; % bottom temperature Celsius

% amount of steps for x and y
iterX=10; 
iterY=30;

x1=linspace(0,a1,iterX);
y1=linspace(0,b1,iterY);
x2=linspace(0,a2,iterX);
y2=linspace(0,b2,iterY);

%Case 1 Temperature distribution
% where the length: 6.1 cm
% where the Width: 20 cm

n=1;
m=1;
p=1;
while p<=iterX
while m<=iterY
while n<68
E1=2*(1-(-1)^n)/(n*pi);
E2=sin(n*pi*x1(p)/a1);
E3=sinh(n*pi*y1(m)/a1);
E4=sinh(n*pi*b1/a1);
phi=E1*E2*E3/E4;
theta1(n)=phi;
n=n+1;
end
summation1(m,p)=sum(theta1);
n=1;
m=m+1;
end
n=1;
m=1;
p=p+1;
end

Temp1=summation1*(Tt-Tb)+Tb;
Temp1=flipud(Temp1);
% Corner temps are the average of B.C. for the two sides intersecting
Temp1(1,1)=(Tt+Tb)/2;
Temp1(1,iterX)=(Tt+Tb)/2;
s=1;

fprintf('Temperature distribution of Polyurethan Block with 6.1cm x 20cm dimensions. \n\n\t ')
while s<=iterX
fprintf('%0.2fcm ',x1(s))
s=s+1;
end
fprintf('\n\n')

s1=1;
s2=1;
s3=iterY;
while s3>=1
    fprintf('%0.2fcm\t ',y1(s3))
    while s2<=iterX
    fprintf('%0.2fC ',Temp1(s1,s2))
    s2=s2+1;
    end
    fprintf('\n')
    s1=s1+1;
    s3=s3-1;
    s2=1;
end



n=1;
m=1;
p=1;
%Case 2  temperature distribution
% where the length: 0.128 m
% where the Width: 0.15 m
while p<=iterX
while m<=iterY
while n<68
E1=2*(1-(-1)^n)/(n*pi);
E2=sin(n*pi*x2(p)/a2);
E3=sinh(n*pi*y2(m)/a2);
E4=sinh(n*pi*b2/a2);
phi=E1*E2*E3/E4;
theta2(n)=phi;
n=n+1;
end
summation2(m,p)=sum(theta2);
n=1;
m=m+1;
end
n=1;
m=1;
p=p+1;
end

Temp2=summation2*(Tt-Tb)+Tb;
Temp2=flipud(Temp2);
% Corner temps are the average of B.C. for the two sides intersecting
Temp2(1,1)=(Tt+Tb)/2;
Temp2(1,10)=(Tt+Tb)/2;
s=1;

fprintf('\n\nTemperature distribution of Polyurethan Block with 12.8cm x 15cm dimensions. \n\n\t ')
while s<=iterX
fprintf('%0.2fcm ',x2(s))
s=s+1;
end
fprintf('\n\n')

s1=1;
s2=1;
s3=iterY;
while s3>=1
    fprintf('%0.2fcm\t ',y2(s3))
    while s2<=iterX
    fprintf('%0.2fC ',Temp2(s1,s2))
    s2=s2+1;
    end
    fprintf('\n')
    s1=s1+1;
    s3=s3-1;
    s2=1;
end





