% Observateur d'état en BO
function Xd = ObservateurBO(t,x)
global a1 a2 b1 b2 e1 e2 w k0 xi uc
%notation
x1=x(1);
x2=x(2);
x3=x(3);
x4=x(4);
x5=x(5);
x6=x(6);

xe1=x(7);
xe2=x(8);
xe3=x(9);
xe4=x(10);
xe5=x(11);
xe6=x(12);

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

%fe(xe) 
fxe1=e1*xe2-a1*xe1*xe2-b1*xe1+b1*xe4;  
fxe2=xe3;   
fxe3=-w^2*xe2-2*xi*w*xe3;     
fxe4=e2*xe5-a2*xe4*xe5+b2*xe1-b2*xe4;   
fxe5=xe6;     
fxe6=-w^2*xe5-2*xi*w*xe6;
fxe=[fxe1;fxe2;fxe3;fxe4;fxe5;fxe6];
%ge(xe)
gxe3=k0*(w^2);        gxe6=k0*(w^2);
gxe=[0 0;0 0;gxe3 0;0 0;0 0;0 gxe6];


xe1p=fxe1;
xe4p=fxe4;


% en bo
phi11=[1;-(a1*xe2+b1); -a1*xe3+(a1*xe2+b1)^2+b1*b2;0;b2;-b2*(a1*xe2+b1)-b2*(a2*xe5+b2)]
phi12=[0;e1-a1*xe1 ;-a1*xe1p-(a1*xe2+b1)*(e1-a1*xe1);0;0;b2*(e1-a1*xe1)]
phi13=[0;0; e1-a1*xe1 ;0;0;0]
phi14=[0;b1;-b1*(a1*xe2+b1)-b1*(a2*xe5+b2) ;1;-(a2*xe5+b2);a2*xe6+(b2+a2*xe5)^2+b1*b2]
phi15=[0;0; b1*(e2-a2*xe4);0;(e2-a2*xe4);-a2*xe4p-(a2*xe5+b2)*(e2-a2*xe4)]
phi16=[0;0;0;0;0;(e2-a2*xe4)]

dphi=[phi11 phi12 phi13 phi14 phi15 phi16];
      
teta=5;
a=1/teta;
b=-a/teta;
c=-b/teta;
e=-2*b/teta;
f=-(e+c)/teta;
i=-2*f/teta;
Steta=[a b c 0 0 0;b e f 0 0 0;c f i 0 0 0;0 0 0 a b c;0 0 0 b e f;0 0 0 c f i];

C=[1 0 0 0 0 0;0 0 0 1 0 0]

u=uc;
Xd = [fx+gx*u;fxe+gxe*u-inv(dphi)*inv(Steta)*C'*(C*x(7:12)-C*x(1:6))];
end