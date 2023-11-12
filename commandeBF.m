function Xd = commandeBF(t,x)
global a1 a2 b1 b2 e1 e2 w k0 xi
%notation
x1=x(1);
x2=x(2);
x3=x(3);
x4=x(4);
x5=x(5);
x6=x(6);
%f(x) 
fx1=e1*x2-a1*x1*x2-b1*x1+b1*x4;  
fx2=x3;   
fx3=-w^2*x2-2*xi*w*x3;     
fx4=e2*x5-a2*x4*x5+b2*x1-b2*x4;   
fx5=x6;     
fx6=-w^2*x5-2*xi*w*x6;
fx=[fx1;fx2;fx3;fx4;fx5;fx6];
%g(x)
gx3=k0*(w^2);        gx6=k0*(w^2);
gx=[0 0;0 0;gx3 0;0 0;0 0;0 gx6];
%les dérives des x

%les dérives secondes de x
%y1=x1;
x1p=fx1;
x4p=fx4;
x1pp=e1*x3-a1*x1p*x2-a1*x1*x3-b1*x1p+b1*x4p;     
x4pp=e2*x6-a2*x4p*x5-a2*x4*x6+b2*x1p-b2*x4p; 

phi1x=(e1-a1*x1)*(-w^2*x2-2*xi*w*x3)-a1*x1pp*x2-a1*x1p*x3-a1*x1p*x3-b1*x1pp+b1*x4pp;           
phi3x=(e2-a2*x4)*(-w^2*x5-2*xi*w*x6)-a2*x4pp*x5-a2*x4p*x6-a2*x4p*x6+b2*x1pp-b2*x4pp;

phi2x = k0*(w^2)*(e1-a1*x1);
phi4x = k0*(w^2)*(e2-a2*x4);

deltax= [phi2x 0;0 phi4x];
Delta0x=[phi1x;phi3x];
beltax=inv(deltax);
alphax=-beltax*Delta0x;

%determination de v1
A1=[0 1 0;0 0 1;0 0 0];
B1=[0;0;1];
C1=[1 0 0];
k1=place(A1,B1,[-1 -1.23 -2]);
z11=x1;
z12=x1p;
z13=x1pp;
z1=[z11;z12;z13];
z1c=[60;0;0];
v1=-k1*(z1-z1c);
%determination de v2
z21=x4;            
z22=x4p;            
z23=x4pp;
z2=[z21;z22;z23];
z2c=[30;0;0];
v2 =-k1*(z2-z2c);
v=[v1;v2];
%la commande
u=alphax+beltax*v;
Xd = fx+gx*u;
end
