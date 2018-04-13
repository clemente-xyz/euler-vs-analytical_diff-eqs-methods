clear all
clear figure
clc

% General variables
%--------
c1= 0.5;
v1=2;
v2=2;
Q= 300;
%--------

% Function by analytical method:
%------------------------------------------------------  
syms  x(t)

t1=0.1:0.1:7; % 1st case
sol1=dsolve(diff(x)== v1*c1 - v2*(x/(Q+t*(v1-v2))), x(0)==36);
f=inline(sol1);
M_analytical1=transpose([f(t1)]); 

t2=7.1:0.1:10; % 2nd case
sol2=dsolve(diff(x)== v1*c1- 5*(x/(Q+t*(v1-5))), x(7)==f(7));
f2=inline(sol2);
M_analytical2=transpose([f2(t2)]);

t3=10.1:0.1:20; % 3rd case
sol3=dsolve(diff(x)== v1*c1 - v2*(x/(Q+t*(v1-v2))), x(10)==f2(10));
f3=inline(sol3);
M_analytical3=transpose([f3(t3)]);
%------------------------------------------------------  

% Function by numerical method:
%---------------------------------
dx=0.1;

% 1st case:
x1=zeros(10,1);
y1=zeros(10,1);
x1(1)=0;
y1(1)=36;

for i=1:70 
    x1(i+1)=x1(i)+dx;
    y1(i+1)=y1(i)+dx*(v1*c1 - v2*(y1(i)/(Q+x1(i)*(v1-v2))));
    y1f=y1(i+1);
    M_numeric1(i)=y1(i+1);
    
end

% 2nd case:
x2=zeros(10,1);
y2=zeros(10,1);
x2(1)=7;
y2(1)=y1f;

for i=1:30 
    x2(i+1)=x2(i)+dx;
    y2(i+1)=y2(i)+dx*(v1*c1- 5*(y2(i)/(Q+x2(i)*(v1-5))));
    y2f=y2(i+1);
    M_numeric2(i)=y2(i+1);
end

% 3rd case:
x3=zeros(10,1);
y3=zeros(10,1);
x3(1)=10;
y3(1)=y2f;

for i=1:100 
    x3(i+1)=x3(i)+dx;
    y3(i+1)=y3(i)+dx*(v1*c1 - v2*(y3(i)/(Q+x3(i)*(v1-v2))));
    y3f=y3(i+1);
    M_numeric3(i)=y3(i+1);
    
end
%------------------------------------

% Error calculation:
%---------------------------
M_Error1=[];
M_Error2=[];
M_Error3=[];

for i=1:70
    M_Error1(i)=abs(M_numeric1(i)-M_analytical1(i));
end
for i=1:30
    M_Error2(i)=abs(M_numeric2(i)-M_analytical2(i));
end    
for i=1:100
    M_Error3(i)=abs(M_numeric3(i)-M_analytical3(i));
end
%---------------------------

%Plotting:
%---------------------------
plot(t1,M_Error1)
hold on
plot(t2,M_Error2)
hold on
plot(t3,M_Error3)
%---------------------------

% Some formalities:
%-----------------------------------------------------------
titulo=title({' ';'\, \, \,  \, \,  \textbf{2nd margins of error}: '; ' '; '  \, \textit{Analytical Method v/s Numeric} '});
set(titulo,'Interpreter','latex', 'fontsize', 17)
eje_x=xlabel('\textbf{Time (min)}') ;
set(eje_x,'Interpreter','latex', 'fontsize', 15)
eje_y=ylabel('\textbf{Amount of salt (\textit{lib})}'); 
set(eje_y,'Interpreter','latex', 'fontsize', 15)
axis([0 20 0 0.03])
%-----------------------------------------------------------
