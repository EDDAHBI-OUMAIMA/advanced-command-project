function Xd= BO(t,x)
global a1 a2 b1 b2 e1 e2 w k0 xi
x1c=60;
x4c=30;
x2c=(b1*x1c-b1*x4c)/(e1-a1*x1c);
x3c=0;
x5c=(b2*x4c-b2*x1c)/(e2-a2*x4c);
x6c=0;
x1=x(1);
x2=x(2);
x3=x(3);
x4=x(4);
x5=x(5);
x6=x(6);
f=[e1*x2-a1*x1*x2-b1*x1+b1*x4 ; x3 ; -w^2*x2-2*xi*w*x3 ;
e2*x5-a2*x4*x5+b2*x1-b2*x4 ; x6; -w^2*x5-2*xi*w*x6];
g=[0 0;0 0;k0*(w)^2 0;0 0;0 0;0 k0*(w)^2];
uc1=x2c/k0;
uc2=x5c/k0;
uc=[uc1;uc2];
u=uc
Xd=f+g*u;
end





