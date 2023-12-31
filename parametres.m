global a1 a2 b1 b2 e1 e2 w k0 xi
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