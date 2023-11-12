
close all;
clear all;
clc

global a1 a2 b1 b2 e1 e2 w k0 xi uc
ro=1000;
L=1;
h=3790;
dc=12.70*10^-3;
df=25.4*10^-3;
Cp=4180;
k0=0.93;
w=2*pi;
xi=0.7;
alpha=70;
betha=35;
T1=75;
T3=15;
S=dc*pi*L;
Ac=pi*(dc/2)^2;
Af=pi*(df/2)^2;
mc=ro*Ac*L;
mf=ro*(Af-Ac)*L;
e1=(alpha*T1)/mc;
a1=alpha/mc;
b1=(S*h)/(mc*Cp);
e2=(betha*T3)/mf;
a2=betha/mf;
b2=(S*h)/(mf*Cp);

x1c=60;
x4c=30;
x2c=(b1*x1c-b1*x4c)/(e1-a1*x1c);
x3c=0;
x5c=(b2*x4c-b2*x1c)/(e2-a2*x4c);
x6c=0;

uc1=x2c/k0;
uc2=x5c/k0;
uc=[uc1;uc2];
t0=0;
tf=20;


x0=[72 0 0 18 0 0];
xe0=[72 1e-3 1e-3 18 1e-3 1e-3];
x0xe0=[x0 xe0];

[t,x]=ode45('ObservateurBO',[t0,tf],x0xe0);
figure(1);plot(t,x(:,1),'r',t,x(:,7),'--b');title('T2'),grid
figure(2),plot(t,x(:,2),'r',t,x(:,8),'--b');title('Xvc'),grid
figure(3),plot(t,x(:,3),'r',t,x(:,9),'--b');title('Vc'),grid
figure(4),plot(t,x(:,4),'r',t,x(:,10),'--b');title('T4'),grid
figure(5),plot(t,x(:,5),'r',t,x(:,11),'--b');title('Xvf'),grid
figure(6),plot(t,x(:,6),'r',t,x(:,12),'--b');title('Vf'),grid
