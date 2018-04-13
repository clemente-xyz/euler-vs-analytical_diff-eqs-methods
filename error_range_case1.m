clear all
clear figure
clc

% General variables
%--------
c1=0.5;
Q=300;
v1=2;
v2=2;
%--------

% Function by analytical method:
%---------------------------
syms x(t)

t1=0.1:0.1:10; % 1st case:
sol1=dsolve(diff(x)== v1*c1 - v2*(x/(Q+t*(v1-v2))), x(0)==36);
f=inline(sol1);
M_analytical1=transpose([f(t1)]); 

t2=10:0.1:19.9; % 2nd case:
sol2=dsolve(diff(x)== - v2*(x/(Q+t*(v1-v2))), x(10)==f(10));
f2=inline(sol2);
M_analytical2=transpose([f2(t2)]);
%---------------------------

% Function by numerical method:
%------------------------------------
dx=0.1;

% 1st case:
M_numerica1=[]; 
x1=zeros(10,1);
y1=zeros(10,1);
x1(1)=0;
y1(1)=36;

for i=1:100 
    x1(i+1)=x1(i)+dx;
    y1(i+1)=y1(i)+dx*(v1*c1 - v2*(y1(i)/(Q+x1(i)*(v1-v2))));
    y1f=y1(i+1);
    M_numeric1(i)=y1(i+1); %Calculo de error
end

% 2nd case:
M_numerica2=[];
x2=zeros(10,1);
y2=zeros(10,1);
x2(1)=10;
y2(1)=y1f;

for i=1:100 
    x2(i+1)=x2(i)+dx;
    y2(i+1)=y2(i)+dx*(- v2*(y2(i)/(Q+x2(i)*(v1-v2))));
    y2f=y2(i+1);
    M_numeric2(i)=y2(i+1);
end
%------------------------------------

% Error calculation:
%---------------------------
M_Error1=[];
M_Error2=[];

for i=1:100
    M_Error1(i)=abs(M_numeric1(i)-M_analytical1(i));
    M_Error2(i)=abs(M_numeric2(i)-M_analytical2(i));
end
%---------------------------


% Plotting:
%---------------------------
plot(t1,M_Error1)
hold on
plot(t2,M_Error2)
%---------------------------

% Some formalities:
%-----------------------------------------------------------
titulo=title({' ';'\, \, \,  \, \,  \textbf{1st margins of error}: '; ' '; '  \, \textit{Analytical Method v/s Numeric} '});
set(titulo,'Interpreter','latex', 'fontsize', 17)
eje_x=xlabel('\textbf{Time (min)}') ;
set(eje_x,'Interpreter','latex', 'fontsize', 15)
eje_y=ylabel('\textbf{Amount of salt (\textit{lib})}'); 
set(eje_y,'Interpreter','latex', 'fontsize', 15)
axis([0 20 0 0.03])
%-----------------------------------------------------------