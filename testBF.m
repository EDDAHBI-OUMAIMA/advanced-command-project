t0=0;
tf=20;
x0=[72 0 0 18 0 0];
[t,x]=ode45('commandeBF',[t0,tf],x0);
figure(1);plot(t,x(:,1),'r');title('T2'),grid
figure(2),plot(t,x(:,2));title('Xvc'),grid
figure(3),plot(t,x(:,3));title('Vc'),grid
figure(4),plot(t,x(:,4));title('T4'),grid
figure(5),plot(t,x(:,5));title('Xvf'),grid
figure(6),plot(t,x(:,6));title('Vf'),grid