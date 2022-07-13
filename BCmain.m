clc;clear all;
x_0=0;
y_0=0;
v_0=0;
x_tf=2;
y_tf=2;
g=10;
lambda_v_tf=0;


%Initial lambda guesses
lambda_x_0=0.2;
lambda_y_0=0.2;
lambda_v_0=0.2;
%final time guess
t_f_guess=2;
P_guess =[lambda_x_0; lambda_y_0; lambda_v_0; t_f_guess];

options=optimset('Display','Iter','Tolx', 1e-8, 'TolFun', 1e-8);
lambda_0=fsolve(@BCError,P_guess,options,x_0,y_0,v_0,x_tf,y_tf);
t_f=lambda_0(4)
%Plot of final states using the results from the integral
[E,t,P]=BCError(lambda_0,x_0,y_0,v_0,x_tf,y_tf);

figure
plot(t(:,1),P(:,1),t(:,1),P(:,2),t(:,1),P(:,3))
title('Brochistochrome Problem- x(t),y(t),v(t)')
xlabel('time')
ylabel('States')