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

t1=0:1:7; % 1st case
sol1=dsolve(diff(x)== v1*c1 - v2*(x/(Q+t*(v1-v2))), x(0)==36);
f=inline(sol1);

t2=7:1:10; % 2nd case
sol2=dsolve(diff(x)== v1*c1- 5*(x/(Q+t*(v1-5))), x(7)==f(7));
f2=inline(sol2);

t3=10:1:20; % 3th case
sol3=dsolve(diff(x)== v1*c1 - v2*(x/(Q+t*(v1-v2))), x(10)==f2(10))
f3=inline(sol3);
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
    
end

% 2nd case
x2=zeros(10,1);
y2=zeros(10,1);
x2(1)=7;
y2(1)=y1f;

for i=1:30 
    x2(i+1)=x2(i)+dx;
    y2(i+1)=y2(i)+dx*(v1*c1- 5*(y2(i)/(Q+x2(i)*(v1-5))));
    y2f=y2(i+1);
end

% 3th case
x3=zeros(10,1);
y3=zeros(10,1);
x3(1)=10;
y3(1)=y2f;

for i=1:100 
    x3(i+1)=x3(i)+dx;
    y3(i+1)=y3(i)+dx*(v1*c1 - v2*(y3(i)/(Q+x3(i)*(v1-v2))));
    y3f=y3(i+1);
    
end
%------------------------------------

% Plotting:
%---------------------------
% Analytical method:
analytical_graph1=plot(t1,f(t1))

hold on
analytical_graph2=plot(t2,f2(t2))

hold on
analytical_graph3=plot(t3,f3(t3));

% Numerical method:
hold on
numerical_graph1=plot(x1,y1)

hold on
numerical_graph2=plot(x2,y2)

hold on
numerical_graph3=plot(x3,y3)
%---------------------------


% Some formalities:
%-----------------------------------------------------------
title=title({' ';'\textbf{2nd change in the amounts of salt as a function of time}: '; ' '; '\, \, \,  \,\, \, \,  \, \, \, \,  \, \, \, \,  \, \textit{Metodo Analitico v/s Numerico} '})
set(title,'Interpreter','latex', 'fontsize', 17)
x_axis=xlabel('\textbf{Time (min)}') 
set(x_axis,'Interpreter','latex', 'fontsize', 15)
y_axis=ylabel('\textbf{Amount of salt (\textit{lib})}') 
set(y_axis,'Interpreter','latex', 'fontsize', 15)
axis([0 20 0 50])
%-----------------------------------------------------------
 