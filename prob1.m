clear all; 
close all;

Time=4;
L=20;
n=200;
x2=linspace(-L/2,L/2,n+1);
x=x2(1:n);
dx=x(2)-x(1);
dt=0.2;
CFL=dt/dx;
time_steps=Time/dt;
t=0:dt:Time;

%Initial conditions
u0=exp(-x.^2)';
u1=exp(-(x+dt).^2)';
usol(:,1)=u0;
usol(:,2)=u1;

%sparse
e1=ones(n,1);
A=spdiags([-e1 e1],[-1 1],n,n);
A(1,n)=-1; A(n,1)=1;
for j=1:time_steps-1
    u2=u1+0.5*CFL*A*u1;
    u1=u2;
    usol(:,j+2)=u2;
end

waterfall(x,t,usol');
%map=[0 0 0];
colormap();

set(gca,'Xlim',[-L/2 L/2],'Xtick', [-L/2 0 L/2],'FontSize',[20]);
set(gca,'Ylim',[0 Time],'ytick', [0 Time/2 Time],'FontSize',[20]);
view(25,40)

x1=xlabel('x'); y1=ylabel('t'); z1=zlabel('u');



