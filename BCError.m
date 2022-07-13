function [E,t,P] = BCError(varargin)
lambda_x_0=varargin{1}(1);
lambda_y_0=varargin{1}(2);
lambda_v_0=varargin{1}(3);
t_f=varargin{1}(4);
x_0=varargin{2};
y_0=varargin{3};
v_0=varargin{4};
x_f=varargin{5};
y_f=varargin{6};
theta_guess=0;
g=10;
P_0=[x_0,y_0,v_0,lambda_x_0,lambda_y_0,lambda_v_0,theta_guess];
options=odeset('RelTol', 1e-8);
tspan=[0,t_f];

[t,P]=ode113(@BSmyODE,tspan,P_0,options,10);

Ptf=P(end,:);
x_tf=Ptf(:,1);
y_tf=Ptf(:,2);
v_tf=Ptf(:,3);
lambda_x_f=Ptf(:,4);
lambda_y_f=Ptf(:,5);
lambda_v_f=Ptf(:,6);
theta=Ptf(:,7);
H_tf=lambda_x_f*v_tf*sin(theta)+(lambda_y_f*v_tf+lambda_v_f*g)*cos(theta);

E(1,1)=x_tf-x_f;
E(2,1)=y_tf-y_f;
E(3,1)=lambda_v_f;
E(4,1)=H_tf+1;
